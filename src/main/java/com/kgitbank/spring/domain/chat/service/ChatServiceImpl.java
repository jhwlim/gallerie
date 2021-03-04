package com.kgitbank.spring.domain.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.chat.mapper.ChatMapper;

@Service
public class ChatServiceImpl {

	@Autowired
	private ChatMapper mapper;
	
	

}
