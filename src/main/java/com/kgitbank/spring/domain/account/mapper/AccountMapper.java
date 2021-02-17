package com.kgitbank.spring.domain.account.mapper;

import com.kgitbank.spring.domain.account.model.Member;

public interface AccountMapper {
	
	// 회원가입
	public int signUp(Member mem);
	
	// 아이디 중복 검사
	public int idCheck(String id);
}
