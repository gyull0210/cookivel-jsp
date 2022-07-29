package com.gyull.cookivel.domain.review;

import java.time.LocalDateTime;

import lombok.Data;
/**
 * 추후 수정
 * @author mkht0
 *
 */
@Data
public class ReviewCommentVO {

	private int reviewComment_idx; //auto increment
	private int member_idx;
	private int rc_ref; // 대댓글일 경우 참조 : 부모글 번호 참조 0 또는 1
	private int rc_step; // 댓글 들여쓰기 레벨 0 또는 1
	private String rc_comment;
	private String rc_ip;
	private LocalDateTime rc_regDate;
	private LocalDateTime rc_recentDate;
}
