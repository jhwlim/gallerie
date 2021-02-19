package com.kgitbank.spring.domain.account.mapper;

import org.apache.ibatis.annotations.Mapper;


import com.kgitbank.spring.domain.account.model.Member;
import com.kgitbank.spring.domain.model.MemberVO;


public interface AccountMapper {
	
	// 회원가입
	public int signUp(MemberVO mem);
	
	// 아이디 중복 검사
	public int idCheck(String id);
	
	// 유저 정보 인증
	public MemberVO userAuth(String id);
	
	// 비밀번호 재설정
	public MemberVO resetPw(String id);
	
	// 비밀번호 변경 완료
	public int changedPw(MemberVO mem);
	
}
