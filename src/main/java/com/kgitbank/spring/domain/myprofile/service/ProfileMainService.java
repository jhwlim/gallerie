package com.kgitbank.spring.domain.myprofile.service;

import java.util.List;

import com.kgitbank.spring.domain.myprofile.dto.ArticleSummaryDto;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileMainService {
	
	public ProfileDto selectMemberById(String id);

	public List<ArticleSummaryDto> selectArticleSummarys(int writerSeqId);
	
}
