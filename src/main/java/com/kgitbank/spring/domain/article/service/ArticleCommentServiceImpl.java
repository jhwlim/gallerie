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
	
	@Override
	public List<CommentVO> list(int id) {
		return mapper.list(id);
	}
	
	@Override
	public void insertComment(CommentVO comment) {
		mapper.insertComment(comment);
	}


}
