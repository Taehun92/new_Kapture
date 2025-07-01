package com.example.kapture.admin.model;

import lombok.Data;

@Data
public class Partnership {
	private int partnershipNo;
	private String title;
	private String content;
	private String name;
	private String email;
	private String phone;
	private String psStatus;
	private String psCreatedAt;
	private String psUpdatedAt;
	private int psUserNo;
}
