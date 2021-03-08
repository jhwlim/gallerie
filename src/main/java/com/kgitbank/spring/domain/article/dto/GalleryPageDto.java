package com.kgitbank.spring.domain.article.dto;

import java.util.List;

import lombok.Data;

@Data
public class GalleryPageDto {

	private int writerSeqId;
	private int articleIndex;
	private String tagName;
	
	private final int articleCount = 6;
	
	private List<GalleryDto> articles;
	private boolean hasMore;


}
