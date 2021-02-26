package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.TagVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class TagMapperTest {
	
	@Autowired
	TagMapper mapper;
	
//	@Ignore
	@Test
	public void selectAllTest() {
		log.info(mapper.selectAll());
	}
	
	@Ignore
	@Test
	public void createTagTest() {
		
		int articleId = 102;
		String tagName = "테스트";
		
		TagVO tag = new TagVO();
		
		tag.setArticleId(articleId);
		tag.setTagName(tagName);
		
		mapper.createTag(tag);
		
		log.info("createTagTest - Complete");
	}
	
	@Ignore
	@Test
	public void createTagSamples() {
		
		int articleId = 102;
		
		for (int i = 0; i < 3; i++) {
			String tagName = "테스트" + i; 
			
			TagVO tag = new TagVO();
			
			tag.setArticleId(articleId);
			tag.setTagName(tagName);
			
			mapper.createTag(tag);
			log.info(tag);
		}
		
		log.info("createTagSamples - Complete");
	}
	
	
}
