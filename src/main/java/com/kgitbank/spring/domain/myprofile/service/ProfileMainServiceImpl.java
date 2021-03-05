package com.kgitbank.spring.domain.myprofile.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.myprofile.dto.ArticleSummaryDto;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;
import com.kgitbank.spring.domain.myprofile.mapper.ProfileMainMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProfileMainServiceImpl implements ProfileMainService {
	
	@Resource(name="profileUploadPath")
	private String uploadPath;
	
	@Resource(name="profileDefaultImgFileName")
	private String defaultImgFile;
	
	@Autowired
	ProfileMainMapper mapper;

	@Override
	public ProfileDto selectMemberById(String id) {
		ProfileDto member = mapper.selectMemberById(id);
		if (member == null) {
			return null;
		}
		
		if (member.getImgPath() == null
				|| !new File(uploadPath + member.getImgPath()).exists()) {
			log.info("Not Exist : " + member.getImgPath());
			member.setImgPath(defaultImgFile);
		} else {
			member.setHasImg(true);
		}
		
		return member;
	}

	@Override
	public List<ArticleSummaryDto> selectArticleSummarys(int writerSeqId) {
		return mapper.selectArticleSummarys(writerSeqId);
	}

}
