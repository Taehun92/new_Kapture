package com.example.kapture.terms.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.terms.model.Terms;

@Mapper
public interface TermsMapper {

	Terms selectTerms(HashMap<String, Object> map);

	int updateTerms(HashMap<String, Object> map);

}
