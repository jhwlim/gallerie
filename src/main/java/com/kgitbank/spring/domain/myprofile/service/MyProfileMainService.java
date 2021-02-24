package com.kgitbank.spring.domain.myprofile.service;

import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MyProfileMainService {
	
	public MemberVO selectMemberById(String id);
	
	public int updateProfileImgBySeqId(MemberVO member);

	public String selectProfileImgBySeqId(int seqId);

	public String uploadProfileImg(MultipartFile file, int seqId);
}
