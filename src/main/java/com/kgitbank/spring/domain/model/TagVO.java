package com.kgitbank.spring.domain.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Alias("TagVO")
@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class TagVO {
	
	private int articleId;
	@NonNull
	private String tagName;
	
}
