package com.kgitbank.spring.domain.account.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class AccountMapperTests {
	
	@Autowired
	private AccountMapper accMapper;
	
	// 아이디 중복 검사
	@Test
	public void memberIdChk() throws Exception{
		String id = "admin"; // 존재하는 아이디 
		String id2 = "test123"; // 존재하지 않는 아이디 
		accMapper.idCheck(id); accMapper.idCheck(id2);
	}
	

	
}
