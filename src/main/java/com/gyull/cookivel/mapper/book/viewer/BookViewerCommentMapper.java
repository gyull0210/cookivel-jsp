package com.gyull.cookivel.mapper.book.viewer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gyull.cookivel.domain.book.BookCommentVO;
import com.gyull.cookivel.domain.pagination.ChapterCommentCriteria;

@Mapper
public interface BookViewerCommentMapper {
	
	public List<BookCommentVO> getCommentListByPaging(@Param("cccri") ChapterCommentCriteria cccri, @Param("book_idx") Integer book_idx,@Param("chapter_idx") Integer chapter_idx); //댓글 목록
	
	public int totalCommentCount(BookCommentVO comment); //댓글 수
	
	public int insert(BookCommentVO comment); //댓글 등록
	
	public BookCommentVO read(BookCommentVO comment); //댓글 읽기
	
	public int delete(BookCommentVO comment); //댓글 삭제
	
	public int totalLikeCount(BookCommentVO comment); //추천 수
	
	public int like(BookCommentVO comment); //댓글 추천
	
	public int deleteLike(BookCommentVO comment); //댓글 추천 취소
}
