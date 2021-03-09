package com.kgitbank.spring.domain.chat.mapper;

import java.util.List;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;
import com.kgitbank.spring.domain.chat.dto.ChattingUser;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.model.MessageVO;

public interface ChatMapper {
		
	public MemberVO selectMemberById(String id);
	
	public ChattingRoom selectRoomIdByUserSeqIds(ChattingRoom room);

	public int createRoomId(ChattingRoom room);
	
	public void insertMessage(MessageVO mvo);
	
	public List<MessageVO> selectMessageByRoomId(int roomId);
	
	public int updateMessageRead(ChattingUser user);
	
}


