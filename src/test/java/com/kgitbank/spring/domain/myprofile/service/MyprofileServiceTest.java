package com.kgitbank.spring.domain.myprofile.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.controller.MyprofileService;
import com.kgitbank.spring.domain.test.mapper.MybatisConfigTests;

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
	
	@Test
	public void servicetest() {
		MemberVO mv = new MemberVO();
		
		mv.setName("홍");
		mv.setEmail("gildong");
		mv.setPhone("111-111-111");
		mv.setId("abc5678");
		
		service.updateMyprofile(mv);
		log.info(mv);
	}
	
}







