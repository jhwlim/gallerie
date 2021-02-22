package com.kgitbank.spring.domain.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
