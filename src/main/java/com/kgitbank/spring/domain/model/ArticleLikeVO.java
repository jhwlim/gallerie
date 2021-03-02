package com.kgitbank.spring.domain.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("ArticleLikeVO")
@Data
public class ArticleLikeVO {
	
	private int articleId;
	private int memberSeqId;
	
}
