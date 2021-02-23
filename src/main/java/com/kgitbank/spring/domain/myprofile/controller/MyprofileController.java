package com.kgitbank.spring.domain.myprofile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.model.LoginVO;
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
	
	// 비밀번호 변경 페이지
	@GetMapping(value = "/updatepw")
	public String currentpw() {
		return "myprofile/updatepw";
	}
	
	@PostMapping(value = "/updatepw")
	public String currentpw(MemberVO vo) {
		vo.setId("abc5678");
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
	
	// 로그인활동 페이지
	@GetMapping(value = "/loginActivity")
	public String loginActivity(Model model) {
		MemberVO mv = new MemberVO();
		mv.setSeqId(1);
		LoginVO lv = new LoginVO();
		lv.setMemberSeqId(1);
		
		List<LoginVO> list = service.getLoginActivityList(mv, lv);
		log.info(list);
//		return service.getLoginActivityList();
		model.addAttribute("loginActivity", list);
		return "myprofile/loginActivity";
	}
	
	/*
	@PostMapping(value = "/loginActivity")
	public void getLoginActivityList(Model model) {
		MemberVO mv = new MemberVO();
		mv.setSeqId(1);
		LoginVO lv = new LoginVO();
		lv.setMemberSeqId(1);
		
		List<LoginVO> list = service.getLoginActivityList(mv, lv);
		log.info(list);
//		return service.getLoginActivityList();
		model.addAttribute("loginActivity", list);
	}
	*/
	
	
	
// ----------------------------------------------------------------------------------
	// 기능 확인용
	@GetMapping(value = "/test")
	public String test() {	
		return "myprofile/test";
	}
	
}