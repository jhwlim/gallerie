package com.kgitbank.spring.domain.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("TagVO")
@Data
public class TagVO {
	
	private int articleId;
	private String tagName;
	
}
