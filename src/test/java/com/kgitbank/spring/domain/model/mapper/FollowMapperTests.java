package com.kgitbank.spring.domain.model.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.follow.mapper.FollowMapper;
import com.kgitbank.spring.domain.model.FollowVO;

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
	
	@Test
	public void createDemoData() {
		
		int followId = 107;
		FollowVO vo = new FollowVO();
		
		for (int i = 2; i < 32; i++) {
			vo.setFollowerId(i);
			vo.setFollowId(followId);
			mapper.following(vo);
		}
		
		log.info("Finish");
	}
}
