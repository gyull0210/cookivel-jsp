package com.gyull.cookivel.service.book;

import java.util.List;

import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.BookCriteria;

public interface BookService {
	
	public BookVO bookInfo(Integer book_idx);
	
	public int getFirstChapter(Integer book_idx);
	
	public int totalNoticeCount(BookCriteria bcri);
	
	public List<BookChapterVO> chapterNotice(Integer book_idx);
	
	public List<BookChapterVO> pagination(BookCriteria bcri);
	
	public int totalCount(BookCriteria bcri);

}
