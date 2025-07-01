<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>문의 내역 확인 | kapture</title>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- Vue.js -->
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <!-- rating -->
        <script src="https://unpkg.com/vue-star-rating@next/dist/VueStarRating.umd.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
    </head>

    <body class="bg-white text-gray-800 text-[16px] tracking-wide">
        <jsp:include page="../common/header.jsp" />

        <div id="app" v-cloak class="flex max-w-6xl mx-auto px-6 py-8 gap-10 min-h-[700px]">
            <!-- 사이드바 -->
            <div class="w-56 bg-white shadow-md p-4 rounded">
                <ul class="space-y-2 font-semibold">
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-mypage.do' }"
                            href="/mypage/user-mypage.do" class="block px-3 py-2 rounded hover:bg-blue-100">회원 정보수정</a>
                    </li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-purchase-history.do' }"
                            href="/mypage/user-purchase-history.do"
                            class="block px-3 py-2 rounded hover:bg-blue-100">구매한 상품</a></li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'user-schedule.do' }"
                            href="/mypage/user-schedule.do" class="block px-3 py-2 rounded hover:bg-blue-100">나의 일정</a>
                    </li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-reviews.do' }"
                            href="/mypage/user-reviews.do" class="block px-3 py-2 rounded hover:bg-blue-100">이용후기 관리</a>
                    </li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'qna.do' }" href="/cs/qna.do"
                            class="block px-3 py-2 rounded hover:bg-blue-100">문의하기</a></li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-qna.do' }"
                            href="/mypage/user-qna.do" class="block px-3 py-2 rounded hover:bg-blue-950">문의 내역 확인</a>
                    </li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-unregister.do' }"
                            href="/mypage/user-unregister.do" class="block px-3 py-2 rounded hover:bg-blue-100">회원
                            탈퇴</a></li>
                </ul>

            </div>
            <div class="flex-1">
                <div class="border border-gray-200 rounded shadow-sm p-6">
                    <h2 class="text-xl font-bold mb-6">📋 문의 내역</h2>
                    <div v-if="inquiryList.length === 0" class="text-center text-gray-500">
                        문의 내역이 없습니다.
                    </div>
                    <div class="grid grid-cols-1 gap-6">
                        <div v-for="inquiry in inquiryList" :key="inquiry.inquiryNo"
                            class="border border-gray-100 rounded-lg p-4 shadow-sm bg-white">
                            <div class="flex justify-between items-center mb-2">
                                <div class="text-lg font-bold text-blue-900">{{ inquiry.qnaTitle }}</div>
                                <span class="text-sm px-2 py-1 rounded-full font-semibold" :class="{
                                    'bg-yellow-100 text-yellow-800': inquiry.qnaStatus === '답변대기',
                                    'bg-green-100 text-green-800': inquiry.qnaStatus === '답변완료'
                                }">
                                    {{ inquiry.qnaStatus }}
                                </span>
                            </div>
                            <div class="text-sm text-gray-600 mb-2">🕒 {{ formatDate(inquiry.inqCreatedAt) }}</div>
                            <div class="text-sm text-gray-800 mb-2">📂 카테고리: <span class="font-semibold">{{
                                    inquiry.category }}</span></div>
                            <div class="text-sm text-gray-700 mb-2">❓ 문의 내용: {{ inquiry.question }}</div>
                            <div class="text-sm text-gray-700">
                                💬 답변:
                                <span v-if="inquiry.answer" class="font-bold text-gray-800">{{ inquiry.answer }}</span>
                                <span v-else class="italic text-gray-400">아직 답변이 없습니다.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />

        <script>
            const app = Vue.createApp({
                data() {
                    return {
                        inquiryList: [],
                        sessionId: "${sessionId}",
                        sessionRole: "${sessionRole}",
                        currentPage: ''
                    };
                },
                methods: {
                    fnGetInquiryList() {
                        const self = this;
                        $.ajax({
                            url: "/mypage/getInquiryList.dox",  // 적절한 경로로 수정해줘
                            type: "POST",
                            dataType: "json",
                            data: {
                                userNo: self.sessionId // 필요하다면
                            },
                            success: function (data) {
                                console.log(data);
                                self.inquiryList = data.list;
                            },
                            error: function (err) {
                                console.error("문의 내역 조회 실패", err);
                            }
                        });
                    },
                    formatDate(dateStr) {
                        if (!dateStr) return "";
                        const date = new Date(dateStr);
                        const year = date.getFullYear();
                        const month = (date.getMonth() + 1).toString().padStart(2, '0');
                        const day = date.getDate().toString().padStart(2, '0');
                        return year + "-" + month + "-" + day;
                    }
                },
                mounted() {
                    if (!this.sessionId || this.sessionRole === 'GUIDE') {
                        alert("일반회원만 이용가능합니다.");
                        location.href = "/main.do";
                    }
                    this.currentPage = window.location.pathname.split('/').pop();
                    this.fnGetInquiryList();
                }

            });
            app.mount('#app');
        </script>
    </body>

    </html>