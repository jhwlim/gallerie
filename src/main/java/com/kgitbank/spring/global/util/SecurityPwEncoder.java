package com.kgitbank.spring.global.util;

public interface SecurityPwEncoder {
	
	public String encode(String rawPw);
	
	public boolean matches(String rawPw, String encodedPw);
	
}
