package com.kgitbank.spring.domain.account.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.account.dto.Sessionkey;
import com.kgitbank.spring.domain.account.mapper.AccountMapper;
import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.global.util.SecurityPwEncoder;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountMapper mapper;
	
	@Autowired
	private AccountMapper accMapper;
	
	@Autowired
	private SecurityPwEncoder encoder;

	@Override
	public MemberVO getLogin(MemberVO member) {
		
		return mapper.getLogin(member);
	}

	@Override
	public void keepLogin(Sessionkey key) {
		mapper.keepLogin(key);
		
	}

	@Override
	public MemberVO checkUserWithSessionkey(String sessionId) {
		return mapper.checkUserWithSessionkey(sessionId);
	}
	
	@Override
	public void loginHistory(LoginVO history) {
		mapper.loginHistory(history);
	}
	
	@Override
	public int signUp(MemberVO mem) throws Exception{
		
		String rawPassword = mem.getPw(); //1234 원문
		String encPassword = encoder.encode(rawPassword);//해쉬
		mem.setPw(encPassword);
		return accMapper.signUp(mem);
	}
	
	@Override
	public int idCheck(String id) throws Exception {
	
		return accMapper.idCheck(id);
	}
	
	@Override
	public int emailCheck(String email) throws Exception {
		
		return accMapper.emailCheck(email);
	}
	
	@Override
	public MemberVO viewIdList(String email) throws Exception {
		
		return accMapper.viewIdList(email);
	}
	
	@Override
	public MemberVO userAuth(String id) throws Exception {
		
		return accMapper.userAuth(id);
	}
	
	@Override
	public MemberVO resetPw(String id) throws Exception {
		
		return accMapper.resetPw(id);
	}
	
	@Override
	public int changedPw(MemberVO mem) throws Exception {
		
		String rawPassword = mem.getPw(); //1234 원문
		String encPassword = encoder.encode(rawPassword);//해쉬
		mem.setPw(encPassword);
		return accMapper.changedPw(mem);
	}

	


}
