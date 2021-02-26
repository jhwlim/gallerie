package com.kgitbank.spring.domain.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.article.dto.ArticleContentDto;
import com.kgitbank.spring.domain.article.service.ArticleContentService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/article")
@Log4j
public class ArticleContentController {

	@Autowired
	ArticleContentService articleService;
	
	@GetMapping(value = "/{id}")
	public String getContent(@PathVariable("id") String id, 
							 Model model) {
		log.info("URL : /article - GET");
		log.info("id=" + id);
		
		try {
			ArticleContentDto article = articleService.selectOne(Integer.parseInt(id));
			log.info("article=" + article);
			if (article == null) {
				throw new Exception();
			}
			
			model.addAttribute("article", article);
			
			return "article/content";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	
}
