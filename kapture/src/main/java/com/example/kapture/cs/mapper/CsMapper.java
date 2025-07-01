package com.example.kapture.cs.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.cs.model.Cs;

@Mapper
public interface CsMapper {

	List<Cs> faqCs(HashMap<String, Object> map);

	int faqCsCnt(HashMap<String, Object> map);

	List<Cs> csNotice(HashMap<String, Object> map);

	int noticeCsCnt(HashMap<String, Object> map);

	void insertQna(HashMap<String, Object> map);

	List<HashMap<String, Object>> searchFaq(HashMap<String, Object> map);

	List<HashMap<String, Object>> searchQna(HashMap<String, Object> map);
	
	int insertPartnership(HashMap<String, Object> map);
	// 관리자 유저 리스트 조회
	List<HashMap<String, Object>> selectAdminUserList();
	// 문의시 알림 정보 저장
	int insertQnaAlarm(HashMap<String, Object> map);
	// 제휴 요청시 알림 정보 저장
	void insertAnswerAlarm(HashMap<String, Object> map);
}
