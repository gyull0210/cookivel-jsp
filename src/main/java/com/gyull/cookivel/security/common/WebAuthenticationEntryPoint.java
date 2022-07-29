package com.gyull.cookivel.security.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

/**
 * 
 * 비로그인일 때 url에 따른 상태분기
 * @author mkht0
 *
 */
public class WebAuthenticationEntryPoint implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {

		String requestURI = request.getRequestURI();
		String ajaxHeader = request.getHeader("X-Requested-With");

        // AJAX 요청인지 검사 (헤더 검사, 비동기인지 체크)
        boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);

        // 403 Error를 반환한다.
        if (isAjax) {
			response.setStatus(HttpStatus.FORBIDDEN.value());
			response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        } else {
      
        		response.setContentType("text/html; charset=utf-8");
    			PrintWriter out = response.getWriter();
    			out.print("<script>alert('로그인이 필요합니다 !'); location.href='/login';</script>");
    			out.flush();//출력버퍼를 비우는 코드
    			out.close();
    			response.setStatus(HttpStatus.FORBIDDEN.value());
    			response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        	}
        }

}
