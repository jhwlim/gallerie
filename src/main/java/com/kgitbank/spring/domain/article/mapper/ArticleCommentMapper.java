package com.kgitbank.spring.domain.article.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.CommentVO;

//@Repository("com.kgitbank.spring.domain.article.mapper.ArticleCommentMapper")
public interface ArticleCommentMapper {

	// 댓글 목록
	public List<CommentVO> listComment(int articleId);
	// 댓글 입력
	public void insertComment(CommentVO comment);
	// 댓글 수정
	public void updateComment(CommentVO comment);
	// 댓글 삭제
	public void deleteComment(CommentVO comment);
	
	// members테이블의 seq_id
	public int getMemberSeqId(String id);
	
}
