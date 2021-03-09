package com.kgitbank.spring.domain.myprofile.service;

import org.springframework.http.HttpHeaders;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileImageService {

	public String uploadProfileImg(MultipartFile file, int seqId);
	
	public byte[] getImage(String fileName);
	
	public byte[] getDefaultImage();
	
	public HttpHeaders getHttpHeadersOfDefaultImage();
	
	public void deleteProfileImg(int seqId);

}
