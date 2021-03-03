package com.kgitbank.spring.domain.article.service;

import java.util.List;

import com.kgitbank.spring.domain.model.CommentVO;

public interface ArticleCommentService {

	// 댓글 목록
	public List<CommentVO> list(int id);
	// 댓글 입력
	public void insertComment(CommentVO comment);

	
}
