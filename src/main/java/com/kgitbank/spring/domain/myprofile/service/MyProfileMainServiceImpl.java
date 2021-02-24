package com.kgitbank.spring.domain.myprofile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.mapper.MyProfileMainMapper;

@Service
public class MyProfileMainServiceImpl implements MyProfileMainService {
	
	@Autowired
	MyProfileMainMapper mapper;

	@Override
	public MemberVO selectMemberById(String id) {
		return mapper.selectMemberById(id);
	}

	@Override
	public int updateProfileImgBySeqId(MemberVO member) {
		return mapper.updateProfileImgBySeqId(member);
	}

	@Override
	public String selectProfileImgBySeqId(int seqId) {
		return mapper.selectProfileImgBySeqId(seqId);
	}
	
	
}
