package com.gyull.cookivel.controller.freeseries;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gyull.cookivel.domain.pagination.Criteria;
import com.gyull.cookivel.domain.pagination.PaginationDTO;
import com.gyull.cookivel.service.freeseries.FreeSeriesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class FreeSeriesController {

	private FreeSeriesService service;
	
	@GetMapping(value="/freeSeries/recentBook")
	public String recentBook(Model model, Criteria cri) {
		
		model.addAttribute("list", service.pagination(cri));

		Integer total = service.totalCount(cri);
		model.addAttribute("total", total);
		model.addAttribute("pageMaker", new PaginationDTO(cri, total));
		
		return "/freeSeries/recentBook";
	}
	
	@GetMapping(value="/freeSeries/list")
	public String list(Model model, Criteria cri) {
		
		//cri.setGenre(""); cri.setSort("");
		log.info(service.count(cri)); //log.info(service.pagination(cri));
		//model.addAttribute("list", service.pagination(cri));

		//Integer total = service.totalCount(cri);
		//model.addAttribute("total", total);
		//model.addAttribute("pageMaker", new PaginationDTO(cri, total));	
		
		return "/freeSeries/list";
	}
}
