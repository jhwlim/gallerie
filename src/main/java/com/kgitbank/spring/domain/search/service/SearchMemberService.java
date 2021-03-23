package com.kgitbank.spring.domain.search.service;

import java.util.List;

import com.kgitbank.spring.domain.model.MemberVO;

public interface SearchMemberService {

	public List<MemberVO> selectMemberByKeyword(String keyword);
	
}
