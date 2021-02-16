package com.kgitbank.spring.domain.myprofile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.test.mapper.MemberMapper;

@Service
public class MyprofileService {

	@Autowired
	public MemberMapper mapper;
	
	public List<MemberVO> updateMyprofile() {
		return mapper.updateMyprofile(); 
	}

	
}
