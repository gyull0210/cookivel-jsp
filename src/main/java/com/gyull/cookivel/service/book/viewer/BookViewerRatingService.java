package com.gyull.cookivel.service.book.viewer;

import com.gyull.cookivel.domain.book.BookRatingVO;

public interface BookViewerRatingService {

	public void rating(BookRatingVO rating); //별점 등록
	
	public BookRatingVO readRating(BookRatingVO rating); //별점 읽기
	
	public void modifyRating(BookRatingVO rating); //별점 수정
}
