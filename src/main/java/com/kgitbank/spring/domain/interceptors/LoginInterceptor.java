package com.kgitbank.spring.domain.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
        
        HttpSession httpSession = req.getSession(false);
        if (httpSession != null) {
            Object obj = httpSession.getAttribute("user"); // 세션에 있는 user 속성값을 가져온다.
            if (obj != null) return true; // 세션에 user 속성값이 있다면 true를 리턴해 컨트롤러의 로직을 정상 실행.
        }
        
        // 여기까지 내려왔다면 세션에 user 속성값이 없다는 뜻이므로
        // 로그인 화면으로 리다이렉트 !
        res.sendRedirect(req.getContextPath() + "/");
        return false;
    }
    
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav) throws Exception {
            
    	
    	super.postHandle(req, res, handler, mav);
		
    }
    
    @Override
    public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception e) 
        throws Exception {
    
    super.afterCompletion(req, res, handler, e);
}

}
