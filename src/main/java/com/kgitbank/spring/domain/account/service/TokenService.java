package com.kgitbank.spring.domain.account.service;

import com.kgitbank.spring.domain.account.dto.FbProfile;

public interface TokenService {

	public FbProfile call_me(String access_token) throws Exception;
}
