package com.kgitbank.spring.domain.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Alias("FileVO")
@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class FileVO {
	
	@NonNull
	private String imgPath;
	private int articleId;
	
}
