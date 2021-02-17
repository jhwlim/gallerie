package com.kgitbank.spring.domain.account.service;

import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.account.mapper.AccountMapper;
import com.kgitbank.spring.domain.account.model.Member;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AccountServiceImpl implements AccountService {

	private AccountMapper acc_mapper;
	
	@Override
	public int signUp(Member mem) throws Exception{
		
		return acc_mapper.signUp(mem);
	}
	
	@Override
	public int idCheck(String id) throws Exception {
	
		return acc_mapper.idCheck(id);
	}
}
