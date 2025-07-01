<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.min.js"></script>
	<script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
	<link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
  	<link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
	<title>상품 수정 | kapture</title>
</head>
<body class="bg-white font-sans text-gray-800">
	<jsp:include page="../common/header.jsp" />
	
	<div id="app" class="flex max-w-6xl mx-auto px-6 py-8 gap-10 min-h-[700px]">
	  <!-- 사이드바 -->
	  <div class="w-56 bg-white shadow-md p-4 rounded">
		<ul class="space-y-2 font-semibold">
		  <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-schedule.do' }" href="/mypage/guide-schedule.do" class="block px-3 py-2 rounded hover:bg-blue-100">나의 스케줄</a></li>
		  <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-mypage.do' }" href="/mypage/guide-mypage.do" class="block px-3 py-2 rounded hover:bg-blue-100">가이드 정보수정</a></li>
		  <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-add.do' }" href="/mypage/guide-add.do" class="block px-3 py-2 rounded hover:bg-blue-950">여행상품 등록</a></li>
		  <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-sales-list.do' }" href="/mypage/guide-sales-list.do" class="block px-3 py-2 rounded hover:bg-blue-100">상품 목록</a></li>
		  <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'qna.do' }" href="/cs/qna.do" class="block px-3 py-2 rounded hover:bg-blue-100">문의하기</a></li>
		  <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-qna.do' }" href="/mypage/guide-qna.do" class="block px-3 py-2 rounded hover:bg-blue-100">문의 내역 확인</a></li>
		</ul>
	  </div>
	
	  <!-- 콘텐츠 영역 -->
	  <div class="flex-1 space-y-6">
		<div class="bg-white border rounded shadow p-6">
		  <div class="text-lg font-bold mb-6">여행상품 수정</div>
	
		  <!-- 제목 -->
		  <div class="mb-4">
			<label class="block font-semibold mb-1">제목</label>
			<input v-model="title" class="w-full border px-3 py-2 rounded" />
		  </div>
	
		  <!-- 소요시간 / 가격 / 날짜 -->
		  <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
			<div>
			  <label class="block font-semibold mb-1">소요시간</label>
			  <select v-model="duration" class="w-full border px-3 py-2 rounded">
				<option value="">:: 선택 ::</option>
				<option value="오전">오전</option>
				<option value="오후">오후</option>
				<option value="종일">종일</option>
			  </select>
			</div>
			<div>
			  <label class="block font-semibold mb-1">가격</label>
			  <input v-model="price" class="w-full border px-3 py-2 rounded" />
			</div>
			<div>
			  <label class="block font-semibold mb-1">날짜</label>
			  <input type="date" v-model="tourDate" :min="minDate" class="w-full border px-3 py-2 rounded" />
			</div>
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
			  <select @change="fnSelectTheme()" v-model="themeParent" class="w-full border px-3 py-2 rounded">
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
			<button @click="fnSave" class="bg-blue-950 text-white px-6 py-2 rounded hover:bg-blue-700">수정</button>
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
               tourNo : "",
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
			   themeName : "",
			   themeParent : "",
			   themeNameList : [],
			   currentPage: "",
			   imgList: [],
			   themeNo : "",
			   themeParentNo : "",
			   minDate : new Date().toISOString().split("T")[0],
			   // 썸네일 이미지
			   thumbnail : ""
            };
        },
        methods: {
			fnTourInfo() {
				let self = this;
				let nparmap = {
					tourNo: self.tourNo,
				};
				$.ajax({
					url: "/tours/tour-info.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log(data);
						self.tourInfo = data.tourInfo;
						console.log('tourInfo : ',self.tourInfo);
						self.reviewsList = data.reviewsList;
						console.log(self.reviewsList);
						console.log('투어 날짜 : ', self.tourInfo.tourDate);

						self.title = data.tourInfo.title;
						self.duration = data.tourInfo.duration;
						self.price = data.tourInfo.price;
						self.tourDate = data.tourInfo.tourDate;
						self.siNo = data.tourInfo.siNo;
						self.guNo = data.tourInfo.guNo;
						self.themeNo = data.tourInfo.themeNo;
						self.themeParentNo = data.tourInfo.themeParentNo;
						self.description = data.tourInfo.description;
						

						self.fnGetSi();
						// self.fnGetGu();
						self.fnGetThemeParent();
						self.fnGetThemeName();
						self.tourDate = self.tourDate.split(" ")[0];
						console.log('투어 내용 : ',self.description);
						self.fnQuill();
						console.log('투어 내용 : ',self.description);
					}
				});
			},

			fnSave(){
				let self = this;
				let nparmap = {
					title: self.title,
					description: self.description,
					duration: self.duration,
					price: self.price,
					tourDate: self.tourDate,
					siName: self.siName,
					guName: self.guName,
					themeName : self.themeName,
					tourNo : self.tourNo,

					// 썸네일 이미지로 설정할 이미지 URL
				};

				if(self.sessionId == ""){
					alert("로그인 후 이용 가능합니다.");
					location.href="/login.do";
					return;
				}

				if(self.title == ""){
					alert("제목을 입력하세요.");
					return;
				}

				if(self.duration == ""){
					alert("소요시간을 선택하세요.");
					return;
				}
				
				if(self.price == ""){
					alert("가격을 입력하세요.");
					return;
				}
				
				if(isNaN(self.price)){
					alert("가격은 숫자만 입력 가능합니다.");
					return;
				}
				
				if(self.price < 0){
					alert("가격은 0보다 커야합니다.");
					return;
				}
				
				if(self.tourDate == ""){
					alert("날짜를 입력하세요.");
					return;
				}
				
				if(self.siName == ""){
					alert("시를 선택하세요.");
					return;
				}
				
				if(self.guName == ""){
					alert("구를 선택하세요.");
					return;
				}

				if(self.themeParent == ""){
					alert("상위테마를 선택하세요.");
					return;
				}
				
				if(self.themeName == ""){
					alert("테마를 선택하세요.");
					return;
				}
				
				if(self.description == ""){
					alert("내용을 입력하세요.");
					return;
				}
				
				$.ajax({
					url:"/mypage/guide-update.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if(data.result == 'success'){
							console.log('data : ', data);
							console.log(self.sessionId);
							console.log(self.siName);
							console.log(self.guName);
							console.log(self.imgList);
							console.log(self.description);
							alert("수정되었습니다.");

							if (self.imgList.length > 0) {
								self.fnUpdateImgList(self.tourNo);
							} else {
								// 이미지 추가 없을 경우
								if(self.thumbnail != "") {
									// 본문에 이미지 존재 
									console.log('본문에 이미지 존재');
									self.fnSetThumbnail();
								} else {
									// 썸네일 초기화
									console.log('본문에 이미지 없음');
									self.fnResetThumbnail();
								}
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
						self.fnGetThemeName();
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
							alert("이미지 추가되었습니다.");
							location.href = "/tours/tour-info.do?tourNo=" + self.tourNo;
						}
					}
				})
			},

			fnGetSi() {
				let self = this;
				let nparmap = {
					siNo: self.siNo
				};
				$.ajax({
					url: "/common/getSi.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log(data);
						self.siName = data.si.siName;
						self.fnSelectGu();
						self.fnGetGu();
						console.log('siName : ',self.siName);
					}
				});
				

			},
			
			fnGetGu() {
				let self = this;
				let nparmap = {
					guNo: self.guNo,
					siNo: self.siNo
				};
				$.ajax({
					url: "/common/getGu.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log(data);
						self.guName = data.gu.guName;
						console.log('guName : ',self.guName);
					}
				});
			},

			fnGetThemeParent() {
				let self = this;
				let nparmap = {
					themeParentNo: self.themeParentNo
				};
				$.ajax({
					url: "/common/getThemeParent.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log('ThemeParentName : ', data);
						self.themeParent = data.themeParent.themeName;
						self.fnSelectTheme();
					}
				});
			},
			
			fnGetThemeName() {
				let self = this;
				let nparmap = {
					themeNo: self.themeNo
				};
				$.ajax({
					url: "/common/getTheme.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log('ThemeName : ', data);
						self.themeName = data.themeName.themeName;
					}
				});

			},
			fnQuill() {
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
								['clean'],
								[{ indent: "-1" }, { indent: "+1" }],
								[{ direction: "rtl" }]
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
	
				quill.root.innerHTML = self.description;
	
				quill.on('text-change', function () {
					self.description = quill.root.innerHTML;
					
					// 본문에 있는 이미지 URL을 추출하여 썸네일 설정
					if(self.getImageUrlsFromHtml(self.description).length > 0) {
						self.thumbnail = self.getImageUrlsFromHtml(self.description)[0];
					} else {
						self.thumbnail = ""; // 이미지가 없을 경우 썸네일 초기화
					}
					console.log('썸네일 : ', self.thumbnail);
				});
			},

			// 본문에 있는 이미지 URL을 추출하는 함수
			getImageUrlsFromHtml(html) {
				let div = document.createElement("div");
				div.innerHTML = html;
				let imgs = div.querySelectorAll("img");
				return Array.from(imgs).map(img => img.getAttribute("src"));
			},

			// 썸네일 초기화
			fnResetThumbnail() {
				let self = this;
				let nparmap = {
					tourNo: self.tourNo
				}
				$.ajax({
					url: "/mypage/resetThumbnail.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log(data);
						location.href = "/tours/tour-info.do?tourNo=" + self.tourNo;
					}
				});
			},

			// 썸네일 설정
			fnSetThumbnail() {
				let self = this;
				let nparmap = {
					tourNo: self.tourNo,
					thumbnail: self.thumbnail
				}
				$.ajax({
					url: "/mypage/setThumbnail.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log(data);
						location.href = "/tours/tour-info.do?tourNo=" + self.tourNo;
					}
				});
			},

			





        },
        mounted() {
            let self = this;
			const params = new URLSearchParams(window.location.search);
			self.tourNo = params.get("tourNo") || "";
			
			if (!this.sessionId || this.sessionRole === 'TOURIST') {
				alert("가이드만 이용가능합니다.");
				location.href = "http://localhost:8080/main.do";
			}

			self.fnSelectSi();
			self.fnGetThemeParentList();

			self.fnTourInfo();

			
        }
    });
    app.mount('#app');
</script>