package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.CommentVO;

public interface CommentMapper {
	
	public List<CommentVO> selectAll();
	
	public void createComment(CommentVO comment);
	
}
