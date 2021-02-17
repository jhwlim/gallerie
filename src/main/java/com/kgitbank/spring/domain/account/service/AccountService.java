package com.kgitbank.spring.domain.account.service;

import com.kgitbank.spring.domain.account.model.Member;

public interface AccountService {

	// 회원가입
	public int signUp(Member mem) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;
}
