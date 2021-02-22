package com.kgitbank.spring.domain.model;

import java.sql.Date;

import lombok.Data;

@Data
public class LoginVO {
	
	private int id;
	private int memberSeqId;
	private Date loginDate;
	private String location;
	private String ip;
	
}
