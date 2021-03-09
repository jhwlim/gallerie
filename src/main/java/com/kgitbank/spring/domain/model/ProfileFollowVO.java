package com.kgitbank.spring.domain.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

import lombok.Data;

@Alias("ProfileFollowVO")
@Data
public class ProfileFollowVO {
	
	private List<Integer> followList;
	private List<ProfileDto> dtoFollowList;
	private List<Integer> followerList;
	private List<ProfileDto> dtoFollowerList;
	private boolean followCheck;

}
