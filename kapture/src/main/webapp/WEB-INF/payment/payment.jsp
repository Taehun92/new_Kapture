<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>결제하기 | kapture</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
  </head>

  <body class="bg-white text-gray-800 font-sans text-[16px] tracking-wide">
    <jsp:include page="../common/header.jsp" />

    <div id="app" class="max-w-3xl min-h-[500px] my-[50px]  mx-auto  p-6 bg-white rounded-md shadow-md mt-10">
      <h2 class="text-2xl font-bold mb-6">🛒 장바구니 내역</h2>

      <div class="flex items-center mb-4">
        <input type="checkbox" id="selectAll" v-model="selectAll" @change="toggleAll" class="mr-2">
        <label for="selectAll" class="text-gray-700 font-bold">전체 선택</label>
      </div>

      <div v-if="basketList.length === 0" class=" text-center text-gray-500">장바구니에 상품이 없습니다.</div>

      <div v-else class="space-y-4">
        <div v-for="item in basketList" :key="item.basketNo"
          class="p-4 border border-gray-200 rounded-md bg-white shadow-sm hover:shadow-md transition">
          <div class="flex justify-between items-center">
            <div class="flex items-start gap-2">
              <input type="checkbox" :value="item" v-model="selectedItems" @change="updateSelectAll" class="mt-1">
              <div>
                <h3 class="text-lg font-semibold text-gray-900">{{ item.title }}</h3>
                <div class="flex items-center gap-2 mt-1">
                  <span class="text-sm text-gray-600">인원:</span>
                  <button @click="decreasePeople(item)" :disabled="item.numPeople <= 1"
                    class="w-6 h-6 flex items-center justify-center bg-gray-200 hover:bg-gray-300 rounded disabled:opacity-50">
                    -
                  </button>
                  <span class="w-6 text-center text-sm font-bold">{{ item.numPeople }}</span>
                  <button @click="increasePeople(item)" :disabled="item.numPeople >= 4"
                    class="w-6 h-6 flex items-center justify-center bg-gray-200 hover:bg-gray-300 rounded disabled:opacity-50">
                    +
                  </button>
                </div>
                <p class="text-sm text-gray-600 mt-1">일자: {{ item.tourDate.split(' ')[0] }} {{item.duration}}</p>
              </div>
            </div>
            <div class="text-blue-600 font-bold text-lg">
              ₩{{ (item.price * item.numPeople).toLocaleString() }}
            </div>
            <button @click="fnRemoveBasket(item)" class="ml-4 text-red-500 hover:text-red-700 text-sm">
              🗑️ 삭제
            </button>
          </div>
        </div>

        <div class="flex justify-between border-t pt-4 mt-6">
          <span class="text-lg font-bold">총 결제 금액</span>
          <span class="text-green-600 text-xl font-bold">₩ {{ totalAmount.toLocaleString() }}</span>
        </div>

        <div v-if="exchangeRate">
          <p class="text-sm text-gray-500">💵 USD 기준: $ {{ totalAmountUSD }}</p>
        </div>

        <div class="flex justify-end gap-4 mt-6">
          <button @click="openPaypalModal"
            class="bg-yellow-300 hover:bg-yellow-400 text-black font-bold py-2 px-4 rounded">
            PayPal 결제
          </button>
          <button @click="payWithCard" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            다른방법으로 결제
          </button>
        </div>
      </div>

      <!-- 모달 영역 -->
      <div v-if="paypalModalVisible" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50">
        <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-md max-h-[90vh] overflow-hidden">
          <div class="flex justify-between items-center mb-4">
            <h3 class="text-lg font-semibold">PayPal 결제</h3>
            <button @click="paypalModalVisible = false" class="text-gray-500 hover:text-black">✕</button>
          </div>
          <div class="portone-ui-container overflow-y-auto max-h-[60vh]" data-portone-ui-type="paypal-spb"></div>
        </div>
      </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    </div>
    <script>
      const app = Vue.createApp({
        data() {
          return {
            basketList: [],
            selectedItems: [],
            selectAll: true,
            exchangeRate: 0,
            sessionId: "${sessionId}",
            paypalModalVisible: false
          };
        },
        computed: {
          totalAmount() {
            return this.selectedItems.reduce((sum, item) => sum + (item.price * item.numPeople), 0);
          },
          totalAmountUSDValue() {
            if (!this.exchangeRate || this.totalAmount === 0) return null;
            return Number((this.totalAmount / this.exchangeRate).toFixed(2));
          },
          totalAmountUSD() {
            if (!this.exchangeRate || this.totalAmount === 0) return null;
            return (this.totalAmount / this.exchangeRate).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
          },
          dynamicTitle() {
            if (this.selectedItems.length === 0) return "한국 여행 패키지";
            if (this.selectedItems.length === 1) return this.selectedItems[0].title;
            return this.selectedItems[0].title + " 외 " + (this.selectedItems.length - 1) + "건";
          },
          selectedIds() {
            return this.selectedItems.map(item => item.basketNo);
          },
        },
        methods: {
          getBasketInfoList() {
            const self = this;
            $.ajax({
              url: "/payment/getBasketInfoList.dox",
              type: "POST",
              dataType: "json",
              data: { sessionId: self.sessionId },
              success(data) {
                self.basketList = data.basketList;
                self.selectedItems = [...data.basketList];
              },
              error() {
                alert("장바구니 불러오기 실패");
              }
            });
          },
          increasePeople(item) {
            if (item.numPeople < 4) {
              item.numPeople++;
            }
          },
          decreasePeople(item) {
            if (item.numPeople > 1) {
              item.numPeople--;
            }
          },
          getExchangeRate() {
            const self = this;
            $.ajax({
              url: "/exchangeRate/all",
              type: "GET",
              dataType: "json",
              success(data) {
                self.exchangeRate = data.USD;
                self.$nextTick(() => {
                  self.loadPaypalButton();
                });
              },
              error() {
                alert("환율 정보를 불러오는 데 실패했습니다.");
              }
            });
          },
          toggleAll() {
            this.selectedItems = this.selectAll ? [...this.basketList] : [];
            console.log("✅ 선택된 항목 목록:", this.selectedItems);
          },
          updateSelectAll() {
            this.selectAll = this.selectedItems.length === this.basketList.length;
          },

          payWithCard() {
            const self = this;
            if (this.selectedItems.length === 0) {
              alert("결제할 상품을 선택해주세요!");
              return;
            }
            const IMP = window.IMP;
            IMP.init("imp08653517");
            IMP.request_pay({
              channelKey: "channel-key-8ebf626d-6066-4986-bebd-8d5b5db76054", // 너의 채널 키로 변경
              pg: "eximbay",
              merchant_uid: "order_" + new Date().getTime(), // ✅ 고유한 주문번호
              name: this.dynamicTitle,
              amount: 10, //this.totalAmount, 
              currency: "KRW",
              buyer_email: "test@portone.io",
              buyer_name: "구매자이름",
              buyer_tel: "010-1234-5678",
              buyer_addr: "서울특별시 강남구 삼성동",
              popup: true,
            }, function (rsp) {
              if (rsp.success) {
                alert("✅ 결제 성공!");
                console.log(rsp);
                self.fnPaymentSave(rsp.paid_amount, rsp.pay_method, rsp.merchant_uid);
              } else {
                alert("❌ 결제 실패: " + rsp.error_msg);
              }
            });
          },

          openPaypalModal() {
            this.paypalModalVisible = true;
            this.$nextTick(() => {
              this.loadPaypalButton(); // 모달 DOM 렌더링 후 실행
            });
          },

          loadPaypalButton() {
            const self = this;
            const IMP = window.IMP;
            IMP.init("imp08653517");
            const amount = this.totalAmountUSDValue;
            if (!amount || amount <= 0) return;
            const requestData = {
              channelKey: "channel-key-45f93c04-3fc8-4d28-ae5a-38adcec081cd",
              pay_method: "paypal",
              amount: amount,
              currency: "USD",
              name: this.dynamicTitle || "한국 여행 패키지",
              popup: true
            };
            const container = document.querySelector(".portone-ui-container");
            if (container) {
              IMP.loadUI("paypal-spb", requestData, (rsp) => {
                if (rsp.success) {
                  self.fnPaymentSave(rsp.paid_amount, rsp.pay_method, rsp.merchant_uid);
                } else {
                  alert("❌ PayPal 결제 실패: " + rsp.error_msg);
                }
              });
            }
          },
          fnRegisterPaymentAlarm() {
            const self = this;
            $.ajax({
              url: "/payment/registerPaymentAlarm.dox",
              type: "POST",
              dataType: "json",
              data: {
                userNo: self.sessionId,
                referenceType: "PAYMENT"
              },
              success(data) {
                console.log("✅ 알림 저장 성공", data);
              },
              error() {
                console.error("❌ 알림 저장 실패");
              }
            });
          },
          fnPaymentSave(amount, method, merchantId) {
            const self = this;
            let nparam = {
              selectedItems: self.selectedItems,
              userNo: self.sessionId,
              amount: amount,
              method: method,
              merchantId: merchantId
            }
            $.ajax({
              url: "/payment/save.dox",
              type: "POST",
              contentType: "application/json",
              dataType: "json",
              data: JSON.stringify(nparam),
              success(res) {
                if (res.result === "success") {
                  // ✅ 알림 등록 메서드 호출
                  self.fnRegisterPaymentAlarm();
                  // ✅ POST 방식으로 결제 완료 페이지 이동
                  location.href = "/payment/success.do?merchantId=" + merchantId;
                } else {
                  alert("결제 정보 저장 실패");
                }
              },
              error() {
                alert("서버와 통신 중 오류 발생");
              }
            });
          },

          fnRemoveBasket(item) {
            const self = this;
            if (!confirm("  " + item.title + "  " + "항목을 삭제하시겠습니까?")) {
              return;
            }

            $.ajax({
              url: "/payment/removeBasket.dox", // 🔁 여기에 맞는 실제 URL 사용
              type: "POST",
              dataType: "json",
              data: { basketNo: item.basketNo },
              success(data) {
                if (data.result === "success") {
                  alert("🗑️ 항목이 삭제되었습니다.");
                  self.getBasketInfoList(); // 리스트 다시 불러오기
                } else {
                  alert("❌ 삭제 실패: " + data.message);
                }
              },
              error() {
                alert("❌ 서버 통신 중 오류가 발생했습니다.");
              }
            });
          }

        },
        watch: {
          basketList: {
            handler(newVal) {
              this.selectedItems = this.basketList.filter(item => this.selectedItems.map(i => i.basketNo).includes(item.basketNo));
            },
            deep: true
          }
        },
        mounted() {
          this.getBasketInfoList();
          this.getExchangeRate();
        }
      });
      app.mount("#app");
    </script>
  </body>

  </html>