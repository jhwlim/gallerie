package com.kgitbank.spring.domain.account.dto;

import lombok.Data;

@Data
public class FbProfile {
	private String user_name;
	private String email;
	private String profile_picture;
	private String id;
}
