package com.kgitbank.spring.domain.article.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.model.ArticleVO;

import lombok.extern.log4j.Log4j;

// 브라우저에서 데이터 전송 관련 테스트 컨트롤러, merge 전 삭제 예정
@Controller
@RequestMapping("/article/test")
@Log4j
public class ArticleTestController {

	@GetMapping("/write")
	public void write() {
		log.info("URL : /article/test - GET");
	}
	
	
	@ResponseBody
	@PostMapping("/save")
	public String save(String content, MultipartFile[] files) {
		log.info("URL : /article/test/save - POST");
		log.info("content=\n" + content);
		log.info(files.length);
		return "";
	}
}
