package com.gyull.cookivel.service.book.viewer;

import java.util.List;

import com.gyull.cookivel.domain.book.BookCommentVO;
import com.gyull.cookivel.domain.pagination.BookCommentCriteria;
import com.gyull.cookivel.domain.pagination.ChapterCommentCriteria;

public interface BookViewerCommentService {

	public List<BookCommentVO> getCommentListByPaging(ChapterCommentCriteria cccri, Integer book_idx, Integer chapter_idx); //댓글 목록
	
	public int totalCommentCount(BookCommentVO comment); //댓글 수
	
	public int create(BookCommentVO comment); //댓글 등록
	
	public BookCommentVO read(BookCommentVO comment); //댓글 읽기
	
	public int remove(BookCommentVO comment); //댓글 삭제
	
	public int like(BookCommentVO comment); //댓글 추천
	
	public int deleteLike(BookCommentVO comment); //댓글 추천 취소


}
