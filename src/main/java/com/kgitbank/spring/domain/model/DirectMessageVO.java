package com.kgitbank.spring.domain.model;

import java.sql.Date;

import lombok.Data;

@Data
public class DirectMessageVO {
	
	private int id;
	private int senderSeqId;
	private int receiverSeqId;
	private String content;
	private Date sendDate;
}
