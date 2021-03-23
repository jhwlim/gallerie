package com.kgitbank.spring.domain.search.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.MemberVO;

public interface SearchMemberMapper {
	
	public List<MemberVO> selectMemberByKeyword(String keyword);
	
}
