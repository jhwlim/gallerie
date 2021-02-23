package com.kgitbank.spring.domain.account.mapper;

import com.kgitbank.spring.domain.account.dto.Sessionkey;
import com.kgitbank.spring.domain.model.MemberVO;

public interface AccountMapper {
	
	public MemberVO getLogin(MemberVO member);
	
	
	public void keepLogin(Sessionkey key);
	
	public MemberVO checkUserWithSessionkey(String sessionId);
	
	// 회원가입
	public int signUp(MemberVO mem);
	
	// 아이디 중복 검사
	public int idCheck(String id);
	
	// 이메일 중복 검사
	public int emailCheck(String email);
	
	// 아이디 정보 인증
	public MemberVO viewIdList(String email);
	
	// 유저 정보 인증
	public MemberVO userAuth(String id);
	
	// 비밀번호 재설정
	public MemberVO resetPw(String id);
	
	// 비밀번호 변경 완료
	public int changedPw(MemberVO mem);

}
