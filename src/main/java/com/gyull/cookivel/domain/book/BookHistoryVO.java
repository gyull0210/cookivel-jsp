package com.gyull.cookivel.domain.book;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.Data;
/**
 * 최근 본 작품 VO
 * 
 * 
 * @author mkht0
 *
 */
@Data
public class BookHistoryVO {
	
	private int recent_idx;
	private int member_idx;
	private int book_idx;
	private int chapter_idx;
	private String chapter_title;
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime recent_regDate = LocalDateTime.now();
	
	private String book_title;
	private String book_writer;
	private String book_genre;
	private String book_writeType;
	private int book_chapters; //총 회차 수
	private String book_intro;

	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime book_regDate = LocalDateTime.now();
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime book_recentDate = LocalDateTime.now();
	private String book_state;
	private String book_isHidden;

	//책 조회수, 별점, 댓글 수
	private int book_views;
	private int book_rating;
	private int book_comments;
	
	//책 표지 이미지
	private String book_imgName;
	private String book_imgUrl;
	private String book_imgThumbUrl;
	private String book_imgUuid;
}
