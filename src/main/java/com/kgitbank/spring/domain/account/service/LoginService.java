package com.kgitbank.spring.domain.account.service;

import com.kgitbank.spring.domain.account.dto.Sessionkey;
import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;

public interface LoginService {

	public MemberVO getLogin(MemberVO member);
	
	public void keepLogin(Sessionkey key);
	
	public MemberVO checkUserWithSessionkey(String sessionId);
	
	public void loginHistory(LoginVO history);
	
}
