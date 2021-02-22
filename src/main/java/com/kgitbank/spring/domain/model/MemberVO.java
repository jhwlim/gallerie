package com.kgitbank.spring.domain.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.kgitbank.spring.domain.account.model.Member;

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
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String profile;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	
}
