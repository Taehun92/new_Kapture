package com.example.kapture.login.dao;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService  {

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
	    OAuth2User oauth2User = super.loadUser(userRequest);
	    String registrationId = userRequest.getClientRegistration().getRegistrationId(); // google, twitter 등

	    System.out.println("✅ [OAuth2 로그인 정보]");
	    System.out.println("▶ Provider: " + registrationId);
	    System.out.println("▶ Access Token: " + userRequest.getAccessToken().getTokenValue());
	    System.out.println("▶ Attributes: " + oauth2User.getAttributes());

	    // 필요시 provider별 사용자 정보 가공 가능
	    if ("google".equals(registrationId)) {
	        // 구글 전용 처리 (예: 이메일/이름 추출)
	        String email = (String) oauth2User.getAttributes().get("email");
	        String name = (String) oauth2User.getAttributes().get("name");
	        System.out.println("✔ 구글 이메일: " + email);
	        System.out.println("✔ 구글 이름: " + name);
	    } else if ("twitter".equals(registrationId)) {
	        // Twitter는 추가 API 호출이 필요할 수 있음
	        System.out.println("ℹ 트위터는 기본 정보가 부족할 수 있습니다.");
	    }

	    return oauth2User;
	}
	
}
