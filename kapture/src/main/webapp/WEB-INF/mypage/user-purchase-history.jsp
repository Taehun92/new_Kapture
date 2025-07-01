<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>주문내역 관리</title>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
    <style>
        /* 모달 관련 CSS */
        .order-modal {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999;
            }

            .modal-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

            .modal-content {
                position: relative;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                width: 800px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
                z-index: 10000;
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .modal-header h2 {
                margin: 0;
            }

            .close-btn {
                font-size: 28px;
                cursor: pointer;
            }

            .modal-body .info-section {
                margin-bottom: 20px;
            }

            .modal-body table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            .modal-body th,
            .modal-body td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .modal-body th {
                background-color: #f9f9f9;
            }
    </style>
    </head>

    <body class="bg-white text-gray-800 text-[16px] tracking-wide">
        <jsp:include page="../common/header.jsp" />

        <div id="app" class="flex max-w-6xl mx-auto px-6 py-8 gap-10">
            <!-- 사이드바 -->
            <div class="w-56 bg-white shadow-md p-4 rounded">
                <ul class="space-y-2 font-semibold">
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-mypage.do' }"
                            href="/mypage/user-mypage.do" class="block px-3 py-2 rounded hover:bg-blue-100">회원 정보수정</a>
                    </li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-purchase-history.do' }"
                            href="/mypage/user-purchase-history.do"
                            class="block px-3 py-2 rounded hover:bg-blue-100">구매한 상품</a></li>
                    <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'user-schedule.do' }"
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
                            href="/mypage/user-unregister.do" class="block px-3 py-2 rounded hover:bg-blue-100">회원
                            탈퇴</a></li>
                </ul>
            </div>

            <!-- 콘텐츠 영역 -->
            <div class="flex-1">
                <!-- 검색 필터 -->
                <div class="flex flex-wrap gap-4 mb-4 items-center">
                    <input type="date" v-model="startDate" class="border rounded px-3 py-2">
                    <span>~</span>
                    <input type="date" v-model="endDate" class="border rounded px-3 py-2">
                    <select v-model="statusFilter" class="border rounded px-3 py-2">
                        <option value="">전체</option>
                        <option value="결제완료">결제완료</option>
                        <option value="거래완료">거래완료</option>
                        <option value="환불요청">환불요청</option>
                        <option value="환불완료">환불완료</option>
                    </select>
                    <input type="text" v-model="keyword" @keyup.enter="loadFilteredData" placeholder="제목 검색"
                        class="border rounded px-3 py-2 w-64">
                    <button @click="loadFilteredData"
                        class="bg-blue-600 hover:bg-blue-800 text-white px-4 py-2 rounded">검색</button>
                </div>

                <!-- 테이블 -->
                <div class="overflow-x-auto">
                    <table class="w-full border border-gray-200">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="p-3 border">상품 번호</th>
                                <th class="p-3 border">결제일</th>
                                <th class="p-3 border">상품 제목</th>
                                <th class="p-3 border">여행 날짜</th>
                                <th class="p-3 border">여행 기간</th>
                                <th class="p-3 border">결제 금액</th>
                                <th class="p-3 border">상태</th>
                                <th class="p-3 border">인원</th>
                                <th class="p-3 border">정보</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-if="transactions.length === 0">
                                <td colspan="9" class="text-center p-4">검색 결과가 없습니다.</td>
                            </tr>
                            <tr v-for="item in transactions" :key="item.PAYMENT_NO" class="border-t">
                                <td class="p-3 text-center">{{ item.TOUR_NO }}</td>
                                <td class="p-3 text-center" v-html="formatDate(item.PAYMENT_DATE)"></td>
                                <td class="p-3 text-center">{{ item.TITLE }}</td>
                                <td class="p-3 text-center" v-html="formatDate(item.TOUR_DATE)"></td>
                                <td class="p-3 text-center">{{ item.DURATION }}</td>
                                <td class="p-3 text-center">{{ formatCurrency(item.AMOUNT) }}</td>
                                <td class="p-3 text-center" :class="{
                        'text-green-600': item.PAYMENT_STATUS === '결제완료' || item.PAYMENT_STATUS === '거래완료',
                        'text-red-500': item.PAYMENT_STATUS === '환불요청',
                        'text-blue-500': item.PAYMENT_STATUS === '환불완료'
                      }">
                                    {{ item.PAYMENT_STATUS }}
                                </td>
                                <td class="p-3 text-center">{{ item.NUM_PEOPLE }}명</td>
                                <td class="p-3 text-center">
                                    <button @click="fnGetOrderInfo(item)"
                                        class="bg-blue-500 hover:bg-blue-700 text-white px-3 py-1 rounded">보기</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 페이지네이션 -->
                <div class="mt-6 text-center space-x-2">
                    <button @click="goPage(page - 1)" :disabled="page === 1" class="px-3 py-1 border rounded"
                        :class="{ 'bg-gray-300': page === 1 }">이전</button>
                    <button v-for="p in totalPages" :key="p" @click="goPage(p)"
                        :class="{ 'bg-blue-600 text-white': p === page }" class="px-3 py-1 border rounded">
                        {{ p }}
                    </button>
                    <button @click="goPage(page + 1)" :disabled="page === totalPages" class="px-3 py-1 border rounded"
                        :class="{ 'bg-gray-300': page === totalPages }">다음</button>
                </div>
            </div>
            <!-- 주문 상세 모달 -->
            <div v-if="showViewModal" class="order-modal" @click.self="fnViewOrderClose">
                <div class="modal-overlay" @click="fnViewOrderClose"></div>
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>주문 상세 정보</h2>
                        <span class="close-btn" @click="fnViewOrderClose">&times;</span>
                    </div>
                    <div class="modal-body">
                        <!-- 주문회원정보 -->
                        <div class="info-section">
                            <h3>주문회원정보</h3>
                            <table>
                                <tr>
                                    <th>이름</th>
                                    <td>
                                        {{ viewOrderInfo.USER_FIRSTNAME }}
                                        <template v-if="viewOrderInfo.USER_LASTNAME != 'N/A'">
                                            {{ viewOrderInfo.USER_LASTNAME }}
                                        </template>
                                    </td>
                                    <th>연락처</th>
                                    <td>{{ viewOrderInfo.PHONE }}</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>{{ viewOrderInfo.EMAIL }}</td>
                                    <th>국적</th>
                                    <td v-if="viewOrderInfo.ISFOREIGNER === 'Y'">외국인</td>
                                    <td v-else>내국인</td>
                                </tr>
                            </table>
                        </div>
                        <!-- 예약 여행 정보 -->
                        <div class="info-section">
                            <h3>예약 여행 정보</h3>
                            <table>
                                <tr>
                                    <th>결제번호</th>
                                    <td>{{ viewOrderInfo.PAYMENT_NO }}</td>
                                    <th>결제일시</th>
                                    <td v-html="formatDate(viewOrderInfo.PAYMENT_DATE)"></td>
                                </tr>
                                <tr>
                                    <th>상품 제목</th>
                                    <td>{{ viewOrderInfo.TITLE }}</td>
                                    <th>여행 날짜</th>
                                    <td v-html="formatDate(viewOrderInfo.TOUR_DATE)"></td>
                                </tr>
                                <tr>
                                    <th>인원</th>
                                    <td>{{ viewOrderInfo.NUM_PEOPLE }}명</td>
                                    <th>여행 기간</th>
                                    <td>{{ viewOrderInfo.DURATION }}</td>
                                </tr>
                                <tr>
                                    <th>결제상태</th>
                                    <td>{{viewOrderInfo.PAYMENT_STATUS}}</td>
                                    <th>결제금액</th>
                                    <td>{{ formatCurrency(viewOrderInfo.AMOUNT) }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    sessionId: "${sessionId}",
                    sessionRole: "${sessionRole}",
                    startDate: '',
                    endDate: '',
                    statusFilter: '',
                    keyword: '',
                    transactions: [],
                    page: 1,
                    size: 10,
                    totalCount: 0,
                    totalPages: 1,
                    showViewModal: false,
                    viewOrderInfo: {},
                };
            },
            methods: {
                loadFilteredData() {
                    this.page = 1;
                    this.fnGetTransactions();
                },
                fnGetTransactions() {
                    let self = this;
                    let nparmap = {
                        startDate: self.startDate,
                        endDate: self.endDate,
                        status: self.statusFilter,
                        keyword: self.keyword,
                        page: self.page, size: self.size,
                        userNo: self.sessionId
                    };
                    $.ajax({
                        url: "/mypage/user-purchase-history.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            self.transactions = data.list;
                            self.totalCount = data.totalCount;
                            self.totalPages = Math.ceil(data.totalCount / self.size);
                        },
                        error: err => console.error("거래 내역 불러오기 실패", err)
                    });
                },
                goPage(p) {
                    if (p < 1 || p > this.totalPages) return;
                    this.page = p;
                    this.fnGetTransactions();
                },
                formatCurrency(val) { return "₩ " + Number(val).toLocaleString(); },
                formatDate(dateStr) {
                    // dateStr 예: "Apr 2, 2025, 12:00:00 AM"
                    let d = new Date(dateStr);
                    if (isNaN(d)) return dateStr; // 유효하지 않은 날짜인 경우 원본 반환

                    let year = d.getFullYear();
                    let month = ('0' + (d.getMonth() + 1)).slice(-2);
                    let day = ('0' + d.getDate()).slice(-2);
                    let hours = ('0' + d.getHours()).slice(-2);
                    let minutes = ('0' + d.getMinutes()).slice(-2);
                    let seconds = ('0' + d.getSeconds()).slice(-2);

                    return year + "-" + month + "-" + day + "<div>" + hours + ":" + minutes + ":" + seconds + "</div>";
                },
                fnRefunded(paymentNo) {
                    let self = this;
                    if (!confirm("해당 주문건을 환불하시겠습니까?")) {
                        return;
                    }
                    let nparmap = {
                        paymentNo: paymentNo
                    };
                    $.ajax({
                        url: "/admin/refunded.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            if (data.result === "success") {
                                alert("환불되었습니다.");
                                self.fnGetTransactions();
                            } else {
                                alert("환불에 실패했습니다.");
                            }
                        },
                        error: function (err) {
                            console.error(err);
                            alert("환불처리 중 오류가 발생했습니다.");
                        }
                    });
                },
                fnGetOrderInfo(item) {
                    let self = this;
                    self.viewOrderInfo = item;
                    self.showViewModal = true;
                },
                fnViewOrderClose() {
                    let self = this;
                    self.showViewModal = false;
                    self.viewOrderInfo = {};
                },
            },
            mounted() {
                let self = this;
                if (!this.sessionId || this.sessionRole === 'GUIDE') {
                    alert("일반회원만 이용가능합니다.");
                    location.href = "/main.do";
                }
                this.currentPage = window.location.pathname.split('/').pop();
                console.log("Current page:", this.currentPage);
                this.fnGetTransactions();
            }
        });
        app.mount('#app');
    </script>

    </html>