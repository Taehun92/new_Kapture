<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
  <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
  <title>공지사항 | kapture</title>
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
      <!-- 검색창 -->
      <div class="flex flex-wrap items-center gap-2 mb-6">
        <select v-model="searchOption" class="px-4 py-2 border border-gray-300 rounded">
          <option value="all">:: 전체 ::</option>
          <option value="title">제목</option>
          <option value="content">내용</option>
        </select>
        <input v-model="keyword" @keyup.enter="fnNotice" placeholder="검색어"
               class="w-96 px-4 py-2 border border-gray-300 rounded" />
        <button @click="fnNotice" class="px-4 py-2 bg-blue-950 text-white rounded hover:bg-blue-700">검색</button>
      </div>

      <!-- 공지 리스트 -->
      <div v-for="item in list" :key="item.noticeNo" @click="toggleContent(item)"
           class="mb-3 cursor-pointer">
        <div class="flex justify-between items-center bg-white px-4 py-3 rounded-lg shadow">
          <span class="font-semibold">{{ item.title }}</span>
          <span class="text-xl">{{ item.isOpen ? '-' : '+' }}</span>
        </div>
        <div v-if="item.isOpen" class="mt-2 px-4 py-3 bg-gray-50 border rounded shadow-sm">
          <div class="text-gray-700">{{ item.content }}</div>
        </div>
      </div>

      <!-- 페이지네이션 -->
      <div class="text-center mt-8">
        <a v-for="num in index" @click="fnPage(num)" class="inline-block mx-1 cursor-pointer">
          <span v-if="page == num" class="bg-blue-950 text-white px-4 py-2 rounded">{{ num }}</span>
          <span v-else class="px-4 py-2 rounded hover:underline">{{ num }}</span>
        </a>
      </div>
    </div>
  </div>

  <jsp:include page="../common/footer.jsp" />

  <script>
    const app = Vue.createApp({
      data() {
        return {
          list: [],
          searchOption: "all",
          keyword: "",
          pageSize: 10,
          index: 0,
          page: 1,
          sessionId: "${sessionId}",
          activeMenu: 'notice'
        };
      },
      methods: {
        fnNotice() {
          let self = this;
          if(self.keyword) {
            self.page = 1;
          }
          let params = {
            keyword: self.keyword,
            searchOption: self.searchOption,
            pageSize: self.pageSize,
            page: (self.page - 1) * self.pageSize
          };
          $.ajax({
            url: "/cs/notice.dox",
            dataType: "json",
            type: "POST",
            data: params,
            success: function (data) {
              console.log(data);
              self.list = data.list.map(item => ({
                ...item,
                isOpen: false
              }));
              console.log(self.list);
              self.index = Math.ceil(data.count / self.pageSize);
            }
          });
        },
        fnPage(num) {
          let self = this;
          self.page = num;
          self.fnNotice();
        },
        toggleContent(item) {
          item.isOpen = !item.isOpen;
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
        setActive(menu) {
          let self = this;
          self.activeMenu = menu;
        }
      },
      mounted() {
        let self = this;
        self.fnNotice();
      }
    });

    app.mount('#app');
  </script>
</body>

</html>