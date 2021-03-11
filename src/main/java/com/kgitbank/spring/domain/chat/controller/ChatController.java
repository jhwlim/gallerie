package com.kgitbank.spring.domain.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;
import com.kgitbank.spring.domain.chat.service.ChatService;
import com.kgitbank.spring.domain.model.MemberVO;

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
	public String getChatPage(@PathVariable(name = "receiverId", required = false) String receiverId, HttpSession session, Model model) {
		
		// 로그인한 아이디 가져오기
		String loginId = (String) session.getAttribute("user");
		if (loginId == null) {
			return "redirect:/";
		}
		
		int loginSeqId = service.selectMemberById(loginId).getSeqId();
		
		if (receiverId == null) {
			return "chat/standBy";
		} else {
			MemberVO receiver = service.selectMemberById(receiverId);
			if (receiver == null) {
				return "redirect:/message";
			}
			int receiverSeqId = receiver.getSeqId();
			log.info(receiverSeqId);
			
			ChattingRoom room = service.selectRoomIdByUserSeqIds(loginSeqId, receiverSeqId);
			log.info(room);
			if (room == null) { // 자기 자신에게 메시지를 보내는 경우
				return "redirect:/message";
			} else {
				model.addAttribute("receiver", receiver);
				model.addAttribute("roomId", room.getSeqId());
				model.addAttribute("messages", service.selectMessageByRoomId(room.getSeqId())); // 이전에 대화했던 메시지 내용		
			}	
		}
		
		// 최근 대화 상대 목록
		model.addAttribute("friends", service.selectContactList(loginSeqId));
		log.info(service.selectContactList(loginSeqId));
		
		return "chat/main";
	}
	
}
