package com.gyull.cookivel.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class FormAccessDeniedHandler implements AccessDeniedHandler {

	private String errorPage;

	private ObjectMapper objecMapper = new ObjectMapper();

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
	
		String ajaxHeader = request.getHeader("X-Requested-With");
		
		boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);
		
		if (isAjax) {
			response.setContentType(MediaType.APPLICATION_JSON_VALUE);
			response.getWriter().write(this.objecMapper.writeValueAsString(ResponseEntity.status(HttpStatus.FORBIDDEN)));

		} else {
			String deniedUrl = errorPage + "?exception=" + accessDeniedException.getMessage();
			redirectStrategy.sendRedirect(request, response, deniedUrl);
		}

	}
	
	public void setErrorPage(String errorPage) {
        if ((errorPage != null) && !errorPage.startsWith("/")) {
            throw new IllegalArgumentException("errorPage must begin with '/'");
        }

        this.errorPage = errorPage;

	}	
}
