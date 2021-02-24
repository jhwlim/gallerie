package com.kgitbank.spring.domain.myprofile.service;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MyProfileMainService {
	
	public MemberVO selectMemberById(String id);
	
	public int updateProfileImgBySeqId(MemberVO member);

	public String selectProfileImgBySeqId(int seqId);

}
