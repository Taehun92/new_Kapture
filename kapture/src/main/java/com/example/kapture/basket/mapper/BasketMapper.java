package com.example.kapture.basket.mapper;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.basket.model.Basket;

@Mapper
public interface BasketMapper {

	// 장바구니 추가
	void insertBasket(HashMap<String, Object> map);
	
	int existsBasketItem(HashMap<String, Object> map);

	int selectCount(HashMap<String, Object> map);
	
	Date selectMinTourDate(HashMap<String, Object> map);

	List<Date> selectTourDateList(HashMap<String, Object> map);

	Date selectMaxTourDate(HashMap<String, Object> map);

	List<Basket> selectBasketList(HashMap<String, Object> map);

	Basket selectBasketByNo(Integer basketNo);

	void updateBasket(HashMap<String, Object> map);

}
