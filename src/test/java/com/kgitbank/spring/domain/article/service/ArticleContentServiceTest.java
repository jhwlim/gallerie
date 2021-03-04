package com.kgitbank.spring.domain.article.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
public class ArticleContentServiceTest {
	
	@Autowired
	ArticleContentService service;
	
	@Ignore
	@Test
	public void transactionTest() {
		
		ArticleVO article = new ArticleVO();
		article.setWriterSeqId(2);
		article.setContent("Hello");
		
		service.saveArticleContent(article, null);
		
		log.info("transactionTest - Complete");
	}
	
	@Test
	public void getTagsFromContentTest() {
		
		String content = "#Hello #google #가나다 #가1 #da,123 #1&* #&* #*123 #해시_연습";
		
		Pattern tagPattern = Pattern.compile("\\#([0-9a-zA-Z가-힣_]+)");
		Matcher matcher = tagPattern.matcher(content);
		
		while(matcher.find()) {
			log.info(matcher.group(1));
		}
		
	}
	
}


