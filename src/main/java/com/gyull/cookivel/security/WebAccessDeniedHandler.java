package com.gyull.cookivel.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class WebAccessDeniedHandler implements AccessDeniedHandler {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

			String requestURI = request.getRequestURI();
			String ajaxHeader = request.getHeader("X-Requested-With");

	        // AJAX 요청인지 검사 (헤더 검사, 비동기인지 체크)
	        boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);

	        if (isAjax) {
				response.setStatus(HttpStatus.FORBIDDEN.value());
				response.setContentType(MediaType.APPLICATION_JSON_VALUE);
	        } else {
			
	        	if(requestURI.contains("/login") || requestURI.contains("/register")) {
	        		response.sendRedirect("/");
			
	        	} else if(requestURI.contains("/admin/**")){
	        		//관리자페이지에 대한 접근권한이 없습니다.
	        		response.sendError(HttpServletResponse.SC_FORBIDDEN, "접근 권한이 없습니다.");
					
	        	} else {
	        		//접근권한이 없습니다
	        		response.sendError(HttpServletResponse.SC_FORBIDDEN, "접근 권한이 없습니다.");
	        	}
	        }
	}

}


