package com.example.kapture.board.model;

import lombok.Data;

@Data
public class Comment {
	
	private int requestNo;
	private int userNo;
	private String commentNo;
	private String message;
	private String userFirstName;
	private String userLastName;
	private String parentCommentNo;
	private String deleteYn;
	
	
}
