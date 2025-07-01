package com.example.kapture.login.model;

import lombok.Data;

@Data
public class Login {
	private int userNo;
	private String password;
	private String email;
	private String phone;
	private String role;
	private String birthday;
	private String address;
	private String gender;
	private String uCreatedAt;
	private String uUpdatedAt;
	private String userFirstName; 
	private String userLastName;
	private String socialType;
	private String isForeigner;
	private String pushYN;
	private String unregisterYN;
	
	private String lastLogin;
	
	private int paymentNo;
	private int tourNo;
	private String paymentStatus;
	
	private String tourDate;
	
	private int alarmNo;
	private int targetUserNo;
	private int referenceId;
	private String referenceType;
	private String urlParam;
	private String alarmStatus;
	private String alCreatedAt;
	
}	