package com.kgitbank.spring.domain.article.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.article.dto.ArticleContentDto;
import com.kgitbank.spring.domain.article.mapper.ArticleContentMapper;

@Service
public class ArticleContentServiceImpl implements ArticleContentService {

	@Autowired
	ArticleContentMapper mapper;
	
	@Override
	public ArticleContentDto selectOne(int id) {
		return mapper.selectOne(id);
	}
	
	
}
