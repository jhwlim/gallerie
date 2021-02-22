package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.LoginVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class LoginMapperTests {

	@Autowired
	LoginMapper mapper;
	
	@Ignore
	@Test
	public void selectAllTest() {
		log.info(mapper.selectAll());
	}
	
	@Ignore
	@Test
	public void createNewLoginTest() {
		
		int memberSeqId = 2;
		String location = "Korea, Seoul";
		String ip = "93.184.216.34";
		
		LoginVO login = new LoginVO();
		
		login.setMemberSeqId(memberSeqId);
		login.setLocation(location);
		login.setIp(ip);
		
		mapper.createNewLogin(login);
		
		log.info("createNewLoginTest - Complete");
	}
	
	@Test
	public void createLoginSamples() {
		
		int memberSeqId = 2;
		
		final int LOCATION = 0;
		final int IP = 1;
		
		String[][] samples = {
				{"Korea, Seoul", "93.184.216.34"},
				{"Korea, Busan", "93.184.216.35"},
				{"USA, Los Angeles", "93.184.216.36"},
		};
		
		for (int i = 0; i < samples.length; i++) {
			LoginVO login = new LoginVO();
			
			login.setMemberSeqId(memberSeqId);
			login.setLocation(samples[i][LOCATION]);
			login.setIp(samples[i][IP]);
			
			mapper.createNewLogin(login);
		}
		
		log.info("createLoginSamples - Complete");
	}
	
}
