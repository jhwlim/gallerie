package com.kgitbank.spring.domain.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * 로그인 화면
 * 메인 화면 (게시물 조회)
 */
@Controller
public class MainController {
	
	@GetMapping(value = "/")
	public String main() {
		return "main/login";
	}
	
	@GetMapping(value="/main")
	public String home() {
		return "main/home";
	}
	
	
}
