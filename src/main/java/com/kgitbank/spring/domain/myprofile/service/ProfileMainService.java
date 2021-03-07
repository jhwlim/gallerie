package com.kgitbank.spring.domain.myprofile.service;

import java.util.List;

import com.kgitbank.spring.domain.myprofile.dto.GalleryDto;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileMainService {
	
	public ProfileDto selectMemberById(String id);

	public List<GalleryDto> selectGalleryBywriterId(int writerSeqId);
	
}
