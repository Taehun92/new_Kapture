package com.example.kapture.tours.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.common.mapper.CommonMapper;
import com.example.kapture.common.model.Region;
import com.example.kapture.common.model.Reviews;
import com.example.kapture.common.model.Theme;
import com.example.kapture.tours.mapper.ToursMapper;
import com.example.kapture.tours.model.Tours;

@Service
public class ToursService {
	// get, select
	// add, insert
	// edit, update
	// remove, delete
	
	@Autowired
	ToursMapper toursMapper;
	
	@Autowired
	CommonMapper commonMapper;

	public HashMap<String, Object> getToursList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			
			List<Tours> toursList = toursMapper.selectToursList(map); // 조건에 맞는 상품 목록 조회 
			List<Region> regionList = commonMapper.selectRegionList(map); // 상품 검색을 위한 지역별 이름 목록
			List<Theme> themeList = commonMapper.selectThemeList(map); // 상품 검색을 위한 테마별 이름 목록
			int count = toursMapper.selectCntTours(map);
			resultMap.put("count", count);
			resultMap.put("result", "success");
			resultMap.put("toursList", toursList);
			resultMap.put("regionList", regionList);
			resultMap.put("themeList", themeList);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	public HashMap<String, Object> getAll(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Tours> toursList = toursMapper.selectAll(map);
			resultMap.put("result", "success");
			resultMap.put("toursList", toursList);
			
		} catch (Exception e) {
      System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 삼품 상세정보 불러오기(+ 해당 상품 리뷰) 
	public HashMap<String, Object> getTourInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {			
			
			Tours tourInfo = toursMapper.selectTourInfo(map); // 해당 상품에 대한 정보
			String result = "success";
			List<Reviews> reviewsList = commonMapper.selectReviewsList(map); // 해당 상품에대한 리뷰 목록
			System.out.println(reviewsList);
			resultMap.put("reviewsList", reviewsList);
			resultMap.put("tourInfo", tourInfo);
			resultMap.put("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	public HashMap<String, Object> removeTour(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = toursMapper.deleteTour(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
			
		} catch (Exception e) {
      System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	public HashMap<String, Object> toggleTourDeleteYn(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = toursMapper.toggleTourDeleteYn(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
			
		} catch (Exception e) {
      System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	public HashMap<String, Object> saveResaleTour(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = toursMapper.insertResaleTour(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
			
		} catch (Exception e) {
      System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	
}