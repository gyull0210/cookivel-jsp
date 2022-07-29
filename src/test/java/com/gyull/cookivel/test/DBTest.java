package com.gyull.cookivel.test;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@SpringBootTest
//Java설정을 이용하는 경우
//@ContextConfiguration(classes= {RootConfig.class})
@Log4j2
public class DBTest {

	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
		
	@Setter(onMethod_ = {@Autowired})
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testmyBatis() {
		
		try(SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection();
		) {
			log.info(session);
			log.info(con);
		} catch(Exception e) {
			log.error(e.getMessage());
		}
	}

}
