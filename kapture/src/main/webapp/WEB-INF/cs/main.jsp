<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
  <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
  <title>고객센터 메인 | kapture</title>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="../../css/kapture-style.css">
</head>

<body class="bg-white font-sans text-gray-800">
    <jsp:include page="../common/header.jsp" />
  
    <div id="app" class="flex flex-col min-h-screen">
      <!-- Hero 검색 -->
      <div class="text-center py-16 px-4 bg-white">
        <h1 class="text-3xl font-bold mb-8">무엇을 도와드릴까요?</h1>
        <div class="flex justify-center">
          <input v-model="searchKeyword" @keyup.enter="search" placeholder="궁금한 내용을 검색해보세요"
            class="w-[600px] px-6 py-4 rounded-full border border-gray-300 text-lg focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>
      </div>
  
      <!-- 카드형 버튼 -->
      <div class="bg-blue-50 pt-10 pb-24">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 gap-8 max-w-6xl mx-auto px-6">
          <div class="bg-white rounded-xl p-8 text-center shadow hover:bg-blue-200 hover:-translate-y-1.5 transition cursor-pointer" @click="goTo('faq')">
            <img src="../../img/faq.png" alt="FAQ" class="w-12 mx-auto mb-3" />
            <div class="text-lg font-semibold text-gray-900">FAQ</div>
            <div class="text-gray-600 mt-1 text-sm">자주 묻는 질문</div>
          </div>
          <div class="bg-white rounded-xl p-8 text-center shadow hover:bg-blue-200 hover:-translate-y-1.5 transition cursor-pointer" @click="goTo('notice')">
            <img src="../../img/notice.png" alt="공지사항" class="w-12 mx-auto mb-3" />
            <div class="text-lg font-semibold text-gray-900">공지사항</div>
            <div class="text-gray-600 mt-1 text-sm">이벤트 및 안내</div>
          </div>
          <div class="bg-white rounded-xl p-8 text-center shadow hover:bg-blue-200 hover:-translate-y-1.5 transition cursor-pointer" @click="goToQna('qna')">
            <img src="../../img/qna.png" alt="Q&A" class="w-12 mx-auto mb-3" />
            <div class="text-lg font-semibold text-gray-900">Q&A</div>
            <div class="text-gray-600 mt-1 text-sm">문의 답변 확인</div>
          </div>
          <div class="bg-white rounded-xl p-8 text-center shadow hover:bg-blue-200 hover:-translate-y-1.5 transition cursor-pointer" @click="goToQna('partnership')">
            <img src="../../img/relationship.png" alt="Q&A" class="w-12 mx-auto mb-3" />
            <div class="text-lg font-semibold text-gray-900">제휴 문의</div>
            <div class="text-gray-600 mt-1 text-sm">프리랜서 가이드·업소 제휴</div>
          </div>
        </div>
  
        <!-- 최신 FAQ 3개 미리보기 -->
        <div class="max-w-6xl mx-auto mt-20 px-6" v-if="faqList.length > 0">
          <h2 class="text-xl font-bold mb-4">최신 자주 묻는 질문</h2>
          <div v-for="item in faqList" :key="item.faq_no" @click="goToFaqDetail(item)"
            class="bg-white px-6 py-4 rounded-lg shadow mb-3 hover:bg-gray-100 cursor-pointer">
            {{ item.question }}
          </div>
        </div>
      </div>
    </div>
  
    <jsp:include page="../common/footer.jsp" /><body class="bg-white font-sans text-gray-800">

  <script>
    const app = Vue.createApp({
      data() {
        return {
          searchKeyword: "",
          faqList: [],
          sessionId: "${sessionId}"
        };
      },
      methods: {
        search() {
          if (this.searchKeyword.trim() !== "") {
            window.location.href = "/cs/search.do?searchKeyword=" + this.searchKeyword;
          }
        },
        goTo(menu) {
          const base = "/cs/";
          if (menu === 'faq') window.location.href = base + "faq.do";
          if (menu === 'notice') window.location.href = base + "notice.do";
        },
        goToQna(menu) {
          if (!this.sessionId) {
            alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
            window.location.href = "/login.do";
            return;
          }
          if (menu === 'qna') window.location.href = "/cs/qna.do";
          if (menu === 'partnership') window.location.href = "/cs/partnership.do";
          
        },
        goToFaqDetail(item) {
          const query = encodeURIComponent(item.question);
          window.location.href = `/cs/search.do?keyword=${query}`;
        }
      },
      mounted() {
        // 추후 FAQ 데이터 요청 처리
      }
    });
    app.mount("#app");
  </script>
</body>

</html>