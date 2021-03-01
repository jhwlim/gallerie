package com.kgitbank.spring.domain.article.mapper;

import java.util.List;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.FileVO;
import com.kgitbank.spring.domain.model.TagVO;

public interface ArticleContentMapper {
	
	public ArticleDto selectArticleWithWriterInfoById(int id);

	public List<FileVO> selectFileByArticleId(int articleId);
	
	public void insertArticle(ArticleVO article);

	public void insertTags(List<TagVO> tags);
	
	public void insertFiles(List<FileVO> files);
	
	public int deleteArticleById(int id);
	
}
