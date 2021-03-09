package com.kgitbank.spring.domain.article.mapper;

import java.util.ArrayList;
import java.util.List;

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
public class ArticleContentMapperTests {

	@Autowired
	ArticleContentMapper mapper;
	
	@Ignore
	@Test
	public void insertTagsTest() {
		
		int articleId = 1;
		String[] tagNames = {"A", "B", "C"};
		
		List<TagVO> tags = new ArrayList<>();
		
		for (String tagName : tagNames) {
			TagVO tag = new TagVO();
			tag.setArticleId(articleId);
			tag.setTagName(tagName);
			tags.add(tag);
		}
		
		mapper.insertTags(tags);
		
		log.info("insertTagsTest - Complete");
	}
	
	
}
