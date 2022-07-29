package com.gyull.cookivel.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gyull.cookivel.domain.member.MemberVO;
import com.gyull.cookivel.service.member.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@AllArgsConstructor
@Log4j2
public class MemberController {

	private MemberService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		
		return "/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, MemberVO vo) {
		
		
		service.register(vo);
		return "/register";
	}
}
