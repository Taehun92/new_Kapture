package com.example.kapture.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.kapture.admin.dao.AdminService;
import com.example.kapture.common.FileManager;
import com.example.kapture.mypage.dao.MyPageService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	// 관리자 페이지 메인
	@RequestMapping("/admin.do")
    public String main(Model model) throws Exception{
        return "/admin/admin";
    }
	
	// 상품 관리
	@RequestMapping("/admin/tours.do")
	public String tour(Model model) throws Exception{
		return "/admin/admin-tours";
	}
	
	// 가이드 관리
	@RequestMapping("/admin/guide.do")
	public String guide(Model model) throws Exception{
		return "/admin/admin-guide";
	}
	
	// 주문 및 예약 관리
	@RequestMapping("/admin/order.do")
	public String order(Model model) throws Exception{
		return "/admin/admin-order";
	}
	
	// 결제 및 수익 관리
	@RequestMapping("/admin/pay.do")
	public String pay(Model model) throws Exception{
		return "/admin/admin-pay";
	}
	
	// 고객 관리 
	@RequestMapping("/admin/customer.do")
	public String customer(Model model) throws Exception{
		return "/admin/admin-customer";
	}
	
	// 마케팅 및 프로모션 관리
	@RequestMapping("/admin/promotion.do")
	public String promotion(Model model) throws Exception{
		return "/admin/admin-promotion";
	}
	
	// 운영 및 설정 관리
	@RequestMapping("/admin/setting.do")
	public String setting(Model model) throws Exception{
		return "/admin/admin-setting";
	}

	// 고객 문의 관리
	@RequestMapping("/admin/customer-inquiry.do")
	public String customerInquiry(Model model) throws Exception{
		return "/admin/customer-inquiry";
	}

	// 리뷰 및 평점관리 
	@RequestMapping("/admin/review.do")
	public String review(Model model) throws Exception{
		return "/admin/admin-review";
	}

	// 제휴문의 관리
	@RequestMapping("/admin/partnership.do")
	public String partnership(Model model) throws Exception{
		return "/admin/admin-partnership";
	}
  
	// 관리자 차트 데이터 조회
	@RequestMapping(value = "/admin/chart.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getChart(@RequestParam HashMap<String, Object> map) {
		System.out.println("받은 파라미터: " + map);
	    HashMap<String, Object> resultMap = adminService.getChartByTypeAndYear(map);
	    return new Gson().toJson(resultMap);
	}
	
	//지역 리스트 
	@RequestMapping("/admin/getRegionList.dox")
	@ResponseBody
	public String getRegionList() {
	    HashMap<String, Object> result = new HashMap<>();
	    result.put("list", adminService.getAllRegionNames());
	    return new Gson().toJson(result);
	}

	//
	@RequestMapping(value = "/admin/getSummary.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getSummary(@RequestParam HashMap<String, Object> map) {
		
	    HashMap<String, Object> resultMap = new HashMap<>();
	    resultMap.put("summary", adminService.getSummary(map));
	    
	    return new Gson().toJson(resultMap);
	}
	// 가이드 리스트 조회
	@RequestMapping(value = "/admin/guides-list.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getGuidesList(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = adminService.getGuidesList(map);
	    return new Gson().toJson(resultMap);
	}
	// 가이드 정보수정
	@RequestMapping(value = "/admin/guide-update.dox", method = RequestMethod.POST)
	@ResponseBody
	public String editGuide(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = adminService.editGuide(map);
	    return new Gson().toJson(resultMap);
	}
	//최근거래 테이블 , 검색 
	@RequestMapping(value = "/admin/getTransactionList.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getTransactionList(@RequestParam HashMap<String, Object> map) {
	    return new Gson().toJson(adminService.getTransactionList(map));
	}
	// 프로필 이미지 저장
	@RequestMapping("/admin/guide-profile.dox")
	@ResponseBody
	public String result(@RequestParam("profile") List<MultipartFile> profile,  HttpServletRequest request,HttpServletResponse response, Model model)
	{
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println("=======================");
			for(MultipartFile file : profile) {			
				String originFilename = file.getOriginalFilename();
				String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
				long size = file.getSize();
				String saveFileName = FileManager.genSaveFileName(extName);
				String fileType = file.getContentType();
				
				String path2 = System.getProperty("user.dir");
				if(!profile.isEmpty())
				{	
					
					File imgfile = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
					file.transferTo(imgfile);
					
					
					HashMap<String, Object> map = new HashMap<String, Object>();
//					map.put("guideNo", guideNo);
					map.put("pFilePath", "../img/" + saveFileName);
					map.put("pFileName", saveFileName);
					map.put("pFileOrgName", originFilename);
					map.put("pFileType", fileType);
					map.put("pFileSize", size);
					map.put("pFileExtension", extName);
					
					// insert 쿼리 실행
					resultMap = adminService.addGuideProfile(map);
					resultMap.put("newFilePath", "../img/" + saveFileName);	
				}	
				
			}
		}catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		System.out.println("=======================");
		return new Gson().toJson(resultMap);
	}

	// 회원 리스트 조회
	@RequestMapping(value = "/admin/users-list.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getUsersList(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.getUsersList(map);
	   return new Gson().toJson(resultMap);
	}
	// 회원 정보수정
	@RequestMapping(value = "/admin/user-update.dox", method = RequestMethod.POST)
	@ResponseBody
	public String editUser(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.editUser(map);
	    return new Gson().toJson(resultMap);
	}
	// 회원 탈퇴 처리
	@RequestMapping(value = "/admin/unregister.dox", method = RequestMethod.POST)
	@ResponseBody
	public String userUnregister(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.userUnregister(map);
	    return new Gson().toJson(resultMap);
	}
	// 회원 문의 조회
	@RequestMapping(value = "/admin/users-inquiries.dox", method = RequestMethod.POST)
	@ResponseBody
	public String userInquiriesList(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.userInquiriesList(map);
	    return new Gson().toJson(resultMap);
	}

	//리뷰 관리 리스트 	
	@RequestMapping(value = "/admin-review.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getReviewList(@RequestParam HashMap<String, Object> map) {
	    HashMap<String, Object> resultMap = new HashMap<>();
	    resultMap = adminService.getAllReviewList(map); // 서비스에서 처리
	    return new Gson().toJson(resultMap); // JSON 문자열로 반환

	}
	// 회원 문의 답변 저장
	@RequestMapping(value = "/admin/inquiry-answer-save.dox", method = RequestMethod.POST)
	@ResponseBody
	public String inquiryAnswerSave(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.inquiryAnswerSave(map);
	    return new Gson().toJson(resultMap);
	}
	// 회원 문의 삭제
	@RequestMapping(value = "/admin/inquiry-delete.dox", method = RequestMethod.POST)
	@ResponseBody
	public String removeInquiry(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.removeInquiry(map);
	    return new Gson().toJson(resultMap);
	}
	// 환불 처리
	@RequestMapping(value = "/admin/refunded.dox", method = RequestMethod.POST)
	@ResponseBody
	public String payRefunded(@RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.payRefunded(map);
	    return new Gson().toJson(resultMap);
	}
	//리뷰 삭제
	@RequestMapping(value = "/admin/review/delete.dox", method = RequestMethod.POST)
	@ResponseBody
	public String deleteReview(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = adminService.deleteReview(map);
	    return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/review/summary.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getReviewSummary() {
	    HashMap<String, Object> resultMap = adminService.getReviewSummary();
	    return new Gson().toJson(resultMap);
	}

	// 주문상세내역 수정
	@RequestMapping(value = "/admin/saveOrderInfo.dox", method = RequestMethod.POST)
	@ResponseBody
	public String saveOrderInfo(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.saveOrderInfo(map);
	    return new Gson().toJson(resultMap);
	}
	// 주문내역 삭제
	@RequestMapping(value = "/admin/removeOrder.dox", method = RequestMethod.POST)
	@ResponseBody
	public String removeOrder(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.removeOrder(map);
	    return new Gson().toJson(resultMap);
	}

	//대시보드 1번 차트
	@RequestMapping(value = "/admin/sales/summary.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getSalesSummary() {
	    HashMap<String, Object> resultMap = adminService.getSalesSummary();
	    return new Gson().toJson(resultMap);
	}
	//대시보드 2번 차트
	@RequestMapping(value = "/admin/theme/summary.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getThemeSummary() {
	    HashMap<String, Object> resultMap = adminService.getThemeSummary();
	    return new Gson().toJson(resultMap);
	}
	//대시보드 4번 리뷰차트 
	@RequestMapping(value = "/admin/review/latest.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getLatestReviews() {
	    HashMap<String, Object> resultMap = adminService.getLatestReviews();
	    return new Gson().toJson(resultMap);
	}
	// 상품관리 조회
	@RequestMapping(value = "/admin/toursManagement.dox", method = RequestMethod.POST)
	@ResponseBody
	public String toursManagementList(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.toursManagementList(map);
	    return new Gson().toJson(resultMap);
	}
	// 상품관리 수정
	@RequestMapping(value = "/admin/tourUpdate.dox", method = RequestMethod.POST)
	@ResponseBody
	public String tourUpdate(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.tourUpdate(map);
	    return new Gson().toJson(resultMap);
	}
	// 상품관리 삭제 
	@RequestMapping(value = "/admin/removeTour.dox", method = RequestMethod.POST)
	@ResponseBody
	public String removeTour(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.removeTour(map);
	    return new Gson().toJson(resultMap);
	}
	// 가이드 추가(유저 정보, 가이드 정보)
	@RequestMapping(value = "/admin/guide-insert.dox", method = RequestMethod.POST)
	@ResponseBody
	public String addGuide(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.addGuide(map);
	    return new Gson().toJson(resultMap);
	}

	//대시보드 3번 월판매율 
	@RequestMapping(value = "/admin/sales/monthly.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getMonthlySales() {
	    HashMap<String, Object> resultMap = adminService.getMonthlySales(); // 바로 호출
	    return new Gson().toJson(resultMap);
	}
	//대시보드 5번 최근판매한 상품 5개 
	@RequestMapping(value = "/admin/sales/latest.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getLatestSales() {
	    HashMap<String, Object> resultMap = adminService.getLatestSales();
	    return new Gson().toJson(resultMap);
	}
	//요청 게시판 글 5개 
	@RequestMapping(value = "/admin/request/latest.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getRequestSummary(@RequestParam HashMap<String, Object> map) {
	    return new Gson().toJson(adminService.getLatestRequests(map));
	}
	// 제휴문의 조회(승인대기, 승인거부)
	@RequestMapping(value = "/admin/partnership.dox", method = RequestMethod.POST)
	@ResponseBody
	public String getPartnershipList(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.getPartnershipList(map);
	    return new Gson().toJson(resultMap);
	}
	// 제휴문의 조회(승인대기, 승인거부)
	@RequestMapping(value = "/admin/partnership-edit.dox", method = RequestMethod.POST)
	@ResponseBody
	public String editPartnership(@RequestParam HashMap<String, Object> map) throws Exception {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap = adminService.editPartnership(map);
	    return new Gson().toJson(resultMap);
	}


}
