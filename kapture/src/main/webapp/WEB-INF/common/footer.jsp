<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<script src="https://cdn.tailwindcss.com"></script>
		<link rel="stylesheet" href="../../css/kapture-style.css">
		<title>푸터</title>
	</head>

	<body>
		<div id="footer" class="bg-gray-300 text-gray-700 text-md px-6 py-6">
			<div class="max-w-[70%] mx-auto">
				<!-- 상단 텍스트 링크 -->
				<div class="flex flex-wrap gap-4 mb-4 font-medium">
					<a href="/cs/notice.do" @click="fnPrivacy" class="hover:text-blue-700">공지사항</a>
					<a href="/cs/privacy.do" @click="fnPrivacy" class="hover:text-blue-700">이용약관</a>
					<a href="/cs/privacy.do" @click="fnPrivacy" class="hover:text-blue-700">개인정보 처리방침</a>
				</div>

				<!-- 메인 내용 -->
				<div class="flex flex-col md:flex-row justify-between items-start gap-8">
					<!-- 회사 정보 -->
					<div class="space-y-1 leading-relaxed">
						<div>상호 : (주) 캡쳐여행사 | 대표 : 이태훈</div>
						<div>주소 : 인천광역시 부평구 경원대로 1366 7층 더조은컴퓨터아카데미</div>
						<div>사업자등록번호 : 999-99-00001 | 통신판매업신고번호 : 제 2025-90000 호</div>
						<div>이메일 : kapture_auth@gmail.com</div>
						<div>Copyright ⓒ 캡쳐여행사 All Rights Reserved. Powered by K-apture Corp.</div>
					</div>

					<!-- 아이콘 영역 (현재 주석 처리된 상태) -->
					<!-- <div class="flex flex-col items-end space-y-2">
				<div class="flex gap-2">
					<img src="/images/icon-twitter.svg" alt="Twitter">
					<img src="/images/icon-facebook.svg" alt="Facebook">
					<img src="/images/icon-instagram.svg" alt="Instagram">
				</div>
				<div class="flex gap-2">
					<img src="/images/pay-visa.png" alt="Visa">
					<img src="/images/pay-mastercard.png" alt="MasterCard">
					<img src="/images/pay-paypal.png" alt="PayPal">
					<img src="/images/pay-applepay.png" alt="Apple Pay">
					<img src="/images/pay-gpay.png" alt="Google Pay">
				</div>
			</div> -->
				</div>
			</div>
		</div>
	</body>

	<script>
		const footer = Vue.createApp({
			data() {
				return {};
			},
			methods: {
				fnPrivacy: function () {
					location.href = "/cs/privacy.do"
				}
			},
			mounted() {

			}
		});

		footer.mount('#footer');
	</script>

	</html>