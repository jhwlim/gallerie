package com.kgitbank.spring.domain.myprofile.dto;

import lombok.Data;

@Data
public class GalleryDto {
	
	private int id;
	private int likeCount;
	private int CommentCount;
	private String imgPath;
	
}
