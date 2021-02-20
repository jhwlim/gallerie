package com.kgitbank.spring.domain.model;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {
	
	private int id;
	private int articleId;
	private int memberSeqId;
	private String content;
	private Date writeDate;
	
}
