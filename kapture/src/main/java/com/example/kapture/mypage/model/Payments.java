package com.example.kapture.mypage.model;

import lombok.Data;

@Data
public class Payments {
	private int paymentNo;
	private int userNo;
	private int tourNo;
	private int amount;
	private String paymentDate;
	private String paymentStatus;
	private String method;
	private String title;
	private String duration;
	private String tourDate;
	private String userFirstName;
	private String userLastName;
	private String comment;
	private String rCreatedAt;
	private String rUpdatedAt;
	private int reviewNo;
	private int rating;
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private String fileOrgName;
	private String tgumbnail;
}
