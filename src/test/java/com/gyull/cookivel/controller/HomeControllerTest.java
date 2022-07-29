package com.gyull.cookivel.controller;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.gyull.cookivel.controller.home.HomeController;

import lombok.extern.log4j.Log4j2;

@WebMvcTest(HomeController.class)
@Log4j2
class HomeControllerTest {

	@Autowired
	private WebApplicationContext ctx;
	
	
	private MockMvc mvc;
	
	public void setup() {
		this.mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	@Test
	void test() throws Exception {

		log.info(
				mvc.perform(MockMvcRequestBuilders.get("/"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}

}
