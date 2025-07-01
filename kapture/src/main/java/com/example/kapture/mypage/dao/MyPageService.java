package com.example.kapture.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.kapture.admin.mapper.AdminMapper;
import com.example.kapture.common.mapper.CommonMapper;
import com.example.kapture.common.model.Region;
import com.example.kapture.common.model.Reviews;
import com.example.kapture.common.model.Theme;
import com.example.kapture.login.model.Login;
import com.example.kapture.mypage.mapper.MyPageMapper;
import com.example.kapture.mypage.model.Guide;
import com.example.kapture.mypage.model.Inquiry;
import com.example.kapture.mypage.model.Payments;
import com.example.kapture.tours.model.Tours;

import jakarta.servlet.http.HttpSession;

@Service
public class MyPageService {

	@Autowired
	MyPageMapper myPageMapper;

	@Autowired
	CommonMapper commonMapper;

	@Autowired
	AdminMapper adminMapper;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	HttpSession session;

	// 회원정보 리스트
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Login userInfo = myPageMapper.selectUser(map);
			resultMap.put("userInfo", userInfo);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "sqlFail");
		}
		return resultMap;
	}

	// 비밀번호 체크
	public HashMap<String, Object> checkPassword(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Login userInfo = myPageMapper.selectUser(map);
			boolean loginFlg = false;
			if (userInfo != null) {
				loginFlg = passwordEncoder.matches((String) map.get("confirmPassword"), userInfo.getPassword());
			}
			if (loginFlg) {
				resultMap.put("result", "success");
			} else {
				resultMap.put("result", "fail");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "sqlFail");
		}
		return resultMap;
	}
	// 회원정보 수정-------------------------------------------------------

	public HashMap<String, Object> userInfoEdit(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();

		try {
			myPageMapper.userInfoUpdate(map); // USERS 테이블 정보 수정
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}

		return resultMap;
	}

	// 구매내역 리스트
	public HashMap<String, Object> getPayList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Payments> payList = myPageMapper.selectPayList(map);
			resultMap.put("payList", payList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;

	}

	// 구매한 상품에 대한 유저 리뷰 리스트
	public HashMap<String, Object> getUserReviews(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Reviews> reviewsList = myPageMapper.selectUserReviewsList(map);
			System.out.println(reviewsList);
			resultMap.put("reviewsList", reviewsList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 리뷰 등록 or 수정
	public HashMap<String, Object> reviewSave(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			System.out.println("editFlg : " + Boolean.parseBoolean((String) map.get("editFlg")));
			boolean editFlg = Boolean.parseBoolean((String) map.get("editFlg"));
			if (!editFlg) {
				System.out.println("리뷰등록 맵: " + map);
				int result = myPageMapper.insertUserReview(map);
				Integer reviewNo = Integer.parseInt((String) map.get("reviewNo"));
				resultMap.put("result", result > 0 ? "success" : "fail");
				resultMap.put("reviewNo", reviewNo);
			}
			if (editFlg) {
				System.out.println("리뷰수정 맵: " + map);
				int result = myPageMapper.updateUserReview(map);
				resultMap.put("result", result > 0 ? "success" : "fail");
				resultMap.put("reviewNo", map.get("reviewNo"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "queryFail");
		}
		return resultMap;
	}

	// 리뷰 삭제
	public HashMap<String, Object> userReviewRemove(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			System.out.println("리뷰삭제 맵: " + map);
			int result = myPageMapper.deleteUserReview(map);
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "queryFail");
		}
		return resultMap;
	}

	// 회원 탈퇴
	public HashMap<String, Object> userUnregister(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Login userInfo = myPageMapper.selectUser(map);
			boolean loginFlg = false;
			if (userInfo != null) {
				loginFlg = passwordEncoder.matches((String) map.get("confirmPassword"), userInfo.getPassword());
			}
			if (loginFlg) {
				int result = myPageMapper.unregisterUser(map);
				resultMap.put("result", result > 0 ? "success" : "unregisterFail");
				session.invalidate();
			} else {
				resultMap.put("result", "pwdCheckFail");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "queryFail");
		}
		return resultMap;
	}

	// 비밀번호 수정
	public HashMap<String, Object> changePassword(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String hashPwd = passwordEncoder.encode((String) map.get("newPassword1"));
			map.put("password", hashPwd);
			int result = myPageMapper.updatePassword(map);
			resultMap.put("result", result > 0 ? "success" : "fail");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "queryFail");
		}
		return resultMap;
	}

	// 구매한 상품 조회
	public HashMap<String, Object> purchaseList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<HashMap<String, Object>> list = myPageMapper.selectPurchaseList(map);
			int totalCount = myPageMapper.selectPurchaseListTotalCount(map);

			resultMap.put("list", list); // 프론트에 넘길 데이터 key
			resultMap.put("totalCount", totalCount);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "queryFail");
		}
		return resultMap;
	}

	// 리뷰 등록시 알림 저장
	public int registerReviewAlarm(HashMap<String, Object> map) {
		Integer guideUserNo = myPageMapper.getGuideUserNoByTourNo(map);
		if (guideUserNo == null)
			return 0;
		map.put("targetUserNo", guideUserNo);

		return myPageMapper.insertReviewAlarm(map);
	}

