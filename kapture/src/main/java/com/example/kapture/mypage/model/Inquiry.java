package com.example.kapture.mypage.model;

import lombok.Data;

@Data
public class Inquiry {
	
	private int inquiryNo;           // 문의 번호
	private int userNo;              // 사용자 번호
	private String category;         // 문의 카테고리
	private String question;         // 질문 내용
	private String answer;           // 답변 내용
	private String inqCreatedAt;       // 작성일
	private String inqUpdatedAt;       // 수정일
	private String qnaTitle;         // 문의 제목
	private String qnaStatus;        // 문의 처리 상태
	
}
