package com.example.kapture.common.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.kapture.common.dao.WeatherService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/weather")
public class WeatherController {

    @Autowired
    WeatherService weatherService;

    @RequestMapping("/mid-forecast.do")
    @ResponseBody
    public Map<String, Object> getMidForecast(@RequestParam String regId) {
        Map<String, Object> result;
        try {
            result = weatherService.getMidForecast(regId);
        } catch (Exception e) {
            result = Map.of(
                    "status", "error",
                    "message", e.getMessage()
            );
            e.printStackTrace();
        }
        return result;
    }
}
