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

@RequestMapping("/message")
@Controller
@AllArgsConstructor
@Log4j
public class ChatController {
	
	@Setter(onMethod_ = {@Autowired})
	private ChatService service;
	
	@RequestMapping(value = {"", "/", "/{receiverId}"}, method = RequestMethod.GET)
	public String viewChatPage(@PathVariable(name = "receiverId", required = false) String receiverId, HttpSession session, Model model) {
		
		// 로그인한 아이디 가져오기
		String loginId = (String) session.getAttribute("user");
		if (loginId == null) {
			return "redirect:/";
		}
		
		int loginSeqId = service.selectMemberById(loginId).getSeqId();
		
		if (receiverId == null) {
			return "chat/main";
		} else {
			int receiverSeqId = service.selectMemberById(receiverId).getSeqId();
			
			ChattingRoom room = service.selectRoomIdByUserSeqIds(loginSeqId, receiverSeqId);
			if (room == null) { // 자기 자신에게 메시지를 보내는 경우
				return "/message/" + receiverId;
			} else {
				model.addAttribute("roomId", room.getSeqId());
				model.addAttribute("messages", service.selectMessageByRoomId(room.getSeqId())); // 이전에 대화했던 메시지 내용		
			}	
		}
		
		// 팔로우하고 있는 리스트
		List<String> list = new ArrayList<>();
		list.add("test02");
		list.add("test03");
		list.add("test04");
		model.addAttribute("friends", list);
	
		return "chat/main";
	}
	
}
