package com.gyull.cookivel.controller.storyroom;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gyull.cookivel.service.storyroom.StoryRoomService;
import com.gyull.cookivel.service.storyroom.chapter.StoryChapterService;
import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.StoryChapterCriteria;
import com.gyull.cookivel.domain.pagination.StoryChapterPagingDTO;
import com.gyull.cookivel.security.domain.CustomUser;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class StoryRoomChapterController {

	private StoryChapterService service;
	private StoryRoomService storyRoomService;
	
	@RequestMapping(value="/storyRoom/chapter/list", method = RequestMethod.GET)
	public String chapterList(Model model, HttpSession session, ServletResponse response, Authentication authentication, StoryChapterCriteria sccri, Integer book_idx) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		
		model.addAttribute("book", service.bookInfo(book_idx));
		
		sccri.setMember_idx(member_idx);
		sccri.setBook_idx(book_idx);

		model.addAttribute("list", service.pagination(sccri));

		Integer total = service.totalCount(sccri);
		model.addAttribute("pageMaker", new StoryChapterPagingDTO(sccri, total));
		log.info(total +","+ service.pagination(sccri));
		return "/storyRoom/chapter/list";
	}
	
	@RequestMapping(value="/storyRoom/chapter/chapterNotice", method = RequestMethod.GET)
	public String chapterNotice(Model model, HttpSession session, ServletResponse response, Authentication authentication, StoryChapterCriteria sccri, Integer book_idx) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		
		model.addAttribute("book", service.bookInfo(book_idx));
		
		sccri.setMember_idx(member_idx);
		sccri.setBook_idx(book_idx);

		model.addAttribute("list", service.noticePagination(sccri));

		Integer total = service.totalNoticeCount(sccri);
		model.addAttribute("pageMaker", new StoryChapterPagingDTO(sccri, total));
		
		return "/storyRoom/chapter/chapterNotice";
	}
	
	@RequestMapping(value="/storyRoom/chapter/chapterWrite", method = RequestMethod.GET)
	public String chapterWrite(Model model, HttpSession session, Authentication authentication, ServletResponse response, Integer book_idx) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		
		BookVO book = new BookVO();
		book.setMember_idx(member_idx);
		book.setBook_idx(book_idx);
		model.addAttribute("book_idx", book_idx);
		BookVO vo = storyRoomService.read(book);
		model.addAttribute("book_title", vo.getBook_title());
		
		return "/storyRoom/chapter/chapterWrite";
	}
	
	@RequestMapping(value="/storyRoom/chapter/chapterWrite", method = RequestMethod.POST)
	public String chapterWrite(Model model, HttpSession session, ServletResponse response, Authentication authentication, StoryChapterCriteria sccri, Integer book_idx, BookChapterVO chapter, RedirectAttributes rttr) {
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		chapter.setMember_idx(member_idx);
		
		service.create(chapter);	
		rttr.addAttribute("book_idx", sccri.getBook_idx());
		
		return "redirect:/storyRoom/chapter/list";
	}
	
	@RequestMapping(value="/storyRoom/chapter/chapterModify", method = RequestMethod.GET)
	public String chapterModify(Model model, HttpSession session, Authentication authentication, ServletResponse response, Integer book_idx, Integer chapter_idx) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		
		BookVO book = new BookVO();
		book.setMember_idx(member_idx);
		book.setBook_idx(book_idx);
		model.addAttribute("book_idx", book_idx);
		BookVO vo = storyRoomService.read(book);
		model.addAttribute("book_title", vo.getBook_title());
		
		BookChapterVO chapter = new BookChapterVO();
		chapter.setMember_idx(member_idx);
		chapter.setBook_idx(book_idx);
		chapter.setChapter_idx(chapter_idx);
		
		model.addAttribute("chapter", service.read(chapter));
		
		return "/storyRoom/chapter/chapterModify";
	}
	
	@RequestMapping(value="/storyRoom/chapter/chapterModify", method = RequestMethod.POST)
	public String chapterModify(Model model, HttpSession session, ServletResponse response, Authentication authentication, StoryChapterCriteria sccri, Integer book_idx, BookChapterVO chapter, RedirectAttributes rttr) {
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		chapter.setMember_idx(member_idx);
		service.modify(chapter);
		rttr.addAttribute("book_idx", sccri.getBook_idx());
		
		return "redirect:/storyRoom/chapter/list";
	}

	@RequestMapping(value="/storyRoom/chapter/chapterRemove", method = {RequestMethod.GET, RequestMethod.POST})
	public String chapterRemove(Model model, Authentication authentication,  StoryChapterCriteria sccri, Integer book_idx, Integer chapter_idx, RedirectAttributes rttr) {
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		
		BookChapterVO chapter = new BookChapterVO();
		chapter.setMember_idx(member_idx);
		chapter.setBook_idx(book_idx);
		chapter.setChapter_idx(chapter_idx);
		
		service.delete(chapter);
		rttr.addAttribute("book_idx", sccri.getBook_idx());
		
		return "redirect:/storyRoom/chapter/list";
	}

}
