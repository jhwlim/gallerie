package com.kgitbank.spring.domain.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	
	@NonNull
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
