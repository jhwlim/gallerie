package com.kgitbank.spring.domain.article.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ArticleContentDto {

	private int id;
	private int writerSeqId;
	private String content;
	private Date writeDate;
	
	private String writerId;
	private String writerName;
	private String imgPath;
}
