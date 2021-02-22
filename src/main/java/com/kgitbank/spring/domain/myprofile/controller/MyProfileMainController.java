package com.kgitbank.spring.domain.myprofile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MyProfileMainController {
	
	@GetMapping("/myprofile")
	public String getMyProfileMain(HttpSession session) {
		log.info(session.getAttribute("user"));
		
		return "myprofile/main";
	}
}
