<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.7.1.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.snow.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.min.js"></script>
		<script src="https://cdn.tailwindcss.com"></script>
		<link rel="stylesheet" href="../../css/kapture-style.css">
		<link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
		<link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
		<title>상품 추가 | kapture</title>

	</head>

	<body class="bg-white font-sans text-gray-800">
		<jsp:include page="../common/header.jsp" />

		<div id="app" class="flex max-w-6xl mx-auto px-6 py-8 gap-10 min-h-[700px]">
			<!-- 사이드바 -->
			<div class="w-56 bg-white shadow-md p-4 rounded">
				<ul class="space-y-2 font-semibold">
					<li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-schedule.do' }"
							href="/mypage/guide-schedule.do" class="block px-3 py-2 rounded hover:bg-blue-100">나의
							스케줄</a></li>
					<li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-mypage.do' }"
							href="/mypage/guide-mypage.do" class="block px-3 py-2 rounded hover:bg-blue-100">가이드
							정보수정</a></li>
					<li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-add.do' }"
							href="/mypage/guide-add.do" class="block px-3 py-2 rounded hover:bg-blue-950">여행상품 등록</a>
					</li>
					<li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-sales-list.do' }"
							href="/mypage/guide-sales-list.do"
							class="block px-3 py-2 rounded hover:bg-blue-100">상품 목록</a></li>
					<li><a :class="{ 'bg-blue-950 text-white': currentPage === 'qna.do' }" href="/cs/qna.do"
							class="block px-3 py-2 rounded hover:bg-blue-100">문의하기</a></li>
					<li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-qna.do' }"
							href="/mypage/guide-qna.do" class="block px-3 py-2 rounded hover:bg-blue-100">문의 내역 확인</a>
					</li>
				</ul>

			</div>

			<!-- 콘텐츠 영역 -->
			<div class="flex-1 space-y-6">
				<div class="bg-white border rounded shadow p-6">
					<div class="text-lg font-bold mb-6">여행상품 등록</div>

					<!-- 제목 -->
					<div class="mb-4">
						<label class="block font-semibold mb-1">제목</label>
						<input v-model="title" class="w-full border px-3 py-2 rounded" />
					</div>

					<!-- 날짜 / 소요시간 / 차량 제공 / 가격 -->
					<div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
						<!-- 날짜 -->
						<div>
							<label class="block font-semibold mb-1">날짜</label>
							<input type="date" v-model="tourDate" :min="minDate"
								class="w-full border px-3 py-2 rounded" />
						</div>
						<!-- 소요시간 -->
						<div>
							<label class="block font-semibold mb-1">소요시간</label>
							<select v-model="duration" class="w-full border px-3 py-2 rounded">
								<option value="">:: 선택 ::</option>
								<option value="오전">오전</option>
								<option value="오후">오후</option>
								<option value="종일">종일</option>
							</select>
						</div>
						<!-- 차량 제공 -->
						<div>
							<label class="block font-semibold mb-1">차량 제공</label>
							<select v-model="vehicle" class="w-full border px-3 py-2 rounded">
								<option value="COMPANY">회사 차량 제공</option>
								<option value="GUIDE">가이드 차량 이용</option>
								<option value="PUBLIC">대중교통 이용</option>
							</select>
						</div>
					</div>
					<!-- 가격 -->
					<div>
						<label class="block font-semibold mb-1">가격</label>
						<input v-model="price" class="w-full border px-3 py-2 rounded mb-3" />
					</div>
					<!-- 시/구/상위테마/테마 -->
					<div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-4">
						<div>
							<label class="block font-semibold mb-1">시</label>
							<select @change="fnSelectGu()" v-model="siName" class="w-full border px-3 py-2 rounded">
								<option value="">:: 선택 ::</option>
								<template v-for="item in siList">
									<option :value="item.siName">{{item.siName}}</option>
								</template>
							</select>
						</div>
						<div>
							<label class="block font-semibold mb-1">구</label>
							<select v-model="guName" class="w-full border px-3 py-2 rounded">
								<option value="">:: 선택 ::</option>
								<template v-for="item in guList">
									<option :value="item.guName">{{item.guName}}</option>
								</template>
							</select>
						</div>
						<div>
							<label class="block font-semibold mb-1">상위테마</label>
							<select @change="fnSelectTheme()" v-model="themeParent"
								class="w-full border px-3 py-2 rounded">
								<option value="">:: 선택 ::</option>
								<template v-for="item in themeParentList">
									<option :value="item.themeName">{{item.themeName}}</option>
								</template>
							</select>
						</div>
						<div>
							<label class="block font-semibold mb-1">테마</label>
							<select v-model="themeName" class="w-full border px-3 py-2 rounded">
								<option value="">:: 선택 ::</option>
								<template v-for="item in themeNameList">
									<option :value="item.themeName">{{item.themeName}}</option>
								</template>
							</select>
						</div>
					</div>

					<!-- 내용 -->
					<div class="mt-6">
						<label class="block font-semibold mb-2">내용</label>
						<div id="editor" class="w-full h-[600px] border rounded"></div>
					</div>

					<!-- 저장 버튼 -->
					<div class="text-right mt-6">
						<button @click="fnSave"
							class="bg-blue-950 text-white px-6 py-2 rounded hover:bg-blue-700">저장</button>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp" />
	</body>

	</html>
	<script>
		const app = Vue.createApp({
			data() {
				return {
					title: "",
					description: "",
					duration: "",
					price: "",
					sessionId: "${sessionId}",
					tourDate: "",
					siNo: "",
					guNo: "",
					siList: [],
					guList: [],
					siName: "",
					guName: "",
					themeParentList: [],
					themeList: [],
					themeName: "",
					themeParent: "",
					themeNameList: [],
					currentPage: "",
					vehicle: "PUBLIC",
					imgList: [],
					minDate: new Date().toISOString().split("T")[0]
				};
			},
			methods: {
				fnSave() {
					let self = this;
					let nparmap = {
						title: self.title,
						description: self.description,
						duration: self.duration,
						price: self.price,
						tourDate: self.tourDate,
						siName: self.siName,
						guName: self.guName,
						sessionId: self.sessionId,
						themeName: self.themeName,
						vehicle: self.vehicle
					};

					if (self.sessionId == "") {
						alert("로그인 후 이용 가능합니다.");
						location.href = "/login.do";
						return;
					}

					if (self.title == "") {
						alert("제목을 입력하세요.");
						return;
					}

					if (self.duration == "") {
						alert("소요시간을 선택하세요.");
						return;
					}

					if (self.price == "") {
						alert("가격을 입력하세요.");
						return;
					}

					if (isNaN(self.price)) {
						alert("가격은 숫자만 입력 가능합니다.");
						return;
					}

					if (self.price < 0) {
						alert("가격은 0보다 커야합니다.");
						return;
					}

					if (self.tourDate == "") {
						alert("날짜를 입력하세요.");
						return;
					}

					if (self.siName == "") {
						alert("시를 선택하세요.");
						return;
					}

					if (self.guName == "") {
						alert("구를 선택하세요.");
						return;
					}

					if (self.themeParent == "") {
						alert("상위테마를 선택하세요.");
						return;
					}

					if (self.themeName == "") {
						alert("테마를 선택하세요.");
						return;
					}

					if (self.description == "") {
						alert("내용을 입력하세요.");
						return;
					}

					if (self.vehicle === "") {
						alert("차량 제공 정보를 선택하세요.");
						return;
					}

					$.ajax({
						url: "/mypage/guide-add.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							if (data.result == 'success') {
								console.log('data : ', data);
								console.log(self.sessionId);
								console.log(self.siName);
								console.log(self.guName);
								alert("등록되었습니다.");

								if (self.imgList.length > 0) {
									self.fnUpdateImgList(data.tourNo);
								} else {
									location.href = "/tours/list.do";
								}
							}
						}
					});
				},

				fnSelectSi() {
					let self = this;
					let nparmap = {
						// siList:self.siList,
						// selectsi:self.selectsi
					};
					$.ajax({
						url: "/common/getSiList.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							self.siList = data.siList;

						}
					});
				},

				fnSelectGu() {
					let self = this;
					// if(){}
					let nparmap = {
						siName: self.siName
					};
					$.ajax({
						url: "/common/getGuList.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							self.guList = data.guList;
						}
					});
				},

				fnGetThemeParentList() {
					let self = this;
					let nparmap = {
					};
					$.ajax({
						url: "/common/getThemeParentList.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							self.themeParentList = data.themeParentList;

						}
					});
				},

				fnSelectTheme() {
					let self = this;
					let nparmap = {
						themeParent: self.themeParent
					};
					$.ajax({
						url: "/common/getThemeList.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							self.themeNameList = data.themeNameList;
						}
					});
				},

				fnUpdateImgList(tourNo) {
					let self = this;
					let imageUrls = self.imgList.map(img => img.url);
					let nparmap = {
						tourNo: tourNo,
						imgList: JSON.stringify(imageUrls), // URL만 전송
						thumbnailList: JSON.stringify(self.imgList) // 전체 데이터도 전송 (썸네일 구분용)


					};
					console.log('imgList : ', self.imgList);
					$.ajax({
						url: "/mypage/updateImg.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							if (data.result == 'success') {
								console.log('data : ', data);
								alert("이미지 등록되었습니다.");
								location.href = "/tours/list.do";
							}
						}
					})
				},



			},
			mounted() {
				if (!this.sessionId || this.sessionRole === 'TOURIST') {
					alert("가이드만 이용가능합니다.");
					location.href = "http://localhost:8080/main.do";
				}

				let self = this;
				let quill = new Quill('#editor', {
					theme: 'snow',
					modules: {
						toolbar: {
							container: [
								[{ 'header': [1, 2, 3, false] }],
								['bold', 'italic', 'underline'],
								[{ 'list': 'ordered' }, { 'list': 'bullet' }],
								['link', 'image'],
								[{ 'color': [] }, { 'background': [] }],
								[{ 'align': [] }],
								['clean']
							],
							handlers: {
								image: function () {
									let input = document.createElement('input');
									input.setAttribute('type', 'file');
									input.setAttribute('accept', 'image/*');
									input.click();

									input.onchange = async () => {
										let file = input.files[0];
										if (!file) return;

										let formData = new FormData();
										formData.append("file", file);

										try {
											let response = await fetch("/upload/image", {
												method: "POST",
												body: formData
											});

											let result = await response.json();

											if (result.success) {
												let range = quill.getSelection();
												quill.insertEmbed(range.index, 'image', result.imageUrl);

												let thumbnailFlag = self.imgList.length === 0 ? "Y" : "N";

												self.imgList.push({
													url: result.imageUrl,
													thumbnail: thumbnailFlag
												});


											} else {
												alert("이미지 업로드 실패");
											}
										} catch (error) {
											console.error("이미지 업로드 중 오류 발생:", error);
										}
									};
								}
							}
						}
					}
				});

				quill.on('text-change', function () {
					self.description = quill.root.innerHTML;
				});

				self.fnSelectSi();
				self.fnGetThemeParentList();
				this.currentPage = window.location.pathname.split('/').pop();
			}
		});
		app.mount('#app');
	</script>