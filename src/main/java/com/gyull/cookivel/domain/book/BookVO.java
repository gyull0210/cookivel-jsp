package com.gyull.cookivel.domain.book;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.gyull.cookivel.domain.book.BookVO;

import lombok.Data;
/**
 * 책
 * 
 * 책 회차수, 책 조회수, 책 별점, 책 댓글 수는 @see BookChapterVO 의 합계
 * @author mkht0
 *
 */
@Data
public class BookVO {

	private int book_idx;
	private int member_idx;

//	@NotBlank(message = "책 제목은 비워둘 수 없습니다.")
//	@Length(min = 2, max = 30, message = "제목은 2자 이상 30자 미만이어야 합니다.")
	private String book_title;
//	@NotBlank(message = "작가명은 비워둘 수 없습니다.")
	private String book_writer;
//	@NotBlank(message = "장르를 선택해주세요.")
	private String book_genre;
//	@NotBlank(message = "연재 종류를 선택해주세요.")
	private String book_writeType;
	private int book_chapters; //총 회차 수
//	@NotBlank(message = "책 소개는 비워둘 수 없습니다.")
//	@Length(min = 1, max = 21844)
	private String book_intro;

	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime book_regDate;
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime book_recentDate;
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