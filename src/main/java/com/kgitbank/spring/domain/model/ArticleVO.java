package com.kgitbank.spring.domain.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("ArticleVO")
@Data
public class ArticleVO {
	
	private int id;
	private int writerSeqId;
	private String content;
	private Date writeDate;
	
}
