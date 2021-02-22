package com.kgitbank.spring.domain.myprofile.mapper;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MyprofileMapper {

	// UPDATE members SET name = #{name}, email = #{email}, phone = #{phone} WHERE id = #{id}
	public int updateMyprofile(MemberVO vo);
	
	// SELECT pw FROM members WHERE id = #{id}
	public int currentpw(MemberVO vo);
	
	// UPDATE members SET pw = #{pw} WHERE id = #{id}
	public int updatepw(MemberVO vo);
	
}