//-------------------------------------------------------------------------------------------------------------------------------------------------  
	public HashMap<String, Object> addTour(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		myPageMapper.insertTour(map);
		Object tourNo = map.get("tourNo");
		if (tourNo != null) {
			resultMap.put("tourNo", tourNo); // 생성된 tourNo를 결과에 추가
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "error");
			resultMap.put("message", "tourNo 생성 실패");
		}

		return resultMap;
	}

	public HashMap<String, Object> getGuideInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			HashMap<String, Object> user = myPageMapper.selectGuideInfo(map);

			resultMap.put("result", "success");
			resultMap.put("userInfo", user);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> getGuideSchedule(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			System.out.println(map);
			List<Guide> schedule = myPageMapper.selectGuideSchedule(map);
			System.out.println("스케줄 " + schedule);
			resultMap.put("schedule", schedule);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> editTour(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<>();

		myPageMapper.updateTour(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> getTour(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<>();

		Tours tours = myPageMapper.selectTour(map);
		resultMap.put("tours", tours);

		return resultMap;
	}

	public HashMap<String, Object> addToursImg(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		myPageMapper.insertToursFile(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> updateImg(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		myPageMapper.resetThumbnail(map);
		myPageMapper.updateToursFile(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> getTransactionListWithPaging(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();

		// 🔸 페이징 처리
		int page = Integer.parseInt(map.getOrDefault("page", "1").toString());
		int size = Integer.parseInt(map.getOrDefault("size", "10").toString());

		// OFFSET 계산
		int offset = (page - 1) * size;
		map.put("page", page); // 여전히 page 넘겨야 XML에서 계산할 수 있음
		map.put("size", size);
		map.put("offset", offset); // 필요 시 XML 쿼리에서 #{offset} 사용 가능

		// 🔸 DB 조회
		List<Guide> list = myPageMapper.selectTransactionList(map);
		List<Region> siList = commonMapper.selectgetSiNameNoList(map);
		List<Theme> themeParentList = commonMapper.selectThemeParentList(map);
		int totalCount = myPageMapper.selectTransactionTotalCount(map);

		resultMap.put("list", list);
		resultMap.put("siList", siList);
		resultMap.put("themeParentList", themeParentList);
		resultMap.put("totalCount", totalCount);

		return resultMap;

	}

	public HashMap<String, Object> deleteTour(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			myPageMapper.deleteTour(map);
			myPageMapper.deleteTourImg(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> setThumbnail(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<>();
		myPageMapper.resetThumbnail(map);
		myPageMapper.setThumbnail(map);
		resultMap.put("result", "success");

		return resultMap;
	}

	public HashMap<String, Object> resetThumbnail(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<>();

		myPageMapper.resetThumbnail(map);
		resultMap.put("result", "success");

		return resultMap;
	}

	public HashMap<String, Object> updateGuideInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();

		try {
			// GUIDE 테이블 정보 업데이트 (예: 경험, 사용 언어 등)
			int guideInfo = myPageMapper.updateGuideInfo(map);
			// USERS 테이블 기본 정보도 같이 수정 (선택 사항)
			int userInfo = myPageMapper.userInfoUpdate(map);

			String result;
			String pFilePath = (String) map.get("pFilePath");

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
			e.printStackTrace();
			resultMap.put("result", "fail");
		}

		return resultMap;
	}

	// 문의 내역 조회
	public HashMap<String, Object> getInquiryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Inquiry> list = myPageMapper.selectInquiryList(map);
			resultMap.put("result", "success");
			resultMap.put("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

}
