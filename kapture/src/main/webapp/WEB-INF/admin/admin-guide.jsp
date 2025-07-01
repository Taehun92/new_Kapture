<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<!-- FullCalendar 및 Bootstrap CSS/JS 추가 -->
		<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
		<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/bootstrap5@6.1.14/index.global.min.js"></script>

		<title>관리자 페이지</title>
		<style>
			/* 테이블 스타일 */
			.content table {
				width: 100%;
				border-collapse: collapse;
				font-size: 14px;
			}

			.content th,
			.content td {
				border: 1px solid #ccc;
				padding: 10px;
				text-align: center;
				vertical-align: middle;
			}

			.content th {
				background-color: #f4f4f4;
			}

			/* 이미지 스타일 */
			.guide-img {
				width: 60px;
				height: 60px;
				object-fit: cover;
				/* 이미지가 잘리지 않도록 조정 */
				border-radius: 5px;
			}

			.guide-img-wrapper {
				width: 60px;
				height: 60px;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			/* "No Image" 문구 표시 스타일 */
			.no-image {
				width: 60px;
				height: 60px;
				border: 1px dashed #999999;
				display: flex;
				align-items: center;
				justify-content: center;
				color: #999;
				font-size: 12px;
			}

			/* 체크박스와 관리 버튼 예시 */
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
				/* 테이블보다 위에 표시되도록 */
			}

			/* 모달 내용 컨테이너 */
			.modal-content {
				background-color: #fff;
				width: 800px;
				/* 모달 폭 (필요에 맞게 조절) */
				padding: 20px;
				border-radius: 5px;
				position: relative;
				/* close 버튼 배치용 */
				max-height: 90vh;
				/* 세로 최대크기 제한 */
				overflow-y: auto;
				/* 내용이 길어지면 스크롤 */
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

			/* 모달 내부 폼 스타일 예시 */
			.modal-form label {
				display: inline-block;
				width: 110px;
				margin-bottom: 5px;
			}

			.modal-form input,
			.modal-form select,
			.modal-form textarea {
				width: 300px;
				margin-bottom: 10px;
			}

			.modal-form input[type=radio] {
				width: 20px;
				margin-right: 30px;
			}

			.modal-form input[type="text"],
			.modal-form input[type="date"],
			.modal-form input[type="password"],
			.modal-form textarea,
			.modal-form select {
				padding: 5px;
				border: 1px solid #ccc;
				border-radius: 4px;
				font-size: 14px;
				width: auto;
				min-width: 150px;
				max-width: 220px;
			}

			.modal-form .form-group {
				margin-bottom: 10px;
			}

			.modal-form button {
				margin-right: 10px;
			}

			/* 유효성 검사 메시지 스타일 */
			.modal-validation {
				font-size: 13px;
				line-height: 1.4;
			}

			/* content-area 및 custom 버튼 스타일 (일정 모달 내부) */
			.content-area {
				width: 100%;
			}

			.custom-buttons {
				list-style: none;
				padding: 0;
				margin: 0 0 10px 0;
				display: flex;
				gap: 10px;
				justify-content: center;
			}

			.custom-button {
				display: flex;
				align-items: center;
				font-size: 14px;
			}

			.custom-button .dot {
				margin-right: 4px;
			}

			.profile-upload-container {
				display: flex;
				align-items: center;
				gap: 10px;
				/* 요소 사이 간격 */
			}

			.add-button {
				width: 95%;
				display: flex;
				justify-content: flex-end;
				margin: 5px;
			}

			.search-div {
				margin: 20px auto;
				border-collapse: collapse;
				font-size: 14px;
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

			.search-input {
				width: 300px;
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
	</head>

	<body>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="app" v-cloak>
			<!-- 제목 추가 -->
			<div class="page-title">가이드 정보 관리</div>
			<hr title-hr>
			<div class="content">
				<div class="add-button">
					<button class="btn-manage" @click="fnOpenAddModal">가이드 추가</button>
				</div>
				<div class="search-div">
					<input type="date" v-model="startDate" class="search-date">
					~　
					<input type="date" v-model="endDate" class="search-date">
					<select v-model="statusFilter" class="search-select">
						<option value="">전체</option>
						<option value="userNo">회원번호</option>
						<option value="guideNo">가이드번호</option>
						<option value="name">회원명</option>
					</select>
					<input type="text" v-model="keyword" class="search-input" @keyup.enter="loadFilteredData"
						placeholder="회원번호 / 회원명 / 가이드번호 검색">
					<button class="search-button" @click="loadFilteredData">검색</button>
				</div>
				<div v-if="loaded">
					<table>
						<thead>
							<tr>
								<th>회원번호</th>
								<th>가이드번호</th>
								<th>이름</th>
								<th>성별</th>
								<th>연락처</th>
								<th>사진</th>
								<th>수정일</th>
								<th>생년월일</th>
								<th>최근접속</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr v-if="guidesList.length === 0">
								<td colspan="10">검색 결과가 없습니다.</td>
							</tr>
							<!-- 가이드 리스트 반복 출력 -->
							<tr v-for="guide in guidesList">
								<!-- 회원번호 -->
								<td>{{ guide.userNo }}</td>
								<!-- 가이드번호-->
								<td>{{ guide.guideNo }}</td>
								<!-- 닉네임 -->
								<td>{{ guide.userLastName }}{{ guide.userFirstName }}</td>
								<!-- 성별 -->
								<td>{{ guide.gender }}</td>
								<!-- 연락처 -->
								<td>{{ guide.phone }}</td>
								<!-- 사진: 있으면 <img>, 없으면 "No Image" 표시 -->
								<td>
									<div class="guide-img-wrapper">
										<img v-if="guide.pFilePath && guide.pFilePath !== ''"
											:src="guide.pFilePath"
											alt="가이드사진"
											class="guide-img"
											@error="handleImageError($event)" />
										<div v-else class="no-image">NO Image</div>
									</div>
								</td>
								<!-- 수정일 -->
								<td>{{ guide.uUpdatedAt.substring(0, 10) }}</td>
								<!-- 생년월일 -->
								<td>{{ guide.birthday }}</td>
								<!-- 최근접속 -->
								<td>{{ guide.lastLogin.substring(0, 10) }}</td>

								<!-- 관리 ( 수정, 삭제 ) -->
								<td>
									<button class="btn-manage" @click="fnGuideEdit(guide)">
										수정
									</button>
									<button class="btn-manage" @click="fnGuideSchedule(guide.userNo)">
										일정
									</button>
									<button class="btn-manage" @click="fnUnregister(guide.userNo, guide.guideNo)">
										삭제
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p v-else style="text-align:center;">데이터를 불러오는 중입니다...</p>
			</div>

			<div style="margin-top: 20px; text-align: center;">
				<button class="tab-btn" @click="goPage(page - 1)" :disabled="page === 1">이전</button>
				<button v-for="p in totalPages" :key="p" class="tab-btn" :class="{ active: p === page }"
					@click="goPage(p)">
					{{ p }}
				</button>
				<button class="tab-btn" @click="goPage(page + 1)" :disabled="page === totalPages">다음</button>
			</div>
			<!-- 가이드 정보 수정 모달 -->
			<div v-if="showEditModal" class="modal-overlay" @click.self="fnGuideEditClose()">
				<div class="modal-content">
					<div class="modal-header">
						<h2>가이드 추가</h2>
						<span class="close-btn" @click="fnGuideEditClose()">&times;</span>
					</div>
					<div class="modal-form">
						<!-- 프로필이미지 -->
						<span class="form-group profile-upload-container">
							<span class="guide-img-wrapper">
								<img v-if="editGuide.pFilePath && editGuide.pFilePath !== ''"
								:src="editGuide.pFilePath" alt="가이드사진" class="guide-img" @error="handleImageError($event)" />
								<div v-else class="no-image">NO Image</div>
							</span>
							<input type="file" @change="handleProfileUpload" />
						</span>
						<!-- 이름 -->
						<div class="form-group">
							<label>이름</label>
							<input type="text" v-model="editGuide.userFirstName" />
						</div>
						<!-- 비밀번호 -->
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" v-model="password" @input="validateNewPassword" />
							<div v-if="password.length > 0 && !passwordValid" class="modal-validation">
								<div :style="{ color: passwordRules.length ? 'green' : 'red' }">
									{{ passwordRules.length ? '✅ At least 6 characters' : '❌ At least 6 characters'}}
								</div>
								<div :style="{ color: passwordRules.number ? 'green' : 'red' }">
									{{ passwordRules.number ? '✅ At least one number' : '❌ At least one number' }}
								</div>
								<div :style="{ color: passwordRules.upper ? 'green' : 'red' }">
									{{ passwordRules.upper ? '✅ At least one uppercase letter' : '❌ At least one uppercase letter' }}
								</div>
								<div :style="{ color: passwordRules.lower ? 'green' : 'red' }">
									{{ passwordRules.lower ? '✅ At least one lowercase letter' : '❌ At least one lowercase letter' }}
								</div>
								<div :style="{ color: passwordRules.special ? 'green' : 'red' }">
									{{ passwordRules.special ? '✅ At least one special character' : '❌ At least one special character' }}
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>비밀번호 확인</label>
							<input type="password" v-model="confirmPassword" @input="validateNewPassword" />
							<div v-if="confirmPassword.length > 0 && passwordValid" class="modal-validation"
								:style="{ color: passwordsMatch ? 'green' : 'red' }">
								{{ passwordsMatch ? '✅ Passwords match.' : '❌ Passwords do not match.' }}
							</div>
						</div>
						<!-- 이메일 -->
						<div class="form-group">
							<label>이메일</label>
							<input type="text" v-model="editGuide.email" placeholder="이메일" />
						</div>
						<!-- 성별 -->
						<div class="form-group">
							<span><label>성별</label></span>
							<span>남성<input type="radio" value="M" v-model="editGuide.gender" /></span>
							<span>여성<input type="radio" value="F" v-model="editGuide.gender" /></span>
						</div>
						<!-- 연락처 -->
						<div class="form-group">
							<label>연락처</label>
							<input type="text" v-model="editGuide.phone" />
						</div>
						<!-- 생년월일 -->
						<div class="form-group">
							<label>생년월일</label>
							<input type="date" v-model="editGuide.birthday" />
						</div>
						<!-- 주소 -->
						<div class="form-group">
							<label>주소</label>
							<input type="text" v-model="editGuide.address">
						</div>
						<!-- 사용가능 언어 -->
						<div class="form-group">
							<label>사용가능 언어</label>
							<input type="text" v-model="editGuide.language">
						</div>
						<!-- 자기소개 등 (예시) -->
						<div class="form-group">
							<label>자기소개</label>
							<textarea v-model="editGuide.experience" rows="4"></textarea>
						</div>

						<!-- 저장 / 취소 -->
						<div>
							<button class="btn-manage" @click="fnSaveGuide(editGuide.userNo, editGuide.guideNo)">저장하기</button>
							<button class="btn-manage" @click="fnGuideEditClose">취소</button>
						</div>
					</div>

				</div>
			</div>
			<!-- [모달 끝] -->
			<!-- 일정 모달 추가 -->
			<div v-if="showScheduleModal" class="modal-overlay" @click.self="fnCloseScheduleModal">
				<div class="modal-content">
					<div class="modal-header">
						<h2>상품 상세 정보</h2>
						<span class="close-btn" @click="fnCloseScheduleModal">&times;</span>
					</div>
					<div class="content-area">
						<ol class="custom-buttons">
							<li class="custom-button">
								<span class="dot" style="color: #3788d8;">●</span>
								<span class="label">종일</span>
							</li>
							<li class="custom-button">
								<span class="dot" style="color: red;">●</span>
								<span class="label">오전</span>
							</li>
							<li class="custom-button">
								<span class="dot" style="color: green;">●</span>
								<span class="label">오후</span>
							</li>
							<li class="custom-button">
								<span class="dot" style="color: gold;">●</span>
								<span class="label">판매대기</span>
							</li>
						</ol>
						<div ref="calendar"></div>
					</div>
					<button class="btn-manage" @click="fnCloseScheduleModal">닫기</button>
				</div>
			</div>
			<!-- 가이드 추가 모달 -->
			<div v-if="showAddModal" class="modal-overlay" @click.self="fnCloseAddModal">
				<div class="modal-content add-guide-modal">
					<!-- 닫기 버튼 -->
					<div class="modal-header">
						<h2>가이드 추가</h2>
						<span class="close-btn" @click="fnCloseAddModal">&times;</span>
					</div>
					<div class="modal-form">
						<!-- 프로필이미지 -->
						<span class="form-group profile-upload-container">
							<span class="guide-img-wrapper">
								<img v-if="editGuide.pFilePath && editGuide.pFilePath !== ''"
								:src="editGuide.pFilePath" alt="가이드사진" class="guide-img" @error="handleImageError($event)" />
								<div v-else class="no-image">NO Image</div>
							</span>
							<input type="file" @change="handleProfileUpload" />
						</span>
						<div class="form-group">
							<label>이름</label>
							<input type="text" v-model="newGuide.userFirstName" />
						</div>
						<div class="form-group">
							<label>이메일</label>
							<input type="text" v-model="newGuide.email" />
						</div>

						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" v-model="newGuide.password" @input="validateNewPassword" />
							<div v-if="newGuide.password.length > 0 && !passwordValid" class="modal-validation">
								<div :style="{ color: passwordRules.length ? 'green' : 'red' }">
									{{ passwordRules.length ? '✅ At least 6 characters' : '❌ At least 6 characters'}}
								</div>
								<div :style="{ color: passwordRules.number ? 'green' : 'red' }">
									{{ passwordRules.number ? '✅ At least one number' : '❌ At least one number' }}
								</div>
								<div :style="{ color: passwordRules.upper ? 'green' : 'red' }">
									{{ passwordRules.upper ? '✅ At least one uppercase letter' : '❌ At least one uppercase letter' }}
								</div>
								<div :style="{ color: passwordRules.lower ? 'green' : 'red' }">
									{{ passwordRules.lower ? '✅ At least one lowercase letter' : '❌ At least one lowercase letter' }}
								</div>
								<div :style="{ color: passwordRules.special ? 'green' : 'red' }">
									{{ passwordRules.special ? '✅ At least one special character' : '❌ At least one special character' }}
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>비밀번호 확인</label>
							<input type="password" v-model="addConfirmPassword" @input="validateNewPassword" />
							<div v-if="addConfirmPassword.length > 0 && passwordValid" class="modal-validation"
								:style="{ color: passwordsMatch ? 'green' : 'red' }">
								{{ passwordsMatch ? '✅ Passwords match.' : '❌ Passwords do not match.' }}
							</div>
						</div>
						<div class="form-group">
							<span><label>성별</label></span>
							<span>남성<input type="radio" value="M" v-model="newGuide.gender" /></span>
							<span>여성<input type="radio" value="F" v-model="newGuide.gender" /></span>
						</div>
						<div class="form-group">
							<label>연락처</label>
							<input type="text" v-model="newGuide.phone" />
						</div>
						<div class="form-group">
							<label>생년월일</label>
							<input type="date" v-model="newGuide.birthday" />
						</div>
						<div class="form-group">
							<label>주소</label>
							<input type="text" v-model="newGuide.address">
						</div>
						<div class="form-group">
							<label>사용가능 언어</label>
							<input type="text" v-model="newGuide.language">
						</div>
						<div class="form-group">
							<label>자기소개</label>
							<textarea v-model="newGuide.experience" rows="4"></textarea>
						</div>
						<!-- 등록 버튼 -->
						<div class="modal-footer">
							<button class="btn-manage" @click="fnAddGuide">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>

	</html>
	<script>
		const app = Vue.createApp({
			data() {
				return {
					sessionId: "${sessionId}",
					sessionRole: "${sessionRole}",
					guidesList: [],
					selectedGuides: [], // 체크된 id들의 배열
					showEditModal: false,  // 수정 모달 표시 여부
					showScheduleModal: false,  // 일정 모달 표시 여부
					showAddModal: false, // 가이드 추가 모달 표시 여부
					editGuide: {
						pFilePath: "",
						pFileNo: "",
					},          // 수정할 가이드 정보
					newGuide: {
						userFirstName: "",
						password: "",
						email: "",
						gender: "M",
						phone: "",
						birthday: "",
						address: "",
						language: "",
						experience: "",
					},
					addConfirmPassword: "",
					schedule: [],
					password: "",
					confirmPassword: "",
					passwordRules: { length: false, upper: false, lower: false, special: false, number: false },
					passwordValid: false,
					passwordsMatch: false,
					minDate: new Date().toISOString().split("T")[0],
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
					this.fnGetGuidesList();
				},
				// 가이드 목록 불러오기
				fnGetGuidesList() {
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
						url: "/admin/guides-list.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							if (data.result === "success") {
								for (let i = 0; i < data.guidesList.length; i++) {
									if (data.guidesList[i].birthday && typeof data.guidesList[i].birthday === 'string') {
										data.guidesList[i].birthday = data.guidesList[i].birthday.substring(0, 10);
									} else {
										data.guidesList[i].birthday = ""; // 또는 기본값 설정
									}
								}
								self.guidesList = data.guidesList;
								self.totalCount = data.totalCount;
								self.totalPages = Math.ceil(self.totalCount / self.size);
								self.loaded = true;
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
					this.fnGetGuidesList();
				},
				// 수정 버튼 클릭 시: userNo로 가이드 상세 불러온 뒤 모달 열기
				fnGuideEdit(guide) {
					let self = this;
					self.editGuide = guide;
					console.log(guide);
					// 모달 열기
					self.showEditModal = true;
				},
				fnGuideEditClose() {
					let self = this;
					self.showEditModal = false;
					self.password = "";
					self.confirmPassword = "";
					self.passwordRules = { length: false, upper: false, lower: false, special: false, number: false };
					self.passwordValid = false;
					self.passwordsMatch = false;
				},
				// 모달에서 '저장하기' 클릭 시: 수정 API 호출
				fnSaveGuide(userNo, guideNo) {
					let self = this;
					// 수정된 정보 전송
					let nparmap = {
						userNo: userNo,
						userFirstName: self.editGuide.userFirstName,
						password: self.password,
						email: self.editGuide.email,
						address: self.editGuide.address,
						gender: self.editGuide.gender,
						phone: self.editGuide.phone,
						birthday: self.editGuide.birthday,
						pFilePath: self.editGuide.pFilePath,
						pFileNo: self.editGuide.pFileNo,
						guideNo: guideNo,
						language: self.editGuide.language,
						experience: self.editGuide.experience,
					};
					$.ajax({
						url: "/admin/guide-update.dox", // 실제 업데이트 API
						dataType: "json",
						type: "POST",
						data: nparmap, // editGuide 객체 전체를 전송 (필요 시 파라미터 조정)
						success: function (data) {
							if (data.result === "success") {
								alert("수정이 완료되었습니다.");
								// 모달 닫기
								self.showEditModal = false;
								self.password = "";
								self.confirmPassword = "";
								self.passwordRules = { length: false, upper: false, lower: false, special: false, number: false };
								self.passwordValid = false;
								self.passwordsMatch = false;
								// 목록 재조회 (갱신)
								self.fnGetGuidesList();
							} else {
								alert("수정에 실패했습니다.");
							}
						},
						error: function (err) {
							console.error(err);
							alert("수정 요청 중 오류가 발생했습니다.");
						}
					});
				},
				// 삭제 버튼 클릭 시
				fnUnregister(userNo, guideNo) {
					if (!confirm("정말 삭제하시겠습니까?")) {
						return;
					}
					let nparmap = {
						userNo: userNo,
						guideNo: guideNo
					};
					$.ajax({
						url: "/admin/unregister.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							if (data.result === "success") {
								alert("삭제되었습니다.");
								if (data.guideResult === "fail") {
									alert("가이드 정보 삭제 실패");
								}
								if (data.guideImgResult === "fail") {
									alert("가이드 이미지 삭제 실패");
								}
								// 목록 새로고침
								location.reload();
							} else {
								alert("삭제 실패");
							}
						},
						error: function (err) {
							console.error(err);
							alert("삭제 요청 중 오류가 발생했습니다.");
						}
					});
				},
				validateNewPassword() {
					let pw = "";
					let pw2 = "";
					if (this.showEditModal) {
						pw = this.password;
						pw2 = this.confirmPassword;
					}
					if (this.showAddModal) {
						pw = this.newGuide.password;
						pw2 = this.addConfirmPassword;
					}
					this.passwordRules.length = pw.length >= 6;
					this.passwordRules.upper = /[A-Z]/.test(pw);
					this.passwordRules.lower = /[a-z]/.test(pw);
					this.passwordRules.special = /[^A-Za-z0-9]/.test(pw);
					this.passwordRules.number = /[0-9]/.test(pw);
					this.passwordValid = this.passwordRules.length && this.passwordRules.upper &&
						this.passwordRules.lower && this.passwordRules.special && this.passwordRules.number;
					this.passwordsMatch = pw && pw2 && (pw === pw2);
				},
				fnGuideSchedule(userNo) {
					let self = this;
					$.ajax({
						url: "/mypage/guide-schedule.dox",
						dataType: "json",
						type: "POST",
						data: { userNo: userNo },
						success: function (data) {
							if (data.result === "success") {
								console.log(data);
								self.schedule = data.schedule;
							} else {
								console.error("스케줄 데이터 로드 실패");
							}
							// 모달 열기 및 FullCalendar 초기화
							self.showScheduleModal = true;
							self.$nextTick(() => {
								const eventsArray = [];
								for (let i = 0; i < self.schedule.length; i++) {
									const item = self.schedule[i];
									const colorMapping = {
										"오전": "red",
										"오후": "green",
										"종일": "#3788d8"
									};
									eventsArray.push({
										id: item.tourNo,
										title: item.title || '투어',
										start: item.tourDate,
										allDay: true,
										backgroundColor: item.deleteYN === 'N' ? "gold" : colorMapping[item.duration],
										borderColor: item.deleteYN === 'N' ? "gold" : colorMapping[item.duration]
									});
								}
								const calendarEl = self.$refs.calendar;
								// 이전에 렌더링된 캘린더 초기화
								calendarEl.innerHTML = "";
								const calendar = new FullCalendar.Calendar(calendarEl, {
									height: 'auto',            // 캘린더 전체 높이를 600px로 설정
									contentHeight: 'auto',  // 콘텐츠 영역 높이를 자동으로 조절
									themeSystem: 'bootstrap5',
									initialView: 'dayGridMonth',
									validRange: function (now) {
										return { start: now };
									},
									events: eventsArray,
									eventClick: function (info) {
										info.jsEvent.preventDefault();
										location.href = "/tours/tour-info.do?tourNo=" + info.event.id;
									}
								});
								calendar.render();
							});
						},
						error: function (err) {
							console.error(err);
						}
					});
				},
				fnCloseScheduleModal() {
					this.showScheduleModal = false;
				},
				handleProfileUpload(event) {
					let self = this;
					const profile = event.target.files[0];
					if (!profile) return;
					const formData = new FormData();
					formData.append('profile', profile);
					// 필요한 경우 가이드 번호나 사용자 번호도 함께 전송

					$.ajax({
						url: '/admin/guide-profile.dox', // 파일 업로드 처리 엔드포인트
						type: 'POST',
						data: formData,
						processData: false,   // 파일 업로드 시 필수: 데이터를 문자열로 처리하지 않음
						contentType: false,   // 필수: multipart/form-data로 전송
						dataType: 'json',
						success: function (data) {
							console.log("프로필 이미지 저장:");
							console.log(data);
							if (data.result === 'success') {
								// 서버가 새 파일 경로를 반환한다고 가정: data.newFilePath
								self.editGuide.pFilePath = data.newFilePath;
								self.editGuide.pFileNo = data.pFileNo;
								console.log("파일넘버 : ");
								console.log(self.editGuide.pFileNo);

							} else {
								alert('이미지 업로드에 실패했습니다.');
							}
						},
						error: function (err) {
							console.error('이미지 업로드 중 오류 발생:', err);
							alert('이미지 업로드 중 오류가 발생했습니다.');
						}
					});
				},
				fnOpenAddModal() {
					let self = this;
					self.showAddModal = true;
				},
				fnCloseAddModal() {
					let self = this;
					self.showAddModal = false;
					self.newGuide = {
						userFirstName: "",
						password: "",
						email: "",
						gender: "M",
						phone: "",
						birthday: "",
						address: "",
						language: "",
						experience: "",
					};
					self.editGuide = {
						pFilePath: "",
						pFileNo: "",
					};
					self.addConfirmPassword = "";
					self.passwordRules = { length: false, upper: false, lower: false, special: false, number: false };
					self.passwordValid = false;
					self.passwordsMatch = false;
				},
				fnAddGuide() {
					let self = this;
					let nparmap = {
						userFirstName: self.newGuide.userFirstName,
						password: self.newGuide.password,
						email: self.newGuide.email,
						gender: self.newGuide.gender,
						phone: self.newGuide.phone,
						birthday: self.newGuide.birthday,
						address: self.newGuide.address,
						language: self.newGuide.language,
						experience: self.newGuide.experience,
						pFilePath: self.editGuide.pFilePath,
						pFileNo: self.editGuide.pFileNo,
					};
					if (!self.newGuide.userFirstName || self.newGuide.userFirstName.trim() === "") {
						alert("이름을 입력하세요.");
						return;
					}
					if (!self.newGuide.password) {
						alert("비밀번호를 입력하세요.");
						return;
					}
					if (!self.passwordRules.length) {
						alert("비밀번호는 6글자 이상입니다.");
						return;
					}
					if (!self.passwordRules.upper) {
						alert("비밀번호에 대문자가 하나 이상 포함되야 합니다.");
						return;
					}
					if (!self.passwordRules.lower) {
						alert("비밀번호에 소문자가 하나 이상 포함되야 합니다.");
						return;
					}
					if (!self.passwordRules.special) {
						alert("비밀번호에 특수문자가 하나 이상 포함되야 합니다.");
						return;
					}
					if (!self.passwordRules.number) {
						alert("비밀번호에 숫자가 하나 이상 포함되야 합니다.");
						return;
					}
					if (!self.passwordsMatch) {
						alert("비밀번호를 확인해주세요.");
						return;
					}
					if (!self.newGuide.email || self.newGuide.email.trim() === "") {
						alert("이메일을 입력하세요.");
						return;
					}
					if (!self.newGuide.phone || self.newGuide.phone.trim() === "") {
						alert("연락처를 입력하세요.");
						return;
					}
					if (!self.newGuide.birthday || self.newGuide.birthday.trim() === "") {
						alert("생년월일을 입력하세요.");
						return;
					}
					if (!self.newGuide.birthday >= new Date()) {
						alert("생년월일을 확인해주세요.");
						return;
					}
					if (!self.newGuide.address || self.newGuide.address.trim() === "") {
						alert("주소를 입력하세요.");
						return;
					}
					if (!self.newGuide.language || self.newGuide.language.trim() === "") {
						alert("사용가능 언어를 입력하세요.");
						return;
					}
					if (!self.newGuide.experience || self.newGuide.experience.trim() === "") {
						alert("자기소개 및 경력을 입력하세요.");
						return;
					}
					$.ajax({
						url: "/admin/guide-insert.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							if (data.result === "success") {
								alert("가이드가 성공적으로 등록되었습니다.");
								self.fnCloseAddModal();
								self.fnGetGuidesList();
							} else {
								alert("등록에 실패했습니다.");
							}
						},
						error: function (err) {
							console.error(err);
							alert("등록 요청 중 오류가 발생했습니다.");
						}
					});
				},
				handleImageError(event) {
					event.target.style.display = 'none'; // 이미지 숨기기
					event.target.parentNode.innerHTML = '<div class="no-image">NO Image</div>'; // 부모 div에 No Image 삽입
				},
			},
			mounted() {
				let self = this;
				if (!self.sessionId || self.sessionRole != 'ADMIN') {
					alert("관리자만 이용가능합니다.");
					location.href = "/main.do";
				}
				self.fnGetGuidesList();
			}
		});
		app.mount('#app');
	</script>