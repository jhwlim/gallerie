package com.kgitbank.spring.domain.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.article.service.ArticleContentService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/article")
@Log4j
public class ArticleContentController {

	@Autowired
	ArticleContentService service;
	
	@GetMapping(value = "/{id}")
	public String getContent(@PathVariable("id") String id, 
							 Model model) {
		log.info("URL : /article - GET");
		log.info("id=" + id);
		
		try {
			ArticleDto article = service.selectOne(Integer.parseInt(id));
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
	
	@ResponseBody
	@PostMapping(value= "")
	public String saveContent(String content, MultipartFile[] files) {
		log.info("URL : /article - POST");
		log.info("content=\n" + content);
		log.info(files.length);
		
		try {
			// 서비스 호출
			
			return "";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
}
