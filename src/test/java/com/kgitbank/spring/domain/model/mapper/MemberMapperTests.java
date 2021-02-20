package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.global.util.SecurityPwEncoder;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class MemberMapperTests {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	SecurityPwEncoder encoder;
	
	@Ignore
	@Test
	public void selectAllTest() {
		log.info(memberMapper.selectAll());
	}
	
	@Ignore
	@Test
	public void insertMemberTest() {
		String id = "abc1234";
		String rawPw = "1234";
		String name = "홍길동";
		String phone = "012-1234-1234";
		String email ="abc1234@test.test.com";
		String profile = "";
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPw(encoder.encode(rawPw));
		member.setName(name);
		member.setPhone(phone);
		member.setEmail(email);
		member.setProfile(profile);
		
		memberMapper.insertMember(member);
		log.info("insertMemberTest - Complete");
	}
	
	
	@Test
	public void createMemberSamples() {
		
		for (int i = 0; i < 100; i++) {
			String id = String.format("test%02d", i);
			String rawPw = String.format("test%02d", i);
			String name = String.format("테스트%02d", i);
			String phone = String.format("012-1234-%04d", i);
			String email = String.format("test%02d@test.test.com", i);
			String profile = String.format("테스트 프로필 %02d", i);
			
			MemberVO member = new MemberVO();
			member.setId(id);
			member.setPw(encoder.encode(rawPw));
			member.setName(name);
			member.setPhone(phone);
			member.setEmail(email);
			member.setProfile(profile);
			
			log.info(member);
			memberMapper.insertMember(member);
		}
		log.info("createSampleMembers - Complete");
	}
}
