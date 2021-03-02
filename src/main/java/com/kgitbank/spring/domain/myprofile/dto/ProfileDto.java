package com.kgitbank.spring.domain.myprofile.dto;

import lombok.Data;

@Data
public class ProfileDto {

	private int seqId;
	private String id;
	private String name;
	private String profile;
	private String imgPath;
	
	private boolean signedIn;
	private boolean hasImg;
	
}
