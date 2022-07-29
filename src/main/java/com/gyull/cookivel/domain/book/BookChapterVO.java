package com.gyull.cookivel.domain.book;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.Data;
/**
 * 책 회차페이지
 * 회차 카테고리에 공지사항인지 연재글인지 체크
 * 회차마다 책제목과 회차제목 모두 표시
 * 회차별 조회수, 평가점수, 댓글 수 체크
 * @author mkht0
 *
 */
@Data
public class BookChapterVO {

	private int chapter_idx;
	private int member_idx;
	private int book_idx;
	@NotBlank(message = "책 제목은 비워둘 수 없습니다.")
	@Length(min = 2, max = 30, message = "제목은 2자 이상 30자 미만이어야 합니다.")
	private String book_title;
	@NotBlank(message = "회차 카테고리를 선택해주세요.")
	private String chapter_category;
	@NotBlank(message = "회차 제목은 비워둘 수 없습니다.")
	private String chapter_title;
	@NotBlank(message = "본문 내용은 비워둘 수 없습니다.")
	private String chapter_content;
	
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime chapter_regDate = LocalDateTime.now();
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime chapter_recentDate = LocalDateTime.now();
	private int chapter_views;
	private int chapter_rating;
	private int chapter_comments;
	
	private String chapter_isHidden;	
	
	//페이지 이전, 다음
	private int prev;
	private int next;
}
