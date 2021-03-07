package com.kgitbank.spring.domain.myprofile.mapper;

import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileMainMapper {
	
	public ProfileDto selectMemberById(String id);
	
}
