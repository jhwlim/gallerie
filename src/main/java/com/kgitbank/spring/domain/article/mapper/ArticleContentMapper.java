package com.kgitbank.spring.domain.article.mapper;

import com.kgitbank.spring.domain.article.dto.ArticleContentDto;

public interface ArticleContentMapper {
	
	public ArticleContentDto selectOne(int id);

}
