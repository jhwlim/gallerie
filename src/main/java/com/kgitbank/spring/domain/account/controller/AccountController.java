package com.kgitbank.spring.domain.account.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.spring.domain.account.model.Member;
import com.kgitbank.spring.domain.account.service.AccountService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*
//회원가입


 */
@Controller(value = "/account")
@AllArgsConstructor
@Log4j
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	private AccountService service;	
	
	@Autowired
    private JavaMailSender mailSender;

	@GetMapping(value = "/join")
	public String join() {
		return "account/signUp";
	}
	
	
	
	
	
	
	@PostMapping(value = "/success")
	public String signUp(Member mem) throws Exception {
		
		int result = service.signUp(mem);
		
		//String message = result > 0 ? "회원가입 완료" : "회원가입 실패";
		//rttr.addAttribute("message", message);
		
		return "account/success";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception{
		
		/*logger.info("memberIdChk() 진입");*/ 
		
		logger.info("memberIdChk() 진입");
		
		int result = service.idCheck(id);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail"; // 중복 아이디가 존재 
		} else {
			return "success"; // 중복 아이디 x 
		}
	
	}// memberIdChkPOST() 종료
	
	/* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);

        /* 이메일 보내기 */
        String setFrom = "qswaz98@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
		try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
				
		String num = Integer.toString(checkNum);

		return num;     
    }

}
