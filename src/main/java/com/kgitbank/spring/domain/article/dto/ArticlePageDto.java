package com.kgitbank.spring.domain.article.dto;

import java.util.List;

import lombok.Data;

@Data
public class ArticlePageDto {

	private int seqId;
	private int articleIndex;
	private final int articleCount = 6;
	
	private List<ArticleDto> articles;
	private boolean hasMore;

}
