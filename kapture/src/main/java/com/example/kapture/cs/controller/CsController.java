package com.example.kapture.cs.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.kapture.cs.dao.CsService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class CsController {

	@Autowired
	CsService csService;

	@RequestMapping("/cs/main.do")
	public String main(Model model) throws Exception {
		return "cs/main";
	}

	@RequestMapping("/cs/faq.do")
	public String login(Model model) throws Exception {
		return "cs/faq";
	}

	@RequestMapping("/cs/notice.do")
	public String notice(Model model) throws Exception {
		return "cs/notice";
	}

	@RequestMapping("/cs/qna.do")
	public String qna(Model model) throws Exception {
		return "cs/qna";
	}

	@RequestMapping("/cs/privacy.do")
	public String privacy(Model model) throws Exception {
		return "cs/privacy";
	}

	@RequestMapping("/cs/search.do")
	public String search(Model model) throws Exception {
		return "cs/search";
	}

	@RequestMapping("/cs/partnership.do")
	public String partnership(Model model) throws Exception {
		return "cs/partnership";
	}

	// 게시글 목록
	@RequestMapping(value = "/cs/faq.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String csMain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		resultMap = csService.csFaq(map);
		return new Gson().toJson(resultMap);
	}

	// 공지사항
	@RequestMapping(value = "/cs/notice.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String notice(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		resultMap = csService.csNotice(map);
		return new Gson().toJson(resultMap);
	}

	// 문의글 추가
	@RequestMapping(value = "/cs/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String csAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		resultMap = csService.qnaAdd(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/cs/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String search(@RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = csService.searchAll(map);
		return new Gson().toJson(resultMap);
	}

	// 제휴문의 추가
	@RequestMapping(value = "/cs/partnershipSave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String partnershipSave(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		resultMap = csService.savePartnership(map);
		return new Gson().toJson(resultMap);
	}
	// 문의시 알림 정보 저장
	@RequestMapping(value = "/cs/registerQnaAlarm.dox", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerQnaAlarm(@RequestParam HashMap<String, Object> map) {
	    Map<String, Object> result = new HashMap<>();

	    try {
	        csService.registerAdminQnaAlarm(map);  // map 통째로 넘김
	        result.put("result", "success");
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("result", "fail");
	    }

	    return result;
	}
	// 제휴 요청시 알림 정보 저장
	@RequestMapping(value = "/cs/registerPartnershipAlarm.dox", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerPartnershipAlarm(@RequestParam HashMap<String, Object> map) {
	    Map<String, Object> result = new HashMap<>();

	    try {
	        csService.registerPartnershipAlarm(map);  // map 통째로 넘김
	        result.put("result", "success");
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("result", "fail");
	    }

	    return result;
	}
}
