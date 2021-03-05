package com.kgitbank.spring.global.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kgitbank.spring.domain.chat.service.ChatService;
import com.kgitbank.spring.domain.model.MessageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class EchoHandler extends TextWebSocketHandler {
	
		@Autowired
		ChatService service;
		
		MessageVO mvo;
		
		Gson gson = new Gson();
	
		//세션을 모두 저장한다
		//방법 1 : 1 : 1 채팅
		//private Map<Map<String, Object>> sessionList = new HashMap<Map<String, Object>>();
	
	
		// (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) 형태
		//방법 2 : 전체 채팅
		private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
		
		// 클라이언트가 서버로 메세지 전송 처리
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

			super.handleTextMessage(session, message);
			
			String str = message.getPayload();
			
			
			
			this.mvo = gson.fromJson(str, MessageVO.class);
			
			log.info(mvo);

			// JSON --> Map으로 변환
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

			//System.out.println(mapReceive);
			
			switch (mvo.getCmd()) {
			
			// CLIENT 입장
			case "CMD_ENTER":
				// 세션 리스트에 저장
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("bang_id", mapReceive.get("bang_id"));
				map.put("session", session);
				map.put("id", mapReceive.get("id"));
				sessionList.add(map);
				
				// 같은 채팅방에 입장 메세지 전송
				for (int i = 0; i < sessionList.size(); i++) {
					Map<String, Object> mapSessionList = sessionList.get(i);
					String bang_id = (String) mapSessionList.get("bang_id");
					WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
					
					if(bang_id.equals(mapReceive.get("bang_id"))) {
						
//						mvo.setContent(mvo.getSenderId() + "님이 입장 했습니다.");
						
//						Map<String, String> mapToSend = new HashMap<String, String>();
//						mapToSend.put("bang_id", bang_id);
//						mapToSend.put("cmd", "CMD_ENTER");
//						mapToSend.put("msg",  map.get("id") +  "님이 입장 했습니다.");
						
//						String jsonStr = objectMapper.writeValueAsString(mapToSend);
						//sess.sendMessage(new TextMessage(jsonStr));
						
						sess.sendMessage(new TextMessage(gson.toJson(mvo)));
					}
				}
				break;
				
			// CLIENT 메세지
			case "CMD_MSG_SEND":
				// 같은 채팅방에 메세지 전송
				for (int i = 0; i < sessionList.size(); i++) {
					Map<String, Object> mapSessionList = sessionList.get(i);
					String bang_id = (String) mapSessionList.get("bang_id");
					WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

					if (bang_id.equals(mapReceive.get("bang_id"))) {
						
						mvo.setSendDate(new Date());
						
						
						
//						Map<String, String> mapToSend = new HashMap<String, String>();
//						mapToSend.put("bang_id", bang_id);
//						mapToSend.put("cmd", "CMD_MSG_SEND");
//						mapToSend.put("msg", session.getId() + " : " + mapReceive.get("msg"));
//
//						String jsonStr = objectMapper.writeValueAsString(mapToSend);
//						sess.sendMessage(new TextMessage(jsonStr));
						
						sess.sendMessage(new TextMessage(gson.toJson(mvo)));
						
						service.saveMessage(mvo);
						
						
						
						
					}
				}
				break;
			}
		}

		// 클라이언트가 연결을 끊음 처리
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

			super.afterConnectionClosed(session, status);
			
			log.info(status.toString());
			
			ObjectMapper objectMapper = new ObjectMapper();
			String now_bang_id = "";
			
			// 사용자 세션을 리스트에서 제거
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> map = sessionList.get(i);
				String bang_id = (String) map.get("bang_id");
				WebSocketSession sess = (WebSocketSession) map.get("session");
				
				if(session.equals(sess)) {
					now_bang_id = bang_id;
					sessionList.remove(map);
					break;
				}	
			}
			
			// 같은 채팅방에 퇴장 메세지 전송 
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (bang_id.equals(now_bang_id)) {
					
					mvo.setCmd("CMD_EXIT");
					
//					Map<String, String> mapToSend = new HashMap<String, String>();
//					mapToSend.put("bang_id", bang_id);
//					mapToSend.put("cmd", "CMD_EXIT");
//					mapToSend.put("content", session.getId() + "님이 퇴장 했습니다.");
//
//					String jsonStr = objectMapper.writeValueAsString(mapToSend);
//					sess.sendMessage(new TextMessage(jsonStr));
					
					sess.sendMessage(new TextMessage(gson.toJson(mvo)));
					
					mvo.setCmd("");

				}
			}
		}
	}