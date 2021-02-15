package com.kgitbank.spring.domain.model;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String profile;
	private Date regDate;
	
}
