package com.example.kapture.mypage.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.kapture.mypage.dao.MyPageService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyPageController {

		@Autowired
		MyPageService myPageService;
		
		// 유저 마이페이지 주소(회원 정보 수정)
		@RequestMapping("/mypage/user-mypage.do")
		public String userMypage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			return "/mypage/user-mypage";
		}
		// 유저 마이페이지 주소(구매한 상품)
		@RequestMapping("mypage/user-purchase-history.do")
		public String purchaseHistory(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			return "/mypage/user-purchase-history";
		}	
		// 유저 마이페이지 주소(나의 일정)
		@RequestMapping("/mypage/user-schedule.do")
		public String fullcalendar(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			return "/mypage/user-schedule";
		}
		// 이용후기 관리 페이지
		@RequestMapping("/mypage/user-reviews.do")
		public String userReviews(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			return "/mypage/user-reviews";
		}
		// 회원 탈퇴 페이지
		@RequestMapping("/mypage/user-unregister.do")
		public String userUnRegister(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			return "/mypage/user-unregister";
		}
		// 문의 내역 조회 페이지
		@RequestMapping("/mypage/user-qna.do")
		public String userQna(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			return "/mypage/user-qna";
		}
		
		
	
//---------------------------------------------------------dox---------------------------------------------------------------------------
		// 유저 정보 가져오기
		@RequestMapping(value = "/mypage/user-info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String getUserInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.getUserInfo(map);
			return new Gson().toJson(resultMap);
		}
		// 비밀번호 확인
		@RequestMapping(value = "/mypage/user-checkPwd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String checkPassword(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.checkPassword(map);
			return new Gson().toJson(resultMap);
		}
		// 정보수정
		@RequestMapping(value = "/mypage/info-edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String userInfoEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		    HashMap<String, Object> resultMap = new HashMap<String, Object>();
		    
		    resultMap = myPageService.userInfoEdit(map);
		    return new Gson().toJson(resultMap);
		}
		// 구매한 상품
		@RequestMapping(value = "/mypage/user-purchase-history.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String purchaseList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.purchaseList(map);
			return new Gson().toJson(resultMap);
		}
		// 나의 일정 
		@RequestMapping(value = "/mypage/user-schedule.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String payList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.getPayList(map);
			return new Gson().toJson(resultMap);
		}
		// 이용후기 불러오기
		@RequestMapping(value = "/mypage/user-reviews.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String userReviews(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.getUserReviews(map);
			return new Gson().toJson(resultMap);
		}
		// 이용후기 등록, 수정
		@RequestMapping(value = "/mypage/user-reviewSave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String reviewSave(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.reviewSave(map);
			return new Gson().toJson(resultMap);
		}
		// 이용후기 삭제
		@RequestMapping(value = "/mypage/user-reviewRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String userReviewRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.userReviewRemove(map);
			return new Gson().toJson(resultMap);
		}
		// 회원 탈퇴
		@RequestMapping(value = "/mypage/user-unregister.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String userUnregister(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.userUnregister(map);
			return new Gson().toJson(resultMap);
		}
		// 비밀번호 변경
		@RequestMapping(value = "/mypage/changePassword.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String changePassword(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.changePassword(map);
			return new Gson().toJson(resultMap);
		}
		// 리뷰 등록시 알림 저장
		@RequestMapping("/mypage/registerReviewAlarm.dox")
		@ResponseBody
		public Map<String, Object> registerReviewAlarm(@RequestParam HashMap<String, Object> map) {
		    Map<String, Object> result = new HashMap<>();
		    int inserted = myPageService.registerReviewAlarm(map);
		    result.put("result", inserted > 0 ? "success" : "fail");
		    return result;
		}
		
