package com.kgitbank.spring.domain.article.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.account.service.AccountService;
import com.kgitbank.spring.domain.article.dto.ArticleDto;
import com.kgitbank.spring.domain.article.service.ArticleContentService;
import com.kgitbank.spring.domain.model.ArticleVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/article")
@Log4j
public class ArticleContentController {

	@Autowired
	ArticleContentService service;
	
	@Autowired
	AccountService accService;
	
	@GetMapping(value = "/{id}")
	public String getContent(@PathVariable("id") String id, 
							 Model model) {
		log.info("URL : /article - GET");
		log.info("id=" + id);
		
		ArticleDto article = service.selectArticleWithWriterInfoById(id);
		if (article == null) {
			return "redirect:/";
		}
		article.setFiles(service.selectFileByArticleId(article.getId()));
		
		model.addAttribute("article", article);
		return "article/content";
	}
	
	@ResponseBody
	@PostMapping(value = "")
	public ResponseEntity<String> saveContent(ArticleVO article, 
											  MultipartFile[] files,
											  HttpSession session) {
		log.info("URL : /article - POST");
		log.info("content=\n" + article.getContent());
		log.info(files.length);
		
		session.setAttribute("user", "test00"); // 테스트용 세션 생성 - 최종 merge 전 삭제
		
		String id = (String) session.getAttribute("user");
		if (id != null) {
			article.setWriterSeqId(accService.selectMemberById(id).getSeqId());
			if(service.saveArticleContent(article, files)) {
				return new ResponseEntity<>(HttpStatus.OK);				
			}
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 파일 업로드 실패
	}
	
	@ResponseBody
	@DeleteMapping(value = "", produces = "application/json")
	public ResponseEntity<String> deleteContent(@RequestBody ArticleDto articleInfo, HttpSession session) {
		log.info("URL : /article - DELETE");
		log.info("articleInfo=" + articleInfo);
		
		session.setAttribute("user", "test00"); // 테스트용 세션 생성 - 최종 merge 전 삭제
		
		// 로그인한 사용자 정보와 삭제하려는 게시물 작성자의 seqId가 동일한지 확인
		String loginId = (String) session.getAttribute("user");
		if (loginId == null || !loginId.equals(articleInfo.getWriterId())) {
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); // 로그인한 아이디가 아닌 경우
		}
		
		int result = service.deleteArticleById(articleInfo.getId());
		
		return result == 0 ? 
				new ResponseEntity<>(HttpStatus.NOT_FOUND) : // Delete Fail, 삭제할 게시물이 존재하지 않는 경우 
				new ResponseEntity<>(HttpStatus.OK);
	}
}
