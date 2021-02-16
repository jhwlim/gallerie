package com.kgitbank.spring.domain.myprofile.mapper;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MyprofileMapper {

	// UPDATE members SET name = #{name}, email = #{email}, phone = #{phone} WHERE id = #{id}
	public int updateMyprofile(MemberVO vo);
		
	// UPDATE members SET pw = #{pw} WHERE id = #{id}
	public int updatePW(MemberVO vo);
	
}
