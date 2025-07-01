package com.example.kapture.common.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.common.model.Common;
import com.example.kapture.common.model.Img;
import com.example.kapture.common.model.Region;
import com.example.kapture.common.model.Reviews;
import com.example.kapture.common.model.Theme;

@Mapper
public interface CommonMapper {
	
	List<Region> selectRegionList(HashMap<String, Object> map);
	
	List<Theme> selectThemeList(HashMap<String, Object> map);
	
	List<Reviews> selectReviewsList(HashMap<String, Object> map);
	
	List<Region> selectSiNameList(HashMap<String, Object> map);
	
	List<Region> selectGuNameList(HashMap<String, Object> map);

	List<Theme> selectThemeParentList(HashMap<String, Object> map);

	List<Theme> selectThemeNameList(HashMap<String, Object> map);
	
	Region selectSiName(HashMap<String, Object> map);
	
	Region selectGuName(HashMap<String, Object> map);
	
	Theme selectThemeParent(HashMap<String, Object> map);
	
	Theme selectThemeName(HashMap<String, Object> map);
	
	List<Theme> selectThemeListByParentNo(HashMap<String, Object> map);
	
	List<Region> selectGuListBysiNo(HashMap<String, Object> map);
	
	List<Region> selectgetSiNameNoList(HashMap<String, Object> map);
	
	// 날씨 정보 가져오기
	List<Common> selectSi(HashMap<String, Object> map);
	
	List<Common> selectGu(HashMap<String, Object> map);
	
	List<Common> selectDong(HashMap<String, Object> map);
	
	Common selectXY(HashMap<String, Object> map);

	Img selectTourThumbnail(HashMap<String, Object> map);
	// 최신 10개 알람 조회
	List<HashMap<String, Object>> selectRecentAlarms(int userNo);
	// 읽은 알람 상태 처리
	int updateAlarmStatus(Map<String, Object> map);

	
}
