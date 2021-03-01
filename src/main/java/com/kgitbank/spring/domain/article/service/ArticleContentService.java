package com.kgitbank.spring.domain.article.service;

import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.model.ArticleVO;

public interface ArticleContentService {
	
	public ArticleDto selectArticleWithWriterInfoById(String id);
	
	public boolean saveArticleContent(ArticleVO article, MultipartFile[] files);
	
	
}
