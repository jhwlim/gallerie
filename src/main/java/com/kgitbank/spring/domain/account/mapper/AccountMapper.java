package com.kgitbank.spring.domain.account.mapper;




import com.kgitbank.spring.model.Member;
import com.kgitbank.spring.model.Sessionkey;



public interface AccountMapper {
	
	public Member getLogin(Member member);
	
	public void keepLogin(Sessionkey key);
	
	public Member checkUserWithSessionkey(String sessionId);

}
