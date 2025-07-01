package com.example.kapture.common.dao;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class S3Service {

    private final S3Client s3Client;

    @Value("${aws.s3.bucket-name}")
    private String bucketName;

    @Value("${aws.region}")
    private String region;

    public S3Service(S3Client s3Client) {
        this.s3Client = s3Client;
    }

    /**
     * MultipartFile을 S3에 업로드하고, 퍼블릭 URL을 반환
     */
    public String uploadFile(MultipartFile file) {
        try {
            // 1) 원본 파일명 기반 (충돌 위험 있음)
            // String key = file.getOriginalFilename();

            // 2) 날짜 + UUID 폴더 구조로 충돌 방지
            String datePath = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            String uuid = UUID.randomUUID().toString();
            String original = file.getOriginalFilename();
            String key = String.format("%s/%s_%s", datePath, uuid, original);

            // S3 Put 요청 생성
            PutObjectRequest putReq = PutObjectRequest.builder()
                    .bucket(bucketName)
                    .key(key)
                    .contentType(file.getContentType())
                    .build();

            // 업로드 실행
            s3Client.putObject(
                putReq,
                RequestBody.fromBytes(file.getBytes())
            );

            // 반환할 퍼블릭 URL 조합
            return String.format("https://%s.s3.%s.amazonaws.com/%s",
                                 bucketName, region, key);

        } catch (IOException e) {
            throw new RuntimeException("파일 업로드 실패", e);
        }
    }
}
