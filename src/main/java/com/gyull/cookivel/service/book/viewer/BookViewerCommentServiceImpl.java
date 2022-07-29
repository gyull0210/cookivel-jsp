package com.gyull.cookivel.service.book.viewer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.mapper.book.viewer.BookViewerCommentMapper;
import com.gyull.cookivel.domain.book.BookCommentVO;
import com.gyull.cookivel.domain.pagination.ChapterCommentCriteria;

import lombok.Setter;

@Service
public class BookViewerCommentServiceImpl implements BookViewerCommentService {

	@Setter(onMethod_ = {@Autowired})
	private BookViewerCommentMapper mapper;
	
	@Override
	public List<BookCommentVO> getCommentListByPaging(ChapterCommentCriteria cccri, Integer book_idx, Integer chapter_idx) {
		return mapper.getCommentListByPaging(cccri, book_idx, chapter_idx);
	}
	
	@Override
	public int totalCommentCount(BookCommentVO comment) {
		return mapper.totalCommentCount(comment);
	}

	@Override
	public int create(BookCommentVO comment) {
		return mapper.insert(comment);
	}

	@Override
	public BookCommentVO read(BookCommentVO comment) {
		return mapper.read(comment);
	}

	@Override
	public int remove(BookCommentVO comment) {
		return mapper.delete(comment);
	}

	@Override
	public int like(BookCommentVO comment) {
		return mapper.like(comment);
	}

	@Override
	public int deleteLike(BookCommentVO comment) {
		return mapper.deleteLike(comment);
	}

}
