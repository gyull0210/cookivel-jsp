package com.gyull.cookivel.controller.book;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.domain.pagination.BookCriteria;
import com.gyull.cookivel.domain.pagination.BookPagingDTO;
import com.gyull.cookivel.security.domain.CustomUser;
import com.gyull.cookivel.service.book.BookService;
import com.gyull.cookivel.service.bookshelf.BookshelfService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@AllArgsConstructor
@Log4j2
public class BookController {
	
	private BookService service;
	private BookshelfService bookShelfService;
	
	@RequestMapping(value = "/book/list", method = RequestMethod.GET)
	public String book(Model model, Authentication authentication, BookCriteria bcri, Integer book_idx, BookSubscribeVO subscribe) {
		
		model.addAttribute("book_idx", bcri.getBook_idx());
		model.addAttribute("book", service.bookInfo(book_idx));
		
		//로그인 되어 있으면 구독한 적 있는지 DB에서 read함
		if(authentication != null) {
			CustomUser user = (CustomUser)authentication.getPrincipal();
			Integer member_idx = user.getMember().getMember_idx();
		
			subscribe.setBook_idx(book_idx);
			subscribe.setMember_idx(member_idx);
		
			//해당 책번호가 구독한 게시물인지 int형으로 리턴받아 변수에 지정
			int subscribeCount = bookShelfService.readSubscribe(subscribe);
			
			if(subscribeCount == 1) {
				model.addAttribute("subscribe", subscribeCount);
			
			} else if(subscribeCount == 0) {			
				model.addAttribute("subscribe", subscribeCount);
			
			}
			
		} else {
			int subscribeCount = 0;
			model.addAttribute("subscribe", subscribeCount);
		}
		
		//첫 회차가 있는지 int형으로 리턴받아 변수에 지정
		int firstChapter = service.getFirstChapter(book_idx);
		
		if(firstChapter == 0) {
			model.addAttribute("firstChapter", firstChapter);
		} else {
			model.addAttribute("firstChapter", firstChapter);		
		}
		
		model.addAttribute("notice", service.chapterNotice(book_idx));
		model.addAttribute("list", service.pagination(bcri));
		log.info(service.pagination(bcri));
		Integer total = service.totalCount(bcri);
		model.addAttribute("pageMaker", new BookPagingDTO(bcri, total));
		
		return "/book/list";
	}

	//구독 컨트롤러
	@RequestMapping(value="/book/subscribe", method=RequestMethod.POST)
	@ResponseBody
	public int subscribe(Model model, Authentication authentication, BookSubscribeVO subscribe) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();

		subscribe.setMember_idx(member_idx);
		
		int subscribeCheck = bookShelfService.readSubscribe(subscribe);
		
		if(user != null && member_idx != null) {
			if(subscribeCheck == 0) {
				bookShelfService.createSubscribe(subscribe);
			} else if(subscribeCheck == 1){
				bookShelfService.removeSubscribe(subscribe);
			}
		}
		
		return subscribeCheck;
	}
	
	//이미지 경로를 만들어서 불러올 수 있는 컨트롤러
	@RequestMapping(value="/book_cover", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String book_imgName){
		File file = new File("c:\\upload\\"+book_imgName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

			log.info(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
