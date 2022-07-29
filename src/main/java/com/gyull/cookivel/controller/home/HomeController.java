package com.gyull.cookivel.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gyull.cookivel.service.home.HomeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@AllArgsConstructor
@Log4j2
public class HomeController {
	
	private HomeService service;
	
	@RequestMapping(value="/")
	public String home(Model model) {
		
		return "home";
	}

}
