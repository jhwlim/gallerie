package com.kgitbank.spring.domain.account.service;


import com.kgitbank.spring.model.Member;
import com.kgitbank.spring.model.Sessionkey;


public interface accountService {
	
	public Member getLogin (Member member);
	
	public void keepLogin(Sessionkey key);
	
	public Member checkUserWithSessionkey(String sessionId);

}
