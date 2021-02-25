package com.kgitbank.spring.domain.myprofile.service;

import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface MyProfileMainService {
	
	public ProfileDto selectMemberById(String id);

	public String uploadProfileImg(MultipartFile file, int seqId);
	
	public byte[] getImage(String fileName);
}
