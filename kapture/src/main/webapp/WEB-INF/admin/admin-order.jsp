<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>주문내역 관리</title>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <style>
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

            select {
                margin: 10px 5px 10px 0;
                padding: 5px;
            }

            .transaction-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            .transaction-table th,
            .transaction-table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            .transaction-table th {
                background-color: #f1f1f1;
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

            .refunded-button {
                margin-top: 5px;
                padding: 2px 5px;
                background-color: #ff0000;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }

            .refunded-button:hover {
                background-color: #b30000;
            }

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

            .modal-body .info-section {
                margin-bottom: 20px;
            }

            .modal-body table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            .modal-footer {
                text-align: right;
            }

            .table-button {
                margin: 5px;
                padding: 2px 5px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }

            .table-button:hover {
                background-color: #0056b3;
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
            <div class="page-title">주문내역 관리</div>
            <hr class="title-hr">
            <div class="content">
                <input type="date" v-model="startDate" class="search-date">
                ~　
                <input type="date" v-model="endDate" class="search-date">
                <select v-model="statusFilter" class="search-select">
                    <option value="">전체</option>
                    <option value="결제완료">결제완료</option>
                    <option value="거래완료">거래완료</option>
                    <option value="환불요청">환불요청</option>
                    <option value="환불완료">환불완료</option>
                </select>
                <input type="text" v-model="keyword" class="search-input" @keyup.enter="loadFilteredData"
                    placeholder="상태 검색">
                <button class="search-button" @click="loadFilteredData">검색</button>
                <div v-if="loaded">
                    <table class="transaction-table">
                        <thead>
                            <tr>
                                <th>상품 번호</th>
                                <th>결제일</th>
                                <th>회원 이름</th>
                                <th>상품 제목</th>
                                <th>여행 날짜</th>
                                <th>여행 기간</th>
                                <th>결제 금액</th>
                                <th>상태</th>
                                <th>인원</th>
                                <th>정보</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-if="transactions.length === 0">
                                <td colspan="10">검색 결과가 없습니다.</td>
                            </tr>
                            <tr v-for="item in transactions"
                                :key="item.PAYMENT_DATE + item.USER_FIRSTNAME + item.TITLE">
                                <td>{{ item.TOUR_NO }}</td>
                                <td v-html="formatDate(item.PAYMENT_DATE)"></td>
                                <td>
                                    {{ item.USER_FIRSTNAME }}
                                    <template v-if="item.USER_LASTNAME != 'N/A'">{{ item.USER_LASTNAME }}</template>
                                </td>
                                <td>{{ item.TITLE }}</td>
                                <td v-html="formatDate(item.TOUR_DATE)"></td>
                                <td>{{ item.DURATION }}</td>
                                <td>{{ formatCurrency(item.AMOUNT) }}</td>
                                <td
                                    :style="{ color: (item.PAYMENT_STATUS === '결제완료' || item.PAYMENT_STATUS === '거래완료')  ? 'green' : item.PAYMENT_STATUS === '환불요청' ? 'red' : 'blue' }">
                                    {{ item.PAYMENT_STATUS }}
                                    <div v-if="item.PAYMENT_STATUS === '환불요청'">
                                        <button class="refunded-button"
                                            @click="fnRefunded(item.PAYMENT_NO)">환불처리</button>
                                    </div>
                                </td>
                                <td>{{ item.NUM_PEOPLE }}명</td>
                                <td>
                                    <button class="table-button" @click="fnGetOrderInfo(item)">보기</button>
                                    <button class="table-button" @click="fnRemoveOrder(item.PAYMENT_NO)">삭제</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p v-else style="text-align:center;">데이터를 불러오는 중입니다...</p>
                <div style="margin-top: 20px; text-align: center;">
                    <button class="tab-btn" @click="goPage(page - 1)" :disabled="page === 1">이전</button>
                    <button v-for="p in totalPages" :key="p" class="tab-btn" :class="{ active: p === page }"
                        @click="goPage(p)">
                        {{ p }}
                    </button>
                    <button class="tab-btn" @click="goPage(page + 1)" :disabled="page === totalPages">다음</button>
                </div>
                <!-- 주문 상세 모달 (아까 올린 이미지와 동일한 디자인) -->
                <div v-if="showEditModal" class="order-modal" @click.self="fnEditOrderClose">
                    <div class="modal-overlay" @click="fnEditOrderClose"></div>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>주문 상세 정보</h2>
                            <span class="close-btn" @click="fnEditOrderClose">&times;</span>
                        </div>
                        <div class="modal-body">
                            <!-- 주문회원정보 -->
                            <div class="info-section">
                                <h3>주문회원정보</h3>
                                <table class="transaction-table">
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            {{ editOrderInfo.USER_FIRSTNAME }}
                                            <template v-if="editOrderInfo.USER_LASTNAME != 'N/A'">
                                                {{ editOrderInfo.USER_LASTNAME }}
                                            </template>
                                        </td>
                                        <th>연락처</th>
                                        <td>{{ editOrderInfo.PHONE }}</td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>{{ editOrderInfo.EMAIL }}</td>
                                        <th>국적</th>
                                        <td v-if="editOrderInfo.ISFOREIGNER === 'Y'">외국인</td>
                                        <td v-else>내국인</td>
                                    </tr>
                                </table>
                            </div>
                            <!-- 예약 여행 정보 -->
                            <div class="info-section">
                                <h3>예약 여행 정보</h3>
                                <table class="transaction-table">
                                    <tr>
                                        <th>결제번호</th>
                                        <td>{{ editOrderInfo.PAYMENT_NO }}</td>
                                        <th>결제일시</th>
                                        <td v-html="formatDate(editOrderInfo.PAYMENT_DATE)"></td>
                                    </tr>
                                    <tr>
                                        <th>상품 제목</th>
                                        <td>{{ editOrderInfo.TITLE }}</td>
                                        <th>여행 날짜</th>
                                        <td v-html="formatDate(editOrderInfo.TOUR_DATE)"></td>
                                    </tr>
                                    <tr>
                                        <th>인원</th>
                                        <td>{{ editOrderInfo.NUM_PEOPLE }}명</td>
                                        <th>여행 기간</th>
                                        <td>{{ editOrderInfo.DURATION }}</td>
                                    </tr>
                                    <tr>
                                        <th>결제상태</th>
                                        <td>
                                            <select v-model="editPaymentStatus" class="search-select">
                                                <option value="결제완료">결제완료</option>
                                                <option value="거래완료">거래완료</option>
                                                <option value="환불요청">환불요청</option>
                                                <option value="환불완료">환불완료</option>
                                            </select>
                                        </td>
                                        <th>결제금액</th>
                                        <td>{{ formatCurrency(editOrderInfo.AMOUNT) }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="table-button" @click="fnSaveOrderInfo">저장</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                        showEditModal: false,
                        editOrderInfo: {},
                        editPaymentStatus: "",
                        loaded: false
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
                            page: self.page, size: self.size
                        };
                        $.ajax({
                            url: "/admin/getTransactionList.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                console.log(data);
                                self.transactions = data.list;
                                self.totalCount = data.totalCount;
                                self.totalPages = Math.ceil(data.totalCount / self.size);
                                self.loaded = true;
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

                        return year + "-" + month + "-" + day;
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
                        self.editOrderInfo = item;
                        self.editPaymentStatus = self.editOrderInfo.PAYMENT_STATUS;
                        self.showEditModal = true;
                    },
                    fnEditOrderClose() {
                        let self = this;
                        self.showEditModal = false;
                        self.editPaymentStatus = "";
                        self.editOrderInfo = {};
                    },
                    fnSaveOrderInfo() {
                        let self = this;
                        self.editOrderInfo.PAYMENT_STATUS = self.editPaymentStatus;
                        let nparmap = {
                            paymentNo: self.editOrderInfo.PAYMENT_NO,
                            paymentStatus: self.editPaymentStatus,
                        };
                        $.ajax({
                            url: "/admin/saveOrderInfo.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                console.log(data);
                                if (data.result === "success") {
                                    alert("수정되었습니다.");
                                    self.showEditModal = false;
                                    self.editOrderInfo = {};
                                    self.fnGetTransactions();
                                } else {
                                    alert("수정에 실패했습니다.");
                                }
                            },
                            error: function (err) {
                                console.error(err);
                                alert("수정 중 오류가 발생했습니다.");
                            }
                        });
                    },
                    fnRemoveOrder(paymentNo) {
                        let self = this;
                        if (!confirm("정말 삭제하시겠습니까?")) {
                            return;
                        }
                        let nparmap = {
                            paymentNo: paymentNo,
                        };
                        $.ajax({
                            url: "/admin/removeOrder.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                console.log(data);
                                if (data.result === "success") {
                                    alert("삭제되었습니다.");
                                    location.reload();
                                } else {
                                    alert("삭제에 실패했습니다.");
                                }
                            },
                            error: function (err) {
                                console.error(err);
                                alert("삭제 중 오류가 발생했습니다.");
                            }
                        });
                    }
                },
                mounted() {
                    let self = this;
                    if (!self.sessionId || self.sessionRole != 'ADMIN') {
                        alert("관리자만 이용가능합니다.");
                        location.href = "/main.do";
                    }
                    this.fnGetTransactions();
                }
            });
            app.mount('#app');
        </script>
    </body>

    </html>