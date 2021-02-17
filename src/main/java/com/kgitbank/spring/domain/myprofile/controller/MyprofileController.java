package com.kgitbank.spring.domain.myprofile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.model.MemberVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/myprofile")
@Log4j
public class MyprofileController {
	@Autowired
	private MyprofileService service;
	
	// 프로필 메인 페이지
	@GetMapping(value = "/myprofilemain")
	public String main() {
		return "myprofile/myprofilemain";
	}
	
	// 프로필 수정하는 페이지
	@RequestMapping(value = "/update")
	public String update() {
		return "myprofile/update";
	}
	
	@PostMapping(value = "/update")
	public String update(MemberVO vo) {
		vo.setId("abc5678");
		
//		int result = service.updateMyprofile(vo);
		
		return "redirect:/myprofile/update";
	}
	
	
	// 비밀번호 변경하는 페이지
	@RequestMapping(value = "/updatepw")
	public String updatePW() {
		return "myprofile/updatepw";
	}
	
	@PostMapping(value = "/updatepw")
	public String updatePW(MemberVO vo) {
//		log.info("접속완료");
				
//		vo.setPw("1113");
		vo.setId("abc5678");
		
//		int result; // 0, 1로 원래비밀번호 맞는지 확인하려고 남겨둠
		
		return "redirect:/myprofile/updatepw";
	}
	
	
	
	
	
}







