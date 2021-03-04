package com.kgitbank.spring.domain.follow.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.FollowVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface FollowMapper {
	
	public void following(FollowVO vo);
	
	
	public List<Integer> selectFollow(ProfileDto vo);
	
	public List<Integer> selectFollower(ProfileDto vo);

}