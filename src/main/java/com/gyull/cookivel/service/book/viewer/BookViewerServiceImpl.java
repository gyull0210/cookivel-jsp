package com.gyull.cookivel.service.book.viewer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.mapper.book.viewer.BookViewerMapper;
import com.gyull.cookivel.domain.book.BookChapterVO;
import com.gyull.cookivel.domain.book.BookRatingVO;
import com.gyull.cookivel.domain.book.ChapterViewVO;

import lombok.Setter;

@Service
public class BookViewerServiceImpl implements BookViewerService {

	@Setter(onMethod_ = {@Autowired})
	private BookViewerMapper mapper;
	
	@Override
	public BookChapterVO readChapter(BookChapterVO chapter) {
		return mapper.readChapter(chapter);
	}
	
	@Override
	public List<BookChapterVO> chapterList(BookChapterVO chapter){
		return mapper.chapterList(chapter);
	}

	@Override
	public int views(Integer chapter_idx) {
		return mapper.views(chapter_idx);
	}
	
	@Override
	public void createViews(ChapterViewVO view) {
		mapper.insertViews(view);
	}
	
	@Override
	public ChapterViewVO getViews(ChapterViewVO view) {
		return mapper.getViews(view);
	}
	
	@Override
	public void updateRate(BookRatingVO rating) {
		mapper.updateRate(rating);
	}
	
	@Override
	public int totalRateCount(BookRatingVO rating) {
		return mapper.totalRateCount(rating);
	}
}
