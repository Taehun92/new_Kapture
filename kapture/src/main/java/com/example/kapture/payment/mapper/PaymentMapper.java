package com.example.kapture.payment.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.kapture.payment.model.Payment;

@Mapper
public interface PaymentMapper {

	List<Payment> selectPaymentList(HashMap<String, Object> map);

	int insertPayment(HashMap<String, Object> map);
	
	List<Payment> selectPaymentDetails(int paymentNo);

	void updateTourDeleteYn(int tourNo);
	
	List<Payment> selectPayment(String merchantId);
	
	void deleteBasketsByNo(@Param("basketNoList") List<Integer> basketNoList);

	int deleteBasket(HashMap<String, Object> map);
	// 해당 유저의 가장 최근 결제 번호 가져오기
	void updateRequestMessage(Map<String, Object> request);
	// 결제 성공시 알림 정보 저장
	void insertAlarm(Map<String, Object> map);
	
    Integer selectLatestPaymentNo(int userNo);
}
