package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.FileVO;

public interface FileMapper {
	
	public List<FileVO> selectAll();
	
	public void saveFile(FileVO file);
	
}
