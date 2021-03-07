package com.kgitbank.spring.domain.article.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.article.dto.GalleryDto;
import com.kgitbank.spring.domain.article.dto.GalleryPageDto;
import com.kgitbank.spring.domain.article.mapper.ArticleContentMapper;
import com.kgitbank.spring.domain.model.ArticleLikeVO;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.FileVO;
import com.kgitbank.spring.domain.model.TagVO;
import com.kgitbank.spring.global.util.FileUtils;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ArticleContentServiceImpl implements ArticleContentService {

	private final PlatformTransactionManager transactionManger;

	public ArticleContentServiceImpl(PlatformTransactionManager transactionManger) {
		this.transactionManger = transactionManger;
	}

	@Resource(name = "articleUploadPath")
	private String uploadPath;
	
	@Autowired
	ArticleContentMapper mapper;
	
	@Override
	public ArticleDto selectArticleWithWriterInfoById(String id) {
		// 아이디 유효성 검사
		if (id == null) {
			return null;
		}
		
		ArticleDto article = null;
		
		try {
			article = mapper.selectArticleWithWriterInfoById(Integer.parseInt(id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		return article;
	}


	@Override
	public List<FileVO> selectFileByArticleId(int articleId) {
		return mapper.selectFileByArticleId(articleId);
	}
	
	
	@Override
	public boolean saveArticleContent(ArticleVO article, MultipartFile[] files) {
		boolean result = false;
		TransactionStatus txStatus = transactionManger.getTransaction(new DefaultTransactionDefinition());
		
		// 트랜잭션 처리
		try {
			insertArticle(article);
			
			// 게시물 내용으로 부터 해시태그를 분류하여 리스트에 저장하고, DB에 저장하기 
			insertTags(getTagsFromContent(article.getContent()));				
			
			if (files != null && files.length > 0) {
				// 유효성 검사 - 지원하지 않은 파일 형식일 때 처리
				for(MultipartFile file : files) {
					if (FileUtils.getMediaType(file.getOriginalFilename()) == null) {
						throw new Exception(file.getOriginalFilename() + " 파일은 지원하지 않은 파일 형식입니다.");
					}
				}
				
				// 파일을 서버에 저장하기
				String[] fileNames = FileUtils.uploadFiles(files, uploadPath); // 연도/월/일/파일이름
				List<FileVO> fileList = new ArrayList<>();
				for (int i = 0; i < fileNames.length; i++) {
					fileList.add(new FileVO(FileUtils.currPathtoUnderbarPath(fileNames[i]), i+1));					
				}
				
				// 서버에 저장한 파일이름을 DB에 저장하기
				insertFiles(fileList);	
			}
			
			log.info("게시물 업로드 완료");
			result = true;
			transactionManger.commit(txStatus);
		} catch (Exception e) {
			transactionManger.rollback(txStatus);
			log.warn("게시물 업로드 실패");
			e.printStackTrace();
		}
		
		return result;
	}

	
	private void insertArticle(ArticleVO article) throws Exception {
		// 유효성 검증
		if (article == null) {
			throw new NullPointerException();
		}
		
		if (article.getContent() == null || article.getContent().trim().equals("")) {
			throw new Exception("Article content is null or composed of only whitespaces");
		}
		
		mapper.insertArticle(article);
	}

	private void insertTags(List<TagVO> tags){
		// 유효성 검증
		if (tags == null || tags.size() == 0) {
			return;
		}
		
		mapper.insertTags(tags);
	}

	private void insertFiles(List<FileVO> files){
		// 유효성 검증
		if (files == null || files.size() == 0) {
			return;
		}
		
		mapper.insertFiles(files);
	}

	private List<TagVO> getTagsFromContent(String content) {
		// 유효성 검증
		if (content == null || content.trim().equals("")) {
			return null;
		}
		
		Set<TagVO> tags = new HashSet<>();
		
		Pattern tagPattern = Pattern.compile("\\#([0-9a-zA-Z가-힣_]+)");
		Matcher matcher = tagPattern.matcher(content);
		
		while(matcher.find()) {
			tags.add(new TagVO(matcher.group(1)));
		}
		
		return new ArrayList<>(tags);
	}


	@Override
	public int deleteArticleById(int id) {
		return mapper.deleteArticleById(id);
	}


	@Override
	public int selectCountLikeByMemberSeqIdAndArticleId(ArticleLikeVO vo) {
		return mapper.selectCountLikeByMemberSeqIdAndArticleId(vo);
	}


	@Override
	public void insertLike(ArticleLikeVO vo) {
		mapper.insertLike(vo);
	}


	@Override
	public void deleteLike(ArticleLikeVO vo) {
		mapper.deleteLike(vo);
	}


	@Override
	public List<GalleryDto> selectGalleryByWriterSeqId(GalleryPageDto page) {
		return mapper.selectGalleryByWriterSeqId(page);
	}


	@Override
	public int selectTotalCountOfArticlesByWriterSeqId(int writerSeqId) {
		return mapper.selectTotalCountOfArticlesByWriterSeqId(writerSeqId);
	}

}
