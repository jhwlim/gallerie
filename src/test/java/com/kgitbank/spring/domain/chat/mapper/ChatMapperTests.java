package com.kgitbank.spring.domain.chat.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",	
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class ChatMapperTests {
	
	@Autowired
	ChatMapper mapper;
	
	@Ignore
	@Test
	public void selectRoomIdByUserSeqIdsTest() {
		int smallSeqId = 1;
		int largeSeqId = 2;
		
		ChattingRoom room = new ChattingRoom();
		room.setSmallUserSeqId(smallSeqId);
		room.setLargeUserSeqId(largeSeqId);
		
		log.info("room=" + mapper.selectRoomIdByUserSeqIds(room));
	}
	
	@Ignore
	@Test
	public void createRoomIdTest() {
		int smallSeqId = 1;
		int largeSeqId = 2;
		
		ChattingRoom room = new ChattingRoom();
		room.setSmallUserSeqId(smallSeqId);
		room.setLargeUserSeqId(largeSeqId);
		
		log.info("room seqId : " + mapper.createRoomId(room));
	}
	
	@Test
	public void test() {
		int roomId = 2;
		log.info(mapper.selectMessageByRoomId(roomId));
	}
}
