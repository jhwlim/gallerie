package com.kgitbank.spring.global.util;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kgitbank.spring.domain.chat.dto.ChattingUser;
import com.kgitbank.spring.domain.chat.service.ChatService;
import com.kgitbank.spring.domain.model.MessageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class EchoHandler extends TextWebSocketHandler {
	
		@Autowired
		ChatService service;
		
		private static Gson gson = new Gson();
			
		Map<Integer, List<WebSocketSession>> sessions = new HashMap<Integer, List<WebSocketSession>>(); // roomId - 접속한 세션 리스트
		Map<String, ChattingUser> sessionIdMap = new HashMap<>(); // 세션ID - 유저정보(roomId, seqId, id)
		
		// 클라이언트가 서버로 메세지 전송 처리
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			String str = message.getPayload();
						
			MessageVO mvo = gson.fromJson(str, MessageVO.class);
			int roomId = mvo.getRoomId();
			List<WebSocketSession> connectedSessions = sessions.get(roomId);
			
			switch (mvo.getCmd()) {
			// CLIENT 입장
			case "CMD_ENTER":
				// 세션ID 맵에 접속한 유저 정보를 추가한다.
				ChattingUser user = new ChattingUser();
				user.setRoomId(roomId);
				user.setId(mvo.getSenderId());
				user.setSeqId(service.selectMemberById(mvo.getSenderId()).getSeqId());
				
				sessionIdMap.put(session.getId(), user);
				
				// 접속한 세션을 해당 roomId의 리스트에 추가한다.
				if (connectedSessions == null) {
					connectedSessions = new LinkedList<>();
				} 
				connectedSessions.add(session);
				sessions.put(roomId, connectedSessions);
				log.info("sessions=" + sessions);
				
				for(WebSocketSession connectedSession : connectedSessions) {
					connectedSession.sendMessage(new TextMessage(gson.toJson(mvo)));
				}
				
				// DB 업데이트 : 상대방이 보낸 안 읽은 메시지 'Y'로 변경하기
				int cntChanged = service.updateMessageRead(user);
				log.info("count of read N → Y = " + cntChanged);
				
				break;
				
			// CLIENT 메세지
			case "CMD_MSG_SEND":
				mvo.setRoomId(roomId);
				mvo.setSendDate(new Date());
				ChattingUser sendUser = (ChattingUser) sessionIdMap.get((String) session.getId());
				int senderSeqId = sendUser.getSeqId();
				mvo.setSenderSeqId(senderSeqId);
				
				boolean existOther = false;
				
				// roomId의 리스트에 있는 세션에게 메시지를 보낸다.
				for(WebSocketSession connectedSession : connectedSessions) {
					connectedSession.sendMessage(new TextMessage(gson.toJson(mvo)));
					
					// 채팅방에 상대방 있는지 확인하기
					if (!existOther) {
						String sessionId = connectedSession.getId();
						ChattingUser u = sessionIdMap.get(sessionId);
						if (!u.getId().equals(mvo.getSenderId())) { // 채팅을 보낸 아이디와 다른 아이디가 존재한다면
							log.info(u);
							log.info(mvo);
							existOther = true;
						}
					}
				}
				
				// 상대방이 있다면 read = 'Y', 없다면 'N'
				mvo.setRead(existOther ? 'Y' : 'N');
				
				// 보낸 메시지를 DB에 저장한다.
				service.insertMessage(mvo);
				
				break;
			}
		}

		// 클라이언트가 연결을 끊음 처리
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			// 연결을 끊은 세션 삭제하기
						
			ChattingUser user = sessionIdMap.get((String) session.getId());
			int roomId = user.getRoomId();
						
			List<WebSocketSession> connectedSessions = sessions.get(roomId);
			log.info("세션 삭제 전 : " + connectedSessions);
			connectedSessions.remove(session);
			log.info("세션 삭제 후 : " + connectedSessions);
			
			MessageVO newMvo = new MessageVO();
			newMvo.setSenderId(user.getId());
			newMvo.setCmd("CMD_EXIT");
			
			for(WebSocketSession connectedSession : connectedSessions) {
				connectedSession.sendMessage(new TextMessage(gson.toJson(newMvo)));
				
				
			}
			
		}
	}