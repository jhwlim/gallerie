package com.kgitbank.spring.domain.chat.service;

import java.util.List;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;
import com.kgitbank.spring.domain.chat.dto.ChattingUser;
import com.kgitbank.spring.domain.chat.dto.ContactDto;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.model.MessageVO;

public interface ChatService {
	
	public MemberVO selectMemberById(String id);
	
	public ChattingRoom selectRoomIdByUserSeqIds(int userSeqId1, int userSeqId2);

	public void insertMessage(MessageVO mvo);
	
	public List<MessageVO> selectMessageByRoomId(int roomId);
	
	public int updateMessageRead(ChattingUser user);
	
	public List<ContactDto> selectContactList(int userSeqId);

}
