package com.gyull.cookivel.mapper.storyroom;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.StoryCriteria;

@Mapper
public interface StoryRoomMapper {

	public List<BookVO> pagination(StoryCriteria scri); //작품 관리 작품 리스트 페이징
	
	public int totalCount(Integer member_idx); //내가 등록한 작품 총 갯수
	
	public void create(BookVO book); //내 작품 등록
	
	public BookVO read(BookVO book); //내 작품 정보 읽기
	
	public void modify(BookVO book); //내 작품 수정
	
	public void modifyCover(BookVO book); //내 작품 표지 수정
	
	public void delete(Integer book_idx); //내 작품 삭제
	
	public List<BookVO> getOldBookCover(); //DB에 없는 책표지 모두 삭제
	
	public int bookChapterUpdate(Integer book_idx); //회차 업데이트 전체
	
	public int bookChaptersUp(Integer book_idx); //회차 업데이트 +1
	
	public int bookChaptersDown(Integer book_idx); //회차 업데이트 -1
}
