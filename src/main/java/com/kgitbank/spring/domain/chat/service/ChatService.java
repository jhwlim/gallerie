package com.kgitbank.spring.domain.chat.service;

import com.kgitbank.spring.domain.model.MessageVO;

public interface ChatService {

	//메세지 저장 (임시)
	public int messageSave(String message) throws Exception;
	
	//메세지 정보 저장
	public int saveMessage(MessageVO mvo) throws Exception;
}
