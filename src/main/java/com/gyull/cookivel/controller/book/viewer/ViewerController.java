package com.gyull.cookivel.controller.book.viewer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gyull.cookivel.service.book.BookService;
import com.gyull.cookivel.service.book.viewer.BookViewerRatingService;
import com.gyull.cookivel.service.book.viewer.BookViewerService;
import com.gyull.cookivel.service.bookshelf.BookshelfService;
import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookRatingVO;
import com.gyull.cookivel.domain.book.ChapterViewVO;
import com.gyull.cookivel.domain.book.BookHistoryVO;
import com.gyull.cookivel.security.domain.CustomUser;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@AllArgsConstructor
@Log4j2
public class ViewerController {
	
	private BookService bookService;
	private BookViewerService service;
	private BookViewerRatingService bookRatingService;
	private BookshelfService bookShelfService;
	
	@RequestMapping(value="/book/view", method = RequestMethod.GET)
	public String view(Model model, Integer book_idx, Authentication authentication, Integer chapter_idx) {
		BookChapterVO chapter = new BookChapterVO();
		
		chapter.setBook_idx(book_idx);
		chapter.setChapter_idx(chapter_idx);
		BookChapterVO readChapter = service.readChapter(chapter);
		
		//최근 조회한 글 확인 없으면 조회수+1 있으면 X
		try {
			ChapterViewVO view = new ChapterViewVO();
			
			if(authentication != null) {
				CustomUser user = (CustomUser)authentication.getPrincipal();
				Integer member_idx = user.getMember().getMember_idx();
				
				view.setMember_idx(member_idx);
				view.setBook_idx(book_idx);
				view.setChapter_idx(chapter_idx);
				
				ChapterViewVO views = service.getViews(view);
				
				if(views != null) {
					
				} else {
					service.createViews(view);					
					service.views(chapter_idx);
				}
				
			} else {
				
				HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				String ip = req.getHeader("X-FORWARDED-FOR");
				if (ip == null) {
					ip = req.getRemoteAddr();
				}
				
				view.setBook_idx(book_idx);
				view.setChapter_idx(chapter_idx);
				view.setIp(ip);
				ChapterViewVO views = service.getViews(view);
				
				if(views != null) {
					
				} else {
					service.createViews(view);				
					service.views(chapter_idx);
				}
			}
			
		} catch(Exception e) {
			log.error(e); e.printStackTrace();
		}
		
		
		//로그인한 상태면 별점 내역 확인
		try {
			BookRatingVO rating = new BookRatingVO();
			
			if(authentication != null) {
			CustomUser user = (CustomUser)authentication.getPrincipal();
			Integer member_idx = user.getMember().getMember_idx();
			
			rating.setMember_idx(member_idx);
			rating.setBook_idx(book_idx);
			rating.setChapter_idx(chapter_idx);
			
			BookRatingVO myRate = bookRatingService.readRating(rating);

			log.info(myRate);
			if(myRate == null) {
				model.addAttribute("rating", myRate);
			} else {
				model.addAttribute("rating", myRate);
			}
			
			} else {
				model.addAttribute("rating", null);
			}
		} catch(Exception e) {
			log.error(e); e.printStackTrace();
			
		}
		
		//로그인한 상태면 읽은 내역에 내역확인 후 없으면 추가 있으면 업데이트
		try {
			BookHistoryVO history = new BookHistoryVO();
			if(authentication != null) {
				CustomUser user = (CustomUser)authentication.getPrincipal();
				Integer member_idx = user.getMember().getMember_idx();

				history.setMember_idx(member_idx);
				history.setBook_idx(book_idx);
			
				int historyCount = bookShelfService.readHistory(history);
			
				if(historyCount == 0) {
					history.setChapter_idx(chapter_idx);
					history.setChapter_title(readChapter.getChapter_title());
					bookShelfService.createHistory(history);
				} else {
					history.setChapter_idx(chapter_idx);
					history.setChapter_title(readChapter.getChapter_title());
					bookShelfService.updateHistory(history);
				}
			}
		} catch(Exception e) {
			log.error(e); e.printStackTrace();
		}
		
		model.addAttribute("chapter", readChapter);
		model.addAttribute("book", bookService.bookInfo(book_idx));
		model.addAttribute("list", service.chapterList(chapter));
		
		return "/book/view";
	}
	
	@RequestMapping(value="/book/view/rating", method = RequestMethod.POST)
	public void rating(Model model, Authentication authentication, BookRatingVO rating) {
		try {
			
			if(authentication != null) {
				CustomUser user = (CustomUser)authentication.getPrincipal();
				Integer member_idx = user.getMember().getMember_idx();
				
				rating.setMember_idx(member_idx);
				
				BookRatingVO myRate = bookRatingService.readRating(rating);
				
				if(myRate == null) {
					bookRatingService.rating(rating);
				} else {
					bookRatingService.modifyRating(rating);
				}
			} else {
				
			}

		} catch(Exception e) {
			log.error(e);
		}
	}
}
