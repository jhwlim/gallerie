package com.kgitbank.spring.domain.article.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.CommentVO;

public interface ArticleCommentMapper {

	// 댓글 목록
	public List<CommentVO> list(int id);
	// 댓글 입력
	public void insertComment(CommentVO comment);
	// 댓글 수정
	public void updateComment(CommentVO comment);
	// 댓글 삭제
	public void deleteComment(CommentVO comment);
	
}
