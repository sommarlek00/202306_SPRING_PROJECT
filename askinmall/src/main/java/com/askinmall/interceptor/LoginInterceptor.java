package com.askinmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.askinmall.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginCheck = (MemberVO) session.getAttribute("loginStatus");
		
		if(loginCheck == null) {
			
			if(isAjaxRequest(request)) {
				response.sendError(400);
			}else {
				getTargetUrl(request);
				response.sendRedirect("/member/login");
			}
			return false;
			
		}
		return true;
		
	}


	private void getTargetUrl(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		String targetUrl = uri + query;
		
		if(request.getMethod().equals("GET")) {
			request.getSession().setAttribute("targetUrl", targetUrl);
		}
	}
	
	
	private boolean isAjaxRequest(HttpServletRequest request) {
		
		boolean isAjax = false;
		
		String header = request.getHeader("AJAX");
		if(header != null && header.equals("true")) {
			isAjax = true;
		}
		return isAjax;
	}
	
	
}
