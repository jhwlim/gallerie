package com.kgitbank.spring.domain.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.chat.mapper.ChatMapper;
import com.kgitbank.spring.domain.model.MessageVO;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatMapper mapper;
	
	@Override
	public int messageSave(String message) throws Exception {


		return mapper.messageSave(message);
	}
	
	@Override
	public int saveMessage(MessageVO mvo) throws Exception {
	
		return mapper.saveMessage(mvo);
	}
	

}
