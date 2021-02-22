package com.kgitbank.spring.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Sessionkey {

	private String email;
	private String sessionId;
	private Date next;
	
}
