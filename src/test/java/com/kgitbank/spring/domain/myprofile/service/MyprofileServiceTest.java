package com.kgitbank.spring.domain.myprofile.service;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class MyprofileServiceTest {

	@Autowired
	MyprofileService service;
	
	@Test @Ignore
	public void servicetest() {
		MemberVO mv = new MemberVO();
		
		mv.setName("홍");
		mv.setEmail("gildong");
		mv.setPhone("111-111-111");
		mv.setId("abc5678");
		
		service.updateMyprofile(mv);
		log.info(mv);
	}
	
	@Test @Ignore
	public void servicetest1() {
		MemberVO mv = new MemberVO();

//		mv.setPw("1113");
		mv.setId("abc5678");
		mv.setPw("1114");
		
		service.updatepw(mv);
		log.info(mv);
	}
	
	
	@Test
	public void servicetest2() {
		MemberVO mv = new MemberVO();
		mv.setSeqId(1);
		LoginVO lv = new LoginVO();
		lv.setMemberSeqId(1);
		
		log.info(service.getLoginActivityList(mv, lv));
		
	}
	
	
	
}






