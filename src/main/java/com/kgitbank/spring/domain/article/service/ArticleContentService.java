package com.kgitbank.spring.domain.article.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.FileVO;
import com.kgitbank.spring.domain.model.TagVO;

public interface ArticleContentService {
	
	public ArticleDto selectOne(int id);
	
	public void saveContent(ArticleVO article, MultipartFile[] files);
	
	public void insertArticle(ArticleVO article) throws Exception;

	public void insertTags(List<TagVO> tags) throws Exception;
		
	public void insertFiles(List<FileVO> files) throws Exception;
	
}
