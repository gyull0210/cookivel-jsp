package com.gyull.cookivel.controller.bookshelf;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gyull.cookivel.service.bookshelf.BookshelfService;
import com.gyull.cookivel.domain.book.BookHistoryVO;
import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.domain.pagination.StoryCriteria;
import com.gyull.cookivel.domain.pagination.StoryPagingDTO;
import com.gyull.cookivel.security.domain.CustomUser;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@AllArgsConstructor
@Log4j2
public class BookshelfController {

	private BookshelfService service;
	
	@RequestMapping(value = "/bookshelf/subscribe", method = RequestMethod.GET)
	public String bookshelf(Model model, StoryCriteria scri, Authentication authentication) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		scri.setMember_idx(member_idx);

		model.addAttribute("list", service.getSubscribeListPaging(scri));
		Integer total = service.totalSubscribeCount(scri);
		model.addAttribute("pageMaker", new StoryPagingDTO(scri, total));
		
		return "/bookshelf/subscribe";
	}

	//구독 컨트롤러
	@RequestMapping(value="/bookshelf/subscribe", method=RequestMethod.POST)
	@ResponseBody
	public int subscribe(Model model, Authentication authentication, BookSubscribeVO subscribe) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();

		subscribe.setMember_idx(member_idx);
		
		int subscribeCheck = service.readSubscribe(subscribe);
		
		if(user != null && member_idx != null) {
			if(subscribeCheck == 0) {
				service.createSubscribe(subscribe);
			} else if(subscribeCheck == 1){
			service.removeSubscribe(subscribe);
			}
		}

		
		return subscribeCheck;
	}
	
	@RequestMapping(value = "/bookshelf/history", method = RequestMethod.GET)
	public String history(Model model, StoryCriteria scri, Authentication authentication) {

		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		scri.setMember_idx(member_idx);

		model.addAttribute("list", service.getHistoryListPaging(scri));
		Integer total = service.totalSubscribeCount(scri);
		model.addAttribute("pageMaker", new StoryPagingDTO(scri, total));
		
		return "/bookshelf/history";
	}
	
	@RequestMapping(value = "/bookshelf/historyRemove", method = RequestMethod.POST)
	@ResponseBody
	public int historyRemove(Model model, Authentication authentication, BookHistoryVO history) {

			CustomUser user = (CustomUser)authentication.getPrincipal();
			Integer member_idx = user.getMember().getMember_idx();
			
			history.setMember_idx(member_idx);			
			
			int historyCheck = service.readHistory(history);
			
			service.removeHistory(history);
			
			return historyCheck;
	}
}
