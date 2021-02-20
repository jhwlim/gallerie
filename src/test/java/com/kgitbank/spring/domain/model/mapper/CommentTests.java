package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.CommentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class CommentTests {
	
	@Autowired
	CommentMapper mapper;

	@Ignore
	@Test
	public void selectAll() {
		log.info(mapper.selectAll());
	}
	
	@Ignore
	@Test
	public void createCommentTest() {
		
		int articleId = 102;
		int memberSeqId = 2;
		String content = "Hello!";
		
		CommentVO comment = new CommentVO();
		
		comment.setArticleId(articleId);
		comment.setMemberSeqId(memberSeqId);
		comment.setContent(content);
		
		mapper.createComment(comment);
		
		log.info("createCommentTest - Complete");
	}
	
	@Test
	public void createCommentSamples() {
		
		int articleId = 102; // articles 테이블에 존재하는 id
		
		for (int i = 0; i < 5; i++) {
			
			int memberSeqId = 2 + i; // members 테이블에 존재하는 seq_id
			String content = "테스트 댓글 " + i;
			
			CommentVO comment = new CommentVO();
			
			comment.setArticleId(articleId);
			comment.setMemberSeqId(memberSeqId);
			comment.setContent(content);
			
			log.info(comment);
			mapper.createComment(comment);
		}
		
		log.info("createCommentSamples - Complete");
	}
	
	
}
