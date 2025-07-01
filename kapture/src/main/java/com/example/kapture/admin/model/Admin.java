package com.example.kapture.admin.model;

import lombok.Data;

@Data
public class Admin {
	
	private int paymentNo;
	private int userNo;
	private int tourNo;
	private int amount;
	private String paymentDate;
	private String paymentStatus;
	private String method;
	private String merchantId;
	private int numPeople;
	private int basketNo;
	private String etc;
	private int reviewNo;
	private int rating;
	private String comment;
	private String rCreatedAt;
	private String rUpdateAt;
	private String reply;
	private int guideNo;
	private String title;
	private int maxPeople;
	private String email;
	private String userFirstName;
	private String userLastName;
	
}
