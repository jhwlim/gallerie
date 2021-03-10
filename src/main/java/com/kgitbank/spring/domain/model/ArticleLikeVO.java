package com.kgitbank.spring.domain.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("ArticleLikeVO")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ArticleLikeVO {
	
	private int articleId;
	private int memberSeqId;
	
}
