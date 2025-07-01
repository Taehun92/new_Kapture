package com.example.kapture.common.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;

import com.example.kapture.common.dao.GeminiService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/gemini")
public class GeminiController {

	private final GeminiService geminiService;

    @GetMapping("/chat")
    public ResponseEntity<?> gemini(@RequestParam String input) {  // userInput 값 받기
        try {
            // 받은 입력값을 geminiService로 전달하여 처리
            return ResponseEntity.ok().body(geminiService.getContents(input));
        } catch (HttpClientErrorException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
