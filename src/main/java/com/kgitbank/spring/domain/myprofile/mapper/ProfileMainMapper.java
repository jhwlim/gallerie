package com.kgitbank.spring.domain.myprofile.mapper;

import java.util.List;

import com.kgitbank.spring.domain.myprofile.dto.ArticleSummaryDto;
import com.kgitbank.spring.domain.myprofile.dto.ProfileDto;

public interface ProfileMainMapper {
	
	public ProfileDto selectMemberById(String id);
	
	public List<ArticleSummaryDto> selectArticleSummarys(int writerSeqId);
	
}
