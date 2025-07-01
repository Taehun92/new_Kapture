package com.example.kapture.common.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.kapture.common.mapper.WeatherMapper;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class WeatherService {
	
	@Autowired
	WeatherMapper weatherMapper;
	
	@Value("${weather.api.key}")
    private String weatherApiKey;

    @Value("${weather.api.url}")
    private String weatherApiUrl;

    
    public Map<String, Object> getMidForecast(String regId) throws Exception {
        Map<String, Object> result = new HashMap<>();

        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String baseTime = "0600";
        String tmFc = today + baseTime;

        StringBuilder sb = new StringBuilder();
        sb.append(weatherApiUrl).append("?serviceKey=").append(URLEncoder.encode(weatherApiKey, "UTF-8"))
          .append("&pageNo=1")
          .append("&numOfRows=10")
          .append("&dataType=JSON")
          .append("&regId=").append(URLEncoder.encode(regId, "UTF-8"))
          .append("&tmFc=").append(tmFc);

        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            response.append(line);
        }
        br.close();

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> data = mapper.readValue(response.toString(), Map.class);

        result.put("status", "success");
        result.put("data", data);

        return result;
    }
	
	

}
