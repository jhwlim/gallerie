package com.kgitbank.spring.domain.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kgitbank.spring.domain.article.service.ArticleCommentService;

@Controller
public class ArticleCommentController {

	@Autowired
	ArticleCommentService service;
	
	
}
