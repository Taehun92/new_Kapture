package com.example.kapture.tours.model;

import lombok.Data;

@Data
public class Tours { 
	//기본적으로 카멜 표기법, "_" 언더바가 있을 경우 언더바 생략 후 카멜표기법으로!!
	private int tourNo;
	private int guideNo;
	private String title;
	private String description;
	private String duration;
	private int price;
	private int maxPeople;
	private String tourDate;
	private String tCreatedAt;
	private String tUpdatedAt;
	private String deleteYN;
	private int siNo;
	private int guNo;
	private int themeNo;
	
	private String themeName;
	private int themeParentNo;
	
	
	private String siName;
	private String guName;
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private String fileOrgName;
	private String fileType;
	private String fileSize;
	private String fileExtension;
	private String iUploadDate;
	private String thumbNail;
	
	
	private int userNo;
	private String language;
	private String experience;
	private String profileImage;
	private String vehicle;
	
	private String pFilePath;
	private String userFirstName;
	private String gender;
	private String rating;
	
	private String comment;
	
	
	
}
