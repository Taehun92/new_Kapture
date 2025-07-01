package com.example.kapture.common.model;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNo;
	private int targetUserNo;
	private int referenceId;
	private String referenceType;
	private String urlParam;
	private String alarmStatus;
	private String alCreatedAt;
}
