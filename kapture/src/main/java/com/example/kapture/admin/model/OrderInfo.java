package com.example.kapture.admin.model;

import lombok.Data;

@Data
public class OrderInfo {
	private int paymentNo;
	private int userNo;
	private int amount;
	private int numPeople;
	private String paymentDate;
	private String paymentStatus;
	
	private int tourNo;
	private String tourDate;
	private String duration;
	private String title;
	
	private String userFirstName;
	private String userLastName;
	private String phone;
	private String email;
	private String isForeigner;
}
