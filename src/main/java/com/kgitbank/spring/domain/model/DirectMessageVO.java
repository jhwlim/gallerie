package com.kgitbank.spring.domain.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("DirectMessageVO")
@Data
public class DirectMessageVO {
	
	private int id;
	private int senderSeqId;
	private int receiverSeqId;
	private String content;
	private Date sendDate;
}
