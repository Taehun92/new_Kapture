<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>

    <!-- Scripts & Libraries -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8.4.7/swiper-bundle.min.js"></script>
    <script src="https://unpkg.com/vue-star-rating@next/dist/VueStarRating.umd.min.js"></script>

    <!-- Styles -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8.4.7/swiper-bundle.min.css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .modal-overlay {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
        }

        .chat-container {
            width: 350px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .chat-header {
            background: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: bold;
            position: relative;
        }

        .close-btn {
            position: absolute;
            right: 10px;
            top: 10px;
            background: transparent;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .chat-box {
            height: 300px;
            overflow-y: auto;
            padding: 15px;
            display: flex;
            flex-direction: column;
        }

        .message {
            max-width: 70%;
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 10px;
            word-break: break-word;
        }

        .user {
            align-self: flex-end;
            background: #007bff;
            color: white;
        }

        .bot {
            align-self: flex-start;
            background: #e9ecef;
        }

        .chat-input {
            display: flex;
            padding: 10px;
            border-top: 1px solid #ccc;
            background: white;
        }

        .chat-input textarea {
            flex: 1;
            height: 40px;
            border: none;
            resize: none;
            padding: 10px;
            border-radius: 5px;
            outline: none;
        }

        .chat-input button {
            margin-left: 10px;
            padding: 10px 15px;
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .open-chat-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 999;
            padding: 10px 15px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>

</head>
<body class="bg-white text-gray-800">
<jsp:include page="../common/header.jsp"></jsp:include>

<div id="app" class="p-6">

    <button class="open-chat-btn" v-if="!showChat" @click="showChat = true">챗봇 열기</button>

        <div class="modal-overlay" v-if="showChat">
            <div class="chat-container">
                <div class="chat-header">
                    Gemini 챗봇
                    <button class="close-btn" @click="showChat = false">✕</button>
                </div>
                <div class="chat-box" ref="chatBox">
                    <div v-for="msg in messages" :class="['message', msg.type]">
                        {{ msg.text }}
                    </div>
                </div>
                <div class="chat-input">
                    <textarea v-model="userInput" placeholder="메시지를 입력하세요..."></textarea>
                    <button @click="sendMessage">전송</button>
                </div>
            </div>
        </div>
        
    <!-- Hero Section -->
    <div class="relative mb-10">
        <div class="absolute z-10 top-10 left-10 text-white">
            <h1 class="text-4xl font-bold">YOUR WORLD OF JOY</h1>
            <p class="text-lg mt-2">캡쳐와 함께 국내의 모든 즐거움을 경험해보세요</p>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img class="w-full h-96 object-cover" src="../../img/city.jpg" />
                </div>
                <div class="swiper-slide">
                    <img class="w-full h-96 object-cover" src="../../img/han.jpg" />
                </div>
                <div class="swiper-slide">
                    <img class="w-full h-96 object-cover" src="../../img/banner3.jpg" />
                </div>
            </div>
        </div>
    </div>

    <!-- 추천 상품 -->
    <div class="mb-12">
        <div class="text-2xl font-semibold border-b border-gray-300 pb-2 mb-6">추천 상품</div>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
            <div v-for="tour in limitedToursList" :key="tour.tourNo" class="bg-white rounded-xl shadow-lg overflow-hidden">
                <img :src="tour.filePath" alt="썸네일" class="w-full h-48 object-cover" />
                <div class="p-4 space-y-2">
                    <div class="flex justify-between text-sm text-gray-500">
                        <span>{{ formatDate(tour.tourDate) }}</span>
                        <span class="text-blue-600"># {{ tour.themeName }}</span>
                    </div>
                    <h3 class="text-lg font-bold">{{ tour.title }}</h3>
                    <p class="text-gray-700 text-sm">{{ truncateText(tour.description) }}</p>
                    <div class="flex justify-between items-center">
                        <span class="text-yellow-500">⭐ {{ tour.rating }}</span>
                        <span class="text-green-600 font-semibold">₩ {{ tour.price.toLocaleString() }}</span>
                    </div>
                    <button @click="goToTourInfo(tour.tourNo)" class="w-full mt-2 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition">예약하기</button>
                </div>
            </div>
        </div>
    </div>

    
    <!-- 추천 리뷰 -->
<div class="mb-10">
    <div class="text-2xl font-semibold border-b border-gray-300 pb-2 mb-6">추천 리뷰</div>
    <div class="space-y-6">
        <div v-for="item in limitedReviewList" class="p-5 bg-white rounded-xl shadow-md hover:shadow-lg transition">
            <div class="flex items-start gap-4">
                <!-- 썸네일 이미지 -->
                <img :src="item.filePath" alt="상품 이미지"
                     class="w-20 h-20 object-cover rounded-full shadow" />

                <!-- 리뷰 정보 -->
                <div class="flex-1">
                    <!-- 작성자 & 작성일 -->
                    <div class="flex items-center justify-between text-sm text-gray-500 mb-1">
                        <span>👤 {{ item.userFirstname }} {{ item.userLastname || '' }}</span>
                        <span>🕒 {{ item.rCreatedAt }}</span>
                    </div>

                    <!-- 제목 -->
                    <div class="text-lg font-semibold text-gray-800 mb-1">{{ item.title }}</div>

                    <!-- 투어 정보 -->
                    <div class="text-sm text-gray-600 mb-1">
                        📅 투어 날짜: <span class="font-medium">{{ item.tourDate }}</span>
                        &nbsp;| 💸 가격: <span class="font-medium">₩{{ item.price.toLocaleString() }}</span>
                        &nbsp;| ⏱ {{ item.duration }}
                    </div>

                    <!-- 내용 -->
                    <p class="text-gray-700 text-sm mb-2 leading-relaxed">📝 {{ item.comment }}</p>

                    <!-- 평점 -->
                    <div class="flex items-center gap-2">
                        <span class="text-sm text-gray-600">⭐ 평점:</span>
                        <star-rating :rating="item.rating" :read-only="true" :star-size="14"
                                     :increment="1" :border-width="3" :show-rating="false"
                                     :rounded-corners="true"
                                     class="inline-block align-middle"></star-rating>
                    </div>
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
                    reviewList : [],
                    userInput: "",
                    messages: [],
                    showChat: false,
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

                truncateText(text, maxLength = 30) {
                    if (!text) return '';
                    return text.length > maxLength ? text.substring(0, maxLength) + '...' : text;
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
                        success: function(data) {
                            const wishTourNos = (data.list || []).map(item => +item.tourNo);
                            console.log("찜목록 tourNo 목록: ", wishTourNos);

                            self.toursList = self.toursList.map(function(tour) {
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
                                guideNo : tour.guideNo,
                                tourNo: tour.tourNo 
                            },
                            success: function(res) {
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
                            success: function(res) {
                                console.log("찜 제거됨", res);
                            }
                        });
                    }
                },

                goToTourInfo(tourNo) {
                    location.href="/tours/tour-info.do?tourNo=" + tourNo;
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
                        }
                    });
                },
                sendMessage() {
                    if (this.userInput.trim() === "") return;

                    this.messages.push({ text: this.userInput, type: 'user' });
                    const inputText = this.userInput;
                    this.userInput = "";
                    this.scrollToBottom();

                    $.ajax({
                        url: "/gemini/chat",
                        type: "GET",
                        data: { input: inputText },
                        success: (response) => {
                            this.messages.push({ text: response, type: 'bot' });
                            this.scrollToBottom();
                        },
                        error: (xhr) => {
                            this.messages.push({ text: "오류 발생: " + xhr.responseText, type: 'bot' });
                            this.scrollToBottom();
                        }
                    });
                },
                scrollToBottom() {
                    this.$nextTick(() => {
                        const chatBox = this.$refs.chatBox;
                        chatBox.scrollTop = chatBox.scrollHeight;
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
                self.fnGetReviewList();
                setTimeout(() => {
                    if (self.sessionId === "${sessionId}") {
                        self.fnGetWishList();
                    } else {
                        console.log("세션 로딩이 아직 안됨");
                    }
                }, 300);

            }
        });
        app.component('star-rating', VueStarRating.default)
        app.mount('#app');
    </script>