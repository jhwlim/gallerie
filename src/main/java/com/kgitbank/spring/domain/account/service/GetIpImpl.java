package com.kgitbank.spring.domain.account.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class GetIpImpl implements GetIp {

	@Override
	public String getIp(HttpServletRequest req) {
		String ip = req.getHeader("X-Forwarded-For");
		 
       // System.out.println(">>>> X-FORWARDED-FOR : " + ip);
 
        if (ip == null) {
            ip = req.getHeader("Proxy-Client-IP");
            //System.out.println(">>>> Proxy-Client-IP : " + ip);
        }
        if (ip == null) {
            ip = req.getHeader("WL-Proxy-Client-IP"); // 웹로직
            //System.out.println(">>>> WL-Proxy-Client-IP : " + ip);
        }
        if (ip == null) {
            ip = req.getHeader("HTTP_CLIENT_IP");
            //System.out.println(">>>> HTTP_CLIENT_IP : " + ip);
        }
        if (ip == null) {
            ip = req.getHeader("HTTP_X_FORWARDED_FOR");
            //System.out.println(">>>> HTTP_X_FORWARDED_FOR : " + ip);
        }
        if (ip == null) {
            ip = req.getRemoteAddr();
        }
        
        //System.out.println(">>>> Result : IP Address : "+ip);
 
        return ip;

	}

}
