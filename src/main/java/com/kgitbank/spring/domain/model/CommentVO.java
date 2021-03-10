package com.kgitbank.spring.domain.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("CommentVO")
@Data
public class CommentVO {
	
	private int id;
	private int articleId;
	private int memberSeqId;
	private String content;
	private Date writeDate;
	
	private String writerId;
	private String imgPath;
	
}
