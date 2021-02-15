package com.kgitbank.spring.domain.myprofile.controller;

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
	private String name;
	private String userId;
	private String nickname;
	private String email;
	private String phone;
	private char gender;
	
}
