package com.kgitbank.spring.domain.myprofile.service;

import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.model.MemberVO;

public interface MyProfileMainService {
	
	public MemberVO selectMemberById(String id);

	public String uploadProfileImg(MultipartFile file, int seqId);
	
	public byte[] getImage(String fileName);
}
