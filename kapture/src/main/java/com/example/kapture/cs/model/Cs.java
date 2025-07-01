package com.example.kapture.cs.model;

import lombok.Data;

@Data
public class Cs {
	
	private int inquiryNo;
	private int userNo;
	private String category;
	private String question;
	private String answer;
	private String inqCreatedAt;
	private String inqUpdatedAt;
	private String qnaTitle;
	private String qnaStatus;
	private int noticeNo;
	private String title;
	private String content;
	private String nCreatedAt;
	private String nUpdatedAt;
	private int faqNo;
	
	private String phone;
	private String userFirstName;
	private String userLastName;
	private String email;
}
