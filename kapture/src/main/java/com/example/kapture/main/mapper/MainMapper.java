package com.example.kapture.main.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.main.model.Main;
import com.example.kapture.tours.model.Tours;

@Mapper
public interface MainMapper {

	List<Tours> selectTourandRatingList(HashMap<String, Object> map);

	List<Main> selectReviewList(HashMap<String, Object> map);

}
