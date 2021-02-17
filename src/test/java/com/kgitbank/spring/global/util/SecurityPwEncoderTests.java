package com.kgitbank.spring.global.util;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SecurityPwEncoderTests {
	
	@Autowired
	SecurityPwEncoder encoder;
	
	@Ignore
	@Test
	public void encodeTest() {
		String rawPw = "abc1234";
		log.info(encoder.encode(rawPw));
	}
	
	@Test
	public void matchTest() {
		String rawPw = "abc1234";
		String encodedPw = encoder.encode(rawPw);
		log.info(encoder);
		
		SecurityPwEncoder newEncoder = new SecurityPwEncoderImpl();
		log.info(newEncoder);
	
		assertEquals(true, newEncoder.matches(rawPw, encodedPw));
		log.info("Test Complete");
	}
	
	
	
}
