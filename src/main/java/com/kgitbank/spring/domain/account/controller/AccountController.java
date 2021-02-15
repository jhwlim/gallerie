package com.kgitbank.spring.domain.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * 회원가입 처리
 * 아이디/비밀번호 찾기
 * 프로필
 */
@Controller(value = "/account")
public class AccountController {
	
	@GetMapping(value = "/join")
	public String join() {
		return "account/signUp";
	}
}
