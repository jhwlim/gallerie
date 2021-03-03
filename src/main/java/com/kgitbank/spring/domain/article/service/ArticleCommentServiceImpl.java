package com.kgitbank.spring.domain.article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.article.mapper.ArticleCommentMapper;
import com.kgitbank.spring.domain.model.CommentVO;

@Service
public class ArticleCommentServiceImpl implements ArticleCommentService {

	@Autowired
	ArticleCommentMapper mapper;
	// 댓글목록
	@Override
	public List<CommentVO> list(int id) {
		return mapper.list(id);
	}
	// 댓글작성
	@Override
	public void insertComment(CommentVO comment) {
		mapper.insertComment(comment);
	}
	// 댓글수정
	@Override
	public void updateComment(CommentVO comment) {
		mapper.updateComment(comment);
	}
	// 댓글삭제
	@Override
	public void deleteComment(CommentVO comment) {
		mapper.deleteComment(comment);
	}


}
