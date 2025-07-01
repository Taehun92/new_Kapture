<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>1:1 문의하기 | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
  </head>

  <body class="bg-white font-sans text-gray-800">
    <jsp:include page="../common/header.jsp" />

    <div id="app" class="flex max-w-6xl mx-auto px-6 py-8">
      <!-- 사이드바 -->
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

      <!-- 메인 콘텐츠 -->
      <div class="flex-1 pl-8">
        <div class="bg-white rounded-lg shadow-md p-6">
          <h2 class="text-2xl font-bold mb-2 text-center">1:1 문의하기</h2>
          <p class="text-gray-600 mb-6 text-center">사이트를 사용하시면서 불편한 사항이나 개선 의견이 있다면 언제든지 문의해주세요.</p>

          <select v-model="category" class="w-full border border-gray-300 rounded px-4 py-3 mb-4">
            <option value="">문의 유형을 선택해주세요</option>
            <option value="예약/결제">예약/결제</option>
            <option value="패키지">패키지</option>
            <option value="취소/환불">취소/환불</option>
          </select>

          <input type="text" placeholder="제목을 입력해주세요 (선택사항)" v-model="qnaTitle"
            class="w-full border border-gray-300 rounded px-4 py-3 mb-4" />

          <textarea rows="12" placeholder="문의하실 내용을 입력해주세요" v-model="question"
            class="w-full border border-gray-300 rounded px-4 py-3 mb-4"></textarea>

          <label class="block text-sm font-medium text-gray-700 mb-1">파일첨부 (최대 5MB)</label>
          <input type="file" ref="file" @change="handleFile"
            class="w-full border border-gray-300 rounded px-3 py-2 mb-2" />
          <div class="text-sm text-red-500 mb-4" v-if="fileWarning">{{ fileWarning }}</div>

          <div class="text-right space-x-2">
            <button class="bg-gray-500 text-white px-6 py-2 rounded hover:bg-gray-600" @click="fnCancel">취소</button>
            <button class="bg-blue-950 text-white px-6 py-2 rounded hover:bg-blue-900" @click="fnQna">문의하기</button>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

    <script>
      const app = Vue.createApp({
        data() {
          return {
            category: "",
            qnaTitle: "",
            question: "",
            userNo: "${sessionId}",
            file: null,
            fileWarning: "",
            sessionId: "${sessionId}",
            activeMenu: 'qna'
          };
        },
        methods: {
          fnQna() {
            let self = this;
            if (!this.category || !this.question) {
              alert("필수 항목을 모두 입력해주세요.");
              return;
            }
            if (this.file && this.file.size > 5 * 1024 * 1024) {
              alert("5MB 이하 파일만 첨부 가능합니다.");
              return;
            }

            const formData = new FormData();
            formData.append("category", this.category);
            formData.append("qnaTitle", this.qnaTitle);
            formData.append("question", this.question);
            formData.append("userNo", this.userNo);
            if (this.file) formData.append("file", this.file);

            $.ajax({
              url: "/cs/add.dox",
              type: "POST",
              data: formData,
              processData: false,
              contentType: false,
              success: function (data) {
                alert("문의가 정상적으로 등록되었습니다.");
                if (data.inquiryNo) {
                  self.fnRegisterQnaAlarm(data.inquiryNo);
                }
                location.href = "/cs/main.do";
              },
              error: function () {
                alert("문의 등록 중 오류가 발생했습니다.");
              }
            });
          },
          fnRegisterQnaAlarm(inquiryNo) {
            $.ajax({
              url: "/cs/registerQnaAlarm.dox",
              type: "POST",
              dataType: "json",
              data: {
                referenceType: "QNA",
                referenceId: inquiryNo,
              },
              success(res) {
                console.log("✅ QnA 알림 등록 성공", res);
              },
              error() {
                console.error("❌ QnA 알림 등록 실패");
              }
            });
          },
          fnCancel() {
            location.href = "/cs/main.do";
          },
          handleFile(event) {
            this.file = event.target.files[0];
            if (this.file && this.file.size > 5 * 1024 * 1024) {
              this.fileWarning = "5MB 이하의 파일만 첨부할 수 있습니다.";
            } else {
              this.fileWarning = "";
            }
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
          },
        }
      });
      app.mount("#app");
    </script>
  </body>

  </html>