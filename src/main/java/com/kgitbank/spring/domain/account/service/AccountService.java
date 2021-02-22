package com.kgitbank.spring.domain.account.service;


import com.kgitbank.spring.model.Member;
import com.kgitbank.spring.model.Sessionkey;
import com.kgitbank.spring.domain.model.MemberVO;

public interface AccountService {
	
	public Member getLogin (Member member);
	
	public void keepLogin(Sessionkey key);
	
	public Member checkUserWithSessionkey(String sessionId);
	
	// 회원가입
	public int signUp(MemberVO mem) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;
	
	// 유저 정보 인증
	public MemberVO userAuth(String id) throws Exception;
	
	// 비밀번호 재설정
	public MemberVO resetPw(String id) throws Exception;
	
	// 비밀번호 변경 완료
	public int changedPw(MemberVO mem) throws Exception;

}
