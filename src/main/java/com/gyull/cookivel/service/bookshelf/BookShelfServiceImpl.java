package com.gyull.cookivel.service.bookshelf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.domain.book.BookHistoryVO;
import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.StoryCriteria;
import com.gyull.cookivel.mapper.bookshelf.BookShelfMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BookShelfServiceImpl implements BookshelfService {

	@Setter(onMethod_ = {@Autowired})
	private BookShelfMapper mapper;
	
	@Override
	public List<BookVO> getSubscribeListPaging(StoryCriteria scri) {
		return mapper.getSubscribeListPaging(scri);
	}
	
	@Override
	public int totalSubscribeCount(StoryCriteria scri) {
		return mapper.totalSubscribeCount(scri);
	}

	@Override
	public int readSubscribe(BookSubscribeVO subscribe) {
		return mapper.readSubscribe(subscribe);
	}

	@Override
	public void createSubscribe(BookSubscribeVO subscribe) {
		mapper.insertSubscribe(subscribe);
	}

	@Override
	public void removeSubscribe(BookSubscribeVO subscribe) {
		mapper.deleteSubscribe(subscribe);
	}
	
	@Override
	public List<BookVO> getHistoryListPaging(StoryCriteria scri){
		return mapper.getHistoryListPaging(scri);
	}
	
	@Override
	public int totalHistory(StoryCriteria scri) {
		return mapper.totalHistory(scri);
	}
	
	@Override
	public int readHistory(BookHistoryVO history) {
		return mapper.readHistory(history);
	}
	
	@Override
	public void createHistory(BookHistoryVO history){
		mapper.insertHistory(history);
	}
	
	@Override
	public void updateHistory(BookHistoryVO history) {
		mapper.updateHistory(history);
	}
	
	@Override
	public void removeHistory(BookHistoryVO history) {
		mapper.deleteHistory(history);
	}

}
