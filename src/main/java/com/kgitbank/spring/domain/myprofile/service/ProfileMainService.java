package com.kgitbank.spring.domain.myprofile.service;

import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileMainService {
	
	public ProfileDto selectMemberById(String id);

}
