package com.kgitbank.spring.domain.myprofile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller(value = "/myprofile")
public class MyprofileController {

	@GetMapping(value = "/myprofilemain")
	public String main() {
		return "myprofile/myprofilemain";
	}
	
	@GetMapping(value = "/update")
	public String update() {
		return "myprofile/update";
	}
	
	@GetMapping(value = "/update")
	public String update(@RequestBody User user, HttpSession session) {
		return "myprofile/update";
	}
	
	
	
	
}







