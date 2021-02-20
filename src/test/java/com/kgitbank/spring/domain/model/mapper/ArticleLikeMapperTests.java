package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.ArticleLikeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class ArticleLikeMapperTests {
	
	@Autowired
	ArticleLikeMapper mapper;
	
	@Ignore
	@Test
	public void selectAllTest() {
		log.info(mapper.selectAll());
	}
	
	@Ignore
	@Test
	public void likeTest() {
		
		int articleId = 102;
		int memberSeqId = 2;
		
		ArticleLikeVO vo = new ArticleLikeVO();
		
		vo.setArticleId(articleId);
		vo.setMemberSeqId(memberSeqId);
		
		mapper.like(vo);
		
		log.info("likeTest - Complete");
	}
	
	@Test
	public void createArticleLikeSamples() {
		
		int articleId = 102; // articles 테이블에 존재하는 id
		int memberSeqId = 2; // members 테이블에 존재하는 seq_id
		
		ArticleLikeVO vo = new ArticleLikeVO();
		
		vo.setArticleId(articleId);
		vo.setMemberSeqId(memberSeqId);
		
		mapper.like(vo);
		
		log.info("createArticleLikeSamples - Complete");
	}
}
