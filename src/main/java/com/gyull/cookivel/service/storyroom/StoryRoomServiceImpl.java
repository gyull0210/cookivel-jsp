package com.gyull.cookivel.service.storyroom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.mapper.storyroom.StoryRoomMapper;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.StoryCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class StoryRoomServiceImpl implements StoryRoomService {

	@Setter(onMethod_ = {@Autowired})
	private StoryRoomMapper mapper;
	
	@Override
	public List<BookVO> pagination(StoryCriteria scri) {
		return mapper.pagination(scri);
	}

	@Override
	public int totalCount(Integer member_idx) {
		return mapper.totalCount(member_idx);
	}

	@Override
	public void create(BookVO book) {
		mapper.create(book);

	}

	@Override
	public BookVO read(BookVO book) {
		return mapper.read(book);
	}

	@Override
	public void modify(BookVO book) {
		mapper.modify(book);
	}

	@Override
	public void modifyCover(BookVO book) {
		mapper.modifyCover(book);

	}

	@Override
	public void delete(Integer book_idx) {
		mapper.delete(book_idx);

	}

	@Override
	public List<BookVO> getOldBookCover() {
		return mapper.getOldBookCover();
	}

	@Override
	public int bookChapterUpdate(Integer book_idx) {
		return mapper.bookChapterUpdate(book_idx);
	}

	@Override
	public int bookChaptersUp(Integer book_idx) {
		return mapper.bookChaptersUp(book_idx);
	}

	@Override
	public int bookChaptersDown(Integer book_idx) {
		return mapper.bookChaptersDown(book_idx);
	}

}
