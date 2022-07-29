package com.gyull.cookivel.mapper.book;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.BookCriteria;

@Mapper
public interface BookMapper {
	
	public BookVO bookInfo(Integer book_idx); //책 정보
	
	public int getFirstChapter(Integer book_idx); //첫 회차 보기
	
	public int totalNoticeCount(BookCriteria bcri); //공지사항 총 갯수
	
	public List<BookChapterVO> chapterNotice(Integer book_idx); //공지사항 리스트

	public List<BookChapterVO> pagination(BookCriteria bcri); //회차 페이지네이션
	
	public int totalCount(BookCriteria bcri); //총 회차
}
