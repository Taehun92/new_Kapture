<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
		<link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
		<title>Login | kapture</title>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
		<script src="https://cdn.tailwindcss.com"></script>
		<link rel="stylesheet" href="../../css/kapture-style.css">
	</head>

	<body class="bg-gray-100 font-sans">
		<jsp:include page="../common/header.jsp" />

		<div id="app" class="flex justify-center items-center min-h-screen px-4">
			<div class="w-[70%] max-w-2xl bg-white rounded-2xl shadow-lg p-12">
				<div class="flex justify-center mb-8">
					<img src="../../img/logo/kapture_Logo(2).png" alt="Kapture Logo" class="h-16" />
				</div>

				<h2 class="text-2xl font-bold text-center text-gray-800 mb-8">Login to Kapture</h2>

				<input type="text" v-model="email" placeholder="Email or ID"
					class="w-full mb-4 px-5 py-3 border border-gray-300 rounded-lg text-base focus:outline-none focus:ring-2 focus:ring-blue-950">

				<input type="password" v-model="password" placeholder="Password" @keyUp.enter="login"
					class="w-full mb-4 px-5 py-3 border border-gray-300 rounded-lg text-base focus:outline-none focus:ring-2 focus:ring-blue-950">

				<div class="text-red-500 text-sm mb-4" v-if="errorMessage">{{ errorMessage }}</div>

				<button @click="login"
					class="w-full bg-blue-700 hover:bg-blue-950 text-white text-lg font-semibold py-3 rounded-lg mb-8">
					Login
				</button>

				<!-- 소셜 로그인 버튼 -->
				<div class="flex justify-center gap-6 mb-8">
					<!-- Google -->
					<a :href="googleLoginUrl"
						class="w-14 h-14 rounded-full bg-white shadow flex justify-center items-center">
						<img src="../../img/google.png" alt="Google 로그인" class="w-14 h-14 rounded-full" />
					</a>

					<!-- Twitter (X) -->
					<button @click="getTwitAuthCodeUrl"
						class="w-14 h-14 rounded-full bg-black shadow flex justify-center items-center">
						<img src="../../img/x.jpg" alt="X 로그인" class="w-14 h-14 rounded-full" />
					</button>

					<!-- Facebook -->
					<button @click="getFacebookAuthUrl"
						class="w-14 h-14 rounded-full bg-white shadow flex justify-center items-center">
						<img src="../../img/facebook.png" alt="Facebook 로그인" class="w-14 h-14 rounded-full" />
					</button>
				</div>


				<!-- 회원가입/비번찾기 링크 -->
				<div class="text-center text-base text-gray-600">
					Don't have an account?
					<a href="/join.do" class="text-blue-600 hover:underline">Sign up here</a><br />
					Forgot your password?
					<a href="/find-id.do" class="text-blue-600 hover:underline">Find it here</a>
				</div>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp" />

		<script>
			const app = Vue.createApp({
				data() {
					return {
						email: "",
						password: "",
						errorMessage: "",
						googleLoginUrl: "/google/login?returnUrl=/main.do"
					};
				},
				methods: {
					login() {
						const self = this;

						if (!self.email || !self.password) {
							self.errorMessage = "Please enter both email and password.";
							return;
						}

						$.ajax({
							url: "/login.dox",
							type: "POST",
							dataType: "json",
							data: {
								email: self.email,
								password: self.password
							},
							success(data) {
								if (data.result === "success") {
									alert(data.login.userFirstName + "님 환영합니다!");
									location.href = "/main.do";
								} else {
									self.errorMessage = data.message || "Login failed. Please try again.";
								}
							},
							error() {
								self.errorMessage = "Server error. Please try again later.";
							}
						});
					},

					getTwitAuthCodeUrl() {
						$.ajax({
							type: "POST",
							url: "/twitter/auth-code-url.dox",
							dataType: "json",
							data: { returnUrl: "/main.do" },
							success: function (res) {
								if (res.result === "success") {
									window.location.href = res.url;

								} else {
									alert("트위터 로그인 URL 생성 실패");
								}
							},
							error: function (xhr, status, error) {
								alert("트위터 로그인에 실패했습니다.");
							}
						});
					},
					
					getFacebookAuthUrl() {
						$.ajax({
							type: "POST",
							url: "/facebook/login-url.dox",
							dataType: "json",
							data: {
								redirectUri: "https://c814-14-37-8-141.ngrok-free.app/oauth/facebook/callback",  // 페북 리디렉션용
								returnUrl: "/main.do"  // 로그인 성공 후 돌아갈 페이지
							},  // 로그인 후 리디렉션될 URL
							
							success: function (res) {
								if (res.result === "success") {

									// 페이스북 로그인 URL로 리디렉션
									window.location.href = res.url;
								} else {
									alert("페이스북 로그인 URL 생성 실패");
								}
							},
							error: function (xhr, status, error) {
								alert("페이스북 로그인에 실패했습니다.");
							}
						});
					}
				}
			});
			app.mount('#app');
		</script>
	</body>

	</html>