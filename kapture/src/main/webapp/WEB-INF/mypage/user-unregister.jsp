<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>회원 탈퇴 | kapture</title>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
    </head>

    <body class="bg-white text-gray-800 text-[16px] tracking-wide">
        <jsp:include page="../common/header.jsp" />

        <div id="app" class="flex max-w-6xl mx-auto px-6 py-8 gap-10 min-h-[700px]">
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
                            href="/mypage/user-qna.do" class="block px-3 py-2 rounded hover:bg-blue-100">문의 내역 확인</a>
                    </li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-unregister.do' }"
                            href="/mypage/user-unregister.do" class="block px-3 py-2 rounded hover:bg-blue-950">회원
                            탈퇴</a></li>
                </ul>
            </div>

            <!-- 콘텐츠 영역 -->
            <div class="flex-1">
                <div v-if="!unregisterFlg" class="flex flex-col items-center justify-center mt-40 text-center gap-6">
                    <p class="text-lg text-red-600 font-semibold">정말로 회원 탈퇴하시겠습니까?</p>
                    <div class="space-x-4">
                        <button @click="unregisterY"
                            class="btn-unregister bg-blue-950 text-white px-4 py-2 rounded hover:bg-blue-700">예</button>
                        <button @click="unregisterN"
                            class="btn-unregister bg-gray-300 px-4 py-2 rounded hover:bg-gray-400">아니오</button>
                    </div>
                </div>

                <template v-if="unregisterFlg && userInfo.password.length > 20">
                    <div class="flex items-center justify-center mt-40 gap-4">
                        <label class="font-medium">비밀번호:</label>
                        <input type="password" v-model="confirmPassword" placeholder="비밀번호를 입력해주세요."
                            @keyup.enter="fnUserUnregister" class="border px-3 py-2 rounded w-64" />
                        <button @click="fnUserUnregister"
                            class="bg-blue-950 text-white px-4 py-2 rounded hover:bg-blue-700">확인</button>
                    </div>
                </template>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />

        <script>
            const app = Vue.createApp({
                data() {
                    return {
                        userInfo: {},
                        confirmPassword: '',
                        sessionId: "${sessionId}",
                        sessionRole: "${sessionRole}",
                        currentPage: '',
                        unregisterFlg: false,
                    };
                },
                methods: {
                    fnUserUnregister() {
                        let self = this;
                        let nparmap = {
                            sessionId: self.sessionId,
                            confirmPassword: self.confirmPassword
                        };
                        $.post("/mypage/user-unregister.dox", nparmap, function (data) {
                            if (data.result == "success") {
                                alert("탈퇴되었습니다.");
                                location.href = "/main.do";
                            } else if (data.result == "pwdCheckFail") {
                                alert("비밀번호를 확인해주세요.");
                            } else {
                                alert("회원탈퇴에 실패했습니다. 다시 시도해주세요.");
                            }
                        }, "json");
                    },
                    unregisterY() {
                        this.unregisterFlg = true;
                    },
                    unregisterN() {
                        location.href = "/mypage/user-purchase-history.do";
                    },
                    fnGetInfo() {
                        let self = this;
                        $.post("/mypage/user-info.dox", { sessionId: self.sessionId }, function (data) {
                            if (data.result === "success") {
                                self.userInfo = data.userInfo;
                            } else {
                                alert("정보를 가지고 오는데 실패했습니다.");
                            }
                        }, "json");
                    }
                },
                mounted() {
                    if (!this.sessionId || this.sessionRole === 'GUIDE') {
                        alert("일반회원만 이용가능합니다.");
                        location.href = "/main.do";
                    }
                    this.currentPage = window.location.pathname.split('/').pop();
                    this.fnGetInfo();
                }
            });
            app.mount('#app');
        </script>

    </body>

    </html>