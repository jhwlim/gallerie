package com.kgitbank.spring.global.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class SecurityPwEncoderImpl implements SecurityPwEncoder {

	@Override
	public String encode(String rawPw) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		return encoder.encode(rawPw);
	}

	@Override
	public boolean matches(String rawPw, String encodedPw) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		return encoder.matches(rawPw, encodedPw);
	}
	
	
}
