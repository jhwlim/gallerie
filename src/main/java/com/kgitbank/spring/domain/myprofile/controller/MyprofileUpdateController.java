package com.kgitbank.spring.domain.myprofile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "/myprofile")
public class MyprofileUpdateController {

	@GetMapping(value = "/update")
	public String update() {
		return "myprofile/update";
	}
	
}
