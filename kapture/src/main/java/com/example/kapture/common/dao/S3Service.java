package com.example.kapture.common.dao;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.PutObjectRequest;
import com.example.kapture.mypage.dao.MyPageService;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;

@Service
public class S3Service {

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    private final AmazonS3 s3Client;
    private final MyPageService myPageService;

    public S3Service(AmazonS3 s3Client, MyPageService myPageService) {
        this.s3Client = s3Client;
        this.myPageService = myPageService;
    }

    public ResponseEntity<Map<String, Object>> uploadImageAndSaveToDB(MultipartFile file) {
        Map<String, Object> response = new HashMap<>();

        try {
            String originalFilename = file.getOriginalFilename();
            String extName = originalFilename.substring(originalFilename.lastIndexOf("."));
            String saveFileName = UUID.randomUUID() + extName;
            String folder = "project-kapture/uploads";
            String s3Path = folder + "/" + saveFileName;

            // ✅ S3 업로드
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentLength(file.getSize());
            metadata.setContentType(file.getContentType());
            s3Client.putObject(new PutObjectRequest(bucket, s3Path, file.getInputStream(), metadata).withCannedAcl(CannedAccessControlList.PublicRead));
            String imageUrl = s3Client.getUrl(bucket, s3Path).toString();

            // ✅ DB 저장 (기존 로직 유지)
            HashMap<String, Object> map = new HashMap<>();
            map.put("filename", saveFileName);
            map.put("path", "/uploads/" + saveFileName);  // 상대 경로로 저장
            map.put("originFilename", originalFilename);
            myPageService.addToursImg(map);

            response.put("success", true);
            response.put("imageUrl", imageUrl);
            return ResponseEntity.ok(response);

        } catch (IOException e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "이미지 업로드 실패");
            return ResponseEntity.status(500).body(response);
        }
    }
}
