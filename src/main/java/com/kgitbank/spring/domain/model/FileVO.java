package com.kgitbank.spring.domain.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("FileVO")
@Data
public class FileVO {
	
	private String imgPath;
	private int articleId;
	
}
