package com.gyull.cookivel.mapper.storyroom.chapter;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.StoryChapterCriteria;

@Mapper
public interface StoryChapterMapper {
	
	public BookVO bookInfo(Integer book_idx); //회차 관리 선택 작품 정보

	public List<BookChapterVO> pagination(StoryChapterCriteria sccri); //회차 관리 회차 리스트 페이징
	
	public List<BookChapterVO> noticePagination(StoryChapterCriteria sccri); //공지사항 리스트 페이징
	
	public int totalCount(StoryChapterCriteria sccri); //내가 등록한 회차 총 갯수
	
	public int totalNoticeCount(StoryChapterCriteria sccri); //내가 등록한 공지사항 총 갯수
	
	public void create(BookChapterVO chapter); //내 회차 등록
	
	public BookChapterVO read(BookChapterVO chapter); //내 회차 정보 읽기
	
	public void modify(BookChapterVO chapter); //내 회차 수정
	
	public void delete(BookChapterVO chapter); //내 회차 삭제
	
}
