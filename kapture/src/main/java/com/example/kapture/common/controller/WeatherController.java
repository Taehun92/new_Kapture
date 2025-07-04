package com.example.kapture.common.controller;


import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.kapture.common.dao.WeatherService;

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

    @RequestMapping(value = "/getRegId.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getRegId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        resultMap = weatherService.getRegId(map);
        return new Gson().toJson(resultMap);
    }
}
