package com.example.kapture.board.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.kapture.board.model.Comment;
import com.example.kapture.board.model.Request;

@Mapper
public interface RequestMapper {

	List<Request> selectRequestList(HashMap<String, Object> map);
    
    int countRequestList(HashMap<String, Object> map);
	
	Request selectRequest(HashMap<String, Object> map);
	
	List<Comment> selectRequestCommentList(HashMap<String, Object> map);

	int insertRequestComment(HashMap<String, Object> map);

	int insertRequest(HashMap<String, Object> map);
	
	int updateRequest(HashMap<String, Object> map);

	void updateRequestStatus(HashMap<String, Object> map);

	int deleteRequest(HashMap<String, Object> map);

	int deleteRequestComment(HashMap<String, Object> map);

	int updateRequestComment(HashMap<String, Object> map);

	int acceptRequestStatus(HashMap<String, Object> map);

	HashMap<String, Object> selectCommentDetail(Integer commentNo);
	// 댓글 달리면 알림 정보 저장
	void insertAlarm(Map<String, Object> map);

	

}
