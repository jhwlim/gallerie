package com.kgitbank.spring.domain.article.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.article.mapper.ArticleContentMapper;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.FileVO;
import com.kgitbank.spring.domain.model.TagVO;

import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ArticleContentServiceImpl implements ArticleContentService {

	private final PlatformTransactionManager transactionManger;

	public ArticleContentServiceImpl(PlatformTransactionManager transactionManger) {
		this.transactionManger = transactionManger;
	}

	@Autowired
	ArticleContentMapper mapper;
	
	@Override
	public ArticleDto selectOne(int id) {
		return mapper.selectOne(id);
	}

	@Override
	public void saveContent(ArticleVO article, MultipartFile[] files) {
		
		TransactionStatus txStatus = transactionManger.getTransaction(new DefaultTransactionDefinition());
		
		// article.content로 부터 tag 분류 및 리스트 
		List<TagVO> tags = new ArrayList<>();
		
		// 테스트용 tag
		tags.add(new TagVO("A"));
		tags.add(new TagVO("C"));
		tags.add(new TagVO("B"));
		log.info(tags);
		
		// 트랜잭션 처리
		try {
			insertArticle(article);
			insertTags(tags);
			
		} catch (Exception e) {
			transactionManger.rollback(txStatus);
			e.printStackTrace();
		}
		
		transactionManger.commit(txStatus);
	}

	
	@Override
	public void insertArticle(ArticleVO article) throws Exception {
		// 유효성 검증
		
		mapper.insertArticle(article);
	}

	@Override
	public void insertTags(List<TagVO> tags) throws Exception {
		// 유효성 검증
		
		mapper.insertTags(tags);
	}

	@Override
	public void insertFiles(List<FileVO> files) throws Exception {
		// 유효성 검증
		
		mapper.insertFiles(files);
	}

	
	
}
