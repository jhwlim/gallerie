package com.kgitbank.spring.domain.chat.service;

import java.util.List;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;
import com.kgitbank.spring.domain.chat.dto.ChattingUser;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.model.MessageVO;

public interface ChatService {

	//메세지 저장 (임시)
	public int messageSave(String message) throws Exception;
	
	//메세지 정보 저장
	public int saveMessage(MessageVO mvo) throws Exception;
	
	
	///////////////////////////////
	
	public MemberVO selectMemberById(String id);
	
	public ChattingRoom selectRoomIdByUserSeqIds(int userSeqId1, int userSeqId2);

	public void insertMessage(MessageVO mvo);
	
	public List<MessageVO> selectMessageByRoomId(int roomId);
	
	public int updateMessageRead(ChattingUser user);
	
}
