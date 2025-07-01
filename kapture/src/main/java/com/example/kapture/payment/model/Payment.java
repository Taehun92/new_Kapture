package com.example.kapture.payment.model;

import lombok.Data;

@Data
public class Payment {

	private int paymentNo;  
	private int userNo; 
	private int tourNo; 
	private int amount; 
	private String paymentDate; 
	private String paymentStatus; 
	private String method;
	private String merchantId;
	private int basketNo;
	private int numPeople;
	
	private String title;       // 상품명
	private int price;          // 상품 가격
	private String duration;    // 여행 일정
	private int maxPeople;      // 최대 인원
	private String tourDate;    // 출발 날짜
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private String fileOrgName;
	private String tgumbnail;
	
}
