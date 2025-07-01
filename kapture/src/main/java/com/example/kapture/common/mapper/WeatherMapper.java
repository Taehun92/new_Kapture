package com.example.kapture.common.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.common.model.Weather;

@Mapper
public interface WeatherMapper {
	
	Weather selectWeather(HashMap<String, Object> map);

}
