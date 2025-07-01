package com.example.kapture.basket.mapper;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.basket.model.WishList;


@Mapper
public interface WishListMapper {

	List<WishList> selectWishList(HashMap<String, Object> map);

	int insertWishList(HashMap<String, Object> map);

	int deleteWishList(HashMap<String, Object> map);

}
