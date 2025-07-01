package com.example.kapture.common.model;

import lombok.Data;

@Data
public class Reviews {
	private int reviewNo;
	private int tourNo;
	private int userNo;
	private int rating;
	private String comment;
	private String rCreatedAt;
	private String rUpdatedAt;
	private String userFirstName;
	private String userLastName;
}
