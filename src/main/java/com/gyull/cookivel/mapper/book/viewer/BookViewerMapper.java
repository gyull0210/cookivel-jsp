package com.gyull.cookivel.mapper.book.viewer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookHistoryVO;
import com.gyull.cookivel.domain.book.BookRatingVO;
import com.gyull.cookivel.domain.book.ChapterViewVO;
import com.gyull.cookivel.domain.book.BookHistoryVO;
/**
 * 주의!
 * BookViewer는 조회 시에 최근 읽은 회차를 추가한다
 * BookShelf는 조회 시에 최근 읽은 작품을 등록한다
 * 
 * @author mkht0
 *
 */
@Mapper
public interface BookViewerMapper {
	
	public BookChapterVO readChapter(BookChapterVO chapter); //읽기
	
	public List<BookChapterVO> chapterList(BookChapterVO chapter); //목록

	public int views(Integer chapter_idx); //조회 수 증가
	
	public void insertViews(ChapterViewVO view); //조회 테이블에 데이터 추가
	
	public ChapterViewVO getViews(ChapterViewVO view); //조회 테이블에 데이터 조회
	
	public void updateRate(BookRatingVO rating); //챕터 별점 평균 업데이트
	
	public int totalRateCount(BookRatingVO rating); //챕터 별점 참여자 수

}
