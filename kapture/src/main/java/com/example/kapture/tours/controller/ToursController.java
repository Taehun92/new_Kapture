package com.example.kapture.tours.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.kapture.tours.dao.ToursService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ToursController {
	
	@Autowired
	ToursService toursService;
	
	// 상품 페이지 dept(1) 주소
	@RequestMapping("/tours/list.do")
    public String toursList(@RequestParam(value = "keyword", required = false) String keyword, Model model) throws Exception{
		model.addAttribute("keyword", keyword);
		return "/tours/tours-list";
    }
	
	// 지역별 상품 페이지 dept(2) 주소
	@RequestMapping("/tours/regionalTours.do")
	public String regionalTours(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/tours/regional-tours";
	}
	// 상품 상세페이지 dept(3) 주소
	@RequestMapping("/tours/tour-info.do")
    public String detailTour(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		request.setAttribute("map", map);
      
		return "/tours/tour-info";
    }
	// 데이트피커 테스트 주소(추후 삭제예정)
	@RequestMapping("/tours/date-picker-test.do")
    public String testDatePicker(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/tours/date-picker-test";
    }
	
	// 리뷰 별점 테스용 주소
	@RequestMapping("/tours/rating.do")
    public String ratingTest(Model model) throws Exception{
        return "/tours/test-rating";
    }
	
//---------------------------------------------------------dox---------------------------------------------------------------------------
		
	// 상품 목록 조회
	@RequestMapping(value = "/tours/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String toursList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		if(map.get("selectedDates") != null) { // 선택된 여행 기간이 널이 아니면 'YYYY-MM-DD'형식으로 짤라서 맵에 추가
			
			String json = map.get("selectedDates").toString(); 
			ObjectMapper mapper = new ObjectMapper();
			List<Object> selectedDates = mapper.readValue(json, new TypeReference<List<Object>>(){});
			List<String> formattedDates = new ArrayList<>();

			for (Object date : selectedDates) {
			    String dateStr = date.toString().substring(0, 10); // "2025-03-25T06:39:00.000Z" → "2025-03-25"
			    formattedDates.add(dateStr);
			}
			
			map.put("selectedDates", formattedDates);
		}
		
		if(map.get("selectedThemes") != null) { // 선택된 테마 리스트가 널이 아니면 맵에 추가
		String json = map.get("selectedThemes").toString(); 
		ObjectMapper mapper = new ObjectMapper();
		List<Object> selectedThemes = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("selectedThemes", selectedThemes);
		}
		
		if(map.get("selectedLanguages") != null) { // 선택된 가이드언어 리스트가 널이 아니면 맵에 추가
			String json = map.get("selectedLanguages").toString(); 
			ObjectMapper mapper = new ObjectMapper();
			List<Object> selectedLanguages = mapper.readValue(json, new TypeReference<List<Object>>(){});
			map.put("selectedLanguages", selectedLanguages);
		}
		
		if(map.get("selectedRegions") != null) { // 선택된 지역 리스트가 널이 아니면 맵에 추가
			String json = map.get("selectedRegions").toString(); 
			ObjectMapper mapper = new ObjectMapper();
			List<Object> selectedRegions = mapper.readValue(json, new TypeReference<List<Object>>(){});
			map.put("selectedRegions", selectedRegions);
		}
		
		System.out.println(map);
		resultMap = toursService.getToursList(map);
		return new Gson().toJson(resultMap);
	}

	// 상품 목록 조회
	@RequestMapping(value = "/tours/all.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String all(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = toursService.getAll(map);
		return new Gson().toJson(resultMap);
	}

	// 상품 상세페이지
	@RequestMapping(value = "/tours/tour-info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tourInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = toursService.getTourInfo(map);
		
		return new Gson().toJson(resultMap); //받는 타입을 json으로 정의해서 json 형태로 변환
	}
	
	
	@RequestMapping("/course.do")
	public String course(Model model) throws Exception{
		return "/tours/course";
	}
	@RequestMapping("/course-info.do")
	public String courseInfo(Model model) throws Exception{
		return "/tours/course-info";
	}
	
	// 상품 삭제
	@RequestMapping(value = "/tours/removeTour.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeTour(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = toursService.removeTour(map);
		return new Gson().toJson(resultMap);
	}
	
	// 상품 deleteYN 수정
	@RequestMapping(value = "/tours/toggleTourDeleteYn.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String toggleTourDeleteYn(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = toursService.toggleTourDeleteYn(map);
		return new Gson().toJson(resultMap);
	}
	
	// 상품 재판매 등록
	@RequestMapping(value = "/tours/resaleTour.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resaleTour(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = toursService.saveResaleTour(map);
		return new Gson().toJson(resultMap);
	}
}