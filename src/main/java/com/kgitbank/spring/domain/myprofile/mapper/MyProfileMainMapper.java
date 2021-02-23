package com.kgitbank.spring.domain.myprofile.mapper;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MyProfileMainMapper {
	
	public MemberVO selectMemberById(String id);
	
}
