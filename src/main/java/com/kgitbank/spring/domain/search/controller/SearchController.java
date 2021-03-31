package com.kgitbank.spring.domain.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.search.service.SearchMemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping(value = "/search")
@Controller
public class SearchController {

	@Autowired
	SearchMemberService service;
	
	@ResponseBody
	@GetMapping
	@RequestMapping(value = "/user", produces = "application/json")
	public ResponseEntity<List<MemberVO>> searchUserByKeyword(String keyword) {
		log.info("keyword=" + keyword);
		return new ResponseEntity<>(service.selectMemberByKeyword(keyword), HttpStatus.OK);
	}
	
}
