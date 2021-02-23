package com.kgitbank.spring.domain.myprofile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.service.MyProfileMainService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/myprofile")
@Log4j
public class MyProfileMainController {
	
	@Autowired
	MyProfileMainService service;
	
	@GetMapping("/{id}")
	public String main(@PathVariable String id, Model model) {
		log.info("URL : /myprofile/" + id + " - GET");
		
		MemberVO member = service.selectMemberById(id);
		log.info("member=" + member);
		
		model.addAttribute("member", member);
		
		return member != null ? "myprofile/myProfileMain" : "";
	}
}
