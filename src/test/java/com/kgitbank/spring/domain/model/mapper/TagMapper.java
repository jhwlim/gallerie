package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.TagVO;

public interface TagMapper {
	
	public List<TagVO> selectAll();
	
	public void createTag(TagVO tag);
}
