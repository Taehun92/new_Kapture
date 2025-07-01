package com.example.kapture.admin.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.admin.model.OrderInfo;
import com.example.kapture.admin.model.Partnership;
import com.example.kapture.cs.model.Cs;
import com.example.kapture.login.model.Login;
import com.example.kapture.mypage.model.Guide;
import com.example.kapture.tours.model.Tours;

@Mapper
public interface AdminMapper {
	
	  Map<String, Object> monthChart();
	  
	  	// 📅 월별 매출 (12개월 컬럼으로 한 줄 반환)
	    Map<String, Object> getMonthChartByYear(HashMap<String, Object> map);

	    // 지역 + 테마별 매출 
	    List<Map<String, Object>> getThemeSalesByRegion(HashMap<String, Object> map);
	    
	    // 3. 📆 일별 매출 (선택한 연도와 월 기준)
	    List<Map<String, Object>> getDayChartByYearMonth(Map<String, Object> map);	   
	    
	    int selectTotalAmount();         // 총 거래 금액
	    int selectYesterdayAmount();     // 어제 거래 금액
	    int selectTotalUsers();          // 총 이용 인원
	    int selectApprovedCount();       // 승인 건수
	    int selectRejectedCount();       // 취소 건수
	    // 가이드관리 정보 조회
		List<Guide> selectguidesList(HashMap<String, Object> map);
		// 가이드관리 가이드정보 수정
		int updateGuideInfo(HashMap<String, Object> map);
		// 가이드관리 유저정보 수정
		int updateUserInfo(HashMap<String, Object> map);

		List<HashMap<String, Object>> selectTransactionList(HashMap<String, Object> map);

		int selectTransactionTotalCount(HashMap<String, Object> map);
		
		List<String> getRegionList();
		// 가이드관리 프로필 이미지 저장
		int insertGuideProfile(HashMap<String, Object> map);
		// 회원관리 회원정보 조회
		List<Login> selectUsersList(HashMap<String, Object> map);
		// 회원관리 회원정보 수정
		int updateUser(HashMap<String, Object> map);
		// 회원관리 회원 탈퇴 처리(유저 삭제), 가이드관리 삭제
		int deleteUser(HashMap<String, Object> map);
		// 역할 수정시 가이드 생성
		int insertGuide(HashMap<String, Object> map);
		// 가이드관리 삭제, 고객관리 삭제,역할 수정시 가이드 삭제
		int deleteGuide(HashMap<String, Object> map);
		// 고객 문의 리스트 조회
		List<Cs> selectInquiriesList(HashMap<String, Object> map);
		// 고객 문의 답변 저장
		int updateInquiryAnswer(HashMap<String, Object> map);
		// 고객 문의 삭제
		int deleteInquiry(HashMap<String, Object> map);
		// 환불 처리
		int updateRefunded(HashMap<String, Object> map);




		List<HashMap<String, Object>> selectAllReviews();

		List<HashMap<String, Object>> selectReviewList(HashMap<String, Object> map);

		int selectReviewCount(HashMap<String, Object> map);

		int deleteReview(HashMap<String, Object> map);

		HashMap<String, Object> getReviewSummary();
		// 주문상세내역 수정
		int updateOrderInfo(HashMap<String, Object> map);
		// 주문내역 삭제
		int deleteOrder(HashMap<String, Object> map);

		List<Map<String, Object>> selectSalesByYear();

		List<Map<String, Object>> selectThemeSummary();
		int selectThemeTotalCount();

		List<Map<String, Object>> selectLatestReviews();
		// 상품관리 조회
		List<Tours> selectToursManagementList(HashMap<String, Object> map);
		// 상품관리 총 개수
		int selectToursTotalCount(HashMap<String, Object> map);
		// 상품관리 수정
		int updateTour(HashMap<String, Object> map);
		// 상품관리 삭제
		int deleteTour(HashMap<String, Object> map);
		// 가이드 추가(가이드 정보)
		int insertNewGuide(HashMap<String, Object> map);
		// 가이드 추가(유저 정보)
		int insertNewUser(HashMap<String, Object> map);
		// 가이드 프로필 수정
		int updateGuideImg(HashMap<String, Object> map);

		List<Map<String, Object>> selectMonthlySales();

		List<Map<String, Object>> selectLatestSales(Map<String, Object> param);

		int selectRequestCount();

		List<HashMap<String, Object>> selectLatestRequests(HashMap<String, Object> map);
		// 가이드리스트 총 인원 
		int selectGuidesTotalCount(HashMap<String, Object> map);
		// 가이드관리 삭제, 고객관리 삭제(가이드 이미지 삭제)
		int deleteGuideImg(HashMap<String, Object> map);
		// 가이드관리 삭제, 고객관리 삭제 가이드이미지 삭제(가이드 번호 조회)
		int selectGuideNo(HashMap<String, Object> map);
		// 가이드관리 삭제, 고객관리 삭제(프로필 존재 여부)
		String selectPFilePath(HashMap<String, Object> map);
		// 회원 총 인원
		int selectUsersTotalCount(HashMap<String, Object> map);
		// 문의조회 총 개수
		int selectInquiriesTotalCount(HashMap<String, Object> map);

		int deleteBeforeGuideImg(HashMap<String, Object> map);

		int guideImgCount(HashMap<String, Object> map);
		// 제휴문의 조회(승인대기, 승인거부)
		List<Partnership> selectWaitingPartnershipList(HashMap<String, Object> map);
		// 제휴문의 조회(승인대기, 승인거부) 총 개수
		int countWaitingPartnership(HashMap<String, Object> map);
		// 제휴문의 조회(승인완료)
		List<Partnership> selectApprovedPartnershipList(HashMap<String, Object> map);
		// 제휴문의 조회(승인완료) 총 개수
		int countApprovedPartnership(HashMap<String, Object> map);
		// 제휴문의 수정
		int updatePartnership(HashMap<String, Object> map);
		// 문의 답변시 알림 정보 저장
		void insertAnswerAlarm(HashMap<String, Object> map);
		// 제휴 상태 변경시 알림 정보 저장
		void insertPartnershipStatusAlarm(HashMap<String, Object> map);

		


		


		
}
