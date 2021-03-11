package com.kgitbank.spring.domain.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Alias("CommentVO")
@Data
public class CommentVO {
	
	private int id;
	private int articleId;
	private int memberSeqId;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date writeDate;
	private String writeDateStr;
	
	private String writerId;
	private String imgPath;
}
