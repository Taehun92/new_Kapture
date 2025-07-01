package com.example.kapture.terms.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.kapture.terms.dao.TermsService;
import com.google.gson.Gson;

@Controller
public class TermsController {
	
	@Autowired
	TermsService termsService;
	
	// 약관 가져오기
	@RequestMapping(value = "/terms/getTerms.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getTerms(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = termsService.getTerms(map);
		return new Gson().toJson(resultMap);
	}
	
	// 약관 가져오기(get방식 - 회원가입)
	@RequestMapping(value = "/terms/getTermsGetMethod.dox", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getTermsGetMethod(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = termsService.getTerms(map);
	    return new Gson().toJson(resultMap);
	}
	
	
	
	// 약관 수정
	@RequestMapping(value = "/terms/saveTerms.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String saveTerms(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = termsService.saveTerms(map);
		return new Gson().toJson(resultMap);
	}

}
