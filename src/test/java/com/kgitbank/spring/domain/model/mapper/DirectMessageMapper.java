package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.DirectMessageVO;

public interface DirectMessageMapper {
	
	public List<DirectMessageVO> selectAll();
	
	public void createNewMessage(DirectMessageVO message);
}
