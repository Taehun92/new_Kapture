package com.example.kapture.common.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.example.kapture.common.dao.S3Service;

@RestController
@CrossOrigin(origins = "*")
public class FileUploadController {

    private final S3Service s3Service;

    public FileUploadController(S3Service s3Service) {
        this.s3Service = s3Service;
    }

    @GetMapping("/test")
    public String test() {
        return "Hello Spring Boot";
    }

    @PostMapping("/upload")
    public Map<String, String> upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST, "파일을 업로드해주세요"
            );
        }
        String url = s3Service.uploadFile(file);
        return Collections.singletonMap("url", url);
    }
}

