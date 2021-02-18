package com.kgitbank.spring.domain.myprofile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.mapper.MyprofileMapper;

@Service
public class MyprofileService {

	@Autowired
	public MyprofileMapper mapper;
	
	public int updateMyprofile(MemberVO vo) {
		return mapper.updateMyprofile(vo);
	}
	
	public int updatePW(MemberVO vo) {
		return mapper.updatePW(vo);
	}
	

	
}
