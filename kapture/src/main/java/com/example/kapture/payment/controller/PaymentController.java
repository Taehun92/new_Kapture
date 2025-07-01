package com.example.kapture.payment.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.example.kapture.payment.dao.PaymentService;
import com.example.kapture.payment.model.Payment;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@Value("${iamport.api.key}")
	private String apiKey;

	@Value("${iamport.api.secret}")
	private String apiSecret;

	@Value("${exchange.api.key}")
	private String exchangeApiKey;

	@Autowired
	private Environment env;

	private Map<String, Object> cachedRates = null;

	private LocalDate lastFetchedDate = null;

	@RequestMapping("/payment.do")
	public String payment(Model model) throws Exception {
		return "/payment/payment";
	}

	// 결제 성공 시 주소(회원 정보 수정)
	@RequestMapping("/payment/success.do")
	public String paymentSuccess(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		return "/payment/success";
	}

	// 장바구니 목록 조회
	@RequestMapping(value = "/payment/getBasketInfoList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String basketInfoList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = paymentService.getBasketInfoList(map);
		return new Gson().toJson(resultMap);
	}

	// 결제 정보 저장
	@RequestMapping(value = "/payment/save.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String savePayment(@RequestBody HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = paymentService.savePayment(map);
		return new Gson().toJson(resultMap);
	}

	// 결제 완료 시 작업
	@RequestMapping(value = "/payment/success.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String showPaymentSuccess(@RequestParam("merchantId") String merchantId, Model model) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(">>>>>>>>" + merchantId);
		// 1. 구매 내역 조회
		resultMap = paymentService.getPaymentList(merchantId);
		System.out.println("중간 응답 resultMap: " + resultMap);
		// 2. 결제된 상품 예약 상태 처리 + 장바구니 삭제 처리
		@SuppressWarnings("unchecked")
		List<Payment> paymentList = (List<Payment>) resultMap.get("paymentList");
		paymentService.processPaymentSuccess(paymentList);

		System.out.println("최종 응답 resultMap: " + resultMap);
		return new Gson().toJson(resultMap);
	}

	// 장바구니 목록 삭제
	@RequestMapping(value = "/payment/removeBasket.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String basketRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = paymentService.removeBasket(map);
		return new Gson().toJson(resultMap);
	}

	// 환율 계산 (일, 미, 중)
	@RequestMapping("/exchangeRate/all")
	@ResponseBody
	public Map<String, Object> getAllExchangeRates() throws Exception {
		String apiKey = env.getProperty("exchange.api.key"); // API 키
		RestTemplate restTemplate = new RestTemplate();

		// ✅ static 변수로 캐시 데이터 유지
		// (Spring에서 이 컨트롤러는 싱글톤으로 유지되므로 안전)
		if (cachedRates != null && lastFetchedDate != null && lastFetchedDate.equals(LocalDate.now())) {
			return cachedRates; // 오늘 이미 호출했다면 캐시 반환
		}

		Map<String, Object> result = new HashMap<>();
		Map<String, String> currencies = new HashMap<>();
		currencies.put("USD", "USD");
		currencies.put("JPY", "JPY");
		currencies.put("CNY", "CNY");

		for (Map.Entry<String, String> entry : currencies.entrySet()) {
			String code = entry.getKey();
			String urlStr = "https://v6.exchangerate-api.com/v6/" + apiKey + "/pair/" + code + "/KRW";

			ResponseEntity<String> response = restTemplate.getForEntity(urlStr, String.class);
			JSONObject json = new JSONObject(response.getBody());

			double rate = json.getDouble("conversion_rate");
			result.put(code, rate);
		}

		// ✅ 캐시 갱신
		cachedRates = result;
		lastFetchedDate = LocalDate.now();

		return result;
	}

	// 결제 후 요청사항 저장
	@RequestMapping(value = "/payment/requestMessageSave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String saveRequestMessages(@RequestBody Map<String, Object> data) throws Exception {
		List<Map<String, Object>> requests = (List<Map<String, Object>>) data.get("requests");

		Map<String, Object> result = paymentService.saveAllRequestMessages(requests);

		return new Gson().toJson(result);
	}

	// 결제 성공시 알림 정보 저장
	@RequestMapping(value = "/payment/registerPaymentAlarm.dox", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerPaymentAlarm(@RequestParam Map<String, Object> map) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			paymentService.registerPaymentAlarm(map);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
		}

		return result;
	}
}
