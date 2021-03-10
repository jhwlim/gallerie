package com.kgitbank.spring.domain.article.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.spring.domain.article.service.ArticleCommentService;
import com.kgitbank.spring.domain.model.ArticleVO;
import com.kgitbank.spring.domain.model.CommentVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/comment")
@Log4j
public class ArticleCommentController {

	@Autowired
	ArticleCommentService service;
	
	// 댓글 목록
	@RequestMapping("/list")
	@ResponseBody
	public List<CommentVO> listComment(Model model, int articleId) {
		return service.listComment(articleId);
	}
	
	// 댓글 작성
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertComment(@RequestParam String id, String content, HttpSession session) {
		log.info(id);
		
		CommentVO vo = new CommentVO();
		String loginId = (String) session.getAttribute("user"); // 로그인 아이디
		
		int memberSeqId = service.getMemberSeqId(loginId); // MemberSeqId
		vo.setArticleId(Integer.parseInt(id));
		vo.setContent(content);
		vo.setMemberSeqId(memberSeqId);
		
		service.insertComment(vo);

		return "redirect:/post/" + id;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public void deleteComment(@RequestBody CommentVO vo) {
		service.deleteComment(vo);
	}
	
}










