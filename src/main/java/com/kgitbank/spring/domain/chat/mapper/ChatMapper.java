package com.kgitbank.spring.domain.chat.mapper;

import com.kgitbank.spring.domain.model.MessageVO;

public interface ChatMapper {
	
	// 메세지 저장 (임시)
	public int messageSave(String message);
	
	// 메세지 정보 저장
	public int saveMessage(MessageVO mvo);
	
}


