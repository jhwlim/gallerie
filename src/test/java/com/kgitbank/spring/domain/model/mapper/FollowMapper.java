package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.FollowVO;

public interface FollowMapper {
	
	public List<FollowVO> selectAll();
	
	public void follow(FollowVO followInfo);
	
}
