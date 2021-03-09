package com.kgitbank.spring.domain.myprofile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.spring.domain.follow.service.FollowService;
import com.kgitbank.spring.domain.model.ProfileFollowVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;
import com.kgitbank.spring.domain.myprofile.service.ProfileMainService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/myprofile")
@Log4j
public class ProfileMainController {
	
	@Autowired
	ProfileMainService service;
	
	@Autowired
	FollowService followService;
	
	@GetMapping({"/", "/{id}"})
	public String main(@PathVariable(name = "id", required = false) String id, Model model, HttpSession session) {
		log.info("URL : /myprofile/" + id + " - GET");
		log.info("id=" + id);
		
		if(session.getAttribute("user") == null) {
			return "redirect:/";
		}
		
		if (id == null) {
			log.warn("id is null");
			return "redirect:/";
		}
		
		ProfileDto member = service.selectMemberById(id);
		if (member == null) {
			log.warn("page not found");
			return "redirect:/";
		}
		
		String loginedId = (String) session.getAttribute("user");
		log.info("loginedId=" + loginedId);
		
		member.setSignedIn(id.equals(loginedId));
		log.info("member=" + member);
		
		model.addAttribute("member", member);
		
		
		ProfileDto user = service.selectMemberById(loginedId);
		
		// 유저세션 팔로우리스트
		List<Integer> followList = followService.selectFollow(user);
		List<ProfileDto> dtoFollowList = new ArrayList<>();
		for(int num : followList) {
			dtoFollowList.add(followService.seqsearch(num));
		}
		
		// 유저세션 팔로워리스트
		List<Integer> followerList = followService.selectFollower(user);
		List<ProfileDto> dtoFollowerList = new ArrayList<>();
		for(int num : followerList) {
			dtoFollowerList.add(followService.seqsearch(num));
		}
		System.out.println(dtoFollowList);
		System.out.println(dtoFollowerList);
		// 요청한 마이프로필과 팔로우 여부 확인
		boolean followCheck = false;
		
		// 팔로우 목록에 요청한 유저가 있다면 true
		if(followList.contains(member.getSeqId())) followCheck = true;
		// 로그인한 아이디와 요청한 유저의 아이디가 같다면 true
		if(member.getSeqId() == user.getSeqId()) followCheck = true;
		
		
		ProfileFollowVO ProfileFollowVO = new ProfileFollowVO();
		ProfileFollowVO.setFollowList(followList);
		ProfileFollowVO.setDtoFollowList(dtoFollowList);
		ProfileFollowVO.setFollowerList(followerList);
		ProfileFollowVO.setDtoFollowerList(dtoFollowerList);
		ProfileFollowVO.setFollowCheck(followCheck);
		
		model.addAttribute("myfollow", ProfileFollowVO);
		
		// 현재 요청한 유저의 팔로우리스트
		List<Integer> reqFollowList = followService.selectFollow(member);
		
		List<ProfileDto> reqDtoFollowList = new ArrayList<>();
		for(int num : reqFollowList) {
			reqDtoFollowList.add(followService.seqsearch(num));
		}
		
		List<Integer> reqFollowerList = followService.selectFollower(member);
		List<ProfileDto> reqDtoFollowerList = new ArrayList<>();
		for(int num : reqFollowerList) {
			reqDtoFollowerList.add(followService.seqsearch(num));
		}
		
		System.out.println(reqDtoFollowList);
		System.out.println(reqDtoFollowerList);
		
		ProfileFollowVO reqProfileFollowVO = new ProfileFollowVO();
		reqProfileFollowVO.setFollowList(reqFollowList);
		reqProfileFollowVO.setDtoFollowList(reqDtoFollowList);
		reqProfileFollowVO.setFollowerList(reqFollowerList);
		reqProfileFollowVO.setDtoFollowerList(reqDtoFollowerList);
		reqProfileFollowVO.setFollowCheck(followCheck);
		
		model.addAttribute("follow", reqProfileFollowVO);
		
		
		return "myprofile/myProfileMain";
	}
}
