<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>제휴 문의 | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
  </head>

  <body class="bg-white font-sans text-gray-800">
    <jsp:include page="../common/header.jsp" />

    <div id="app" class="max-w-7xl mx-auto p-6 flex gap-6">
      <!-- 사이드바 (좌측 고정) -->
      <div class="w-56 bg-white shadow-md p-4 rounded">
        <ul class="space-y-2 font-semibold">
          <li :class="{ 'bg-blue-950 text-white': activeMenu === 'notice' }" @click="goTo('notice')"
            class="cursor-pointer rounded px-3 py-2 hover:bg-blue-100 hover:text-blue-950">
            공지사항
          </li>
          <li :class="{ 'bg-blue-950 text-white': activeMenu === 'faq' }" @click="goTo('faq')"
            class="cursor-pointer rounded px-3 py-2 hover:bg-blue-950 hover:text-white">
            FAQ
          </li>
          <li :class="{ 'bg-blue-950 text-white': activeMenu === 'inquiry' }" @click="goTo('inquiry')"
            class="cursor-pointer rounded px-3 py-2 hover:bg-blue-100 hover:text-blue-950">
            Q&A
          </li>
          <li :class="{ 'bg-blue-950 text-white': activeMenu === 'partnership' }" @click="goTo('partnership')"
            class="cursor-pointer rounded px-3 py-2 hover:bg-blue-100 hover:text-blue-950">
            제휴문의
          </li>
        </ul>
      </div>

      <!-- 메인 콘텐츠 영역 -->
      <div class="flex-1">
        <!-- 개인정보 동의 안내 -->
        <label class="block text-lg font-semibold mb-2">🔒 개인정보보호를 위한 이용자 동의사항</label>
        <textarea rows="5" class="w-full border rounded px-4 py-2 text-sm bg-gray-50 resize-none" readonly>
          제휴안내 등을 희망하는 기업 및 개인을 대상으로 아래와 같이 개인정보를 수집하고 있습니다.
          
          1. 수집 개인정보 항목 : 이름, 이메일, 전화번호
          2. 개인정보의 수집 및 이용목적 : 신청에 따른 본인확인 및 원활한 의사소통 경로 확보
          3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기
        </textarea>
        <div class="mt-2">
          <label class="inline-flex items-center">
            <input type="checkbox" v-model="agree" class="mr-2">
            <span class="text-sm text-gray-700">개인정보보호를 위한 이용자 동의사항을 확인하였습니다.</span>
          </label>
        </div>

        <!-- 입력 폼 -->
        <div class="space-y-4">
          <div>
            <label class="block font-semibold mb-1">이름 <span class="text-red-500">*</span></label>
            <input type="text" v-model="name" class="w-full border px-4 py-2 rounded" placeholder="홍길동">
          </div>
          <div>
            <label class="block font-semibold mb-1">이메일 <span class="text-red-500">*</span></label>
            <input type="email" v-model="email" class="w-full border px-4 py-2 rounded" placeholder="email@example.com">
          </div>
          <div>
            <label class="block font-semibold mb-1">연락처 <span class="text-red-500">*</span></label>
            <input type="text" v-model="phone" class="w-full border px-4 py-2 rounded" placeholder="010-1234-5678">
          </div>
          <div>
            <label class="block font-semibold mb-1">제목 <span class="text-red-500">*</span></label>
            <input type="text" v-model="title" class="w-full border px-4 py-2 rounded" placeholder="제목을 입력해주세요.">
          </div>
          <div>
            <label class="block font-semibold mb-1">내용 <span class="text-red-500">*</span></label>
            <textarea v-model="content" rows="5" class="w-full border px-4 py-2 rounded"
              placeholder="내용을 입력해주세요."></textarea>
          </div>
        </div>

        <!-- 등록 버튼 -->
        <div class="text-right mt-6">
          <button @click="fnSavePartnership" class="bg-blue-950 text-white px-6 py-2 rounded hover:bg-blue-800"
            :disabled="!agree">등록하기</button>
        </div>
      </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

    <script>
      const app = Vue.createApp({
        data() {
          return {
            sessionId: "${sessionId}",
            name: '',
            email: '',
            phone: '',
            title: '',
            content: '',
            agree: false,
            activeMenu: 'partnership'
          };
        },
        methods: {
          fnSavePartnership() {
            // 유효성 검사
            if (!this.name || !this.email || !this.phone || !this.title || !this.content) {
              alert("모든 필수 항목을 입력해주세요.");
              return;
            }

            if (!this.agree) {
              alert("개인정보 수집 및 이용에 동의해 주세요.");
              return;
            }

            const self = this;
            const param = {
              name: self.name,
              email: self.email,
              phone: self.phone,
              title: self.title,
              content: self.content,
              sessionId: self.sessionId
            };

            $.ajax({
              url: "/cs/partnershipSave.dox", // 서버에서 처리할 경로
              type: "POST",
              dataType: "json",
              data: param,
              success: function (data) {
                console.log("data=========>",data);
                if (data.result === 'success') {
                  self.fnRegisterPartnershipAlarm(data.partnershipNo);
                  alert("제휴 문의가 정상적으로 등록되었습니다.");
                  location.href = "/cs/main.do"; // 등록 후 메인 페이지로 이동
                } else {
                  alert("등록 중 오류가 발생했습니다.");
                }
              },
              error: function () {
                alert("서버 오류가 발생했습니다.");
              }
            });
          },
          // 제휴 요청시 알림 정보 저장
          fnRegisterPartnershipAlarm(partnershipNo) {
            let self = this;
            $.ajax({
              url: "/cs/registerPartnershipAlarm.dox",
              type: "POST",
              dataType: "json",
              data: {
                referenceType: "PARTNERSHIP",
                referenceId: partnershipNo,
              },
              success(res) {
                console.log("✅ partnership 알림 등록 성공", res);
              },
              error() {
                console.error("❌ partnership 알림 등록 실패");
              }
            });
          },
          goTo(menu) {
            let self = this;
            if (menu === 'notice') {
              window.location.href = '/cs/notice.do';
            } else if (menu === 'faq') {
              window.location.href = '/cs/faq.do';
            } else if (menu === 'inquiry') {
              if (!self.sessionId) {
                alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
                window.location.href = '/login.do';
              } else {
                window.location.href = '/cs/qna.do';
              }
            } else if (menu === 'partnership') {
              window.location.href = '/cs/partnership.do';
            }
          }
        }
      });
      app.mount("#app");
    </script>
  </body>

  </html>