package com.kgitbank.spring.domain.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/*
 * 회원가입 처리
 * 아이디/비밀번호 찾기
 * 프로필
 */
@Controller(value = "/account")
public class accountController {
	
	@GetMapping(value = "/join")
	public String join() {
		return "account/signUp";
	}
	
}
