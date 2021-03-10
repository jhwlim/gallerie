package com.kgitbank.spring.domain.myprofile.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
@RequestMapping(value = "/myprofile/account")
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
		return "myprofile/account/edit";
	}
	
	@RequestMapping(value = "/edit", method=RequestMethod.POST)
	public String update(@RequestParam HttpSession session) {
		MemberVO vo = new MemberVO();
//		vo.setId("abc5678");
//		vo.setId("test00");
		log.info(vo);
		String loginId = (String) session.getAttribute("user");
		log.info("loginId: " + loginId);
		vo.setId(loginId);
		service.updateMyprofile(vo);
		return "redirect:/myprofile/account/edit";
	}
	
	// 비밀번호 확인 페이지
	@GetMapping(value = "/checkpw")
	public String currentpw() {
		return "myprofile/account/checkpw";
	}
	
	@PostMapping(value = "/checkpw")
	public String currentpw(MemberVO vo, Model model, @RequestParam("test") String test) {
		vo.setId("abc5678");
		log.info(test);
		
		if (encoder.matches(vo.getPw(), service.currentpw(vo))) {
			log.info("일치");
			log.info(vo.getPw());
			model.addAttribute("oldpw", vo.getPw());
			model.addAttribute("test", test);
			return "myprofile/account/changepw";
		} else {
			log.info("불일치");
			return "redirect:/myprofile/account/checkpw";
		}
	}
	
	// 비밀번호 변경 페이지
	@GetMapping(value = "/changepw")
	public String updatepw(@RequestParam(name="test", required=false) String test) {
		if (test == null) {
			return "redirect:/myprofile/updatepw";
		}
		return "myprofile/account/changepw";
	}
	
	@PostMapping(value = "/changepw")
	public String updatepw(MemberVO vo) {
		vo.setId("abc5678");
		
		service.updatepw(vo);
		return "redirect:/myprofile/account/updatepw";

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
		model.addAttribute("loginActivity", list);
		return "myprofile/account/loginActivity";
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