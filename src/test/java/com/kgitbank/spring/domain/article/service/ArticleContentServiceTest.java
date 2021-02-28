package com.kgitbank.spring.domain.article.service;

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
public class ArticleContentServiceTest {
	
	@Autowired
	ArticleContentService service;
	
	@Test
	public void transactionTest() {
		
		ArticleVO article = new ArticleVO();
		article.setWriterSeqId(2);
		article.setContent("Hello");
		
		service.saveContent(article, null);
		
		log.info("transactionTest - Complete");
	}
	
}


