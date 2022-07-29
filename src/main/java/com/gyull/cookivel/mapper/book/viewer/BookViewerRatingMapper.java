package com.gyull.cookivel.mapper.book.viewer;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.book.BookRatingVO;

@Mapper
public interface BookViewerRatingMapper {
	
	public void rating(BookRatingVO rating); //별점 등록
	
	public BookRatingVO readRating(BookRatingVO rating); //별점 읽기
	
	public void updateRating(BookRatingVO rating); //별점 수정
}
