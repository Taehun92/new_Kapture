package com.example.kapture.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.kapture.board.dao.RequestService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class RequestController {

	@Autowired
	RequestService requestService;
	
	@RequestMapping("/request/list.do") 
	public String list(Model model) throws Exception{
    return "/board/request-list";
	}
	
	@RequestMapping("/request/add.do") 
	public String add(Model model) throws Exception{
    return "/board/request-add";
	}
	
	@RequestMapping("/request/view.do")
    public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board/request-view";
    }
	
	@RequestMapping("/request/edit.do")
    public String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board/request-edit";
    }
	
	
	
	// 게시글 목록 조회
	@RequestMapping(value = "/request/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestList(Model model, @RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
	    resultMap = requestService.getRequestList(map);
	    return new Gson().toJson(resultMap);
	}

	
	// 게시글 작성
	@RequestMapping(value = "/request/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.addRequest(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 수정
	@RequestMapping(value = "/request/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.editRequest(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 조회
	@RequestMapping(value = "/request/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestGet(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.getRequest(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/request/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.removeRequest(map);
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 작성
	@RequestMapping(value = "/request/comment/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestCommentAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.addRequestComment(map);
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 수정
	@RequestMapping(value = "/request/comment/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestCommentEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.editRequestComment(map);
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/request/comment/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestCommentRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.removeRequestComment(map);
		return new Gson().toJson(resultMap);
	}
	
	// 답변 채택
	@RequestMapping(value = "/request/accept.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String requestAccept(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = requestService.acceptRequest(map);
		return new Gson().toJson(resultMap);
	}
	// 댓글 달리면 알림 정보 저장
	@RequestMapping(value = "/request/registerCommentAlarm.dox", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerCommentAlarm(@RequestParam Map<String, Object> map) throws Exception {
	    Map<String, Object> resultMap = new HashMap<>();
	    try {
	    	requestService.registerAlarm(map);
	        resultMap.put("result", "success");
	    } catch (Exception e) {
	        resultMap.put("result", "fail");
	    }
	    return resultMap;
	}
	
	
}
