package com.example.kapture.mypage.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.common.model.Reviews;
import com.example.kapture.login.model.Login;
import com.example.kapture.mypage.model.Guide;
import com.example.kapture.mypage.model.Inquiry;
import com.example.kapture.mypage.model.Payments;
import com.example.kapture.tours.model.Tours;


@Mapper
public interface MyPageMapper {

	Login selectUser(HashMap<String, Object> map);

	int userInfoUpdate(HashMap<String, Object> map);
	

	List<Payments> selectPayList(HashMap<String, Object> map);

	void insertTour(HashMap<String, Object> map);

	List<Reviews> selectUserReviewsList(HashMap<String, Object> map);

	int insertUserReview(HashMap<String, Object> map);

	int updateUserReview(HashMap<String, Object> map);

	List<Guide> selectGuideSchedule(HashMap<String, Object> map);
	
	int deleteUserReview(HashMap<String, Object> map);

	int unregisterUser(HashMap<String, Object> map);

	void updateTour(HashMap<String, Object> map);

	Tours selectTour(HashMap<String, Object> map);

	int updatePassword(HashMap<String, Object> map);

	void insertToursFile(HashMap<String, Object> map);

	void updateToursFile(HashMap<String, Object> map);

	Tours insertTourParameters(HashMap<String, Object> map);

	List<Guide> selectTransactionList(Map<String, Object> map);

	int selectTransactionTotalCount(Map<String, Object> map);

	int deleteTour(HashMap<String, Object> map);

	int deleteTourImg(HashMap<String, Object> map);

	void resetThumbnail(HashMap<String, Object> map);

	void setThumbnail(HashMap<String, Object> map);
	
	List<Inquiry> selectInquiryList(HashMap<String, Object> map);

	HashMap<String, Object> selectGuideInfo(HashMap<String, Object> map);
  
	int updateGuideInfo(HashMap<String, Object> map);
	// 구매한 상품 조회
	List<HashMap<String, Object>> selectPurchaseList(HashMap<String, Object> map);
	// 구매한 상푸 개수
	int selectPurchaseListTotalCount(HashMap<String, Object> map);
	
	// 가이드의 USER_NO 조회
	Integer getGuideUserNoByTourNo(HashMap<String, Object> map);
	// 리뷰 등록시 알림 저장
	int insertReviewAlarm(HashMap<String, Object> map);
}
