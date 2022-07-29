package com.gyull.cookivel.domain.book;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.Data;
/**
 * 책 댓글
 * 좋아요만 가능
 * 수정/삭제 가능
 * @author mkht0
 *
 */
@Data
public class BookCommentVO {

	private int bc_idx;
	private int member_idx;
	private int book_idx;
	private int chapter_idx;
	private String mem_nickName;
	private String bc_comment;
	private int bc_likes;
	private int bc_nestedCount;

	private int bc_parent;
	private int bc_depth;
	private int bc_seq;
	private int bc_group;
	
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime bc_regDate;
	
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime bc_regGroup;
	
	private String mem_imgThumbUrl;
	
}