//--------------------------------------------------------------------가이드페이지--------------------------------------------------------------------------------------------  
		
		// 가이드 페이지
		@RequestMapping("/mypage/guide-mypage.do")
		public String guideMypage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/mypage/guide-mypage";
		}
		
		// 가이드 글쓰기 페이지
		@RequestMapping("/mypage/guide-add.do")
		public String guideAdd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/mypage/guide-add";
		}
		
		// 가이드 글쓰기 수정
		@RequestMapping("/mypage/guide-edit.do")
		public String guideEdit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/mypage/guide-edit";
		}
		
		//가이드 스케줄
		@RequestMapping("/mypage/guide-schedule.do")
		public String guideschedule(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/mypage/guide-schedule";
		}		
		//가이드 판매내역
		@RequestMapping("/mypage/guide-sales-list.do")
		public String guideSalesList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/mypage/guide-sales-list";
		}		
		@RequestMapping("/mypage/guide-reviews.do")
		public String guideReviews(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/mypage/guide-reviews";
		}
		// 문의 내역 조회 페이지
		@RequestMapping("/mypage/guide-qna.do")
		public String guideQna(Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			return "/mypage/guide-qna";
		}
		
		// 가이드 글쓰기
		@RequestMapping(value = "/mypage/guide-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addTour(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.addTour(map);
			return new Gson().toJson(resultMap);
		}
		
		//가이드 정보불러오기 
		@RequestMapping(value = "/mypage/guide-info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String getGuideInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		    HashMap<String, Object> resultMap = myPageService.getGuideInfo(map);
		    return new Gson().toJson(resultMap);
		}
		//가이드 정보수정 
		@RequestMapping(value = "/mypage/guide-info-edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String guideInfoEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		    HashMap<String, Object> resultMap = new HashMap<String, Object>();
		    
		    resultMap = myPageService.updateGuideInfo(map);
		    return new Gson().toJson(resultMap);
		}

		// 가이드 스케줄 관리
		@RequestMapping(value = "/mypage/guide-schedule.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String guideSchedule(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
					
			resultMap = myPageService.getGuideSchedule(map);
			return new Gson().toJson(resultMap);
		}

		// 가이드 글 수정
		@RequestMapping(value = "/mypage/guide-edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String editGuide(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.updateGuideInfo(map);
			return new Gson().toJson(resultMap);
		}
		
		// 가이드 글 정보
		@RequestMapping(value = "/mypage/guide-get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String getTour(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.getTour(map);
			return new Gson().toJson(resultMap);
		}
		
		// 파일 처리
		
		@PostMapping("/upload/image")
	    public ResponseEntity<Map<String, Object>> uploadImage(@RequestPart("file") MultipartFile file,
	                                                           HttpServletRequest request) {
	        Map<String, Object> response = new HashMap<>();
	        
	        // 파일 저장할 경로 (예: 프로젝트 내 static 폴더)
	        String uploadDir = request.getServletContext().getRealPath("/uploads/");
	        File uploadFolder = new File(uploadDir);

	        // 폴더가 없으면 생성
	        if (!uploadFolder.exists()) {
	            uploadFolder.mkdirs();
	        }

	        try {
	            // 원본 파일 이름과 확장자 추출
	            String originalFilename = file.getOriginalFilename();
	            String extName = originalFilename.substring(originalFilename.lastIndexOf("."));
	            
	            // 파일명 중복 방지를 위해 UUID 사용
	            String saveFileName = UUID.randomUUID() + extName;
	            
	            // 저장할 파일 경로
	            File destFile = new File(uploadDir, saveFileName);
	            file.transferTo(destFile);
	            
	            // 저장된 이미지의 URL 생성
	            String imageUrl = request.getContextPath() + "/uploads/" + saveFileName;

	            // DB 저장을 원하면 여기에 boardService.addBoardImg() 호출 가능
	            HashMap<String, Object> map = new HashMap<>();
	            map.put("filename", saveFileName);
	            map.put("path", "/uploads/" + saveFileName);
	            map.put("originFilename", originalFilename);
	            myPageService.addToursImg(map);

	            // 성공 응답
	            response.put("success", true);
	            response.put("imageUrl", imageUrl);
	            return ResponseEntity.ok(response);
	        } catch (IOException e) {
	            e.printStackTrace();
	            response.put("success", false);
	            response.put("message", "이미지 업로드 실패");
	            return ResponseEntity.status(500).body(response);
	        }
	    }
		
		// 이미지에 투어 아이디 넣기
		@RequestMapping(value = "/mypage/updateImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String updateImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			String json = map.get("imgList").toString(); 
			String json2 = map.get("thumbnailList").toString(); 
			ObjectMapper mapper = new ObjectMapper();
			List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
			List<Object> list2 = mapper.readValue(json2, new TypeReference<List<Object>>(){});
			map.put("list", list);
			map.put("thumbnailList", list2);
			
			resultMap = myPageService.updateImg(map);
			return new Gson().toJson(resultMap);
		}
		
		
		//가이드 판매내역
		@RequestMapping(value = "/mypage/getTransactionList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String getTransactionList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
					
			resultMap = myPageService.getTransactionListWithPaging(map);
			
		    return new Gson().toJson(resultMap);
		}

		
		
		// 가이드 글 수정
		@RequestMapping(value = "/mypage/guide-update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String updateTour(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.editTour(map);
			return new Gson().toJson(resultMap);
		}
		
		// 가이드 글 삭제
		@RequestMapping(value = "/mypage/guide-delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String deleteTour(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.deleteTour(map);
			return new Gson().toJson(resultMap);
		}
		
		// 이미지 추가 없을 때 썸네일 첫번째 이미지로 바꾸기
		@RequestMapping(value = "/mypage/setThumbnail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String setThumbnail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.setThumbnail(map);
			return new Gson().toJson(resultMap);
		}
		// 본문에 이미지 없을 때 썸네일 초기화
		@RequestMapping(value = "/mypage/resetThumbnail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String resetThumbnail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myPageService.resetThumbnail(map);
			return new Gson().toJson(resultMap);
		}
		
		// 문의 내역 조회
		@RequestMapping(value = "/mypage/getInquiryList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String getInquiryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = myPageService.getInquiryList(map);
			return new Gson().toJson(resultMap);
		}
		
}

