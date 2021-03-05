package com.kgitbank.spring.domain.follow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.follow.mapper.FollowMapper;
import com.kgitbank.spring.domain.model.FollowVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	FollowMapper mapper;

	@Override
	public void following(FollowVO vo) {
		mapper.following(vo);
	}

	@Override
	public List<Integer> selectFollow(ProfileDto vo) {
		
		return mapper.selectFollow(vo);
	}

	@Override
	public List<Integer> selectFollower(ProfileDto vo) {
		
		return mapper.selectFollower(vo);
	}


	

}