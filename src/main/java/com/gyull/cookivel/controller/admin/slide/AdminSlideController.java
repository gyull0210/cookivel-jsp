package com.gyull.cookivel.controller.admin.slide;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminSlideController {
	
	@RequestMapping(value = "/admin/slide/slideList", method = RequestMethod.GET)
	public String adminSlide(Model model) {
				
		return "/admin/slide/slideList";
	}
	
	@RequestMapping(value = "/admin/slide/slideView", method = RequestMethod.GET)
	public String adminSlideView(Model model) {
				
		return "/admin/slide/slideView";
	}
}
