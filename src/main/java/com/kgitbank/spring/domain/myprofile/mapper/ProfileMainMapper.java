package com.kgitbank.spring.domain.myprofile.mapper;

import java.util.List;

import com.kgitbank.spring.domain.myprofile.dto.GalleryDto;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileMainMapper {
	
	public ProfileDto selectMemberById(String id);
	
	public List<GalleryDto> selectGalleryBywriterId(int writerSeqId);
	
}
