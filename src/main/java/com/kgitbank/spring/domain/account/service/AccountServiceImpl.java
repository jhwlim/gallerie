package com.kgitbank.spring.domain.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.account.mapper.AccountMapper;
import com.kgitbank.spring.model.Member;

@Service
public class AccountServiceImpl implements accountService {
	
	@Autowired
	private AccountMapper mapper;

	@Override
	public Member getLogin(Member member) {
		
		return mapper.getLogin(member);
	}


}
