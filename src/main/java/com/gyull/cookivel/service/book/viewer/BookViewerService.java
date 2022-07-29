package com.gyull.cookivel.service.book.viewer;

import java.util.List;

import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookHistoryVO;
import com.gyull.cookivel.domain.book.BookRatingVO;
import com.gyull.cookivel.domain.book.ChapterViewVO;

public interface BookViewerService {

	public BookChapterVO readChapter(BookChapterVO chapter); //읽기
	
	public List<BookChapterVO> chapterList(BookChapterVO chapter); //목록

	public int views(Integer chapter_idx); //조회 수 증가
	
	public void createViews(ChapterViewVO view); //조회 테이블에 데이터 추가
	
	public ChapterViewVO getViews(ChapterViewVO view); //조회 테이블에 데이터 조회
	
	public void updateRate(BookRatingVO rating); //챕터 별점 평균 업데이트
	
	public int totalRateCount(BookRatingVO rating); //챕터 별점 참여자 수
}
