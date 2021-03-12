package com.kgitbank.spring.domain.myprofile.mapper;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class ProfileMainMapperTests {
	
	@Autowired
	ProfileMainMapper mapper;
	
	@Autowired
	ProfileImageMapper imgMapper;
	
	@Test
	public void selectMemberByIdTest() {
		
		String id = "test00";
		
		log.info(mapper.selectMemberById(id));
	}
	
	@Ignore
	@Test
	public void updateProfileImgBySeqIdTest() {
		int seqId = 1;
		String imgPath = "/test";
		
		MemberVO member = new MemberVO();
		member.setSeqId(seqId);
		member.setImgPath(imgPath);
		
		int result = imgMapper.updateProfileImgBySeqId(member);
		
		assertEquals(1, result);
	}
	
	@Ignore
	@Test
	public void selectProfileImgBySeqIdTest() {	
		int seqId = 1;	
		log.info(imgMapper.selectProfileImgBySeqId(seqId));
	}
	
}








