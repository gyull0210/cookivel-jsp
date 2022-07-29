package com.gyull.cookivel.domain.member;

import java.time.LocalDateTime;

import lombok.Data;
/**
 * 회원 프로필 이미지
 * @author mkht0
 *
 */
@Data
public class MemberImageVO {

	private int member_idx; //not auto increment
	private String mem_imgName;
	private String mem_imgUrl;
	private String mem_imgThumbUrl;
	private String mem_imgUuid;
	private String mem_imgType;
	private LocalDateTime mem_imgRegDate;
	private LocalDateTime mem_imgRecentDate;
}
