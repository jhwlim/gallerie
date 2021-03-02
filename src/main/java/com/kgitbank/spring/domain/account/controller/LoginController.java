package com.kgitbank.spring.domain.account.controller;


import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kgitbank.spring.domain.account.dto.Sessionkey;
import com.kgitbank.spring.domain.account.service.AccountService;
import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.global.util.GetIp;
import com.kgitbank.spring.global.util.SecurityPwEncoder;
import com.kgitbank.spring.global.util.SessionConfig;

import lombok.extern.log4j.Log4j;


@Controller

@Log4j
public class LoginController {
	
	@Autowired
	AccountService service;
	
	@Autowired
	SecurityPwEncoder encoder;
	
	@Autowired
	GetIp getip;
	
	

	@GetMapping(value = "/")
	public String main(HttpServletRequest req, HttpServletResponse rep, HttpSession session) {
		
		MemberVO loginMember = null;
		
		String doubleLogin = "";
		
		Cookie[] cookies = req.getCookies();
		String sessionId;
		
		// 로그인 세션이 있다면 home으로 이동시킴
		if(session.getAttribute("user") != null) {
			System.out.println("이미 로그인한 상태!!");
			return"/main/home";
		}
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("loginCookie") && cookie.getValue() != null) {
					sessionId=cookie.getValue();
					System.out.println(sessionId);
					loginMember = service.checkUserWithSessionkey(sessionId);
					
					
					System.out.println(loginMember);
					if(loginMember != null) {
						
						doubleLogin = SessionConfig.getSessionidCheck("user", loginMember.getId());
						session.setAttribute("user", loginMember.getId());
						
						LoginVO logvo = new LoginVO();
						
						logvo.setMemberSeqId(loginMember.getSeqId());
						logvo.setIp(getip.getIp(req));
						service.loginHistory(logvo);
						
						if(doubleLogin != "") {
							
							Date sessionLimit = new Date(System.currentTimeMillis());
							
							Sessionkey key = new Sessionkey();
							key.setEmail(loginMember.getEmail());
							key.setSessionId(session.getId());
							key.setNext(sessionLimit);
							
							service.keepLogin(key);
						}
						
						
						return "/main/home";
					}
				}
			}
		}

		
		return "account/login";
	}

	@PostMapping(value = "/")
	public String mainsignin(MemberVO member, HttpSession session, Model model, HttpServletRequest req, HttpServletResponse rep) {
		
		String doubleLogin = "";
		
		MemberVO loginMember = null;

		if(session.getAttribute("user") != null)session.removeAttribute("user");
		
		loginMember = service.getLogin(member);
		if(loginMember != null) {
			if(!(encoder.matches(member.getPw(), loginMember.getPw()))) {
				loginMember = null;
				req.setAttribute("loginFailMsg", "입력한 아이디와 비밀번호가 일치하지 않습니다. <br>아이디 또는 비밀번호를 다시 한번 입력해 주세요.");
				
			}
		}else {
			req.setAttribute("loginFailId", "해당 아이디가 없습니다.");
		}
		
		
		
		log.info(loginMember);
		
		if(loginMember != null) {
			
			System.out.println("다시로그인??");
			System.out.println("현재 세션 아이디" + session.getId());
			doubleLogin = SessionConfig.getSessionidCheck("user", loginMember.getId());
			session.setAttribute("user", loginMember.getId());
			System.out.println(getip.getIp(req));
			
			
			LoginVO logvo = new LoginVO();
			
			logvo.setMemberSeqId(loginMember.getSeqId());
			logvo.setIp(getip.getIp(req));
			service.loginHistory(logvo);
			String check = req.getParameter("remember");
			
			if(check != null) {
				
				Cookie newCookie = new Cookie("loginCookie", session.getId());
				newCookie.setPath("/");
				int amount = 60 * 60 * 24 * 7;
				newCookie.setMaxAge(amount);
				rep.addCookie(newCookie);
				
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
				
				Sessionkey key = new Sessionkey();
				key.setEmail(loginMember.getEmail());
				key.setSessionId(session.getId());
				key.setNext(sessionLimit);

					service.keepLogin(key);
			}
			
			if(doubleLogin != "") {
				
				Date sessionLimit = new Date(System.currentTimeMillis());
				
				Sessionkey key = new Sessionkey();
				key.setEmail(loginMember.getEmail());
				key.setSessionId(session.getId());
				key.setNext(sessionLimit);
				
				service.keepLogin(key);
			}
			
			return "main/home";
		}else {
			System.out.println("로그인실패");
		}
		
		return "account/login";
	} 
	
	@PostMapping(value = "/logout")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse rep) {
		session.invalidate();
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				System.out.println(cookies[i].getName() + " : " + cookies[i].getValue());
				cookies[i].setValue(null);
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				rep.addCookie(cookies[i]);
			}
		}
		return "redirect:/";
	}
	
	
	
	@PostMapping(value = "/sessiondel")
	public String sessiondel(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}

}
