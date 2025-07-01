<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.7.1.js"
			integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
		<script src="https://unpkg.com/@vuepic/vue-datepicker@latest"></script>
		<link rel="stylesheet" href="https://unpkg.com/@vuepic/vue-datepicker@latest/dist/main.css">
		<title>view 기본 세팅 파일</title>
	</head>
	<style>
	</style>

	<body>
		<div id="app">
			<div style="width : 200px;">
				<!-- 데이트 피커 다음으로 내려가면 작동안함 -->
				 <!-- 선택된 날짜 'yy/mm/dd' 하는 법 -->
				  <!-- 헤더, 푸터 인클루드 시 충돌 안나게 하는법 -->
				<div>선택한 날짜 : {{ date }}</div>
				<vue-date-picker v-model="date" multi-calendars model-auto range :min-date="new Date()"
					@input="params.startDate = _formatedDatepicker($event)" />

			</div>
		</div>
	</body>

	</html>
	<script>
		const app = Vue.createApp({
			data() {
				return {
					date: new Date(),
					// selectedDate: null,
				};
			},
			components: {
				VueDatePicker
			},
			// watch: {
			// 	date(date) {
			// 		this.selectedDate = date;
			// 	}
			// },
			// computed: {
			// 	formattedDate() {
			// 		if (!this.date) return ''; // 날짜가 없을 때 빈 문자열 반환
			// 		const d = new Date(this.date);
			// 		const yy = String(d.getFullYear()).slice(2); // 연도 두 자리
			// 		const mm = String(d.getMonth() + 1).padStart(2, '0'); // 월 (0부터 시작하므로 +1 필요)
			// 		const dd = String(d.getDate()).padStart(2, '0'); // 일
			// 		return yy + '/' + mm + '/' + dd;
			// 	}
			// },
			methods: {
				// formatDate(date) {
				// 	// 🟢 date가 유효한지 체크
				// 	// 🟢 YY/MM/DD 형식으로 변환
				// 	const yy = String(date.getFullYear()).slice(2); // '25'
				// 	const mm = String(date.getMonth() + 1).padStart(2, '0'); // '03'
				// 	const dd = String(date.getDate()).padStart(2, '0'); // '23'					
				// 	return yy + '/' + mm + '/' + dd;
				// }
			},
			mounted() {

			}
		});
		app.mount('#app');
	</script>