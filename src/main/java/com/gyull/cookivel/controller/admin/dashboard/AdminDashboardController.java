package com.gyull.cookivel.controller.admin.dashboard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminDashboardController {
	
	@RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
	public String adminDashboard(Model model) {
		return "/admin/dashboard";
	}
	
	@RequestMapping(value = "/admin/member/memberList", method = RequestMethod.GET)
	public String memberList(Model model) {
		return "/admin/member/memberList";
	}

}
