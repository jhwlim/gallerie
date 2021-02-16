package com.kgitbank.spring.domain.myprofile.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kgitbank.spring.domain.model.MemberVO;

@Controller(value = "/myprofile")
public class MyprofileController {

	private MyprofileService service;
	
	@GetMapping(value = "/myprofilemain")
	public String main() {
		return "myprofile/myprofilemain";
	}
	
	@GetMapping(value = "/update")
	public String update() {
		List<MemberVO> updateList = service.updateMyprofile();
		
		return "myprofile/update";
	}
	
	
	
}







