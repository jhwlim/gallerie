package com.kgitbank.spring.domain.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("LoginVO")
@Data
public class LoginVO {
	
	private int memberSeqId;
	private Date loginDate;
	private String location;
	private String ip;
	
}
