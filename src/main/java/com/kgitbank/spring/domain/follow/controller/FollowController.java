package com.kgitbank.spring.domain.follow.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.kgitbank.spring.domain.account.service.AccountService;
import com.kgitbank.spring.domain.follow.service.FollowService;
import com.kgitbank.spring.domain.model.FollowVO;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;
import com.kgitbank.spring.domain.myprofile.service.ProfileMainService;

@Controller
public class FollowController {
	
	@Autowired
	ProfileMainService profileService;
	
	@Autowired
	FollowService followService;
	
	
	@GetMapping(value="/follow/{id}")
	public String follow(@PathVariable String id, Model model, HttpSession session) {
		
		if (id == null) {
			return "redirect:/";
		}
		
		ProfileDto member = profileService.selectMemberById(id);
		if (member == null) {
			return "redirect:/";
		}
		
		if(session.getAttribute("user") == null) {
			return "redirect:/";
		}
		
		boolean followed = false;
		
		String loginId = (String) session.getAttribute("user");
		
		ProfileDto login_id = profileService.selectMemberById(loginId);
		ProfileDto search_id = profileService.selectMemberById(id);
		
		System.out.println(login_id.getId() + " - " + search_id.getId());
		System.out.println(login_id.getSeqId() + " - " + search_id.getSeqId());
		
		List<Integer> followList = followService.selectFollow(login_id);
		System.out.println(followList);
		
		if(followList.contains(search_id.getSeqId())) {
			followed = true;
		}
		
		FollowVO vo = new FollowVO();
		
		vo.setFollowerId(login_id.getSeqId());
		vo.setFollowId(search_id.getSeqId());
		if(!followed) {
			followService.following(vo);
		}else {
			System.out.println("이미팔로우됨");
		}
		
		
		return "redirect:/myprofile/"+id;
	}

}