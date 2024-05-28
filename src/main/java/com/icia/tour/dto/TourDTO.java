package com.icia.tour.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourDTO {
	private String mId; //아이디
	private String mPw; //패스워드
	private String mName; //이름
	private String mBirth; //생년월일
	private String mGender; //성별
	private String mEmail; //이메일
	private String mPhone; //연락처
	private String mAddr;	// (우편번호)일반주소, 상세주소
 	private String mProfileName;
 	
 	private String addr1; // 우편번호
 	private String addr2; // 일반주소
 	private String addr3; // 상세주소	
 	private MultipartFile mProfile;	// 업로드 파일
 
 	 	
}