package com.kgitbank.spring.domain.article.dto;

import java.sql.Date;
import java.util.List;

import com.kgitbank.spring.domain.model.CommentVO;
import com.kgitbank.spring.domain.model.FileVO;

import lombok.Data;

@Data
public class ArticleDto {

	private int id;
	private int writerSeqId;
	private String content;
	private Date writeDate;
	
	private String writerId;
	private String writerName;
	private String imgPath;
	
	private List<FileVO> files;
	private List<CommentVO> comments;
	
	private int likeCount;
	private boolean hasLike;
	
}
