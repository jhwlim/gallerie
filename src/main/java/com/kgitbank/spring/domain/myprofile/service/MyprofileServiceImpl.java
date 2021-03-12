package com.kgitbank.spring.domain.myprofile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.model.LoginVO;
import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.mapper.MyprofileMapper;
import com.kgitbank.spring.global.util.SecurityPwEncoder;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MyprofileServiceImpl implements MyprofileService {

	@Autowired
	private MyprofileMapper mapper;
	
	@Autowired
	private SecurityPwEncoder encoder;
	
	// 회원정보 수정
	public void updateMyprofile(MemberVO vo) {
		mapper.updateMyprofile(vo);
	}
	
	// 현재 비밀번호 비교하려고 가져오는 쿼리문
	public String currentpw(MemberVO vo) {
		return mapper.currentpw(vo);
	}

	// 비밀번호 수정
	public int updatepw(MemberVO vo) {
		
		String rawPassword = vo.getPw();
		String encPassword = encoder.encode(rawPassword);
		vo.setPw(encPassword);
		
		return mapper.updatepw(vo);
	}
	
	// 위치 정보 가져오는 쿼리문
	public List<LoginVO> getLoginActivityList(MemberVO mv, LoginVO lv) {
		return mapper.getLoginActivityList(mv, lv);
	}

	@Override
	public String getEditInfo(String id) {
		return mapper.getEditInfo(id);
	}
	
	
}
