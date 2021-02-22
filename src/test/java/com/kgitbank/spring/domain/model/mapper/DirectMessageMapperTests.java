package com.kgitbank.spring.domain.model.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.model.DirectMessageVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class DirectMessageMapperTests {

	@Autowired
	DirectMessageMapper mapper;
	
	@Ignore
	@Test
	public void selectAllTest() {
		log.info(mapper.selectAll());
	}
	
	@Ignore
	@Test
	public void createNewMessageTest() {
		
		int senderSeqId = 2;
		int receiverSeqId = 3;
		String content = "Hello!";
		
		DirectMessageVO message = new DirectMessageVO();
		
		message.setSenderSeqId(senderSeqId);
		message.setReceiverSeqId(receiverSeqId);
		message.setContent(content);
		
		mapper.createNewMessage(message);
		
		log.info("createNewMessageTest - Complete");
	}
	
}
