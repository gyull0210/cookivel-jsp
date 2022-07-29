package com.gyull.cookivel.api.subscribe;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.security.domain.CustomUser;
import com.gyull.cookivel.service.bookshelf.BookshelfService;

@RestController
public class ApiSubscribeController {

	private BookshelfService bookShelfService;	
	
	//구독 추가
//	@PostMapping(value="/api/subscribe", produces = MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<String> subscribe(Authentication authentication, @RequestBody BookSubscribeVO subscribe) {
//		
//		CustomUser user = (CustomUser)authentication.getPrincipal();
//		Integer member_idx = user.getMember().getMember_idx();
//
//		subscribe.setMember_idx(member_idx);
//		
//		int subscribeCheck = bookShelfService.readSubscribe(subscribe);
//		
//		return subscribeCheck == 1 
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	//구독 업데이트
	//읽은 회차 표시
//	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
//			value="/api/subscribe/{member_idx}/{book_idx}", 
//			consumes = "application/json",
//			produces = MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<String> modify(@RequestBody BookSubscribeVO subscribe, @PathVariable("book_idx") Integer book_idx) {
//		
//		return bookShelfService.updateHistory(null) == 1
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	//구독 취소
	//서비스단에서 int 리턴해야함
//	@DeleteMapping(value="/api/subscribe/{member_idx}/{book_idx}", produces = MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<String> remove(Authentication authentication, @PathVariable("book_idx") Integer book_idx, @RequestBody BookSubscribeVO subscribe) {
//
//		CustomUser user = (CustomUser)authentication.getPrincipal();
//		Integer member_idx = user.getMember().getMember_idx();
//
//		subscribe.setMember_idx(member_idx);
//		
//		return bookShelfService.removeSubscribe(subscribe) == 1
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
}
