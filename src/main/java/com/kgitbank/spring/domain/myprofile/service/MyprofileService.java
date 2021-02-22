package com.kgitbank.spring.domain.myprofile.service;

import com.kgitbank.spring.domain.model.MemberVO;


public interface MyprofileService {

	public int updateMyprofile(MemberVO vo);
	
	public int currentpw(MemberVO vo);

	public int updatepw(MemberVO vo);
	
}
