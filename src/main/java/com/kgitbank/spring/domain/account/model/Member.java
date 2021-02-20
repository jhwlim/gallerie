package com.kgitbank.spring.domain.account.model;

import java.sql.Date;

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
public class Member {

	// 테스트용
	@NonNull
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String profile;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
}