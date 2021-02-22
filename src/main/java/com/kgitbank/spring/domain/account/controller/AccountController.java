package com.kgitbank.spring.domain.account.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kgitbank.spring.domain.account.service.AccountService;
import com.kgitbank.spring.domain.model.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


/*
	- 회원가입
	- 로그인
	- 아이디/비밀번호 찾기
 */

@Controller(value = "/account")
@AllArgsConstructor
@Log4j
public class AccountController {

	@Setter(onMethod_ = {@Autowired})
	private AccountService service;	

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping(value = "/login")
	public String login() {
		return "main/login";
	}

	@GetMapping(value = "/signup")
	public String join() {
		return "account/signUp";
	}

	@GetMapping(value = "/findid")
	public String findId() {
		return "account/findId";
	}

	//비밀번호 찾기 아이디 입력
	@GetMapping(value = "/findpw")
	public String findPw() {
		return "account/findPw";
	}

	//비밀번호 찾기 이메일 인증
	@PostMapping(value = "/userauth")
	public String userAuth(String id, Model model, MemberVO mem) throws Exception {

		model.addAttribute("member", service.userAuth(mem.getId()));

		return "account/userAuth";
	}

	@PostMapping(value = "/resetpw")
	public String resetPw(String id, Model model) throws Exception{

		model.addAttribute("member", service.resetPw(id));

		return "account/resetPw";
	}

	@PostMapping(value = "/login")
	public String changedPw(MemberVO mem) throws Exception{

		int result = service.changedPw(mem);

		return "main/login";
	}

	@PostMapping(value = "/viewidlist")
	public String viewIdList(String email, Model model, MemberVO mem) throws Exception{

		model.addAttribute("member", service.viewIdList(email));

		return "account/viewIdList";
	}


	@PostMapping(value = "/success")
	public String signUp(MemberVO mem) throws Exception {

		int result = service.signUp(mem);

		return "account/success";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception{

		//아이디 입력 테스트용 
		//logger.info("memberIdChk() 진입");

		int result = service.idCheck(id);

		//아이디 중복 테스트용
		//logger.info("결과값 = " + result);

		if(result != 0) {
			return "fail"; // 중복 아이디가 존재 
		} else {
			return "success"; // 중복 아이디 x 
		}
	} // memberIdChkPOST() 종료

	// 이메일 중복 검사
	@RequestMapping(value = "/memberEmailChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberEmailChkPOST(String email) throws Exception{


		log.info("memberEmailChk() 진입");
		int result = service.emailCheck(email);


		log.info("결과값 = " + result);
		if(result != 0) {
			return "fail"; // 중복 이메일이 존재 
		} else {
			return "success"; // 중복 이메일 x 
		}
	} // memberEmailChkPOST() 종료

	/* 이메일 인증 */
	@RequestMapping(value="/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{


		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "youremail@naver.com";
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


	/* 이메일 인증 */
	@RequestMapping(value="/mailCheckPw", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckPwGET(String email) throws Exception{

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "youremail@naver.com";
		String toMail = email;
		String title = "비밀번호 재설정 인증 이메일 입니다.";
		String content = 
				"본인이 하지 않은 활동이었다면 비밀번호를 변경하시기 바랍니다." +
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
