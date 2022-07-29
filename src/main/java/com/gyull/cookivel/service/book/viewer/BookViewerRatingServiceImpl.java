package com.gyull.cookivel.service.book.viewer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.mapper.book.viewer.BookViewerMapper;
import com.gyull.cookivel.mapper.book.viewer.BookViewerRatingMapper;
import com.gyull.cookivel.domain.book.BookRatingVO;

import lombok.Setter;

@Service
public class BookViewerRatingServiceImpl implements BookViewerRatingService {

	@Setter(onMethod_ = {@Autowired})
	private BookViewerRatingMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private BookViewerMapper viewerMapper;
	
	@Override
	public void rating(BookRatingVO rating) {
		mapper.rating(rating);
	
	}

	@Override
	public BookRatingVO readRating(BookRatingVO rating) {
		return mapper.readRating(rating);
	}

	@Override
	public void modifyRating(BookRatingVO rating) {
		mapper.updateRating(rating);
		//챕터 별점 업데이트
		//책 별점 업데이트
	}

}
