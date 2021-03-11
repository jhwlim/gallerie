package com.kgitbank.spring.domain.follow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.follow.FollowDto;
import com.kgitbank.spring.domain.follow.mapper.FollowMapper;
import com.kgitbank.spring.domain.model.FollowVO;
import com.kgitbank.spring.domain.model.MemberVO;
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

	@Override
	public void ufollow(FollowVO vo) {
		mapper.ufollow(vo);
		
	}

	@Override
	public ProfileDto seqsearch(Integer id) {
		
		return mapper.seqsearch(id);
	}

	@Override
	public List<ProfileDto> selectProfileOfFollow(int seqId) {
		return mapper.selectProfileOfFollow(seqId);
	}

	@Override
	public List<FollowDto> selectTop5Follows() {
		return mapper.selectTop5Follows();
	}

	@Override
	public boolean checkFollow(FollowVO vo) {
		return mapper.checkFollow(vo) == 1 ? true : false;
	}


	

}