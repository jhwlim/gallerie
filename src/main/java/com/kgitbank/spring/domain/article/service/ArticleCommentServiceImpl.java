package com.kgitbank.spring.domain.article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.article.mapper.ArticleCommentMapper;
import com.kgitbank.spring.domain.model.CommentVO;
import com.kgitbank.spring.global.util.DateFormatUtils;

@Service
public class ArticleCommentServiceImpl implements ArticleCommentService {

	@Autowired
	ArticleCommentMapper mapper;
	
	// 댓글목록
	@Override
	public List<CommentVO> listComment(int articleId) {
		List<CommentVO> result = mapper.listComment(articleId);
		for (CommentVO c : result) {
			c.setWriteDateStr(DateFormatUtils.changeDateToAgoStr(c.getWriteDate()));
		}
		return result;
	}
	// 댓글작성
	@Override
	public void insertComment(CommentVO comment) {
		mapper.insertComment(comment);
	}
	// 댓글수정
	@Override
	public void updateComment(CommentVO comment) {
		mapper.updateComment(comment);
	}
	// 댓글삭제
	@Override
	public void deleteComment(CommentVO comment) {
		mapper.deleteComment(comment);
	}
	
	// members테이블의 SeqId
	@Override
	public int getMemberSeqId(String id) {
		return mapper.getMemberSeqId(id);
	}
	
}
