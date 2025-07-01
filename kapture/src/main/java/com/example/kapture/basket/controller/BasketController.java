package com.example.kapture.basket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.kapture.basket.dao.BasketService;
import com.google.gson.Gson;

@Controller
public class BasketController {
	
	@Autowired
	BasketService basketService;
	
	// 장바구니 추가
	@RequestMapping(value = "/basket/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = basketService.addBasket(map);
		return new Gson().toJson(resultMap);
	}
	// 장바구니 담았는 지 여부 체크
	@RequestMapping(value = "/basket/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = basketService.getBasket(map);
		return new Gson().toJson(resultMap);
	}
	
	// 장바구니 담은 갯수 구하기
	@RequestMapping(value = "/basket/getCount.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getCount(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = basketService.getCount(map);
		return new Gson().toJson(resultMap);
	}
	
	// 최소 날짜 구하기
	@RequestMapping(value = "/basket/getMinTourDate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getMinTourDate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = basketService.getMinTourDate(map);
		return new Gson().toJson(resultMap);
	}
	
	// 최대 날짜 구하기
	@RequestMapping(value = "/basket/getMaxTourDate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getMaxTourDate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = basketService.getMaxTourDate(map);
		return new Gson().toJson(resultMap);
	}
	
	// 장바구니에 담은 날짜 리스트 출력
	@RequestMapping(value = "/basket/getTourDateList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getTourDateList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = basketService.getTourDateList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 장바구니에 담은 아이템 가져오기
	@RequestMapping(value = "/basket/getBasketList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getBasket(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = basketService.getBasketList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 장바구니 업데이트
	@RequestMapping(value = "/basket/update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBasket(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = basketService.editBasket(map);
		
		return new Gson().toJson(resultMap);
	}
	
	// 장바구니 다중 업데이트
	@RequestMapping(value = "/basket/updateList.dox", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateBasketList(@RequestBody HashMap<String, List<HashMap<String, Object>>> param) {
	    List<HashMap<String, Object>> cartList = param.get("cartList");
	    for (HashMap<String, Object> map : cartList) {
	        basketService.editBasket(map);  // 기존 updateCount 재활용
	        System.out.println(map);
	    }

	    HashMap<String, Object> result = new HashMap<>();
	    result.put("result", "success");
	    return result;
	}
	
}
