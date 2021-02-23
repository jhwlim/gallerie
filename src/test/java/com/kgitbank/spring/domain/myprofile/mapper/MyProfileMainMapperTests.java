package com.kgitbank.spring.domain.myprofile.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.mapper.ArticleLikeMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class MyProfileMainMapperTests {
	
	@Autowired
	MyProfileMainMapper mapper;
	
	@Test
	public void selectMemberByIdTest() {
		
		String id = "test00";
		
		log.info(mapper.selectMemberById(id));
	}
	
}
