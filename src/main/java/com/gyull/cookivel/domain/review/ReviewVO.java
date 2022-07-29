package com.gyull.cookivel.domain.review;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReviewVO {

	private int review_idx;
	private int member_idx;
	private String review_title;
	private String review_writer;
	private String review_content;
	private String review_ip;
	private LocalDateTime review_regDate;
	private LocalDateTime review_recentDate;
	private int review_views;
	private int review_like;
}
