package com.kgitbank.spring.domain.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MemberMapper {
	
//	@Select("SELECT * FROM members")
	public List<MemberVO> selectAll();
	
	// UPDATE members SET name = #{name}, email = #{email}, phone = #{phone} WHERE id = #{id}
	public void updateMyprofile(MemberVO vo);
	
	// UPDATE members SET pw = #{pw} WHERE id = #{id} and pw = #{pw}
	public int updatePW(MemberVO vo);
	
}
