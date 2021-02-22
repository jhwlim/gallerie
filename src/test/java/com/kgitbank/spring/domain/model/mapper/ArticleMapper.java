package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.ArticleVO;

public interface ArticleMapper {
	
	public List<ArticleVO> selectAll();
	
	public void createNewArticle(ArticleVO article);
	
}
