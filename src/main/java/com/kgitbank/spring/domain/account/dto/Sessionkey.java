package com.kgitbank.spring.domain.account.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Sessionkey {

	private String email;
	private String sessionId;
	private Date next;
	
}
