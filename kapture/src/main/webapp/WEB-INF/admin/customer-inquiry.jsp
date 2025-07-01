<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">

		<title>관리자 페이지</title>
		<style>
			/* 테이블 스타일 */
			.content table {
				width: 100%;
				margin: 20px 0;
				border-collapse: collapse;
				font-size: 14px;
			}

			.content th,
			.content td {
				border: 1px solid #ccc;
				padding: 10px;
				text-align: center;
				vertical-align: middle;
				word-break: break-word;
				white-space: normal;
			}

			.content th {
				background-color: #f4f4f4;
			}

			/* 버튼 */
			.btn-manage {
				background-color: #007bff;
				color: white;
				border: none;
				padding: 5px 8px;
				margin: 5px;
				border-radius: 3px;
				cursor: pointer;
			}

			.btn-manage:hover {
				background-color: #0056b3;
			}

			/* 제목 스타일 */
			.page-title {
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                /* margin-top: 20px; */
                margin-left: 240px;
                /* 사이드바 너비(200px) + 여백(20px) */
                padding: 20px;
                display: flex;
                justify-content: center;
                /* 수평 중앙 정렬 */
                align-items: center;
            }

            .title-hr {
                margin-bottom: 30px;
            }

			/* 모달 오버레이 (뒷배경) */
			.modal-overlay {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.4);
				display: flex;
				align-items: center;
				justify-content: center;
				z-index: 9999;
			}

			/* 모달 내용 컨테이너 */
			.modal-content {
				background-color: #fff;
				width: 600px;
				/* 모달 폭 */
				padding: 20px;
				border-radius: 5px;
				max-height: 90vh;
				overflow-y: auto;
				display: flex;
				flex-direction: column;
				align-items: center;
				text-align: center;
			}

			.modal-header {
                position: relative;
                height: 60px;
                /* 높이 지정 (필수) */
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
            }

            .modal-header h2 {
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                margin: 0;
                font-weight: bold;
                font-size: 22px;
            }

            .close-btn {
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 28px;
                cursor: pointer;
            }

			.search-input,
			.search-select,
			.search-date {
				padding: 10px 14px;
				font-size: 16px;
				height: 40px;
				border: 1px solid #ccc;
				border-radius: 6px;
				margin-right: 10px;
				box-sizing: border-box;
			}

			.search-input {
				width: 300px;
			}

			.search-button {
				padding: 10px 20px;
				font-size: 16px;
				height: 40px;
				background-color: #007bff;
				color: white;
				border: none;
				border-radius: 6px;
				cursor: pointer;
			}

			.search-button:hover {
				background-color: #0056b3;
			}

			.search-container {
				width: 100%;
				margin: 20px 0;
			}

			.tab-btn {
				margin-right: 10px;
				padding: 8px 12px;
				border: 1px solid #ccc;
				background: #f4f4f4;
				cursor: pointer;
				border-radius: 4px;
			}

			.tab-btn.active {
				background-color: #007bff;
				color: white;
			}

			[v-cloak] {
				display: none;
			}
		</style>
		</style>
	</head>

	<body>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="app" v-cloak>
			<!-- 제목 추가 -->
			<div class="page-title">고객 문의 관리</div>

			<hr>
			<div class="content">
				<div class="search-container">
					<input type="date" v-model="startDate" class="search-date">
					~
					<input type="date" v-model="endDate" class="search-date">
					<select v-model="statusFilter" class="search-select">
						<option value="">전체</option>
						<option value="inquiryNo">문의번호</option>
						<option value="userNo">회원번호</option>
						<option value="name">회원명</option>
						<option value="category">카테고리</option>
						<option value="qnaTitle">제목</option>
						<option value="qnaStatus">상태</option>
					</select>
					<input type="text" v-model="keyword" class="search-input" @keyup.enter="loadFilteredData"
						placeholder="회원명/상품 검색">
					<button class="search-button" @click="loadFilteredData">검색</button>
				</div>
				<div v-if="loaded">
					<table>
						<thead>
							<tr>
								<th>문의번호</th>
								<th>회원번호</th>
								<th>이름</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>문의내용</th>
								<th>답변내용</th>
								<th>접수일</th>
								<th>처리상태</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr v-if="inquiriesList.length === 0">
								<td colspan="12">검색 결과가 없습니다.</td>
							</tr>
							<!-- 문의 리스트 반복 출력 -->
							<tr v-for="inquiry in inquiriesList">
								<!-- 문의번호 -->
								<td>{{ inquiry.inquiryNo }}</td>
								<!-- 회원번호-->
								<td>{{ inquiry.userNo }}</td>
								<!-- 회원번호-->
								<td>
									{{ inquiry.userFirstName }}
									<template v-if="inquiry.userLastName != 'N/A'">{{inquiry.userLastName}}</template>
								</td>
								<!-- 이메일-->
								<td>{{ inquiry.email }}</td>
								<!-- 연락처-->
								<td>{{ inquiry.phone }}</td>
								<!-- 카테고리 -->
								<td>{{ inquiry.category }}</td>
								<!-- 제목 -->
								<td>{{ inquiry.qnaTitle }}</td>
								<!-- 문의내용 -->
								<td>{{ inquiry.question }}</td>
								<!-- 답변 -->
								<td>{{inquiry.answer}}</td>
								<!-- 접수일-->
								<td>{{ inquiry.inqCreatedAt.substring(0, 10) }}</td>
								<!-- 처리상태 -->
								<td>{{inquiry.qnaStatus}}</td>
								<!-- 관리 ( 수정, 삭제 ) -->
								<td>
									<button class="btn-manage" @click="fnInquiryAnswer(inquiry)">
										답변
									</button>
									<button class="btn-manage" @click="fnInquiryDelete(inquiry.inquiryNo)">
										삭제
									</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="margin-top: 20px; text-align: center;">
						<button class="tab-btn" @click="goPage(page - 1)" :disabled="page === 1">이전</button>
						<button v-for="p in totalPages" :key="p" class="tab-btn" :class="{ active: p === page }"
							@click="goPage(p)">
							{{ p }}
						</button>
						<button class="tab-btn" @click="goPage(page + 1)" :disabled="page === totalPages">다음</button>
					</div>
				</div>
				<p v-else style="text-align:center;">데이터를 불러오는 중입니다...</p>
			
				<div v-if="showAnswerModal" class="modal-overlay" @click.self="fnCloseAnswerModal">
					<div class="modal-content">
						<div class="modal-header">
							<h2>1:1 문의 답변</h2>
							<span class="close-btn" @click="fnCloseAnswerModal">&times;</span>
						</div>
						<!-- 테이블 시작 -->
						<table style="width: 100%; border-collapse: collapse; margin-top: 10px;">
							<tbody>
								<!-- 문의유형 -->
								<tr>
									<!-- 왼쪽 셀: 라벨 -->
									<td style="width: 120px; background-color: #f4f4f4; text-align: center; 
											border: 1px solid #ccc; padding: 10px;">
										문의유형
									</td>
									<!-- 오른쪽 셀: 인풋박스 -->
									<td style="border: 1px solid #ccc; padding: 10px;">
										<input type="text" v-model="selectedInquiry.category" readonly
											style="width: 97%; padding: 5px;" />
									</td>
								</tr>

								<!-- 제목 -->
								<tr>
									<td style="background-color: #f4f4f4; text-align: center; 
											border: 1px solid #ccc; padding: 10px;">
										제목
									</td>
									<td style="border: 1px solid #ccc; padding: 10px;">
										<input type="text" v-model="selectedInquiry.qnaTitle" readonly
											style="width: 97%; padding: 5px;" />
									</td>
								</tr>

								<!-- 문의내용 -->
								<tr>
									<td style="background-color: #f4f4f4; text-align: center; 
											border: 1px solid #ccc; padding: 10px;">
										문의내용
									</td>
									<td style="border: 1px solid #ccc; padding: 10px;">
										<textarea v-model="selectedInquiry.question" readonly
											style="width: 97%; height: 100px; padding: 5px; resize: none;"></textarea>
									</td>
								</tr>

								<!-- 답변 -->
								<tr>
									<td style="background-color: #f4f4f4; text-align: center; 
											border: 1px solid #ccc; padding: 10px;">
										답변
									</td>
									<td style="border: 1px solid #ccc; padding: 10px;">
										<textarea v-model="answerText" placeholder="답변 내용을 입력해주세요"
											style="width: 97%; height: 150px; padding: 5px; resize: none;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div style="margin-top: 20px;">
							<button class="btn-manage" @click="fnSaveAnswer">저장</button>
						</div>
					</div>
				</div>
				<!-- [모달 끝] -->
			</div>
		</div>
	</body>

	</html>
	<script>
		const app = Vue.createApp({
			data() {
				return {
					inquiriesList: [],
					sessionId: "${sessionId}",
					sessionRole: "${sessionRole}",
					showAnswerModal: false,// 답변 모달 표시 여부
					selectedInquiry: null, // 현재 선택된 문의 정보
					startDate: "",
					endDate: "",
					keyword: "",
					page: 1,
					size: 10,
					totalCount: 0,
					totalPages: 1,
					statusFilter: "",
					loaded: false
				};
			},
			methods: {
				loadFilteredData() {
					this.page = 1;
					this.fnGetInquiryiesList();
				},
				// 문의 목록 불러오기
				fnGetInquiryiesList() {
					let self = this;
					let nparmap = {
						startDate: self.startDate,
						endDate: self.endDate,
						statusFilter: self.statusFilter,
						keyword: self.keyword,
						page: self.page,
						size: self.size,
					};
					$.ajax({
						url: "/admin/users-inquiries.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							if (data.result === "success") {
								self.inquiriesList = data.inquiriesList;
								self.totalCount = data.totalCount;
								self.totalPages = Math.ceil(self.totalCount / self.size);
								self.loaded = true;
							} else {
								alert("데이터를 불러오는데 실패했습니다.");
							}
						},
						error: function (err) {
							console.error(err);
						}
					});
				},
				goPage(p) {
					if (p < 1 || p > this.totalPages) return;
					this.page = p;
					this.fnGetInquiryiesList();
				},
				// '답변' 버튼 클릭 시 모달 열기
				fnInquiryAnswer(inquiry) {
					this.selectedInquiry = inquiry;
					this.answerText = inquiry.answer; // 원본 답변 복사
					this.showAnswerModal = true;
				},

				// 모달 닫기
				fnCloseAnswerModal() {
					this.showAnswerModal = false;
					this.selectedInquiry = null;
					this.answerText = "";
				},

				// '저장' 버튼 클릭 시 답변 저장
				fnSaveAnswer() {
					let self = this;
					if (!self.selectedInquiry) {
						alert("문의 정보를 찾을 수 없습니다.");
						return;
					}
					// 서버 전송 전에 원본 객체에도 answerText 반영 (선택사항)
					self.selectedInquiry.answer = self.answerText;
					let nparmap = {
						inquiryNo: self.selectedInquiry.inquiryNo,
						answer: self.answerText,
						targetUserNo: self.selectedInquiry.userNo,
						referenceType: "ANSWER",
					};

					$.ajax({
						url: "/admin/inquiry-answer-save.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							if (data.result === "success") {
								alert("답변이 저장되었습니다.");
								self.showAnswerModal = false;
								self.selectedInquiry = null;
								self.answerText = "";
								self.fnGetInquiryiesList(); // 목록 갱신
							} else {
								alert("답변 저장 실패");
							}
						},
						error: function (err) {
							console.error(err);
							alert("답변 저장 중 오류가 발생했습니다.");
						}
					});
				},

				// '삭제' 버튼 클릭 시
				fnInquiryDelete(inquiryNo) {
					if (!confirm("정말 삭제하시겠습니까?")) return;

					$.ajax({
						url: "/admin/inquiry-delete.dox",
						dataType: "json",
						type: "POST",
						data: { inquiryNo: inquiryNo },
						success: function (data) {
							console.log(data);
							if (data.result === "success") {
								alert("삭제되었습니다.");
								// 재조회 or 페이지 리로드
								location.reload();
							} else {
								alert("삭제에 실패하였습니다.");
							}

						},
						error: function (err) {
							console.error(err);
							alert("삭제 요청 중 오류가 발생했습니다.");
						}
					});
				},
			},
			mounted() {
				let self = this;
				if (!self.sessionId || self.sessionRole != 'ADMIN') {
					alert("관리자만 이용가능합니다.");
					location.href = "/main.do";
				}
				self.fnGetInquiryiesList();
			}
		});
		app.mount('#app');
	</script>