package com.kgitbank.spring.domain.myprofile.controller;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.service.MyprofileService;
import com.kgitbank.spring.global.util.SecurityPwEncoder;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/myprofile")
@Log4j
public class MyprofileController {
	@Autowired
	private MyprofileService service;
	@Autowired
	SecurityPwEncoder encoder;
	
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
		service.updateMyprofile(vo);
		return "redirect:/myprofile/update";
	}
	
//	@GetMapping(value = "/updatepw")
//	@ResponseBody
//	public String currentpw(MemberVO vo) {
//		String resultAlert = "";
//		if (service.currentpw(vo).equals("1114")) {
//			resultAlert="<script>alert('확인완료');location.href='/myprofile/updatepw'</script>";
//		} else {
//			resultAlert="<script>alert('잘못된 비밀번호입니다');location.href='/myprofile/changepw'</script>";
//		}
//		return resultAlert;
//	}
	
	// 비밀번호 변경 페이지
	@GetMapping(value = "/updatepw")
	public String currentpw() {
		return "myprofile/updatepw";
	}
	
	@PostMapping(value = "/updatepw")
	public String currentpw(MemberVO vo) {
		vo.setId("abc5678");
		log.info(vo);
//		String result = "3333"; // 페이지넘어가나 확인하려고 지정해둠
//		
//		if (result.equals(service.currentpw(vo))) {
//			return "myprofile/changepw";
//		} else {
//			return "redirect:/myprofile/updatepw";
//		}
		
//		int result = service.currentpw(vo);
//		if (result > 0) {
//			return "myprofile/changepw";
//		} else {
//			return "redirect:/myprofile/updatepw";
//		}
		
		String result = null;
		
		if (encoder.matches(vo.getPw(), service.currentpw(vo))) {
			return "myprofile/changepw";
		} else {
			return "redirect:/myprofile/updatepw";
		}
	}
	
	
	@GetMapping(value = "/changepw")
	public String updatepw() {
		return "myprofile/changepw";
	}
	
	@PostMapping(value = "/changepw")
	public String updatepw(MemberVO vo) {
		vo.setId("abc5678");
		
		service.updatepw(vo);
		return "redirect:/myprofile/changepw";
	}
	
	
	
	
	
	
	
}







