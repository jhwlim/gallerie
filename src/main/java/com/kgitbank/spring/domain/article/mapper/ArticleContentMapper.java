package com.kgitbank.spring.domain.article.mapper;

import java.util.List;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.article.dto.GalleryDto;
import com.kgitbank.spring.domain.article.dto.GalleryPageDto;
import com.kgitbank.spring.domain.model.ArticleLikeVO;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.FileVO;
import com.kgitbank.spring.domain.model.TagVO;

public interface ArticleContentMapper {
	
	public ArticleDto selectArticleWithWriterInfoById(int id);

	public List<FileVO> selectFileByArticleId(int articleId);
	
	public List<GalleryDto> selectGalleryByWriterSeqId(GalleryPageDto page);
	
	public List<GalleryDto> selectGalleryByTagName(GalleryPageDto page);
	
	public List<GalleryDto> selectGalleryOrderByLikeAndComment(GalleryPageDto page);
	
	public int selectTotalCountOfArticlesByWriterSeqId(int writerSeqId);
	
	public int selectTotalCountOfArticlesByTagName(String tagName);
	
	public int selectTotalCountOfArticles();
	
	public void insertArticle(ArticleVO article);

	public void insertTags(List<TagVO> tags);
	
	public void insertFiles(List<FileVO> files);
	
	public int deleteArticleById(int id);
	
	public int selectCountLikeByMemberSeqIdAndArticleId(ArticleLikeVO vo);
	
	public void insertLike(ArticleLikeVO vo);
	
	public void deleteLike(ArticleLikeVO vo);
	
}
