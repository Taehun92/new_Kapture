package com.example.kapture.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.common.mapper.CommonMapper;
import com.example.kapture.common.model.Common;
import com.example.kapture.common.model.Img;
import com.example.kapture.common.model.Region;
import com.example.kapture.common.model.Theme;

@Service
public class CommonService {

	@Autowired
	CommonMapper commonMapper;

	public HashMap<String, Object> getSiList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Region> siList = commonMapper.selectSiNameList(map);
		
		resultMap.put("siList", siList);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	public HashMap<String, Object> getGuList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Region> guList = commonMapper.selectGuNameList(map);
		
		resultMap.put("guList", guList);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	public HashMap<String, Object> getThemeParentList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Theme> themeParentList = commonMapper.selectThemeParentList(map);
		
		resultMap.put("themeParentList", themeParentList);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	public HashMap<String, Object> getThemeList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Theme> themeNameList = commonMapper.selectThemeNameList(map);
		
		resultMap.put("themeNameList", themeNameList);
		resultMap.put("result", "success");
		
		return resultMap;
		
	}

	public HashMap<String, Object> getSi(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Region si = commonMapper.selectSiName(map);
		
		resultMap.put("si", si);
		
		return resultMap;
	}

	public HashMap<String, Object> getGu(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Region gu = commonMapper.selectGuName(map);
		
		resultMap.put("gu", gu);
		
		return resultMap;
	}

	public HashMap<String, Object> getThemeParent(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Theme themeParent = commonMapper.selectThemeParent(map);
		
		resultMap.put("themeParent", themeParent);
		
		return resultMap;
		
	}

	public HashMap<String, Object> getTheme(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Theme themeName = commonMapper.selectThemeName(map);
		
		resultMap.put("themeName", themeName);
		
		return resultMap;
	}
	
	public HashMap<String, Object> getThemeListByParent(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Theme> themeList = commonMapper.selectThemeListByParentNo(map);
		
		resultMap.put("themeList", themeList);
		resultMap.put("result", "success");
		
		return resultMap;
	}
	
	public HashMap<String, Object> getGuListBysiNo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Region> guList = commonMapper.selectGuListBysiNo(map);
		
		resultMap.put("guList", guList);
		resultMap.put("result", "success");
		
		return resultMap;
	}
	
	public HashMap<String, Object> getSiNameNoList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Region> siList = commonMapper.selectgetSiNameNoList(map);
		
		resultMap.put("siList", siList);
		resultMap.put("result", "success");
		
		return resultMap;
	}
	
	
	// 날씨 정보
	public HashMap<String, Object> selectSi(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Common> si = commonMapper.selectSi(map);
		
		resultMap.put("si", si);
		
		return resultMap;
	}
	
	public HashMap<String, Object> selectGu(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Common> gu = commonMapper.selectGu(map);
		
		resultMap.put("gu", gu);
		
		return resultMap;
	}
	
	public HashMap<String, Object> selectDong(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Common> dong = commonMapper.selectDong(map);
		
		resultMap.put("dong", dong);
		
		return resultMap;
	}
	
	public HashMap<String, Object> selectXY(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Common xy = commonMapper.selectXY(map);
		
		resultMap.put("xy", xy);
		
		return resultMap;
	}

	public HashMap<String, Object> getTourThumbnail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Img img = commonMapper.selectTourThumbnail(map);
			resultMap.put("result", "success");
			resultMap.put("img", img);
			
		} catch (Exception e) {
      System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	// 최신 10개 알람 조회
	public List<HashMap<String, Object>> getRecentAlarms(int userNo) {
	    return commonMapper.selectRecentAlarms(userNo);
	}
	// 읽은 알람 상태 처리
	public int updateAlarmStatus(Map<String, Object> map) {
	    return commonMapper.updateAlarmStatus(map);
	}
	
	
	
	
}
