package com.kgitbank.spring.domain.myprofile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;
import com.kgitbank.spring.domain.myprofile.service.ProfileMainService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/myprofile")
@Log4j
public class ProfileMainController {
	
	@Autowired
	ProfileMainService service;
	
	@GetMapping("/{id}")
	public String main(@PathVariable String id, Model model, HttpSession session) {
		log.info("URL : /myprofile/" + id + " - GET");
		
		ProfileDto member = service.selectMemberById(id);
		MemberVO loginUser = (MemberVO) session.getAttribute("user");
		if (loginUser != null) {
			member.setSignedIn(id.equals(loginUser.getId()));			
		}
		log.info("member=" + member);
		
		member.setSignedIn(true);
		model.addAttribute("member", member);
		
		return member != null ? "myprofile/myProfileMain" : "";
	}
}
