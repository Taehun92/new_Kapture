package com.example.kapture.board.model;

import lombok.Data;

@Data
public class Request {
	
	private int requestNo;
	private int userNo;
	private String title;
	private String description;
	private String region;
	private int budget;
	private String status;
	private String rqCreatedAt;
	private String rqUpdatedAt;
	private String userFirstName;
	private String userLastName;
	private String commentNo;
	private String message;
	private String parentCommentNo;
	private String currency;
	private String deleteYn;
}
