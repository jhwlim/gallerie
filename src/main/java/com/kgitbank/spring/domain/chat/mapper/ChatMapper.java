package com.kgitbank.spring.domain.chat.mapper;

import java.util.List;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;
import com.kgitbank.spring.domain.chat.dto.ChattingUser;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.model.MessageVO;

public interface ChatMapper {
	
	// 메세지 저장 (임시)
	public int messageSave(String message);
	
	// 메세지 정보 저장
	public int saveMessage(MessageVO mvo);
	
	
	
	///////////////////////////////
	
	public MemberVO selectMemberById(String id);
	
	public ChattingRoom selectRoomIdByUserSeqIds(ChattingRoom room);

	public int createRoomId(ChattingRoom room);
	
	public void insertMessage(MessageVO mvo);
	
	public List<MessageVO> selectMessageByRoomId(int roomId);
	
	public int updateMessageRead(ChattingUser user);
	
}


