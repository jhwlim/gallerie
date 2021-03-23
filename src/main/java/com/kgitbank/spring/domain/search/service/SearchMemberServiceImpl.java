package com.kgitbank.spring.domain.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.search.mapper.SearchMemberMapper;

@Service
public class SearchMemberServiceImpl implements SearchMemberService {

	@Autowired
	private SearchMemberMapper mapper;
	
	@Override
	public List<MemberVO> selectMemberByKeyword(String keyword) {
		return mapper.selectMemberByKeyword(keyword);
	}

}
