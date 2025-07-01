package com.example.kapture.terms.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.terms.mapper.TermsMapper;
import com.example.kapture.terms.model.Terms;

@Service
public class TermsService {

	@Autowired
	TermsMapper termsMapper;

	public HashMap<String, Object> getTerms(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Terms terms = termsMapper.selectTerms(map);
			resultMap.put("terms", terms);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> saveTerms(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			int num = termsMapper.updateTerms(map);
			resultMap.put("num", num);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

}
