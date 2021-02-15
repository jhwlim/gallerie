package com.kgitbank.spring.domain.myprofile.controller;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
public class User {

	@NonNull
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String profile;
	private Date reg_date;
	
	// 나중에 프로필 파일 필요할수도 있으니깐
	/*
	 private int userImgNo;
	 private String userImgName;
	 private long userImgSize;
	 private String userImgType;
	 */
	
}
