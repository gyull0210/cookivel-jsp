package com.gyull.cookivel.controller.book.viewer;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gyull.cookivel.service.book.viewer.BookViewerCommentService;
import com.gyull.cookivel.domain.book.BookCommentVO;
import com.gyull.cookivel.domain.pagination.ChapterCommentCriteria;
import com.gyull.cookivel.security.domain.CustomUser;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/book/view/comment/")
@AllArgsConstructor
@Log4j2
public class ChapterCommentController {
	private BookViewerCommentService service;	
	
	@PostMapping(value="/create",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody BookCommentVO comment){
		
		int insertCount = service.create(comment);
		
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{book_idx}/{chapter_idx}/{page}",
			produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<BookCommentVO>> commentList(@PathVariable("book_idx")Integer book_idx, @PathVariable("chapter_idx")Integer chapter_idx, @PathVariable("page")Integer page){
		
		ChapterCommentCriteria cccri = new ChapterCommentCriteria(page, 10, book_idx, chapter_idx);
		
		return new ResponseEntity<>(service.getCommentListByPaging(cccri, book_idx, chapter_idx), HttpStatus.OK);
	}

	
	@DeleteMapping(value="/{bookComment_idx}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("bookComment_idx") Integer bookComment_idx, Authentication authentication, BookCommentVO comment){

		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		comment.setMember_idx(member_idx);
		comment.setBc_idx(bookComment_idx);
		
		return service.remove(comment) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
