package com.example.kapture.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.board.mapper.RequestMapper;
import com.example.kapture.board.model.Comment;
import com.example.kapture.board.model.Request;

@Service
public class RequestService {

	@Autowired
	RequestMapper requestMapper;

	// 요청 글 조회 
	public HashMap<String, Object> getRequestList(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            // 파라미터에서 pageSize, offset, page를 그대로 사용
        	List<Request> requestList = requestMapper.selectRequestList(map);
            int totalCount = requestMapper.countRequestList(map);

            int pageSize = Integer.parseInt(map.getOrDefault("pageSize", "10").toString());
            int totalPages = (int) Math.ceil((double) totalCount / pageSize);

            resultMap.put("result", "success");
            resultMap.put("requestList", requestList);
            resultMap.put("totalPages", totalPages);

        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("result", "fail");
        }

        return resultMap;
    }

	public HashMap<String, Object> addRequest(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = requestMapper.insertRequest(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	public HashMap<String, Object> editRequest(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = requestMapper.updateRequest(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	

	public HashMap<String, Object> getRequest(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Request info = requestMapper.selectRequest(map);
			List<Comment> commentList = requestMapper.selectRequestCommentList(map);
			resultMap.put("result", "success");
			resultMap.put("info", info);
			resultMap.put("commentList", commentList);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> addRequestComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = requestMapper.insertRequestComment(map);
			int commentNo = (int) map.get("commentNo");
			System.out.println(">>>>>>" + commentNo);
			HashMap<String, Object> comment = requestMapper.selectCommentDetail(commentNo);
			System.out.println(comment);
			requestMapper.updateRequestStatus(map);
			resultMap.put("comment", comment);
			resultMap.put("result", "success");
			resultMap.put("num", num);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> removeRequest(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = requestMapper.deleteRequest(map);
			int num2 = requestMapper.deleteRequestComment(map);
			requestMapper.updateRequestStatus(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
			resultMap.put("num2", num2);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> editRequestComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = requestMapper.updateRequestComment(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> removeRequestComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = requestMapper.deleteRequestComment(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> acceptRequest(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int num = requestMapper.acceptRequestStatus(map);
			resultMap.put("result", "success");
			resultMap.put("num", num);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	// 댓글 달리면 알림 정보 저장
	public void registerAlarm(Map<String, Object> map) throws Exception {
		System.out.println("map=======>"+map);
		requestMapper.insertAlarm(map);
	}
	
	
}
