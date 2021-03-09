package com.kgitbank.spring.domain.article.service;

import javax.servlet.http.HttpSession;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.spring.domain.model.CommentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class ArticleCommentServiceTest {

	@Autowired
	ArticleCommentService service;
	
	@Test
	@Ignore
	public void test() {
		CommentVO vo = new CommentVO();
		String loginId = "test00"; // 로그인 아이디
		int memberSeqId = service.getMemberSeqId(loginId); // MemberSeqId
		vo.setArticleId(2);
		vo.setContent("Hello");
		vo.setMemberSeqId(memberSeqId);
		
		service.insertComment(vo);
	}
	
	@Test
	public void test2() {
		log.info(service.listComment(2));
	}
	
}

















