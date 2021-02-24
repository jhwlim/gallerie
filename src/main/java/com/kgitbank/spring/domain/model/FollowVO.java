package com.kgitbank.spring.domain.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("FollowVO")
@Data
public class FollowVO {
	
	private int followerId;
	private int followId;
	
}
