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
	
	@GetMapping({"/", "/{id}"})
	public String main(@PathVariable(name = "id", required = false) String id, Model model, HttpSession session) {
		log.info("URL : /myprofile/" + id + " - GET");
		log.info("id=" + id);
		if (id == null) {
			log.warn("id is null");
			return "redirect:/";
		}
		
		ProfileDto member = service.selectMemberById(id);
		if (member == null) {
			log.warn("page not found");
			return "redirect:/";
		}
		
		String loginedId = (String) session.getAttribute("user");
		log.info("loginedId=" + loginedId);
		
		member.setSignedIn(id.equals(loginedId));
		log.info("member=" + member);
		
		model.addAttribute("member", member);
		
		return "myprofile/myProfileMain";
	}
}
