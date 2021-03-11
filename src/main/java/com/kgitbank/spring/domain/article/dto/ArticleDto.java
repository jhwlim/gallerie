package com.kgitbank.spring.domain.article.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.kgitbank.spring.domain.model.CommentVO;
import com.kgitbank.spring.domain.model.FileVO;

import lombok.Data;

@Data
public class ArticleDto {

	private int id;
	private int writerSeqId;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date writeDate;
	private String writeDateStr;
	
	private String writerId;
	private String writerName;
	private String imgPath;
	
	private List<FileVO> files;
	private List<CommentVO> comments;
	
	private int likeCount;
	private boolean hasLike;

}
