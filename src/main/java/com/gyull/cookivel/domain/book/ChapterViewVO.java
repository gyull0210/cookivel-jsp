package com.gyull.cookivel.domain.book;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.Data;
/**
 * 회차 조회용 VO
 * 회원일 경우 member_idx
 * 비회원일 경우에는 ip를 기준으로 중복체크를 한다
 * 
 * @author mkht0
 *
 */
@Data
public class ChapterViewVO {

	private int member_idx;
	private int book_idx;
	private int chapter_idx;
	private String ip;
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime view_regDate;
}
