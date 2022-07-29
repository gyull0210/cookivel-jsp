package com.gyull.cookivel.service.freeseries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.Criteria;
import com.gyull.cookivel.mapper.freeseries.FreeSeriesMapper;

import lombok.Setter;

@Service
public class FreeSeriesServiceImpl implements FreeSeriesService {

	@Setter(onMethod_ = {@Autowired(required=true)})
	private FreeSeriesMapper mapper;
	
	@Override
	public List<BookVO> pagination(Criteria cri) {
		return mapper.pagination(cri);
	}

	@Override
	public List<BookVO> finishedPagination(Criteria cri){
		return mapper.finishedPagination(cri);
	}
	
	@Override
	public int totalCount(Criteria cri) {
		return mapper.totalCount(cri);
	}
	
	@Override
	public int finishedCount(Criteria cri) {
		return mapper.finishedCount(cri);
	}
	
	//test
	@Override
	public List<BookVO> paging(Criteria cri){
		return mapper.paging(cri);
	}
	
	@Override
	public int count(Criteria cri) {
		return mapper.count(cri);
	}

}
