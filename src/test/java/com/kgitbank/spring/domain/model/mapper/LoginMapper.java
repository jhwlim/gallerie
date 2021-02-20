package com.kgitbank.spring.domain.model.mapper;

import java.util.List;

import com.kgitbank.spring.domain.model.LoginVO;

public interface LoginMapper {
	
	public List<LoginVO> selectAll();
	
	public void createNewLogin(LoginVO login);
	
}
