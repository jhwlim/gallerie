package com.kgitbank.spring.domain.follow;

import lombok.Data;

@Data
public class FollowDto {
	
	private int seqId;
	private String id;
	private String imgPath;
	private boolean followed;
	
}
