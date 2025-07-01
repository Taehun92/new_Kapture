package com.example.kapture.basket.model;

import lombok.Data;

@Data
public class Basket {
	
	private String basketNo;
	private String tourNo;
	private String userNo;
	private String status;
	
	private String title;
	private String duration;
	private String numPeople;
	private String price;
	private String tourDate;

}
