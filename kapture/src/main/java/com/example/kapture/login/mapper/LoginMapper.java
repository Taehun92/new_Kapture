package com.example.kapture.login.mapper;

import java.util.HashMap;

import java.util.Map;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.login.model.Login;

@Mapper
public interface LoginMapper {

	Login getlogin(HashMap<String, Object> map);

	int insertUser(HashMap<String, Object> map);

	Login checkUser(HashMap<String, Object> map);

	Map<String, Object> selectUserByEmail(String email);
	
	
	int insertSocialUser(Map<String, Object> param);
	
	List<String> selectUserEmail(HashMap<String, Object> map);

	int updateUserPassword(HashMap<String, Object> map);

	 // 트위터 ID로 사용자 조회
    Map<String, Object> selectUserByTwitterId(String twitterId);

    // 트위터 사용자 신규 등록
    int insertTwitterUser(Map<String, Object> param);

    void updateLastLogin(int userNo);
    // 지난 여행 중 알림 없는 상품 조회 쿼리
	List<Integer> selectReviewTargets(int userNo);
	// 알람 등록
	void insertAlarm(HashMap<String, Object> alarmMap);



}
