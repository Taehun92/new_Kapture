package com.example.kapture.common.model;

import lombok.Data;

@Data
public class Theme {
	private int themeNo;
	private String themeName;
	private int themeParentNo;
	private String parentName;
}
