package com.gyull.cookivel.domain.book;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.Data;
/**
 * 회차 별점
 * 
 * @author mkht0
 *
 */
@Data
public class BookRatingVO {
	
	private int bookRating_idx;
	private int member_idx;
	private int book_idx;
	private int chapter_idx;
	private int chapter_rate;
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime br_regDate = LocalDateTime.now();
}
