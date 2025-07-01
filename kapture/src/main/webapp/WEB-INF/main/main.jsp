<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8.4.7/swiper-bundle.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <link rel="stylesheet" href="../../css/chatbot.css">
        <script src="https://cdn.jsdelivr.net/npm/swiper@8.4.7/swiper-bundle.min.js"></script>
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <script src="https://unpkg.com/vue-star-rating@next/dist/VueStarRating.umd.min.js"></script>
        <title>메인 페이지 | kapture</title>
        <style>
            .gtranslate-wrapper,
            .chatbot-wrapper,
            .weather-wrapper {
                position: fixed;
                z-index: 9999;
                bottom: 40px;
                transition: bottom 0.3s ease;
            }
        </style>
    </head>

    <body class="bg-white text-gray-800 font-sans text-[16px] tracking-wide overflow-x-hidden">
        <jsp:include page="../common/header.jsp"></jsp:include>
        <aside class="w-[250px] bg-gray-100">
            <jsp:include page="../common/sidebar.jsp"></jsp:include>
        </aside>
        <div id="app" class="pb-12">

            <!-- Swiper 배너 -->
            <div class="relative w-full h-[600px]">
                <!-- ✅ 전체 어두운 오버레이 -->
                <div class="absolute inset-0 bg-black bg-opacity-40 z-10"></div>

                <!-- ✅ 텍스트를 배너 정중앙에 위치시키기 -->
                <div
                    class="absolute inset-0 z-20 flex flex-col items-center justify-center text-white text-center px-4">
                    <h1 class="text-6xl font-light">Capture Korea, Kapture Memories</h1>
                    <p class="text-2xl mt-4 font-light">한국을 담고, 기억을 Kapture 하세요</p>
                </div>

                <!-- ✅ 배경 이미지 (Swiper) -->
                <div class="swiper-container w-full h-full relative z-0">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img class="w-full h-full object-cover" src="../../img/banner.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img class="w-full h-full object-cover" src="../../img/han.jpg">
                        </div>
                        <div class="swiper-slide">
                            <img class="w-full h-full object-cover" src="../../img/banner3.jpg">
                        </div>
                    </div>
                </div>
            </div>
            <div class="max-w-[1200px] mx-auto mt-12">
                <h2 class="text-2xl font-bold mb-4 border-b-2 pb-2">추천 상품</h2>

                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
                    <div class="border rounded-xl shadow-md overflow-hidden flex flex-col justify-between"
                        v-for="tour in limitedToursList" :key="tour.tourNo">
                        <img :src="tour.filePath" class="w-full h-48 object-cover" alt="썸네일" />
                        <div class="p-4">
                            <div class="flex justify-between items-center text-sm text-gray-500 mb-2">
                                <span>{{ formatDate(tour.tourDate) }}</span>
                                <span># {{ tour.themeName }}</span>
                                <img :src="tour.isFavorite === 'Y' ? '../../svg/taeguk-full.svg' : '../../svg/taeguk-outline.svg'"
                                    alt="찜 아이콘" class="w-8 h-8 cursor-pointer" @click="toggleFavorite(tour)" />
                            </div>
                            <h3 class="text-lg font-semibold mb-2">{{ tour.title }}</h3>
                            <p class="text-gray-600 text-sm mb-3">{{ truncateHtml(tour.description) }}</p>
                            <div class="flex justify-between items-center">
                                <span class="text-yellow-500 text-sm flex items-center gap-1">
                                    <span>⭐</span>
                                    <span>{{ tour.rating || 0 }}</span>
                                    <span>/ 5</span>
                                </span>
                                <span class="font-bold text-blue-600">₩ {{ tour.price.toLocaleString() }}</span>
                            </div>
                            <button class="mt-4 w-full bg-blue-950 hover:bg-blue-700 text-white py-2 px-4 rounded"
                                @click="goToTourInfo(tour.tourNo)">예약하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 추천 리뷰 -->
            <div class="mb-10 max-w-[1200px] mx-auto mt-12">
                <div class="text-2xl font-semibold border-b border-gray-300 pb-2 mb-6">최근 리뷰</div>
                <div class="space-y-6">
                    <div v-for="item in limitedReviewList"
                        class="p-5 bg-white rounded-xl shadow-md hover:shadow-lg transition">
                        <div class="flex items-start gap-4">
                            <!-- 썸네일 이미지 -->
                            <img :src="item.filePath" alt="상품 이미지" class="w-20 h-20 object-cover rounded-full shadow" />
                            <!-- 리뷰 정보 -->
                            <div class="flex-1">
                                <!-- 작성자 & 작성일 -->
                                <div class="flex items-center justify-between text-sm text-gray-500 mb-2">
                                    <!-- 👤 작성자 + ⭐ 평점 -->
                                    <div class="flex items-center gap-4">
                                        <span>👤 {{ item.userFirstname }} {{ item.userLastname || '' }}</span>
                                        <div class="flex items-center gap-1 text-gray-600">
                                            <span>⭐ 평점:</span>
                                            <template v-if="showRating && typeof item.rating === 'number'">
                                                <star-rating :rating="item.rating" :read-only="true" :star-size="14"
                                                    :increment="1" :border-width="3" :show-rating="false"
                                                    :rounded-corners="true"
                                                    class="inline-block align-middle"></star-rating>
                                            </template>
                                        </div>
                                    </div>
                                    <!-- 🕒 작성일 -->
                                    <span>🕒 {{ formatDate(item.rCreatedAt) }}</span>
                                </div>

                                <div class="flex flex-wrap items-center gap-8 mb-1">
                                    <!-- 제목 -->
                                    <div class="text-xl font-bold text-gray-800 cursor-pointer"
                                        @click="goToTourInfo(item.tourNo)">
                                        {{ item.title }}
                                    </div>

                                    <!-- 투어 정보 -->
                                    <div class="flex flex-wrap items-center gap-x-4 text-sm text-gray-600">
                                        <span>📅 투어 날짜: <span class="font-semibold">{{ formatDate(item.tourDate)
                                                }}</span></span>
                                        <span>⏱ {{ item.duration }}</span>
                                        <span>💸 가격: <span class="font-semibold">₩{{ item.price.toLocaleString()
                                                }}</span></span>
                                    </div>
                                </div>

                                <!-- 내용 -->
                                <p class="text-gray-700 mt-2 text-lg  mb-2 font-bold leading-relaxed">📝 {{ item.comment
                                    }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>

    </html>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    swiper: null,
                    toursList: [],
                    sessionId: "${sessionId}",
                    userInput: "",
                    messages: [],
                    bottomOffset: 40,
                    showChat: false,
                    showWeather: false,
                    reviewList: [],
                    showRating: false,
                };
            },

            computed: {
                limitedToursList() {
                    return this.toursList.slice(0, 12); // 최대 9개만 반환
                },

                limitedReviewList() {
                    return this.reviewList.slice(0, 4); // 최대 9개만 반환
                }
            },
            methods: {
                formatDate(input) {
                    if (!input) return '';

                    // 문자열인 경우: "2025-04-12 00:00:00"
                    if (typeof input === 'string') {
                        return input.split(' ')[0];
                    }

                    // Date 객체인 경우
                    const year = input.getFullYear();
                    const month = (input.getMonth() + 1).toString().padStart(2, '0');
                    const day = input.getDate().toString().padStart(2, '0');
                    return year + '-' + month + '-' + day;
                },

                truncateHtml(html, maxLength = 40) {
                    const div = document.createElement("div");
                    div.innerHTML = html;
                    const text = div.textContent || div.innerText || "";
                    return text.length > maxLength ? text.substring(0, maxLength) + "..." : text;
                },

                fnToursList() {
                    let self = this;
                    let nparmap = {
                    };
                    $.ajax({
                        url: "/main/getTourandRatingList.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            self.toursList = data.list;
                        }
                    });
                },

                fnGetWishList() {
                    let self = this;
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

                            self.toursList = self.toursList.map(function (tour) {
                                const tourNo = Number(tour.tourNo);
                                return {
                                    ...tour,
                                    isFavorite: wishTourNos.includes(tourNo) ? "Y" : "N"
                                };
                            });

                            console.log("최종 toursList: ", self.toursList);
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

                goToTourInfo(tourNo) {
                    location.href = "/tours/tour-info.do?tourNo=" + tourNo;
                },

                fnGetReviewList() {
                    let self = this;
                    let nparmap = {
                        tourNo: 1
                    };
                    $.ajax({
                        url: "/main/getReviewList.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log('리뷰 데이타 : ', data);
                            self.reviewList = data.reviewList;
                            setTimeout(() => {
                                self.showRating = true;
                            }, 500); // 또는 300ms까지도 시도
                        }
                    });
                }

            },
            mounted() {
                let self = this;
                let swiper = new Swiper('.swiper-container', {
                    // 기본 옵션 설정
                    loop: true, // 반복
                    spaceBetween: 0,
                    slidesPerView: 1,
                    autoplay: {
                        delay: 2500,
                    },
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true,
                    },
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },
                });

                self.fnToursList();

                setTimeout(() => {
                    if (self.sessionId === "${sessionId}") {
                        self.fnGetWishList();
                    } else {
                        console.log("세션 로딩이 아직 안됨");
                    }
                }, 300);

                self.fnGetReviewList();
            }
        });

        app.component('star-rating', VueStarRating.default);
        app.mount('#app');
    </script>

    <!-- <script>
        document.addEventListener("DOMContentLoaded", function () {
            window.addEventListener("scroll", () => {
                const footer = document.querySelector("#footer");
                const gtranslate = document.querySelector("#gt_float_wrapper");
                if (!footer || !gtranslate) return;
                const scrollBottom = window.scrollY + window.innerHeight;
                const footerTop = footer.getBoundingClientRect().top + window.scrollY;
                const footerHeight = footer.offsetHeight;
                const baseOffset = 20;
                const buffer = 80;
                if (scrollBottom >= footerTop - buffer) {
                    offset = (scrollBottom - footerTop) + 60;
                } else {
                    offset = baseOffset;
                }
                gtranslate.style.setProperty("bottom", offset + "px", "important");
            });
        });
    </script> -->
    <script>
        window.addEventListener("load", function () {
            window.addEventListener("scroll", function () {
                const footer = document.querySelector("#footer");
                const gtranslate = document.querySelector("#gt_float_wrapper");

                if (!footer) return;

                const scrollY = window.scrollY;
                const windowHeight = window.innerHeight;
                const footerTop = footer.getBoundingClientRect().top + scrollY;
                const baseOffset = 40;
                const buffer = 20;
                const scrollBottom = scrollY + windowHeight;

                let newOffset = baseOffset;
                if (scrollBottom >= footerTop + buffer) {
                    const overlap = scrollBottom - (footerTop + buffer);
                    newOffset = baseOffset + overlap;
                }

                if (gtranslate) {
                    gtranslate.style.setProperty("bottom", newOffset + "px", "important");
                }
            }, { passive: true });
        });
    </script>