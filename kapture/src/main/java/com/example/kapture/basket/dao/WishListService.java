package com.example.kapture.basket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.basket.mapper.WishListMapper;
import com.example.kapture.basket.model.WishList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class WishListService {
	
	@Autowired
	WishListMapper wishListMapper;

	
	// 찜 목록 조회
	public HashMap<String, Object> getWishList(HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<>();
	    //DB에서 찜 목록 조회
	    try {
	    	if (map.get("userNo") == ""  || map.get("userNo").toString().isEmpty()) {
	    	    // DB 쿼리 실행하지 않도록
	    		
	    	    resultMap.put("result", "no-login");
	    	    return resultMap;
	    	}
	    	else {
	    		List<WishList> list = wishListMapper.selectWishList(map);
			    resultMap.put("list", list);
			    resultMap.put("result", "success");
	    	}
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("result", "fail");
        }
        return resultMap; 
	}

	// 찜 목록 추가
	public HashMap<String, Object> addWishList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
        try {
            int num = wishListMapper.insertWishList(map);
            resultMap.put("result", "success");
            resultMap.put("num", num);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("result", "fail");
        }
        return resultMap;
	}

	// 찜 목록 삭제
	public HashMap<String, Object> removeWishList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
        try {
        	int num = wishListMapper.deleteWishList(map);
            resultMap.put("result", "success");
            resultMap.put("num", num);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("result", "fail");
        }
        return resultMap;
	}

}
