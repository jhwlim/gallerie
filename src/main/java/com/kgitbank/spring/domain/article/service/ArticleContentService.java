package com.kgitbank.spring.domain.article.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.article.dto.GalleryDto;
import com.kgitbank.spring.domain.article.dto.GalleryPageDto;
import com.kgitbank.spring.domain.model.ArticleLikeVO;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.FileVO;

public interface ArticleContentService {
	
	public ArticleDto selectArticleWithWriterInfoById(String id);
	
	public List<FileVO> selectFileByArticleId(int articleId);

	public List<GalleryDto> selectGalleryByWriterSeqId(GalleryPageDto page);
	
	public int selectTotalCountOfArticlesByWriterSeqId(int writerSeqId);
	
	public boolean saveArticleContent(ArticleVO article, MultipartFile[] files);
	
	public int deleteArticleById(int id);
	
	public int selectCountLikeByMemberSeqIdAndArticleId(ArticleLikeVO vo);
	
	public void insertLike(ArticleLikeVO vo);
	
	public void deleteLike(ArticleLikeVO vo);
	
}
