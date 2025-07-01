package com.example.kapture.admin.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.kapture.admin.mapper.AdminMapper;
import com.example.kapture.admin.model.Partnership;
import com.example.kapture.cs.model.Cs;
import com.example.kapture.login.model.Login;
import com.example.kapture.mypage.model.Guide;
import com.example.kapture.tours.model.Tours;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminMapper;

	@Autowired
	PasswordEncoder passwordEncoder;

	// 관리자 페이지 차트 데이터 조회
	public HashMap<String, Object> getChartByTypeAndYear(HashMap<String, Object> map) {
		String type = (String) map.get("type");
		String year = (String) map.get("year");

		if (type == null || year == null) {
			throw new RuntimeException("type 또는 year 누락됨");
		}

		HashMap<String, Object> result = new HashMap<>();

		// 📅 월별 매출
		if ("month".equals(type)) {
			Map<String, Object> raw = adminMapper.getMonthChartByYear(map);

			String[] months = { "01월", "02월", "03월", "04월", "05월", "06월", "07월", "08월", "09월", "10월", "11월", "12월" };

			List<Map<String, Object>> list = new ArrayList<>();
			for (String month : months) {
				Map<String, Object> row = new HashMap<>();
				row.put("LABEL", month);
				row.put("TOTAL", raw.getOrDefault(month, 0));
				list.add(row);
			}

			result.put("list", list);
		}

		// 지역 + 테마별 + 타이틀
		else if ("themeByRegion".equals(type)) {
			List<Map<String, Object>> raw = adminMapper.getThemeSalesByRegion(map);

			Set<String> regions = new LinkedHashSet<>();
			Set<String> themes = new LinkedHashSet<>();
			Map<String, Map<String, Integer>> grouped = new LinkedHashMap<>();

			for (Map<String, Object> row : raw) {
				String region = (String) row.get("REGION");
				String theme = (String) row.get("THEME");
				int total = ((Number) row.get("TOTAL")).intValue();

				if (region == null || theme == null)
					continue;

				regions.add(region);
				themes.add(theme);

				grouped.putIfAbsent(theme, new HashMap<>());
				grouped.get(theme).put(region, total);
			}

			List<Map<String, Object>> series = new ArrayList<>();
			for (String theme : themes) {
				Map<String, Object> data = new HashMap<>();
				data.put("name", theme);

				List<Integer> values = new ArrayList<>();
				for (String region : regions) {
					values.add(grouped.get(theme).getOrDefault(region, 0));
				}

				data.put("data", values);
				series.add(data);
			}

			result.put("series", series); // ✅ stacked chart용
			result.put("categories", new ArrayList<>(regions)); // ✅ x축 지역
		}

		// 📆 일별 매출
		else if ("day".equals(type)) {
			List<Map<String, Object>> raw = adminMapper.getDayChartByYearMonth(map);

			String selectedYear = map.get("year").toString();
			String selectedMonth = map.get("month").toString();

			int lastDay = getLastDayOfMonth(Integer.parseInt(selectedYear), Integer.parseInt(selectedMonth));

			// 1~마지막 일까지 0으로 초기화
			Map<String, Integer> chartMap = new LinkedHashMap<>();
			for (int i = 1; i <= lastDay; i++) {
				String dayLabel = String.format("%02d일", i);
				chartMap.put(dayLabel, 0);
			}

			// DB 데이터로 갱신
			for (Map<String, Object> row : raw) {
				String day = (String) row.get("DAY");
				// 👇 포맷 통일: "1일" → "01일"
				String formattedDay = String.format("%02d일", Integer.parseInt(day.replace("일", "")));
				int total = ((Number) row.get("TOTAL")).intValue();
				chartMap.put(formattedDay, total);
			}

			List<Map<String, Object>> list = new ArrayList<>();
			for (Map.Entry<String, Integer> entry : chartMap.entrySet()) {
				Map<String, Object> item = new HashMap<>();
				item.put("LABEL", entry.getKey());
				item.put("TOTAL", entry.getValue());
				list.add(item);
			}

			result.put("list", list);
		}

		else {
			result.put("list", Collections.emptyList());
		}

		return result;
	}

	private int getLastDayOfMonth(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, 1);
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	public HashMap<String, Object> getSummary(HashMap<String, Object> map) {
		HashMap<String, Object> result = new HashMap<>();

		int totalAmount = adminMapper.selectTotalAmount();
		int yesterdayAmount = adminMapper.selectYesterdayAmount();
		int totalUsers = adminMapper.selectTotalUsers();
		int approved = adminMapper.selectApprovedCount();
		int rejected = adminMapper.selectRejectedCount();

		result.put("totalAmount", totalAmount);
		result.put("yesterdayAmount", yesterdayAmount);
		result.put("totalUsers", totalUsers);
		result.put("approved", approved);
		result.put("rejected", rejected);

		return result;
	}

	public List<String> getAllRegionNames() {
		return adminMapper.getRegionList();
	}

	// 가이드관리 가이드정보 조회
	public HashMap<String, Object> getGuidesList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Guide> guidesList = adminMapper.selectguidesList(map);
			int totalCount = adminMapper.selectGuidesTotalCount(map);

			resultMap.put("totalCount", totalCount);
			resultMap.put("result", "success");
			resultMap.put("guidesList", guidesList);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 가이드관리 정보 수정
	public HashMap<String, Object> editGuide(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String hashPwd = passwordEncoder.encode((String) map.get("password"));
			map.put("password", hashPwd);
			int guideInfo = adminMapper.updateGuideInfo(map);
			System.out.println("가이드 수정 쿼리 실행 후 : " + map);

			int userInfo = adminMapper.updateUserInfo(map);
			String pFilePath = (String) map.get("pFilePath");
			String result;

			if (pFilePath != null && pFilePath != "") {
				int guideImg = adminMapper.updateGuideImg(map);
				int guideImgCount = adminMapper.guideImgCount(map);
				if (guideImgCount > 1) {
					int beforeGuideImg = adminMapper.deleteBeforeGuideImg(map);
				}
				if (guideInfo > 0 && userInfo > 0 && guideImg > 0) {
					result = "success";
				} else {
					result = "fail";
				}

			} else {
				if (guideInfo > 0 && userInfo > 0) {
					result = "success";
				} else {
					result = "fail";
				}
			}
			resultMap.put("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	public HashMap<String, Object> getTransactionList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();

		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int size = Integer.parseInt(String.valueOf(map.get("size")));

		List<HashMap<String, Object>> list = adminMapper.selectTransactionList(map);
		int totalCount = adminMapper.selectTransactionTotalCount(map);

		resultMap.put("list", list); // 프론트에 넘길 데이터 key
		resultMap.put("totalCount", totalCount);

		return resultMap;
	}

	// 가이드관리 프로필 이미지 저장
	public HashMap<String, Object> addGuideProfile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			int result = adminMapper.insertGuideProfile(map);
			System.out.println("insertGuideProfile 이후 " + map);
			int pFileNo = Integer.parseInt(String.valueOf(map.get("pFileNo")));
			System.out.println("map.get(\"pFileNo\")" + pFileNo);
			resultMap.put("pFileNo", pFileNo);
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 가이드 관리 삭제, 고객관리 회원 탈퇴 처리(삭제)
	public HashMap<String, Object> userUnregister(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.deleteUser(map); // 유저 삭제는 항상 수행

			String role = (String) map.get("role");
			Object guideNoObj = map.get("guideNo");
			Integer guideNo = null;
			if (guideNoObj != null) {
				if (guideNoObj instanceof String) {
					guideNo = Integer.parseInt((String) guideNoObj);
				} else if (guideNoObj instanceof Integer) {
					guideNo = (Integer) guideNoObj;
				}
			}
			int getGuideNo = 0;
			// 가이드이미지 삭제(가이드 번호 조회)
			if ("GUIDE".equals(role)) {
				getGuideNo = adminMapper.selectGuideNo(map);
				map.put("guideNo", getGuideNo);
				System.out.println("가이드넘버조회=====" + map);
			}
			// 프로필 존재 여부
			String getPFilePath = "";
			if (guideNo != null || getGuideNo > 0) {
				getPFilePath = adminMapper.selectPFilePath(map);
				System.out.println("가이드이미지조회=====" + getPFilePath);
			}
			// 가이드 번호가 있을 경우 가이드 삭제도 수행
			if (((guideNo != null && guideNo > 0) || "GUIDE".equals(role)) && result > 0) {
				int guideResult = adminMapper.deleteGuide(map);
				if (getPFilePath != null && getPFilePath != "") {
					int guideImg = adminMapper.deleteGuideImg(map);
					if (guideImg <= 0) {
						resultMap.put("guideImgResult", "fail");
					} else {
						resultMap.put("guideImgResult", "success");
					}
				}
				if (guideResult <= 0) {
					resultMap.put("guideResult", "fail");
				} else {
					resultMap.put("guideResult", "success");
				}
			}
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 회원관리 유저정보 수정
	public HashMap<String, Object> editUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.updateUser(map);
			resultMap.put("result", result > 0 ? "success" : "fail");
			String beforeRole = (String) map.get("beforeRole");
			String role = (String) map.get("role");
			System.out.println("role:" + (String) map.get("role"));
			System.out.println("beforeRole:" + (String) map.get("beforeRole"));
			if ("GUIDE".equals(role) && "TOURIST".equals(beforeRole)) {
				int guideResult = adminMapper.insertGuide(map);
				resultMap.put("guideInsertResult", "success");
				if (guideResult <= 0) {
					resultMap.put("guideInsertResult", "fail");
				}
			}
			if ("TOURIST".equals(role) && "GUIDE".equals(beforeRole)) {
				int guideResult = adminMapper.deleteGuide(map);
				resultMap.put("guideDeleteResult", "success");
				if (guideResult <= 0) {
					resultMap.put("guideDeleteResult", "fail");
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 회원관리 정보 조회
	public HashMap<String, Object> getUsersList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Login> usersList = adminMapper.selectUsersList(map);
			// 회원 총 인원
			int totalCount = adminMapper.selectUsersTotalCount(map);

			resultMap.put("totalCount", totalCount);
			resultMap.put("usersList", usersList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 고객 문의 리스트 조회
	public HashMap<String, Object> userInquiriesList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Cs> inquiriesList = adminMapper.selectInquiriesList(map);
			// 문의조회 총 갯수
			int totalCount = adminMapper.selectInquiriesTotalCount(map);
			resultMap.put("totalCount", totalCount);
			resultMap.put("inquiriesList", inquiriesList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 고객 문의 답변 저장
	public HashMap<String, Object> inquiryAnswerSave(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.updateInquiryAnswer(map);
			int targetUserNo = Integer.parseInt(map.get("targetUserNo").toString());
			map.put("targetUserNo", targetUserNo);
			// 문의 답변시 알림 정보 저장
			adminMapper.insertAnswerAlarm(map);

			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 고객 문의 삭제
	public HashMap<String, Object> removeInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.deleteInquiry(map);
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 환불 처리
	public HashMap<String, Object> payRefunded(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.updateRefunded(map);
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	public HashMap<String, Object> getAllReviewList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();

		// 페이징 파라미터 추출
		int page = Integer.parseInt((String) map.getOrDefault("page", "1"));
		int pageSize = Integer.parseInt((String) map.getOrDefault("pageSize", "10"));
		int offset = (page - 1) * pageSize;

		map.put("offset", offset);
		map.put("pageSize", pageSize);

		// 리뷰 리스트 가져오기
		List<HashMap<String, Object>> list = adminMapper.selectReviewList(map);
		map.get("keyword");
		map.get("sort");

		// 전체 리뷰 수
		int totalCount = adminMapper.selectReviewCount(map);
		System.out.println("전체 리뷰 수: " + totalCount);

		// 결과 저장
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);

		return resultMap;
	}

	// 리뷰 삭제
	public HashMap<String, Object> deleteReview(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();

		int result = adminMapper.deleteReview(map);
		System.out.println(map);

		if (result > 0) {
			resultMap.put("status", "success");
			resultMap.put("message", "리뷰가 삭제되었습니다.");
		} else {
			resultMap.put("status", "fail");
			resultMap.put("message", "삭제할 리뷰가 없습니다.");
		}

		return resultMap;
	}

	public HashMap<String, Object> getReviewSummary() {
		return adminMapper.getReviewSummary();
	}

	// 주문상세내역 수정
	public HashMap<String, Object> saveOrderInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.updateOrderInfo(map);
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 주문내역 삭제
	public HashMap<String, Object> removeOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.deleteOrder(map);
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	public HashMap<String, Object> getSalesSummary() {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Map<String, Object>> salesList = adminMapper.selectSalesByYear();
		resultMap.put("salesList", salesList);
		return resultMap;
	}

	public HashMap<String, Object> getThemeSummary() {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Map<String, Object>> themeList = adminMapper.selectThemeSummary();
		int totalCount = adminMapper.selectThemeTotalCount();
		resultMap.put("themeList", themeList);
		resultMap.put("totalCount", totalCount);
		return resultMap;
	}

	public HashMap<String, Object> getLatestReviews() {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Map<String, Object>> reviewList = adminMapper.selectLatestReviews();
		resultMap.put("reviews", reviewList);
		return resultMap;
	}

	// 상품관리 조회
	public HashMap<String, Object> toursManagementList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Tours> toursList = adminMapper.selectToursManagementList(map);
			// 상품관리 총 갯수
			int totalCount = adminMapper.selectToursTotalCount(map);

			resultMap.put("totalCount", totalCount);
			resultMap.put("toursList", toursList);
			resultMap.put("result", toursList != null ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 상품관리 수정
	public HashMap<String, Object> tourUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.updateTour(map);

			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 상품관리 삭제
	public HashMap<String, Object> removeTour(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = adminMapper.deleteTour(map);

			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 가이드 추가(유저 정보, 가이드 정보)
	public HashMap<String, Object> addGuide(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String hashPwd = passwordEncoder.encode((String) map.get("password"));
			map.put("password", hashPwd);
			System.out.println("insertNewUser 이전 " + map);
			int insertUserResult = adminMapper.insertNewUser(map);
			System.out.println("insertNewUser 이후 " + map);
			int insertGuideResult = adminMapper.insertNewGuide(map);
			String pFilePath = (String) map.get("pFilePath");
			if (pFilePath != null && pFilePath != "") {
				int guideImg = adminMapper.updateGuideImg(map);
				if (insertGuideResult > 0 && insertUserResult > 0 && guideImg > 0) {
					resultMap.put("result", "success");
				} else {
					resultMap.put("result", "fail");
				}
			} else {
				if (insertGuideResult > 0 && insertUserResult > 0) {
					resultMap.put("result", "success");
				} else {
					resultMap.put("result", "fail");
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	public HashMap<String, Object> getMonthlySales() {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Map<String, Object>> list = adminMapper.selectMonthlySales();
		resultMap.put("monthlyList", list);
		return resultMap;
	}

	public HashMap<String, Object> getLatestSales() {
		HashMap<String, Object> resultMap = new HashMap<>();

		// 오프셋 기본값: 처음 0부터, 5개
		Map<String, Object> param = new HashMap<>();
		param.put("offset", 0);
		param.put("limit", 5);

		List<Map<String, Object>> list = adminMapper.selectLatestSales(param);
		resultMap.put("salesList", list);
		return resultMap;
	}

	public HashMap<String, Object> getLatestRequests(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();

		try {
			map.put("offset", 0);
			map.put("limit", 5);

			List<HashMap<String, Object>> list = adminMapper.selectLatestRequests(map);

			resultMap.put("requestList", list);
			resultMap.put("totalCount", list.size());
			resultMap.put("result", "success");

		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "fail");
			resultMap.put("message", "요청글 데이터 조회 실패");
		}

		return resultMap;
	}

	// 제휴문의 조회(승인대기, 승인거부)
	public HashMap<String, Object> getPartnershipList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Partnership> waitingList = adminMapper.selectWaitingPartnershipList(map);
			int countWaiting = adminMapper.countWaitingPartnership(map);
			List<Partnership> approvedList = adminMapper.selectApprovedPartnershipList(map);
			int countApproved = adminMapper.countApprovedPartnership(map);

			resultMap.put("result", "success");
			resultMap.put("waitingList", waitingList);
			resultMap.put("countWaiting", countWaiting);
			resultMap.put("approvedList", approvedList);
			resultMap.put("countApproved", countApproved);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

	// 제휴문의 수정
	public HashMap<String, Object> editPartnership(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			
			int targetUserNo = Integer.parseInt(map.get("targetUserNo").toString());
			map.put("targetUserNo", targetUserNo);
			int referenceId = Integer.parseInt(map.get("partnershipNo").toString());
			map.put("referenceId", referenceId);
			System.out.println("타겟넘버: "+targetUserNo);
			System.out.println("승인상태: " +map.get("psStatus"));
			System.out.println("참조아이디: "+referenceId);
			// 제휴 상태 변경시 알림 정보 저장
			adminMapper.insertPartnershipStatusAlarm(map);
			int result = adminMapper.updatePartnership(map);

			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", e.getMessage());
		}
		return resultMap;
	}

}