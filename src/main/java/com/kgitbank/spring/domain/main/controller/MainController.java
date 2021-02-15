package com.kgitbank.spring.domain.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.account.service.accountService;
import com.kgitbank.spring.model.Member;

/*
 * 로그인 화면
 * 메인 화면(게시물 조회)
 */
@Controller
public class MainController {
	
	@Autowired
	accountService service;
	
	@GetMapping(value = "/")
	public String main() {
		return "main/login";
	}
	
	@PostMapping(value = "/")
	public String mainsignin(Member member, HttpSession session, Model model) {

		
		Member loginMember = service.getLogin(member);
		
		if(loginMember != null) {
			System.out.println(loginMember);
			model.addAttribute("user", loginMember);
			return "main/home";
		}
		
		return "redirect:/";
	}
	
}
