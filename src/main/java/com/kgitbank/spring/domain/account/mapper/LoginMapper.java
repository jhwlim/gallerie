package com.kgitbank.spring.domain.account.mapper;

import com.kgitbank.spring.domain.account.dto.Sessionkey;
import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;

public interface LoginMapper {

	public MemberVO getLogin(MemberVO member);
	
	public void keepLogin(Sessionkey key);
	
	public MemberVO checkUserWithSessionkey(String sessionId);
	
	public void loginHistory(LoginVO history);
	
}
