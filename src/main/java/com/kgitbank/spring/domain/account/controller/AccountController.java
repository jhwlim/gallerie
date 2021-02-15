package com.kgitbank.spring.domain.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kgitbank.spring.domain.account.model.Member;
import com.kgitbank.spring.domain.account.service.AccountService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
//회원가입


 */
@Controller(value = "/account")
//@AllArgsConstructor
//@Log4j
public class AccountController {
	
	@GetMapping(value = "/join")
	public String join() {
		return "account/signUp";
	}
	@Setter(onMethod_ = {@Autowired})
	private AccountService service;	
	
	@PostMapping(value = "/success")
	public String signUp(Member mem) {
		
		int result = service.signUp(mem);
		
		//String message = result > 0 ? "회원가입 완료" : "회원가입 실패";
		//rttr.addAttribute("message", message);
		
		return "account/success";
	}

}
