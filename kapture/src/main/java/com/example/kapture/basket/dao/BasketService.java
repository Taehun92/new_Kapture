package com.example.kapture.basket.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.basket.mapper.BasketMapper;
import com.example.kapture.basket.model.Basket;

@Service
public class BasketService {
	
	@Autowired
	BasketMapper basketMapper;

	
	// 장바구니 추가
	public HashMap<String, Object> addBasket(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
	    
	    // 장바구니 중복 체크
	    int count = basketMapper.existsBasketItem(map);
	    
	    if (count > 0) {
	        // 이미 존재하면 중복 알림 처리
	        resultMap.put("result", "duplicate");
	    } else {
	        // 존재하지 않으면 삽입 진행
	        basketMapper.insertBasket(map);
	        resultMap.put("result", "success");
	    }
		return resultMap;
	}


	public HashMap<String, Object> getCount(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		int count = basketMapper.selectCount(map);
		
		resultMap.put("count", count);
		
		resultMap.put("result", "success");
		
		return resultMap;
	}


	public HashMap<String, Object> getBasket(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		int count = basketMapper.existsBasketItem(map);
		
		resultMap.put("count", count);
		
		resultMap.put("result", "success");
		
		return resultMap;
		
	}
	
	public HashMap<String, Object> getMinTourDate(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		Date minDate = basketMapper.selectMinTourDate(map);
		
		resultMap.put("minDate", minDate);
		
		resultMap.put("result", "success");
		
		return resultMap;
		
	}


	public HashMap<String, Object> getTourDateList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Date> dateList = basketMapper.selectTourDateList(map);
		
		
		resultMap.put("dateList", dateList);
		
		resultMap.put("result", "success");
		
		return resultMap;
	}


	public HashMap<String, Object> getMaxTourDate(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		Date maxDate = basketMapper.selectMaxTourDate(map);
		
		resultMap.put("maxDate", maxDate);
		
		resultMap.put("result", "success");
		
		return resultMap;
	}


	public HashMap<String, Object> getBasketList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Basket> basketList  = basketMapper.selectBasketList(map);
		
		resultMap.put("basketList", basketList);
		
		resultMap.put("result", "success");
		
		return resultMap;
	}


	public HashMap<String, Object> editBasket(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		basketMapper.updateBasket(map);
		resultMap.put("result", "success");
		return resultMap;
	}

}
