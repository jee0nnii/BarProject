package com.bar.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bar.user.constants.User;

public class SessionInterceptors extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {	
		String contextPath = request.getContextPath();
		if(request.getSession().getAttribute(User.USER) == null) {
			System.out.println("되는거냐고");
			response.sendRedirect(contextPath + "/login");
			return false;
		}	
		return true;
	}			
}
