package com.kgitbank.spring.domain.myprofile.service;

import java.util.List;

import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;


public interface MyprofileService {

	public void updateMyprofile(MemberVO vo);
	
	public String currentpw(MemberVO vo);

	public int updatepw(MemberVO vo);
	
	public List<LoginVO> getLoginActivityList(MemberVO mv, LoginVO lv);
	
}
