<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.7.1.js"
			integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
		<script src="https://unpkg.com/vue-star-rating@next/dist/VueStarRating.umd.min.js"></script>
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
		<script src="https://cdn.tailwindcss.com"></script>
		<link rel="stylesheet" href="../../css/kapture-style.css">
		<link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
		<link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
		<title>상품 상세 | kapture</title>
		<style>
			
		</style>
	</head>

	<body class="bg-white text-gray-800 text-[16px] tracking-wide">
		<jsp:include page="../common/header.jsp" />
		<div id="app" class="px-4 py-6">
			<div class="max-w-[1280px] mx-auto">
				<!-- 상품 정보 섹션 -->
				<div v-if="tourInfo && tourInfo.title"
					class="bg-white rounded-xl shadow-lg p-4 flex flex-col md:flex-row gap-6 border border-gray-200 mb-6">
					<div class="w-full md:w-1/2">
						<img class="rounded-xl shadow-md w-full h-96 object-cover transition-transform duration-300 hover:scale-105"
							:src="tourInfo.filePath" />
					</div>
					<div class="w-full md:w-1/2 flex flex-col gap-4">
						<h1 class="text-3xl font-bold text-center text-gray-800 relative">
							{{ tourInfo.title }}
							<div class="w-160 h-1 bg-blue-950 mx-auto mt-2 rounded"></div>
						</h1>
						<div class="flex items-start gap-4 bg-blue-50 border border-gray-200 rounded-lg p-4">
							<img :src="getImagePath(tourInfo.pFilePath)" alt="가이드 사진"
								class="w-32 h-32 flex-shrink-0 rounded-full border object-cover" />
							<div class="text-sm text-gray-800 space-y-2">
								<div class="flex items-center gap-4 text-gray-600 text-lg flex-wrap">
									<p class="font-bold text-2xl text-black">{{ tourInfo.userFirstName }}</p>
									<p class="font-semibold text-lg">성별: {{ tourInfo.gender === 'M' ? '남자' : '여자' }}</p>
									<p class="font-semibold text-lg">사용 언어: {{ tourInfo.language }}</p>
								</div>
								<p class="text-gray-600 text-lg whitespace-pre-wrap">{{ tourInfo.experience }}</p>
							</div>
						</div>

						<!-- 📌 가격/날짜/차량 정보 -->
						<div class="flex flex-col items-center gap-5 mt-4 text-xl text-gray-700">

							<!-- 💰 윗줄: 가격 + 총 금액 -->
							<div
								class="flex flex-wrap justify-center items-center gap-16 text-2xl font-semibold text-blue-950">
								<div>
									₩{{ Number(tourInfo.price).toLocaleString() }}
									<span class="text-sm text-gray-600 font-medium">/ 인당</span>
								</div>
								<div class="text-gray-800 font-bold">
									총 금액 : ₩{{ (Number(tourInfo.price) * count).toLocaleString() }}
								</div>
							</div>

							<!-- 🗓️ 아랫줄: 날짜 / 시간 / 차량 -->
							<div class="flex flex-wrap justify-center items-center gap-16 text-xl text-gray-600">
								<div class="flex items-center gap-1">
									📅 {{ formatDate(tourInfo.tourDate) }}
								</div>
								<div class="flex items-center gap-1">
									⏰ {{ tourInfo.duration }}
								</div>
								<div class="flex items-center gap-2">
									<img v-if="tourInfo.vehicle === 'COMPANY'" src="/svg/car-company.svg"
										class="w-5 h-5" alt="회사 차량">
									<img v-else-if="tourInfo.vehicle === 'GUIDE'" src="/svg/car.svg" class="w-5 h-5"
										alt="가이드 차량">
									<img v-else-if="tourInfo.vehicle === 'PUBLIC'" src="/svg/bus.svg" class="w-5 h-5"
										alt="대중교통">
									<span>
										{{
										tourInfo.vehicle === 'COMPANY' ? '회사 차량 제공' :
										tourInfo.vehicle === 'GUIDE' ? '가이드 차량 이용' :
										tourInfo.vehicle === 'PUBLIC' ? '대중교통 이용' : ''
										}}
									</span>
								</div>
							</div>
						</div>

						<!-- 📌 3. 인원수 + 찜/장바구니 -->
						<div class="flex justify-between items-center mt-4">
							<!-- 👥 인원수 -->
							<div class="flex items-center text-xl gap-6 text-base">
								<button @click="decrease"
									class="px-5 py-2 rounded bg-gray-200 hover:bg-gray-300 text-lg">-</button>
								<span class="min-w-[100px] text-center">인원수 {{ count }}명</span>
								<button @click="increase"
									class="px-5 py-2 rounded bg-gray-200 hover:bg-gray-300 text-lg">+</button>
							</div>

							<!-- 💙 찜 + 장바구니 -->
							<div class="flex items-center gap-4 mr-3" v-if="tourInfo && tourInfo.title">
								<div class="flex items-center gap-2 cursor-pointer mr-5"
									@click="toggleFavorite(tourInfo)">
									<img :src="tourInfo.isFavorite === 'Y' ? '/svg/taeguk-full.svg' : '/svg/taeguk-outline.svg'"
										alt="찜 아이콘" class="w-9 h-9 hover:scale-110 transition-transform" />
									<span class="text-blue-950 font-semibold text-base">
										{{ tourInfo.isFavorite === 'Y' ? '찜 취소' : '찜 하기' }}
									</span>
								</div>
								<button @click="fnAddedToCart"
									class="bg-blue-950 text-white px-5 py-2.5 rounded hover:bg-blue-800 flex items-center gap-2 text-base font-medium shadow-sm">
									🛒 <span>장바구니 담기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 설명 -->
				<div v-if="tourInfo && tourInfo.title">
					<div
						class="bg-white rounded-xl shadow-lg p-6 flex flex-col md:flex-row gap-6 border border-gray-200 mb-6">
						<div class="prose max-w-none mt-6 min-h-[600px] px-20 py-10" v-html="styledDescription"></div>
					</div>
					<div class="flex gap-4 mb-8" v-if="sessionId == tourInfo.userNo">
						<button class="px-4 py-2 bg-blue-950 text-white rounded hover:bg-blue-700"
							@click="fnEdit">수정</button>
						<button class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600"
							@click="fnDelete">삭제</button>
					</div>
				</div>
				<!-- 후기 -->
				<div
					class="bg-white rounded-xl shadow-lg pt-1 p-6 flex flex-row md:flex-col gap-6 border border-gray-200 mb-6">
					<div class="mt-10 border-t pt-6 space-y-6">
						<div class="flex items-center gap-3">
							<div
								class="inline-block bg-blue-100 text-blue-800 text-sm font-semibold px-3 py-1 rounded-full mb-2">
								이용 후기
							</div>
							<star-rating :rating="getReviewAvg()" :read-only="true" :increment="0.01"
								:show-rating="false" />
							<span class="text-gray-500 text-sm">{{ getReviewAvg() }} / 5</span>
						</div>

						<div class="space-y-2">
							<div v-for="n in 5" :key="n" class="flex items-center gap-4 text-sm">
								<span class="w-10">{{ n }}점</span>
								<div class="w-full bg-gray-200 rounded h-3 overflow-hidden">
									<div class="bg-yellow-400 h-full" :style="{ width: getReviewPercentage(n) + '%' }">
									</div>
								</div>
								<span class="w-12 text-right">{{ getReviewCount(n) }}명</span>
							</div>
						</div>
					</div>
					<!-- 후기 목록 -->
					<div class="bg-white rounded-xl shadow-lg p-6 flex flex-col gap-6 border border-gray-200 mb-6">
						<div class="space-y-6">
							<div v-for="review in reviewsList" :key="review.reviewNo" class="border-t pt-4">
								<!-- 이름 -->
								<div class="flex justify-between items-center text-base font-bold text-blue-950">
									<!-- 좌측: 이름 + 별점 -->
									<div class="flex text-lg items-center gap-3">
										<span>{{ review.userFirstName }} {{ review.userLastName }}</span>
										<star-rating :rating="Number(review.rating)" :read-only="true"
											:show-rating="false" :star-size="20" />
									</div>
									<!-- 우측: 작성일 -->
									<div class="text-sm text-gray-500 font-semibold">
										{{ formatDate(new Date(review.rCreatedAt)) }}
									</div>
								</div>
								<!-- 코멘트 -->
								<div
									class="mt-2 p-3 bg-gray-50 border border-gray-200 rounded text-gray-800 text-[15px] leading-relaxed whitespace-pre-line break-words">
									{{ review.comment }}
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 장바구니 트리거 바 -->
				<div class="fixed bottom-0 left-1/2 transform -translate-x-1/2 w-44 text-white text-center py-2 rounded-t-lg cursor-pointer z-50 bg-blue-950 hover:bg-blue-700 transition-colors"
					@click="showModal = true">
					<div class="text-sm flex items-center justify-center gap-2 w-32 mx-auto font-bold">
						🛒 장바구니 열기
					</div>
				</div>

				<div class="fixed inset-0 z-50 flex items-end justify-center"
					:class="showModal ? 'bg-black bg-opacity-50 pointer-events-auto' : 'bg-transparent pointer-events-none'"
					@click.self="handleCartClose">

					<!-- ✅ 모달 본체 (슬라이드 업) -->
					<transition name="slide-modal">
						<div v-if="showModal" class="bg-white w-full max-w-4xl mx-auto rounded-t-2xl" @click.stop>

							<!-- ✅ 내부 컨텐츠 -->
							<div class="p-6 max-h-[90vh] overflow-y-auto">

								<!-- 고정된 상단 -->
								<div
									class="sticky top-0 bg-white z-50 flex justify-between items-center mb-4 border-b pb-2 px-4 pt-4">
									<h2 class="text-lg font-bold">🗓️ 일정 확인</h2>
									<button class="text-sm text-red-500 hover:underline"
										@click="handleCartClose">닫기</button>
								</div>

								<div class="overflow-x-auto">
									<!-- text-center, align-middle 추가 -->
									<table class="w-full text-center align-middle">
										<thead class="bg-blue-950 text-white">
											<tr>
												<th class="border-2 border-gray-400 w-40 
                                           h-[1rem] box-border px-4 py-2 text-base 
                                           overflow-hidden whitespace-nowrap text-ellipsis">
													날짜
												</th>
												<th class="border-2 border-gray-400 w-30
                                           h-[1rem] box-border px-4 py-2 text-base
                                           overflow-hidden whitespace-nowrap text-ellipsis">
													시간
												</th>
												<th class="border-2 border-gray-400
                                           h-[1rem] box-border px-4 py-2 text-base
                                           overflow-hidden whitespace-nowrap text-ellipsis">
													상품 제목
												</th>
												<th class="border-2 border-gray-400 w-30
                                           h-[1rem] box-border px-4 py-2 text-base
                                           overflow-hidden whitespace-nowrap text-ellipsis">
													인원 수
												</th>
												<th class="border-2 border-gray-400
                                           h-[1rem] box-border px-4 py-2 text-base
                                           overflow-hidden whitespace-nowrap text-ellipsis">
													금액
												</th>
												<th class="border-2 border-gray-400 w-20
                                           h-[1rem] box-border px-4 py-2 text-base
                                           overflow-hidden whitespace-nowrap text-ellipsis">
													삭제
												</th>
											</tr>
										</thead>

										<tbody>
											<!-- 예시: 7일 반복 -->
											<template v-for="n in 7" :key="'day-' + n">
												<!-- (1) 종일 예약 -->
												<template
													v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '종일')">
													<tr>
														<!-- 날짜 -->
														<td
															class="border border-gray-500 h-[1rem] box-border px-4 py-2 text-base overflow-hidden whitespace-nowrap text-ellipsis align-middle font-bold">
															{{ formatDate(addDays(minDate, n - 1)) }}
														</td>
														<!-- 시간 -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															종일
														</td>
														<!-- 상품 제목 -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															{{ getCartItemByDateAndTime(addDays(minDate, n - 1),
															'종일')?.title ||
															''
															}}
														</td>
														<!-- 인원 수 -->
														<td
															class="border border-gray-500 h-[1rem] box-border px-4 py-2 text-base overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<div v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '종일')"
																class="flex items-center justify-center gap-2">
																<button class="px-2 py-1 bg-blue-950 text-white rounded"
																	@click="changePeople(getCartItemByDateAndTime(addDays(minDate, n - 1), '종일'), -1)"
																	:disabled="(getCartItemByDateAndTime(addDays(minDate, n - 1), '종일')?.numPeople || 0) <= 1">
																	-
																</button>
																<span>
																	{{ getCartItemByDateAndTime(addDays(minDate, n - 1),
																	'종일')?.numPeople || 0 }}명
																</span>
																<button class="px-2 py-1 bg-blue-950 text-white rounded"
																	@click="changePeople(getCartItemByDateAndTime(addDays(minDate, n - 1), '종일'), 1)"
																	:disabled="(getCartItemByDateAndTime(addDays(minDate, n - 1), '종일')?.numPeople || 0) >= 4">
																	+
																</button>
															</div>
														</td>
														<!-- 금액 -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															₩ {{
															(
															Number(getCartItemByDateAndTime(addDays(minDate, n - 1),
															'종일')?.price ||
															0) *
															Number(getCartItemByDateAndTime(addDays(minDate, n - 1),
															'종일')?.numPeople || 0)
															).toLocaleString()
															}}
														</td>
														<!-- 삭제 -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<button
																class="border border-gray-300 rounded text-red-500 hover:underline px-2 py-1"
																@click="deleteFromCart(getCartItemByDateAndTime(addDays(minDate, n - 1), '종일'))">
																🗑️
															</button>
														</td>
													</tr>
												</template>

												<!-- (2) 오전/오후 예약 -->
												<template v-else>
													<!-- 오전 행 -->
													<tr>
														<!-- 날짜 (rowspan=2) -->
														<td class="border border-gray-500 h-[1rem] box-border px-4 py-2 text-base overflow-hidden whitespace-nowrap text-ellipsis align-middle font-bold"
															rowspan="2">
															{{ formatDate(addDays(minDate, n - 1)) }}
														</td>
														<!-- 시간(오전) -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															오전
														</td>
														<!-- 상품 제목(오전) -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															{{ getCartItemByDateAndTime(addDays(minDate, n - 1),
															'오전')?.title ||
															''
															}}
														</td>
														<!-- 인원 수(오전) -->
														<td
															class="border border-gray-500 h-[1rem] box-border px-4 py-2 text-base overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<div v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '오전')"
																class="flex items-center justify-center gap-2">
																<button class="px-2 py-1 bg-blue-950 text-white rounded"
																	@click="changePeople(getCartItemByDateAndTime(addDays(minDate, n - 1), '오전'), -1)"
																	:disabled="(getCartItemByDateAndTime(addDays(minDate, n - 1), '오전')?.numPeople || 0) <= 1">
																	-
																</button>
																<span>
																	{{ getCartItemByDateAndTime(addDays(minDate, n - 1),
																	'오전')?.numPeople || 0 }}명
																</span>
																<button class="px-2 py-1 bg-blue-950 text-white rounded"
																	@click="changePeople(getCartItemByDateAndTime(addDays(minDate, n - 1), '오전'), 1)"
																	:disabled="(getCartItemByDateAndTime(addDays(minDate, n - 1), '오전')?.numPeople || 0) >= 4">
																	+
																</button>
															</div>
														</td>
														<!-- 금액(오전) -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<template
																v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '오전')">
																₩ {{
																(
																Number(getCartItemByDateAndTime(addDays(minDate, n - 1),
																'오전')?.price || 0) *
																Number(getCartItemByDateAndTime(addDays(minDate, n - 1),
																'오전')?.numPeople || 0)
																).toLocaleString()
																}}
															</template>
														</td>
														<!-- 삭제(오전) -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<button
																v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '오전')"
																class="border border-gray-300 rounded text-red-500 hover:underline px-2 py-1"
																@click="deleteFromCart(getCartItemByDateAndTime(addDays(minDate, n - 1), '오전'))">
																🗑️
															</button>
														</td>
													</tr>
													<!-- 오후 행 -->
													<tr>
														<!-- 시간(오후) -->
														<td
															class="border border-gray-500 h-[1rem] box-border px-4 py-2 text-base overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															오후
														</td>
														<!-- 상품 제목(오후) -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															{{ getCartItemByDateAndTime(addDays(minDate, n - 1),
															'오후')?.title ||
															''
															}}
														</td>
														<!-- 인원 수(오후) -->
														<td
															class="border border-gray-500 h-[1rem] box-border px-4 py-2 text-base overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<div v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '오후')"
																class="flex items-center justify-center gap-2">
																<button class="px-2 py-1 bg-blue-950 text-white rounded"
																	@click="changePeople(getCartItemByDateAndTime(addDays(minDate, n - 1), '오후'), -1)"
																	:disabled="(getCartItemByDateAndTime(addDays(minDate, n - 1), '오후')?.numPeople || 0) <= 1">
																	-
																</button>
																<span>
																	{{ getCartItemByDateAndTime(addDays(minDate, n - 1),
																	'오후')?.numPeople || 0 }}명
																</span>
																<button class="px-2 py-1 bg-blue-950 text-white rounded"
																	@click="changePeople(getCartItemByDateAndTime(addDays(minDate, n - 1), '오후'), 1)"
																	:disabled="(getCartItemByDateAndTime(addDays(minDate, n - 1), '오후')?.numPeople || 0) >= 4">
																	+
																</button>
															</div>
														</td>
														<!-- 금액(오후) -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<template
																v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '오후')">
																₩ {{
																(
																Number(getCartItemByDateAndTime(addDays(minDate, n - 1),
																'오후')?.price || 0) *
																Number(getCartItemByDateAndTime(addDays(minDate, n - 1),
																'오후')?.numPeople || 0)
																).toLocaleString()
																}}
															</template>
														</td>
														<!-- 삭제(오후) -->
														<td class="border border-gray-500
                                               h-[1rem] box-border px-4 py-2 text-base
                                               overflow-hidden whitespace-nowrap text-ellipsis align-middle">
															<button
																v-if="getCartItemByDateAndTime(addDays(minDate, n - 1), '오후')"
																class="border border-gray-300 rounded text-red-500 hover:underline px-2 py-1"
																@click="deleteFromCart(getCartItemByDateAndTime(addDays(minDate, n - 1), '오후'))">
																🗑️
															</button>
														</td>
													</tr>
												</template>
											</template>
										</tbody>
									</table>
								</div>
								<div class="mt-3 text-right text-lg font-semibold text-gray-700 h-47">
									💰 최종 금액: <span class="text-green-600">{{ getTotalPrice().toLocaleString() }}</span>
									원
								</div>
								<div class="flex justify-end mt-2">
									<button @click="fnPay"
										class="w-48 text-sm text-white px-4 py-2 rounded shadow text-center bg-blue-950 hover:bg-blue-700 transition-colors">
										결제하기
									</button>
								</div>
							</div>
						</div>
					</transition>
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
					tourNo: "",
					count: 0,
					tourInfo: {},
					reviewsList: [],
					sessionId: "${sessionId}",
					showModal: false,
					date: new Date(),
					showCartButton: false,
					tourDate: null,
					dateList: [],
					minDate: null,
					maxDate: null,

					cartList: [],
					isFavorite: "N"

				};
			},
			computed: {
				styledDescription() {
				  if (!this.tourInfo?.description) return "";
				  return this.tourInfo.description.replace(
					/<img([^>]+)>/g,
					'<img style="width:1000px; height:800px;" $1>'
				  );
				}
			  },
			methods: {
				fnTourInfo() {
					let self = this;
					let nparmap = {
						tourNo: self.tourNo,
					};
					console.log("파라미터tourNo :",nparmap);
					$.ajax({
						url: "/tours/tour-info.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log("tourInfo>>>>>>",data);
							self.tourInfo = data.tourInfo;
							self.tourInfo.isFavorite = "N";
							console.log(self.tourInfo);
							self.reviewsList = data.reviewsList;
							console.log(self.reviewsList);
							console.log('투어 날짜 : ', self.tourInfo.tourDate);
							self.fnGetWishList();
							document.title = self.tourInfo.title + " | Kapture";

						}
					});
				},
				increase() {
					if (this.count < 4) this.count++;
					console.log('인원수 : ', this.count);
				},
				decrease() {
					if (this.count > 0) this.count--;
					console.log('인원수 : ', this.count);
				},
				getReviewCount(star) {
					return this.reviewsList.filter(r => r.rating === star).length;
				},

				// 특정 별점의 비율을 계산 (전체 리뷰 대비 %)
				getReviewPercentage(star) {
					const total = this.reviewsList.length;
					if (total === 0) return 0;
					return (this.getReviewCount(star) / total) * 100;
				},
				getReviewAvg() {
					if (this.reviewsList.length === 0) return 0;
					const total = this.reviewsList.reduce((sum, rating) => sum + rating.rating, 0);
					return parseFloat((total / this.reviewsList.length).toFixed(1));
				},

				getImagePath(path) {
					console.log('원본 path >>>', path);
					if (!path) return '/img/logo/kapture_Logo.png';
					if (path.startsWith('http')) return path;
					return path.replace('..', '');
				},

				fnAddedToCart() {
					let self = this;
					let nparmap = {
						tourNo: self.tourNo,
						sessionId: self.sessionId,
						count: self.count
					};

					if (!self.sessionId) {
						alert('로그인이 필요합니다.');
						location.href = '/login.do'
						return;
					}

					if (self.count <= 0) {
						alert('인원수를 선택해주세요.');
						return;
					}

					if (!self.cartList || self.cartList.length === 0) {
						const today = new Date();
						const selectedDate = new Date(self.tourInfo.tourDate);

						// 오늘보다 이전 또는 같은 날짜면 담을 수 없음
						if (selectedDate <= today) {
							alert('오늘 이후의 날짜만 선택 가능합니다.');
							return;
						}

						// 최초 담기이므로 min/maxDate는 오늘 기준으로 초기화
						self.minDate = selectedDate;
						self.maxDate = selectedDate;
					}

					self.fnGetMinTourDate();
					self.fnGetMaxTourDate();

					// 같은 날짜에 "종일" 상품이 있는지 확인
					const selectedDate = self.formatDate(new Date(self.tourInfo.tourDate));
					const hasFullDay = self.cartList.some(item =>
						self.formatDate(new Date(item.tourDate)) === selectedDate && item.duration === '종일');

					// 같은 날짜에 "오전" 또는 "오후" 상품이 있는지 확인
					const hasMorningOrAfternoon = self.cartList.some(item =>
						self.formatDate(new Date(item.tourDate)) === selectedDate && (item.duration === '오전' || item.duration === '오후'));

					// "종일" 상품이 이미 있는 경우 "오전" 또는 "오후" 상품 추가 불가
					if ((self.tourInfo.duration === '오전' || self.tourInfo.duration === '오후') && hasFullDay) {
						alert('같은 날짜에 종일 상품이 이미 담겨 있어 오전 또는 오후 상품을 담을 수 없습니다.');
						return;
					}

					// "오전" 또는 "오후" 상품이 이미 있는 경우 "종일" 상품 추가 불가
					if (self.tourInfo.duration === '종일' && hasMorningOrAfternoon) {
						alert('같은 날짜에 오전 또는 오후 상품이 이미 담겨 있어 종일 상품을 담을 수 없습니다.');
						return;
					}

  					if (self.tourInfo.duration === '오전') {
    					const existsMorning = self.cartList.some(item =>
      					self.formatDate(new Date(item.tourDate)) === selectedDate && item.duration === '오전');
    					if (existsMorning) {
      						alert('같은 날짜에 이미 오전 상품이 담겨 있습니다.');
      						return;
    					}
  					}

  					if (self.tourInfo.duration === '오후') {
    					const existsAfternoon = self.cartList.some(item =>
      					self.formatDate(new Date(item.tourDate)) === selectedDate && item.duration === '오후');
    					if (existsAfternoon) {
      						alert('같은 날짜에 이미 오후 상품이 담겨 있습니다.');
      						return;
    					}
  					}

					if (self.minDate && self.cartList.length > 0) { // 장바구니에 이미 투어가 담겨있다면 날짜 비교
						const selectedDate = new Date(self.tourInfo.tourDate);
						const mindate = new Date(self.minDate);
						const maxdate = new Date(self.maxDate);
						const diffMin = Math.abs(Math.ceil((selectedDate - mindate) / (1000 * 60 * 60 * 24)));
						const diffMax = Math.abs(Math.ceil((selectedDate - maxdate) / (1000 * 60 * 60 * 24)));
						if (diffMax > 6 || diffMin > 6) {
							alert('장바구니에 담긴 투어와 6일 이상 차이납니다. 담을 수 없습니다.');
							return;
						}
					} else {
						// 🧠 장바구니가 비어있는 경우 → tourDate를 기준으로 초기화
						const baseDate = new Date();
						self.minDate = baseDate;
						self.maxDate = baseDate;
					}


					let existingItem = self.cartList.find(item =>
						item.tourNo == self.tourNo &&
						self.formatDate(new Date(item.tourDate)) === self.formatDate(new Date(self.tourInfo.tourDate)) &&
						item.duration === self.tourInfo.duration
					);

					console.log('existingItem : ', existingItem);


					if (existingItem) {
						if (existingItem.numPeople != self.count) {
							$.ajax({
								url: "/basket/update.dox",
								dataType: "json",
								type: "POST",
								data: {
									basketNo: existingItem.basketNo,  // 기존 항목의 고유 ID
									count: self.count
								},
								success: function (data) {
									alert('인원수가 변경되었습니다.');
									localStorage.setItem("basketChanged", Date.now());
									self.fnGetCart();
									self.fnGetMinTourDate();
									self.fnGetMaxTourDate();
									self.fnGetTourDateList();
									self.fnGetBasketList();
									self.fnGetBasket();

								}
							});
							return;
						} else {
							alert("이미 담은 상품입니다!");
							return;
						}
					}

					$.ajax({
						url: "/basket/add.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							if (data.result == "success") {
								alert("장바구니에 담겼습니다.");
								self.fnGetCart();
								self.fnGetMinTourDate();
								self.fnGetMaxTourDate();
								self.fnGetTourDateList();
								self.fnGetBasketList();
								self.fnGetBasket();
								location.reload();
							} else {
								alert("이미 담은 상품입니다!");
							}
						}
					});
				},
				fnGetCart() {
					let self = this;
					let nparmap = {
						tourNo: self.tourNo,
						sessionId: self.sessionId,

					};

					$.ajax({
						url: "/basket/get.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							if (data.count > 0) {

							} else {

							}
						}
					});
				},
				fnGetMinTourDate() {
					let self = this;

					let nparmap = {
						tourNo: self.tourNo,
						sessionId: self.sessionId,
					}

					$.ajax({
						url: "/basket/getMinTourDate.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log('fnGetMinTourDate 호출', data);
							if (data.minDate) {
								// "4월 15, 2025" 형식의 날짜를 Date 객체로 변환
								const parts = data.minDate.split(' ');
								const month = parts[0].replace('월', '');
								const day = parseInt(parts[1].replace(',', ''), 10);
								const year = parseInt(parts[2], 10);

								// 월은 0부터 시작하므로 1을 빼줍니다.
								const monthIndex = parseInt(month, 10) - 1;
								const dateObj = new Date(year, monthIndex, day);
								self.minDate = dateObj;
							}
						}
					});
				},

				fnGetMaxTourDate() {
					let self = this;
					let nparmap = {
						tourNo: self.tourNo,
						sessionId: self.sessionId,

					};

					$.ajax({
						url: "/basket/getMaxTourDate.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log('fnGetMaxTourDate 호출', data);
							if (data.maxDate) {
								// "4월 15, 2025" 형식의 날짜를 Date 객체로 변환
								const parts = data.maxDate.split(' ');
								const month = parts[0].replace('월', '');
								const day = parseInt(parts[1].replace(',', ''), 10);
								const year = parseInt(parts[2], 10);

								// 월은 0부터 시작하므로 1을 빼줍니다.
								const monthIndex = parseInt(month, 10) - 1;
								const dateObj = new Date(year, monthIndex, day);
								self.maxDate = dateObj;
							}
						}
					});
				},

				fnGetTourDateList() {
					let self = this;
					let nparmap = {
						tourNo: self.tourNo,
						sessionId: self.sessionId,

					};

					$.ajax({
						url: "/basket/getTourDateList.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							self.dateList = data.dateList;
							console.log(self.dateList);
						}
					});
				},

				addDays(date, days) {
					const newDate = new Date(date);
					newDate.setDate(newDate.getDate() + days); // Use newDate here
					return newDate;
				},

				formatDate(date) {
					if (!date) return '';

					// 문자열이면 Date 객체로 변환
					if (!(date instanceof Date)) {
						date = new Date(date);
					}

					const year = date.getFullYear();
					const month = (date.getMonth() + 1).toString().padStart(2, '0');
					const day = date.getDate().toString().padStart(2, '0');
					return year + '-' + month + '-' + day;
				},

				fnGetBasketList() {
					let self = this;
					let nparmap = {
						sessionId: self.sessionId,
					};

					$.ajax({
						url: "/basket/getBasketList.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							console.log(data);
							self.cartList = data.basketList;

						}
					});
				},

				getSortedCartList() {
					return this.cartList.slice().sort((a, b) => {
						if (a.duration === '오전' && b.duration !== '오전') return -1;
						if (a.duration !== '오전' && b.duration === '오전') return 1;
						return 0;
					});
				},

				fnGetBasket() {
					let self = this;
					let nparmap = {
						sessionId: self.sessionId
					};
					$.ajax({
						url: "/basket/getCount.dox",
						type: "POST",
						data: nparmap,
						dataType: "json",
						success: function (data) {
							console.log(data);
							if (data.count > 0) {
								self.showCartButton = true;
							}

						}
					});
				},
				getCartItemByDateAndTime(date, time) {
					const formattedDate = this.formatDate(date);
					return this.cartList.find(item =>
						this.formatDate(new Date(item.tourDate)) === formattedDate &&
						item.duration === time
					) || null;
				},

				changePeople(item, diff) {
					const self = this;
					const index = self.cartList.findIndex(i => i.basketNo === item.basketNo);

					if (index !== -1) {
						// 반드시 숫자로 변환해서 연산
						const current = Number(self.cartList[index].numPeople);
						const newCount = current + diff;
						self.cartList[index].numPeople = newCount < 1 ? 1 : newCount;
					}
				},

				// 최종 금액 계산 메서드
				getTotalPrice() {
					return this.cartList.reduce((total, item) => total + Number(item.price) * Number(item.numPeople), 0);
				},

				deleteFromCart(item) {
					const self = this;
					if (!item || !item.basketNo) return;
					if (confirm("이 항목을 장바구니에서 삭제할까요?")) {
						$.ajax({
							url: "/payment/removeBasket.dox",
							type: "POST",
							data: { basketNo: item.basketNo },
							dataType: "json",
							success: function (data) {
								if (data.result === "success") {
									alert("삭제되었습니다.");
									localStorage.setItem("basketChanged", Date.now());
									self.fnGetBasketList();  // 장바구니 목록 갱신
									self.fnGetBasket();      // 아이콘 등 상태 갱신
									self.fnGetMinTourDate(); // 날짜 갱신
									self.fnGetMaxTourDate();
									location.reload();
								}
							}
						});
					}
				},

				handleCartClose() {
					let self = this;
					self.showModal = false;

					// 모든 장바구니 항목 업데이트
					let updatedCartList = self.cartList.map(item => ({
						basketNo: item.basketNo,
						count: item.numPeople
					}));
					$.ajax({
						url: "/basket/updateList.dox",
						type: "POST",
						contentType: "application/json",
						data: JSON.stringify({ cartList: updatedCartList }),
						success: function (data) {
							console.log("장바구니 업데이트 완료", data);
							localStorage.setItem("basketChanged", Date.now());
						},
						error: function (err) {
							console.error("장바구니 업데이트 실패", err);
						}
					});
				},

				fnPay() {
					this.handleCartClose();
					location.href = "/payment.do"
				},

				fnGetWishList() {
					let self = this;

					if (!self.sessionId) {
						return;
					}

					let nparmap = {
						userNo: parseInt(self.sessionId)
					};

					$.ajax({
						url: "/wishList/getWishList.dox",
						type: "POST",
						dataType: "json",
						data: nparmap,
						success: function (data) {
							const wishTourNos = (data.list || []).map(item => +item.tourNo);
							console.log("찜목록 tourNo 목록: ", wishTourNos);
							const currentTourNo = Number(self.tourInfo.tourNo); // 현재 보고 있는 상품 번호
							self.tourInfo.isFavorite = wishTourNos.includes(currentTourNo) ? "Y" : "N";

							console.log("최종 info 객체: ", self.tourInfo);
						}
					});
				},

				toggleFavorite(tour) {
					let self = this;
					tour.isFavorite = tour.isFavorite === "Y" ? "N" : "Y";
					if (tour.isFavorite === "Y") {
						$.ajax({
							url: "/wishList/addWishList.dox",
							type: "POST",
							data: {
								userNo: self.sessionId,
								guideNo: tour.guideNo,
								tourNo: tour.tourNo
							},
							success: function (res) {
								console.log("찜 추가됨", res);
							}
						});
					} else {
						$.ajax({
							url: "/wishList/removeWishList.dox",
							type: "POST",
							data: {
								userNo: self.sessionId,
								tourNo: tour.tourNo
							},
							success: function (res) {
								console.log("찜 제거됨", res);
							}
						});
					}
				},
				fnEdit() {
					location.href = "/mypage/guide-edit.do?tourNo=" + this.tourNo;
				},

				fnDelete() {
					let self = this;
					let nparmap = {
						tourNo: self.tourNo,
					};

					if (confirm("정말 삭제하시겠습니까?")) {
						$.ajax({
							url: "/mypage/guide-delete.dox",
							dataType: "json",
							type: "POST",
							data: nparmap,
							success: function (data) {
								if (data.result == "success") {
									alert("삭제되었습니다.");
									location.href = "/tours/list.do"
								} else {
									alert("삭제에 실패했습니다.");
								}
							}
						});
					}
				}


			},
			mounted() {
				let self = this;
				
				const params = new URLSearchParams(window.location.search);
				self.tourNo = params.get("tourNo") || "";
				
				self.fnGetBasketList();

				setTimeout(() => {
					if (self.cartList.length === 0 && self.tourInfo?.tourDate) {
						self.minDate = new Date(self.tourInfo.tourDate);
					}
				}, 300);
				
				self.fnTourInfo();
				self.fnGetCart();
				self.fnGetBasket();
				self.fnGetMinTourDate();
				self.fnGetMaxTourDate();
				self.fnGetTourDateList();

			}
		});
		app.component('star-rating', VueStarRating.default)
		app.mount('#app');
	</script>