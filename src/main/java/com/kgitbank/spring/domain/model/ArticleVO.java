package com.kgitbank.spring.domain.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ArticleVO {
	
	private int id;
	private int writerSeqId;
	private String content;
	private Date writeDate;
	
}
