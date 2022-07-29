package com.gyull.cookivel.domain.member;

import lombok.Data;
/**
 * 회원 코드분류
 * 회원권한 설정
 * 4자리(앞 2자리 @see MasterCodeVO)
 * @author mkht0
 *
 */
@Data
public class MemberCodeVO {
	
	private String member_idx; //not auto increment
	private String mem_codeNum;
	private String mem_codeName;

}
