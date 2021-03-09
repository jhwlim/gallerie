package com.kgitbank.spring.domain.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.account.dto.Sessionkey;
import com.kgitbank.spring.domain.account.mapper.LoginMapper;
import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;

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

}
