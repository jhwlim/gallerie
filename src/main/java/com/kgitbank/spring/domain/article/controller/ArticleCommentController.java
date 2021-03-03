package com.kgitbank.spring.domain.article.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.spring.domain.article.service.ArticleCommentService;
import com.kgitbank.spring.domain.model.CommentVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/comment")
@Log4j
public class ArticleCommentController {

	@Autowired
	ArticleCommentService service;
	
	// 댓글 목록
	@RequestMapping(value = "/list")
	@ResponseBody
	public List<CommentVO> listComment(@RequestParam int id) {
		List<CommentVO> list = service.list(id);
		return list;
	}
	
	// 댓글 작성
	@RequestMapping(value = "/insert")
	public void insertComment(@ModelAttribute CommentVO vo) {
		
		service.insertComment(vo);
	}
	
	// 댓글 수정
	@RequestMapping(value = "/update")
	public void updateComment() {
		
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/delete")
	public void deleteComment() {
		
	}
	
}










