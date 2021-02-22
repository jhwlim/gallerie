package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.FileVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class FileMapperTests {
	
	@Autowired
	FileMapper mapper;
	
//	@Ignore
	@Test
	public void selectAllTest() {
		log.info(mapper.selectAll());
	}
	
	@Ignore
	@Test
	public void saveFileTest() {
		
		String imgPath = "/test";
		int articleId = 102;
		
		FileVO file = new FileVO();
		
		file.setImgPath(imgPath);
		file.setArticleId(articleId);
		
		mapper.saveFile(file);
		
		log.info("saveFileTest - Complete");
	}
	
	@Ignore
	@Test
	public void createFileSamples() {
		
		String imgPath = "/test/test"; // 파일 저장 경로
		int articleId = 102; // articles 테이블에 존재하는 id
		
		FileVO file = new FileVO();
		
		file.setImgPath(imgPath);
		file.setArticleId(articleId);
		
		mapper.saveFile(file);
		
		log.info("createFileSamples - Complete");
	}
}
