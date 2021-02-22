package com.kgitbank.spring.model;


import lombok.Data;

@Data
public class Member {
	
	private String id;
	private String email;
	private String pw;
	private String name;
	private String phone;
	private String profile;
	private java.util.Date reg_date;
	

}
