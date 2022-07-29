package com.gyull.cookivel.mapper.freeseries;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;

import com.gyull.cookivel.domain.pagination.Criteria;

import lombok.extern.log4j.Log4j2;

@AutoConfigureTestDatabase(replace = Replace.NONE)
@MybatisTest
@Log4j2
class FreeSeriesMapperTest {

	@Autowired
	FreeSeriesMapper mapper;
	
	@Test
	void test() {
		Criteria cri = new Criteria();
		
		mapper.totalCount(cri);
	}
	
	@Test
	void test2() {
		Criteria cri = new Criteria();
		
		mapper.pagination(cri);
	}

}
