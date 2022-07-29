package com.gyull.cookivel.security.filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gyull.cookivel.domain.member.MemberVO;

public class AjaxLoginProcessingFilter extends AbstractAuthenticationProcessingFilter {

	private ObjectMapper objectMapper = new ObjectMapper();
	
	public AjaxLoginProcessingFilter() {
		super(new AntPathRequestMatcher("/api/login"));
	}
	
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException, IOException, ServletException {
		
		if(isAjax(request)) {
			throw new IllegalStateException("Authentication in not supported");
		}
		
		MemberVO vo = objectMapper.readValue(request.getReader(), MemberVO.class);
		
	    if (vo.getMem_email().isEmpty() ||vo.getMem_pw().isEmpty()){
	            throw  new IllegalArgumentException("Username or password is empty");
	    }
	        
	    //Token 클래스에 첫번째 생성자에게 정보들을 전달해주자  첫번째 생서자는
	    //사용자의 username,password 를 전달받으니까 여기서 사용자의 username,password를 전달해주면된다.
	    AjaxAuthenticationToken ajaxAuthenticationToken = new AjaxAuthenticationToken(vo.getMem_email(), vo.getMem_pw());
			
	    //작성해준 토큰을 전달해주면된다. 
	    return getAuthenticationManager().authenticate(ajaxAuthenticationToken);
	    }
		
	    //Ajax 인지 아닌지 기준점을 정해준다 
	    private boolean isAjax(HttpServletRequest request) {
	    	
	    //정보에 담겨 있는 값과 같은지 아닌지 판별해야하는데 서버에서 미리 약속을 정해줄수 있다. 
	    if ( "XMLHttpRequest".equals(request.getHeader("X-Requested-With")) ){
	       return true;
	    }
	        
	    //위에 값과 일치하지 않으면 
	    return false;
	    }
}
