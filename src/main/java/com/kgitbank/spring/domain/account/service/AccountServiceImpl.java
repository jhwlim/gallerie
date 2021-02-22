package com.kgitbank.spring.domain.account.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.account.mapper.AccountMapper;
import com.kgitbank.spring.model.Member;
import com.kgitbank.spring.model.Sessionkey;


@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountMapper mapper;

	@Override
	public Member getLogin(Member member) {
		
		return mapper.getLogin(member);
	}

	@Override
	public void keepLogin(Sessionkey key) {
		mapper.keepLogin(key);
		
	}

	@Override
	public Member checkUserWithSessionkey(String sessionId) {
		return mapper.checkUserWithSessionkey(sessionId);
	}


}
