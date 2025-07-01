<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>결제 완료 | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
    <link rel="stylesheet" href="https://unpkg.com/@vuepic/vue-datepicker/dist/main.css">
</head>
<body class="bg-white text-gray-800 font-sans text-[16px] tracking-wide">
    <jsp:include page="../common/header.jsp" />

    <div id="app" class="max-w-4xl mx-auto p-6">
        <!-- 타이틀 + 결제번호 -->
        <h2 class="text-3xl font-bold text-green-600 text-center mb-2">🎉 결제가 완료되었습니다!</h2>
        <p v-if="payments && payments.length > 0" class="text-center text-gray-500 mb-8 text-sm">
            결제번호 : {{ payments[0].paymentNo }}
        </p>
        <p v-else class="text-center text-gray-400 text-sm">
        결제 정보를 불러오는 중입니다...
        </p>

        <!-- 결제 상품 목록 -->
        <div v-for="(item, index) in payments" :key="item.paymentNo + '-' + item.tourNo" class="bg-white shadow rounded-lg p-6 mb-6">
            <div class="mb-2"><span class="font-semibold">상품명:</span> {{ item.title }}</div>
            <div class="mb-2"><span class="font-semibold">상품 가격:</span> ₩ {{ (item.price * item.numPeople).toLocaleString("ko-KR") }}</div>
            <div class="mb-2"><span class="font-semibold">여행 일정:</span> {{ item.duration }}</div>
            <div class="mb-2"><span class="font-semibold">출발 날짜:</span> {{ item.tourDate }}</div>
            <div class="mb-2"><span class="font-semibold">결제 인원:</span> {{ item.numPeople }}명</div>
          
            <!-- 요청사항 -->
            <div class="mt-4">
                <label class="block mb-1 font-semibold">요청사항</label>
                <textarea
                    :key="applyGlobalMessage ? 'global-' + index : 'individual-' + index"
                    :value="applyGlobalMessage ? globalRequestMessage : item.requestMessage"
                    :disabled="applyGlobalMessage"
                    @input="applyGlobalMessage ? updateGlobal($event) : updateIndividual($event, index)"
                    class="w-full p-2 border rounded"
                    placeholder="요청사항을 입력해주세요. ex) 알레르기 반응, 참고사항 등">
                </textarea>
            </div>
          </div>
        <!-- 전체 요청사항 입력 -->
        <div class="bg-gray-100 border p-4 rounded-lg mb-6">
            <label class="font-semibold block mb-2">모든 상품에 동일한 요청사항 입력</label>
            <textarea v-model="globalRequestMessage" rows="2"
            class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="모든 상품에 동일하게 전달될 요청사항을 입력하세요. ex) 알러지 반응, 참고사항 등"></textarea>
        
            <div class="mt-2">
            <label class="inline-flex items-center">
                <input type="checkbox" v-model="applyGlobalMessage" class="accent-blue-600">
                <span class="ml-2 text-sm text-gray-700">모든 상품에 동일 요청사항 적용</span>
            </label>
            </div>
        </div>

        <!-- 총 결제 금액 -->
        <div v-if="payments.length > 0" class="text-right text-xl font-bold mt-4 font-mono">
            총 결제 금액: ₩ {{ formattedAmount }}
        </div>

        <!-- 버튼 영역 -->
        <div class="flex justify-center gap-4 mt-10">
            <a href="javascript:void(0)" @click="submitRequests" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition"> 요청 전송 후 메인</a>
            <a href="/mypage.do" class="bg-gray-600 text-white px-6 py-2 rounded hover:bg-gray-700 transition">마이페이지로</a>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
                payments: [],
                merchantId: "",
                applyGlobalMessage: false,
                globalRequestMessage: ""
            };
        },
        computed: {
            totalAmount() {
                return this.payments.reduce((sum, item) => {
                    return sum + (item.price * item.numPeople);
                }, 0);
            },
            formattedAmount() {
                return this.totalAmount.toLocaleString("ko-KR");
            }
        },
        watch: {
            applyGlobalMessage(newVal) {
                if (newVal) {
                    this.payments.forEach(p => {
                        p.requestMessage = this.globalRequestMessage;
                    });
                }
            },
            globalRequestMessage(newVal) {
                if (this.applyGlobalMessage) {
                    this.payments.forEach(p => {
                        p.requestMessage = newVal;
                    });
                }
            }
        },
        methods: {
            updateGlobal(event) {
                this.globalRequestMessage = event.target.value;
                this.payments.forEach(p => {
                    p.requestMessage = this.globalRequestMessage;
                });
            },
            updateIndividual(event, index) {
                this.payments[index].requestMessage = event.target.value;
            },
            fetchPaymentList(merchantId) {
                let self = this;
                $.ajax({
                    url: "/payment/success.dox",
                    type: "POST",
                    data: { merchantId: merchantId },
                    dataType: "json",
                    success: (res) => {
                        console.log("응답 객체:", res);
                        self.payments = res.paymentList.map(item => ({
                            ...item, requestMessage: ""
                        }));
                    },
                    error: () => {
                        alert("결제 정보를 불러오는 데 실패했습니다.");
                    }
                });
            },
            submitRequests() {
                const self = this;

                const requestData = self.payments.map(item => ({
                    paymentNo: item.paymentNo,
                    requestMessage: item.requestMessage
                }));

                $.ajax({
                    url: "/payment/requestMessageSave.dox",
                    type: "POST",
                    data: JSON.stringify({ requests: requestData }),
                    contentType: "application/json",
                    success(res) {
                        if (res.result === "success") {
                            alert("요청사항이 저장되었습니다.");
                            location.href = "/main.do";
                        } else {
                            alert("요청사항 저장 실패: " + (res.message || "알 수 없는 오류"));
                        }
                    },
                    error() {
                        alert("서버 오류로 요청사항 저장에 실패했습니다.");
                    }
                });
            }
        },
        mounted() {
            const params = new URLSearchParams(window.location.search);
            this.merchantId = params.get("merchantId") || "";
            this.fetchPaymentList(this.merchantId);
        }
    });
    app.mount("#app");
    </script>
