package com.gyull.cookivel.mapper.home;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;

import com.gyull.cookivel.domain.member.MemberVO;

import lombok.extern.log4j.Log4j2;

@AutoConfigureTestDatabase(replace = Replace.NONE)
@MybatisTest
@Log4j2
class HomeMapperTest {

	@Autowired
	private HomeMapper mapper;
	
	@Test
	void test() {
		MemberVO vo = new MemberVO();
		
		vo.setMem_email("unknown1");
		vo.setMem_pw("pw1");
		vo.setMem_nickName("unknown1");
		vo.setMem_phoneNum("00000000001");

		mapper.create(vo);
		 
		log.info(vo);
	}
	
	@Test
	void test2() {
		log.info("2번째수행중");
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		list = mapper.list();
		
		log.info(list+"2번째 수행 끝");
	}
	
	@Test
	void test3() {
		
		MemberVO vo = mapper.getMember(100);
		
		log.info(vo);
	}

}
