package com.kgitbank.spring.domain.article.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.spring.domain.article.service.ArticleFileService;
import com.kgitbank.spring.global.util.FileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ArticleFileController {

	@Autowired
	ArticleFileService service;
	
	@Resource(name="articleDefaultImgFileName")
	private String defaultImagePath;
	
	@GetMapping("/image/article/")
	public String getImage() {
		return "redirect:/image/article/" + defaultImagePath + "/";
	}
	
	@GetMapping("/image/article/{imgPath}")
	public ResponseEntity<byte[]> getImage(@PathVariable(name = "imgPath") String imgPath) {
		log.info("URL : /image/article - GET");
		log.info("imgPath=" + imgPath);
		
		String savedFileName = imgPath;
		HttpHeaders headers = new HttpHeaders();
		
		try {
			MediaType mediaType = FileUtils.getMediaType(imgPath);
			if (mediaType == null) {
				return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE); 
			}
			
			byte[] imgBytes = service.getImage(savedFileName);
			if (imgBytes == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			headers.setContentType(mediaType);
			
			return new ResponseEntity<>(imgBytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	
}
