package com.gyull.cookivel.controller.admin.member;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminMemberController {

	@GetMapping(value="/member")
	public String member() {
		return "member";
	}
}
