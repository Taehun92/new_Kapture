package com.example.kapture.main.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.main.mapper.MainMapper;
import com.example.kapture.main.model.Main;
import com.example.kapture.tours.model.Tours;

@Service
public class MainService {

	@Autowired
	MainMapper mainMapper;
	
	// 메인화면 상품 조회
	public HashMap<String, Object> getTourandRatingList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Tours> tourandRatingList = mainMapper.selectTourandRatingList(map);
			resultMap.put("result", "success");
			resultMap.put("list", tourandRatingList);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> getReviewList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Main> reviewList = mainMapper.selectReviewList(map);
		resultMap.put("reviewList", reviewList);
		return resultMap;
	}
	
	
}
