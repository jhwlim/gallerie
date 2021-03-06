package com.kgitbank.spring.domain.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String viewChatPage(@RequestParam String id, Model model) {
		
		model.addAttribute("receiver_id", id);
		
		return "chat/chat";
	}
	
	@RequestMapping(value = "/messageSave", method = RequestMethod.POST)
	@ResponseBody
	public String messageSave(String message) throws Exception{
		
		//log.info("messageSave() 진입");
		
		//log.info(message);
		
		int result = service.messageSave(message);
		
		return "suceess";
		
	}

}
