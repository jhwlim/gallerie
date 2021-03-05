package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.follow.mapper.FollowMapper;
import com.kgitbank.spring.domain.model.FollowVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class FollowMapperTests {
	
	@Autowired
	FollowMapper mapper;
	
	ProfileDto vo = new ProfileDto();
	
//	@Ignore
	@Test
	public void selectAllTest() {
		vo.setSeqId(2);
		log.info(mapper.selectFollow(vo));
	}
	
	@Ignore
	@Test
	public void followTest() {
		
		
		int followerId = 2;
		int followId = 4;
		
		FollowVO followInfo = new FollowVO();
		followInfo.setFollowerId(followerId);
		followInfo.setFollowId(followId);
		
		mapper.following(followInfo);
		
		log.info("followTest - Complete");
	}
	
}
