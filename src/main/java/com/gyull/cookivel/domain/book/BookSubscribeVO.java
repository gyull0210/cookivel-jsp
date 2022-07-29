package com.gyull.cookivel.domain.book;

import lombok.Data;
/**
 * 작품 구독 VO
 * 책 테이블과 INNER JOIN하여 리스트를 보여줌
 * 
 * @author mkht0
 *
 */
@Data
public class BookSubscribeVO {

	private int subscribe_idx;
	private int member_idx;
	private int book_idx;

}
