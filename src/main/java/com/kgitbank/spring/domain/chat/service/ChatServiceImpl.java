package com.kgitbank.spring.domain.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.chat.dto.ChattingRoom;
import com.kgitbank.spring.domain.chat.dto.ChattingUser;
import com.kgitbank.spring.domain.chat.dto.ContactDto;
import com.kgitbank.spring.domain.chat.mapper.ChatMapper;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.model.MessageVO;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatMapper mapper;
	
	@Override
	public ChattingRoom selectRoomIdByUserSeqIds(int userSeqId1, int userSeqId2) {
		ChattingRoom room = new ChattingRoom();
		int small = 0;
		int large = 0;
		
		if (userSeqId1 == userSeqId2) {
			return null;
		} else if (userSeqId1 > userSeqId2) {
			large = userSeqId1;
			small = userSeqId2;
		} else {
			large = userSeqId2;
			small = userSeqId1;
		}
		
		room.setLargeUserSeqId(large);
		room.setSmallUserSeqId(small);
		
		ChattingRoom roomFromDB = mapper.selectRoomIdByUserSeqIds(room);
		if (roomFromDB != null) {
			return roomFromDB;			
		} else {
			mapper.createRoomId(room);
			return room;
		}
		
	}

	@Override
	public MemberVO selectMemberById(String id) {
		return mapper.selectMemberById(id);
	}

	@Override
	public void insertMessage(MessageVO mvo) {
		mapper.insertMessage(mvo);
	}

	@Override
	public List<MessageVO> selectMessageByRoomId(int roomId) {
		return mapper.selectMessageByRoomId(roomId);
	}

	@Override
	public int updateMessageRead(ChattingUser user) {
		return mapper.updateMessageRead(user);
	}

	@Override
	public List<ContactDto> selectContactList(int userSeqId) {
		return mapper.selectContactList(userSeqId);
	}
	
	

}
