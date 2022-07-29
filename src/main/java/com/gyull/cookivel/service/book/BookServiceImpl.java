package com.gyull.cookivel.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.BookCriteria;
import com.gyull.cookivel.mapper.book.BookMapper;

import lombok.Setter;

@Service
public class BookServiceImpl implements BookService {

	@Setter(onMethod_ = {@Autowired})
	private BookMapper mapper;
	
	@Override
	public BookVO bookInfo(Integer book_idx) {
		return mapper.bookInfo(book_idx);
	}
	
	@Override
	public int getFirstChapter(Integer book_idx) {
		return mapper.getFirstChapter(book_idx);
	}
	
	@Override
	public int totalNoticeCount(BookCriteria bcri) {
		return mapper.totalNoticeCount(bcri);
	}
	
	@Override
	public List<BookChapterVO> chapterNotice(Integer book_idx) {
		return mapper.chapterNotice(book_idx);
	}
	
	@Override
	public List<BookChapterVO> pagination(BookCriteria bcri) {
		return mapper.pagination(bcri);
	}

	@Override
	public int totalCount(BookCriteria bcri) {
		return mapper.totalCount(bcri);
	}

}
