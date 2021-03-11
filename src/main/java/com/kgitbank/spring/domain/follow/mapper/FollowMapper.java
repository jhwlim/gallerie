package com.kgitbank.spring.domain.follow.mapper;

import java.util.List;

import com.kgitbank.spring.domain.follow.FollowDto;
import com.kgitbank.spring.domain.model.FollowVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface FollowMapper {
	
	public void following(FollowVO vo);
	
	public void ufollow(FollowVO vo);
	
	public ProfileDto seqsearch(Integer id);
	
	public List<Integer> selectFollow(ProfileDto vo);
	
	public List<Integer> selectFollower(ProfileDto vo);

	public List<ProfileDto> selectProfileOfFollow(int seqId);
	
	public List<FollowDto> selectTop5Follows();
	
	public int checkFollow(FollowVO vo);
	
}