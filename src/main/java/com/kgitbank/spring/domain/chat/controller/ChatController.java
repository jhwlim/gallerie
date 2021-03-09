package com.kgitbank.spring.domain.chat.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;
import com.kgitbank.spring.domain.chat.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class ChatController {
	
	
	@Setter(onMethod_ = {@Autowired})
	private ChatService service;
	
	/*
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String viewChatPage(@RequestParam String id, Model model) {
		
		model.addAttribute("receiver_id", id);
		
		return "chat/chat";
	}
	*/
	
		
	@RequestMapping(value = "/chat.do/{receiverId}", method = RequestMethod.GET)
	public String viewChatPage(@PathVariable String receiverId, HttpSession session, Model model) {
		
		// 로그인한 아이디 가져오기
		String loginId = (String) session.getAttribute("user");
		if (loginId == null) {
			return "redirect:/";
		}
		
		int loginSeqId = service.selectMemberById(loginId).getSeqId();
		int receiverSeqId = service.selectMemberById(receiverId).getSeqId();
		
		ChattingRoom room = service.selectRoomIdByUserSeqIds(loginSeqId, receiverSeqId);
		log.info("room=" + room);
		if (room == null) { // 자기 자신에게 메시지를 보내는 경우
			return "/chat.do/" + receiverId;
		} else {
			model.addAttribute("roomId", room.getSeqId());
			model.addAttribute("messages", service.selectMessageByRoomId(room.getSeqId())); // 이전에 대화했던 메시지 내용
			
			List<String> freiends = new ArrayList<>();
			freiends.add("test02");
			freiends.add("test03");
			freiends.add("test04");
			model.addAttribute("friends", freiends);
		}
		
		return "chat/chat";
	}
	
}
