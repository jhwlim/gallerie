package com.kgitbank.spring.domain.chat.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ContactDto {
	
	private int seqId;
	private Date sendDate;
	private String sendDateStr;
	private int roomId;
	
	private int userSeqId;
	private String userId;
	private String imgPath;
}
