package com.gyull.cookivel.mapper.freeseries;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.Criteria;

@Mapper
public interface FreeSeriesMapper {

	public List<BookVO> pagination(Criteria cri);

	public List<BookVO> finishedPagination(Criteria cri);
	
	public int totalCount(Criteria cri);
	
	public int finishedCount(Criteria cri);
	
	//test
	public List<BookVO> paging(Criteria cri);
	
	public int count(Criteria cri);
}
