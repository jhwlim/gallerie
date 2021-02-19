package com.kgitbank.spring.domain.test.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.account.mapper.AccountMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class MybatisConfigTests {
	
	@Autowired
	MemberMapper mapper;
	
	@Autowired
	private AccountMapper acc_mapper;
	
//	@Test
//	@Ignore
//	public void testMybatisConfig() {
//		log.info(mapper.selectAll());
//	}
	
	// 아이디 중복 검사
	@Test
	public void memberIdChk() throws Exception{
		String id = "admin"; // 존재하는 아이디 
		String id2 = "test123"; // 존재하지 않는 아이디 
		acc_mapper.idCheck(id); acc_mapper.idCheck(id2);
	}
	

	
}
