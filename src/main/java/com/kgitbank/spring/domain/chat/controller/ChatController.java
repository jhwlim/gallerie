package com.kgitbank.spring.domain.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


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
	
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String viewChatPAge(@RequestParam String id, Model model) {
		
		model.addAttribute("receiver_id", id);
		
		return "chat/chat";
	}
		
}
