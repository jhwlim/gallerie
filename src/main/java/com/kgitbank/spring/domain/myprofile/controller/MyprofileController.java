package com.kgitbank.spring.domain.myprofile.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.dto.GeoIPVO;
import com.kgitbank.spring.domain.myprofile.service.GeoIPLocationService;
import com.kgitbank.spring.domain.myprofile.service.MyprofileService;
import com.kgitbank.spring.global.util.SecurityPwEncoder;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/account")
@Log4j
public class MyprofileController {
	@Autowired
	private MyprofileService service;
	private GeoIPLocationService locationService;
	public MyprofileController() throws IOException {
		locationService = new GeoIPLocationService();
	}
	
	@Autowired
	SecurityPwEncoder encoder;
	
	// 프로필 메인 페이지
//	@GetMapping(value = "/myprofilemain")
//	public String main() {
//		return "myprofile/myprofilemain";
//	}
	
	// 프로필 수정하는 페이지
	@RequestMapping(value = "/edit")
	public String update() {
		return "myprofile/edit";
	}
	
	@RequestMapping(value = "/edit", method=RequestMethod.POST)
	public String update(MemberVO vo, HttpSession session) {
		String loginId = (String) session.getAttribute("user");
		vo.setId(loginId);
		
//		model.addAttribute("id", loginId);
		
		// 확인해보고 지우기
//		log.info("vo.getName(): " + vo.getName());
//		model.addAttribute("currentName", vo.getName());
//		log.info("vo.getPhone(): " + vo.getPhone());
//		model.addAttribute("currentPhone", vo.getPhone());
//		log.info("vo.getEmail(): " + vo.getEmail());
//		model.addAttribute("currentEmail", vo.getEmail());
		
		service.updateMyprofile(vo);
		return "redirect:/myprofile/edit";
	}
	
	// 비밀번호 확인 페이지
	@GetMapping(value = "/checkpw")
	public String currentpw() {
		return "myprofile/checkpw";
	}
	
	@PostMapping(value = "/checkpw")
	public String currentpw(MemberVO vo, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		String loginId = (String) session.getAttribute("user");
		vo.setId(loginId);
		
		if (encoder.matches(vo.getPw(), service.currentpw(vo))) {
			log.info("일치");
			log.info(vo.getPw());
			model.addAttribute("oldpw", vo.getPw());
			return "myprofile/changepw";
		} else {
			log.info("불일치");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 확인해주세요.');</script>");
			out.flush();
			return "myprofile/checkpw";
		}
	}
	
	// 비밀번호 변경 페이지
	@GetMapping(value = "/changepw")
	public String updatepw(@RequestParam(name="test", required=false) String test) {
		if (test == null) {
			return "myprofile/checkpw";
		}
		return "myprofile/changepw";
	}
	
	@PostMapping(value = "/changepw")
	public String updatepw(MemberVO vo, HttpSession session) {
		String loginId = (String) session.getAttribute("user");
		vo.setId(loginId);
		
		service.updatepw(vo);
		return "myprofile/checkpw";
	}
	
	// 로그인활동 페이지
	@GetMapping(value = "/loginActivity")
	public String loginActivity(Model model) {
		MemberVO mv = new MemberVO();
		LoginVO lv = new LoginVO();
		
		List<LoginVO> list = service.getLoginActivityList(mv, lv);
		log.info("list: " + list);
		model.addAttribute("loginActivity", list);
		return "myprofile/loginActivity";
	}
	
    @GetMapping(value = "/GeoIP")
	public String GeoIPTest() {
		return "geoIPTest/GeoIP";
	}
    
    @PostMapping(value = "/GeoIP", produces="application/json")
    @ResponseBody
    public GeoIPVO getLocation(@RequestParam(value="ipAddress", required=true) String ipAddress) throws Exception {
    	return locationService.getLocation(ipAddress);
    }
	
}