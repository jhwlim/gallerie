package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MemberMapper {
	
	public List<MemberVO> selectAll();
	
	public void insertMember(MemberVO member);
}
