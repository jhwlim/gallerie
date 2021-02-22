package com.kgitbank.spring.domain.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	
	private int seqId;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String profile;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	private String imgPath;
	private String sessionkey;
	private Timestamp sessionlimit;
	
}
