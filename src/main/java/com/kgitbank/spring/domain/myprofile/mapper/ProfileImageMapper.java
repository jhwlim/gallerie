package com.kgitbank.spring.domain.myprofile.mapper;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileImageMapper {

	public int updateProfileImgBySeqId(MemberVO member);
	
	public String selectProfileImgBySeqId(int seqId);
	
}
