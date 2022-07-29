package com.gyull.cookivel.mapper.bookshelf;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.book.BookHistoryVO;
import com.gyull.cookivel.domain.book.BookSubscribeVO;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.StoryCriteria;

@Mapper
public interface BookShelfMapper {
	
	public List<BookVO> getSubscribeListPaging(StoryCriteria scri); //구독 페이징
	
	public int totalSubscribeCount(StoryCriteria scri); //구독 총 갯수
	
	public int readSubscribe(BookSubscribeVO subscribe); //구독 유무 확인
	
	public void insertSubscribe(BookSubscribeVO subscribe); //구독 추가
	
	public void deleteSubscribe(BookSubscribeVO subscribe); //구독 취소
	
	public List<BookVO> getHistoryListPaging(StoryCriteria scri); //최근에 읽은 작품 페이징
	
	public int totalHistory(StoryCriteria scri); //최근에 읽은 작품 갯수
	
	public int readHistory(BookHistoryVO history); //최근에 읽은 작품 유무 확인
	
	public void insertHistory(BookHistoryVO history); //최근에 읽은 작품 추가
	
	public void updateHistory(BookHistoryVO history); //최근에 읽은 작품 회차 업데이트
	
	public void deleteHistory(BookHistoryVO history); //최근에 읽은 작품 목록에서 삭제

}
