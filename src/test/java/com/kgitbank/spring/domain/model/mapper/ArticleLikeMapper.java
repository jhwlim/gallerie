package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.ArticleLikeVO;

public interface ArticleLikeMapper {
	
	public List<ArticleLikeVO> selectAll();
	
	public void like(ArticleLikeVO vo);
}
