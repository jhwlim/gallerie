package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.ArticleVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class ArticleMapperTests {
	
	@Autowired
	ArticleMapper mapper;
	
	@Ignore
	@Test
	public void selectAllTest() {
		log.info(mapper.selectAll());
	}
	
	@Ignore
	@Test
	public void createNewArticleTest() {
		
		int writerSeqId = 2;
		String content = "Hello!";
		
		ArticleVO article = new ArticleVO();
		
		article.setWriterSeqId(writerSeqId );
		article.setContent(content);
		
		mapper.createNewArticle(article);
		
		log.info("createNewArticleTest - Complete");
	}
	
	@Test
	public void createArticleSamples() {
		
		int writerSeqId = 2; // members 테이블에 존재하는 seq_id
		
		for (int i = 0; i < 200; i++) {
			String content = String.format("테스트 게시글 %03d", i);
			
			ArticleVO article = new ArticleVO();
			
			article.setWriterSeqId(writerSeqId );
			article.setContent(content);
			
			log.info(article);
			mapper.createNewArticle(article);
		}

		log.info("createArticleSamples - Complete");
	}
	
}
