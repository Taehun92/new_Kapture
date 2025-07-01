package com.example.kapture.basket.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.kapture.basket.dao.WishListService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class WishListController {
	
	@Autowired
	WishListService wishListService;
	
	// 찜 목록 조회
	@RequestMapping(value = "/wishList/getWishList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getWishList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = wishListService.getWishList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 찜 목록 추가
	@RequestMapping(value = "/wishList/addWishList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addWishList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = wishListService.addWishList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 찜 목록 삭제
	@RequestMapping(value = "/wishList/removeWishList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeWishList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = wishListService.removeWishList(map);
		return new Gson().toJson(resultMap);
	}

	
	

	
}
