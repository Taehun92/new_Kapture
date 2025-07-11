<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
        <title>헤더</title>
    </head>

    <body class="bg-white text-gray-800 text-[16px] tracking-wide">

        <!-- ✅ 번역 위젯 -->
        <div class="gtranslate-wrapper fixed left-16 z-50" style="bottom: 160px;">
            <div class="gtranslate_wrapper"></div>
        </div>

        <!-- ✅ 헤더 시작 -->
        <div id="header" class="w-full bg-white shadow-sm border-b">
            <!-- ✅ 환율 위젯: header 내부에서 Vue로 제어 -->
            <div v-if="showExchangeWidget" class="fixed right-16 z-40" style="top: 200px;">
                <div
                    class="bg-blue-50 text-gray-900 w-[200px] p-3 rounded-lg border border-blue-300 shadow-lg text-xs leading-tight">
                    <div class="font-semibold text-sm mb-2 flex items-center gap-1">
                        💱 현재 환율 (₩ 기준)
                    </div>
                    <!-- 환율 정보 (1000원 기준)
                    <ul>
                        <li v-for="(rate, currency) in exchangeRates" :key="currency">
                            {{ currency }}: {{ (1000 / rate).toFixed(2) }}
                        </li>
                    </ul> -->

                    <!-- 입력 박스 -->
                    <div class="mt-3">
                        <input type="number" v-model.number="inputWon" placeholder="금액 (₩)"
                            class="w-full text-[15px] px-2 py-1 border border-gray-300 rounded focus:outline-none focus:ring-1 focus:ring-blue-400" />
                    </div>

                    <!-- 계산 결과 -->
                    <div class="mt-2 text-[15px] text-gray-700">
                        <div v-for="(rate, currency) in exchangeRates" :key="currency">
                            {{ inputWon.toLocaleString() }}원 → 
                            {{ (inputWon / rate).toLocaleString(undefined, { maximumFractionDigits: 2 }) }} {{ currency }}
                        </div>
                    </div>

                    <!-- 업데이트 날짜 -->
                    <div class="text-[10px] text-gray-500 mt-2">
                        기준: {{ exchangeUpdatedAt }}
                    </div>
                </div>
            </div>

            <!-- ✅ 헤더 컨텐츠 -->
            <div class="w-[70%] h-[150px] mx-auto relative flex justify-between items-center px-4">
                <!-- 🔹 우측 로그인/알림/장바구니 영역 -->
                <div class="absolute top-4 right-4 flex gap-3 text-[15px] text-gray-600 items-center">
                    <a href="/cs/faq.do" class="hover:text-blue-700">FAQ</a>
                    <a href="/cs/main.do" class="hover:text-blue-700">고객센터</a>

                    <template v-if="sessionId == ''">
                        <a href="/login.do">
                            <button
                                class="bg-blue-950 hover:bg-blue-700 text-white px-3 py-[2px] rounded text-[13px] font-thin">
                                Login
                            </button>
                        </a>
                    </template>

                    <template v-else>
                        <a href="/payment.do" class="relative hover:text-blue-700">
                            <i class="fa-solid fa-cart-shopping text-[20px]"></i>
                            <span v-if="basketCount > 0"
                                class="absolute -top-2 -right-2 bg-red-600 text-white text-[10px] px-[5px] py-[1px] rounded-full leading-none">
                                {{ basketCount }}
                            </span>
                        </a>

                        <div class="relative alarm-box">
                            <button @click="fnToggleAlarm" class="relative hover:text-blue-700">
                                <i class="fa-solid fa-bell text-[20px]"></i>
                                <span v-if="unreadAlarmCount > 0"
                                    class="absolute -top-2 -right-2 bg-red-600 text-white text-[10px] min-w-[16px] h-[16px] flex items-center justify-center rounded-full leading-none">
                                    {{ unreadAlarmCount }}
                                </span>
                            </button>

                            <!-- 알림 모달 -->
                            <div v-if="showAlarmModal"
                                class="absolute right-0 mt-2 w-60 bg-white border rounded shadow-md z-50 text-sm">
                                <div class="p-3 border-b font-semibold text-gray-700">새 알림</div>
                                <ul>
                                    <li v-for="alarm in alarmList" :key="alarm.alarmNo"
                                        class="border-b py-2 px-2 text-sm flex justify-between items-center cursor-pointer"
                                        :class="alarm.alarmStatus === 'N' ? 'font-bold text-black' : 'text-gray-400'"
                                        @click="fnReadAlarm(alarm)">
                                        {{ alarm.content }}
                                        <span class="text-xs">{{ alarm.formattedDate }}</span>
                                    </li>
                                </ul>
                                <div v-if="alarmList.length === 0" class="p-3 text-center text-gray-400">알림이 없습니다.</div>
                            </div>
                        </div>

                        <a v-if="sessionRole == 'ADMIN'" href="/admin.do" class="hover:text-blue-700">
                            <i class="fa-solid fa-user-group text-[20px]"></i>
                        </a>
                        <a v-if="sessionRole == 'TOURIST'" href="/mypage/user-mypage.do" class="hover:text-blue-700">
                            <i class="fa-solid fa-user text-[20px]"></i>
                        </a>
                        <a v-if="sessionRole == 'GUIDE'" href="/mypage/guide-schedule.do" class="hover:text-blue-700">
                            <i class="fa-solid fa-user-tie text-[20px]"></i>
                        </a>

                        <button @click="fnLogout"
                            class="bg-blue-950 hover:bg-blue-700 text-white px-3 py-[2px] rounded text-[13px] font-thin">
                            Logout
                        </button>
                    </template>
                </div>

                <!-- 🔵 로고 & 메뉴 -->
                <div class="flex items-center gap-28 font-semibold text-[35px] text-gray-800">
                    <a href="/main.do">
                        <img src="https://project-kapture.s3.ap-northeast-2.amazonaws.com/img/logo/web-app-manifest-512x512.png"
                            alt="로고" class="w-[120px] h-[96px] object-contain" />
                    </a>
                    <div class="flex gap-12">
                        <a href="/tours/list.do" class="hover:text-blue-700">Tours</a>
                        <a href="/request/list.do" class="hover:text-blue-700">Request</a>
                        <a href="/course.do" class="hover:text-blue-700">Where to Go</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- ✅ Vue 스크립트 -->
        <script>
            window.gtranslateSettings = {
                default_language: "ko",
                native_language_names: true,
                detect_browser_language: true,
                languages: ["ko", "en", "ja", "zh-CN"],
                wrapper_selector: ".gtranslate_wrapper",
                alt_flags: { en: "usa" }
            };
        </script>
        <script src="https://cdn.gtranslate.net/widgets/latest/float.js" defer></script>

        <script>
            const header = Vue.createApp({
                data() {
                    return {
                        keyword: "",
                        sessionId: "${sessionId}",
                        sessionRole: "${sessionRole}",
                        basketCount: 0,
                        alarmList: [],
                        unreadAlarmCount: 0,
                        showAlarmModal: false,
                        showExchangeWidget: false,
                        exchangeRates: {},
                        exchangeUpdatedAt: '',
                        inputWon: 1000
                    };
                },
                methods: {
                    fnLogout() {
                        $.post("/logout.dox", {}, function (data) {
                            if (data.result === "success") {
                                alert("로그아웃 되었습니다.");
                                location.href = "/main.do";
                            }
                        }, "json");
                    },
                    fnToggleAlarm() {
                        this.showAlarmModal = !this.showAlarmModal;
                    },
                    fnCloseAlarmOutside(e) {
                        const alarmBox = document.querySelector('.alarm-box');
                        if (alarmBox && !alarmBox.contains(e.target)) {
                            this.showAlarmModal = false;
                        }
                    },
                    fnGetBasket() {
                        if (!this.sessionId) return;
                        $.post("/basket/getCount.dox", { sessionId: this.sessionId }, (data) => {
                            this.basketCount = data.count;
                        }, "json");
                    },
                    fnGetAlarms() {
                        if (!this.sessionId) return;
                        $.post("/common/alarms.dox", { sessionId: this.sessionId }, (data) => {
                            this.alarmList = data.list.map(item => ({
                                ...item,
                                content: this.mapAlarmContent(item),
                                formattedDate: item.alCreatedAt?.substring(2, 10).replace(/-/g, '.')
                            }));
                            this.unreadAlarmCount = this.alarmList.filter(i => i.alarmStatus === 'N').length;
                        }, "json");
                    },
                    fnReadAlarm(alarm) {
                        $.post("/common/read-alarm.dox", { alarmNo: alarm.alarmNo }, (data) => {
                            if (data.result === "success") {
                                const urlMap = {
                                    PAYMENT: "/mypage/user-purchase-history.do",
                                    COMMENT: "/request/view.do?requestNo=" + alarm.urlParam,
                                    ACCEPT: "/request/view.do?requestNo=" + alarm.urlParam,
                                    TOUR: "/mypage/user-reviews.do",
                                    REVIEW: "/tours/tour-info.do?tourNo=" + alarm.urlParam,
                                    QNA: "/admin/customer-inquiry.do",
                                    ANSWER: "/mypage/user-qna.do",
                                    PARTNERSHIP: "/admin/partnership.do",
                                    PARTNERSHIP_STATUS: "/main.do"
                                };
                                location.href = urlMap[alarm.referenceType] || "/main.do";
                            }
                        }, "json");
                    },
                    mapAlarmContent(item) {
                        const map = {
                            PAYMENT: "예약이 확정되었습니다.",
                            COMMENT: "내 요청글에 새로운 댓글이 달렸습니다.",
                            ACCEPT: "내 댓글이 채택되었습니다!",
                            TOUR: "리뷰를 남겨주세요!",
                            REVIEW: "새로운 리뷰가 등록되었습니다.",
                            QNA: "새로운 문의가 등록되었습니다.",
                            ANSWER: "문의하신 내용에 답변이 등록되었습니다.",
                            PARTNERSHIP: "새로운 제휴 문의가 등록되었습니다."
                        };
                        if (item.referenceType === "PARTNERSHIP_STATUS") {
                            return item.urlParam === "승인완료"
                                ? "제휴 요청이 승인되었습니다."
                                : item.urlParam === "승인거부"
                                    ? "제휴 요청이 거부되었습니다."
                                    : "제휴 요청 상태가 변경되었습니다.";
                        }
                        return map[item.referenceType] || "새로운 알림이 있습니다.";
                    },
                    fnGetExchangeRates() {
                        $.get("/exchangeRate/all", (data) => {

                            // 환율 데이터 전체가 바로 data로 들어오므로 그대로 사용
                            this.exchangeRates = data;
                            this.exchangeUpdatedAt = new Date().toISOString().substring(0, 10); // or 서버에서 updatedAt 따로 내려줄 수도 있음

                        }, "json");
                    }
                },
                mounted() {
                    if (this.sessionId) this.fnGetBasket();
                    this.fnGetAlarms();

                    // 페이지 경로 체크
                    const path = window.location.pathname;
                    const showOnPages = ["/tours/list.do", "/tours/tour-info.do"];
                    this.showExchangeWidget = showOnPages.includes(path);

                    if (this.showExchangeWidget) this.fnGetExchangeRates();

                    window.header = this;
                    document.addEventListener("click", this.fnCloseAlarmOutside);
                    window.addEventListener("storage", (e) => {
                        if (e.key === "basketChanged") this.fnGetBasket();
                    });
                },
                beforeUnmount() {
                    document.removeEventListener("click", this.fnCloseAlarmOutside);
                }
            });

            header.mount('#header');
        </script>
    </body>

    </html>