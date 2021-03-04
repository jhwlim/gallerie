package com.kgitbank.spring.domain.article.controller;

import java.util.List;

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
import com.kgitbank.spring.domain.article.service.ArticleCommentService;
import com.kgitbank.spring.domain.article.service.ArticleContentService;
import com.kgitbank.spring.domain.model.ArticleLikeVO;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.CommentVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/article")
@Log4j
public class ArticleContentController {

	@Autowired
	ArticleContentService service;
	
	@Autowired
	AccountService accService;
	
	@Autowired
	ArticleCommentService commentService;
	
	@GetMapping(value = "/{id}")
	public String getContent(@PathVariable("id") String id, 
							 Model model,
							 HttpSession session) {
		log.info("URL : /article - GET");
		log.info("id=" + id);
		
		String loginId = (String) session.getAttribute("user");
		if (loginId == null) {
			return "redirect:/"; 
		}
		
		// 게시물에 대한 정보를 조회
		ArticleDto article = service.selectArticleWithWriterInfoById(id);
		if (article == null) {
			return "redirect:/";
		}
		article.setFiles(service.selectFileByArticleId(article.getId()));
		
		// 해당 게시물에 로그인한 아이디가 좋아요를 눌렀는지 확인
		ArticleLikeVO likeVO = new ArticleLikeVO(article.getId(), accService.selectMemberById(loginId).getSeqId());
		article.setHasLike(service.selectCountLikeByMemberSeqIdAndArticleId(likeVO) == 1 ? true : false);
		
		// 게시물에 대한 댓글 리스트를 조회
		// List<CommentVO> comments = commentService.list(article.getId());
		// log.info("댓글 리스트 : " + comments);
		// article.setComments(comments);
		
		log.info(article);
		model.addAttribute("article", article);
		return "article/content";
	}
	
	@ResponseBody
	@PostMapping(value = "/")
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
	@DeleteMapping(value = "/", produces = "application/json")
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
	
	@ResponseBody
	@PostMapping(value = "/like")
	public ResponseEntity<String> likeArticle(@RequestBody ArticleLikeVO vo, HttpSession session) {
		log.info("URL : /article/like - POST");
		log.info("articleId=" + vo.getArticleId());
		
		String loginId = (String) session.getAttribute("user");
		log.info(loginId);
		if (loginId == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		vo.setMemberSeqId(accService.selectMemberById(loginId).getSeqId());
		service.insertLike(vo);
		
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@ResponseBody
	@DeleteMapping(value = "/like")
	public ResponseEntity<String> cancelLike(@RequestBody ArticleLikeVO vo, HttpSession session) {
		log.info("URL : /article/like - DELETE");
		log.info("articleId=" + vo.getArticleId());
		
		String loginId = (String) session.getAttribute("user");
		log.info(loginId);
		if (loginId == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		vo.setMemberSeqId(accService.selectMemberById(loginId).getSeqId());
		service.deleteLike(vo);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
