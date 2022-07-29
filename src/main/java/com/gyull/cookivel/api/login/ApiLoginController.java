package com.gyull.cookivel.api.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gyull.cookivel.domain.member.MemberVO;
import com.gyull.cookivel.service.member.MemberService;

@RestController
public class ApiLoginController {

	private MemberService service;
	
	@RequestMapping(value="/api/login")
	public String logins() {
		
		return "login";
	}
}
