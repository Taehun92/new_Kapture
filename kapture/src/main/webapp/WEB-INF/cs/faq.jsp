<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="../../css/kapture-style.css">
  <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
  <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
  <title>자주 묻는 질문 | kapture</title>
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

    <!-- 메인 컨텐츠 -->
    <div class="flex-1 pl-8">
      <!-- 검색창 -->
      <div class="flex flex-wrap items-center gap-2 mb-6">
        <select v-model="searchOption" class="px-4 py-2 border border-gray-300 rounded">
          <option value="all">:: 전체 ::</option>
          <option value="category">카테고리</option>
          <option value="question">질문</option>
        </select>
        <input v-model="keyword" @keyup.enter="fnMain()" placeholder="검색어"
          class="w-96 px-4 py-2 border border-gray-300 rounded" />
        <button @click="fnMain()" class="px-4 py-2 bg-blue-950 text-white rounded hover:bg-blue-700">검색</button>
      </div>

      <!-- 카테고리 필터 -->
      <div class="flex gap-4 border-b pb-3 mb-6 font-bold text-gray-800">
        <span v-for="cat in categories" :key="cat.value"
          :class="['cursor-pointer px-3 py-1 rounded', selectedCategory === cat.value ? 'text-red-600 border-b-2 border-red-600' : 'hover:text-blue-700']"
          @click="page = 1; fnMain(cat.value)">
          {{ cat.label }}
        </span>
      </div>

      <!-- 질문 리스트 -->
      <div v-for="item in filteredList" :key="item.category + item.question" class="mb-3">
        <div @click="toggleAnswer(item)"
          class="flex justify-between items-center bg-white px-4 py-3 rounded-lg shadow cursor-pointer">
          <span class="font-semibold">{{ item.category }} - {{ item.question }}</span>
          <span class="text-xl">{{ item.isOpen ? '-' : '+' }}</span>
        </div>
        <div v-if="item.isOpen" class="mt-2 px-4 py-3 bg-gray-50 border rounded shadow-sm">
          <div class="text-gray-700">답변: {{ item.answer }}</div>
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
          sessionId: "${sessionId}",
          filteredList: [],
          searchOption: "all",
          keyword: "",
          pageSize: 10,
          index: 0,
          page: 1,
          activeMenu: 'faq',
          selectedCategory: "all",
          categories: [
            { label: "전체", value: "all" },
            { label: "국내패키지", value: "국내패키지" },
            { label: "예약/결제", value: "예약/결제" },
          ]
        };
      },
      methods: {
        fnMain(cat = this.selectedCategory) {
          let self = this;
          let nparmap = {
            keyword: self.keyword,
            searchOption: self.searchOption,
            pageSize: self.pageSize,
            page: (self.page - 1) * self.pageSize
          };
          $.ajax({
            url: "/cs/faq.dox",
            dataType: "json",
            type: "POST",
            data: nparmap,
            success: function (data) {
              self.list = data.list.map(item => ({
                ...item,
                isOpen: false
              }));
              console.log('현재 페이지 :', self.page);
              self.index = Math.ceil(data.count / self.pageSize);
              self.filterByCategory(cat);
              console.log(cat);
            }
          });
        },
        fnPage(num) {
          let self = this;
          self.page = num;
          self.fnMain(self.selectedCategory);
          console.log('현재 페이지 :', self.page);
        },
        toggleAnswer(item) {
          item.isOpen = !item.isOpen;
        },
        setActive(menu) {
          let self = this;
          self.activeMenu = menu;
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
        filterByCategory(category) {
          let self = this;
          self.selectedCategory = category;
          if (category === "all") {
            
            self.filteredList = self.list;
          } else {
            
            self.filteredList = self.list.filter(item => item.category === category);
            self.index = Math.ceil(self.filteredList.length / self.pageSize);
          }
        }
      },
      mounted() {
        let self = this;
        let cat = 'all';
        self.fnMain(cat);
      }
    });
    app.mount('#app');
  </script>
</body>

</html>