package com.gyull.cookivel.domain.member;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import lombok.Data;
/**
 * 회원정보
 * 회원프로필사진 별도 @see MemberImageVO
 * 회원권한코드 별도 @see MemberCodeVO
 * 회원 간편로그인 별도 
 * 회원 계정상태 및 사용 유무 있음
 * @author mkht0
 *
 */

@Data
public class MemberVO {
	//회원 정보
//	@NotEmpty
	private int member_idx;
//	@NotBlank(message="닉네임은 비워둘 수 없습니다.")
	private String mem_nickName;
//	@NotBlank(message="이메일은 비워둘 수 없습니다.")
//	@Email(message="이메일의 형식에 맞지 않습니다.")
	private String mem_email;
//	@NotBlank
//	@Length(min = 10, max = 50)
//	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{10,50}",
//           message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 10자 ~ 50자의 비밀번호여야 합니다.")
	private String mem_pw;
//	@NotBlank(message = "핸드폰 번호는 비워둘 수 없습니다.")
//	@Pattern(regexp = "/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/",
//			message = "핸드폰 번호 형식에 맞지 않습니다.") 
//	@Length(min = 10, max = 11)
	private String mem_phoneNum;
	private String mem_name;
	private String mem_about;
	private String mem_address;
	private String mem_authority;
	private int mem_point;
	private int mem_money;
	private String mem_ip;
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime mem_regDate;
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime mem_recentDate;
	private String mem_isUsed; //활성계정인지 휴면계정인지
	private String mem_isQuit; //탈퇴회원인지 아닌지
	
	
	//회원 권한
	private List<MemberCodeVO> authList;
	
	//회원 프로필 사진
	private List<MemberImageVO> profileList;
	
	//회원 간편 로그인
}