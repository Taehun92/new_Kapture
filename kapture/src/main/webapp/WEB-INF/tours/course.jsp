<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 코스 리스트</title>
    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Vue 3 CDN -->
    <script src="https://unpkg.com/vue@3"></script>
</head>
<body>

<div id="app" class="p-6 max-w-screen-xl mx-auto font-sans">
    <!-- 카테고리 필터 -->
    <div class="mb-6 flex flex-wrap gap-2">
        <button
            v-for="cat in categories"
            :key="cat.code"
            :class="[
                'px-4 py-2 rounded-full text-sm transition duration-200',
                selectedCat2 === cat.code ? 'bg-blue-950 text-white shadow-md' : 'bg-gray-100 hover:bg-gray-200 text-gray-700'
            ]"
            @click="filterByCategory(cat.code)"
        >
            {{ cat.label }}
        </button>
    </div>

    <!-- 언어 및 지역 선택 -->
    <div class="mb-6 flex flex-wrap gap-4 items-center">
        <span>언어 :</span>
        <div class="relative inline-block text-left">
          <button @click="open = !open"
            class="inline-flex justify-between items-center w-48 px-4 py-2 bg-white border border-gray-300 rounded-lg shadow-sm text-sm text-gray-700 hover:bg-gray-100">
            <img :src="selectedLang.flag" alt="Flag" class="w-5 h-5 mr-2" />
            {{ selectedLang.label }}
            <svg class="ml-auto w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
          </button>

          <div v-if="open" class="absolute z-10 mt-2 w-48 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5">
            <div class="py-1">
              <button v-for="langItem in langList" :key="langItem.code" @click="selectLang(langItem)"
                class="w-full px-4 py-2 text-left text-sm text-gray-700 hover:bg-gray-100 flex items-center space-x-2">
                <img :src="langItem.flag" alt="Flag" class="w-5 h-5" />
                <span>{{ langItem.label }}</span>
              </button>
            </div>
          </div>
        </div>

        <span>지역 :</span>
        <select v-model="selectedRegion" @change="filterByRegion" class="px-4 py-2 border border-gray-300 rounded-lg shadow-sm text-sm">
            <option value="">전체</option>
            <option value="1">서울</option>
            <option value="6">부산</option>
            <option value="4">대구</option>
            <option value="2">인천</option>
            <option value="5">광주</option>
            <option value="3">대전</option>
            <option value="7">울산</option>
            <option value="8">세종</option>
            <option value="31">경기</option>
            <option value="32">강원</option>
            <option value="33">충북</option>
            <option value="34">충남</option>
            <option value="35">경북</option>
            <option value="36">경남</option>
            <option value="37">전북</option>
            <option value="38">전남</option>
            <option value="39">제주</option>
        </select>
    </div>

    <!-- 검색창 -->
    <div class="mb-6 flex gap-2 items-center">
        <input v-model="searchKeyword" type="text" placeholder="검색어를 입력하세요" @keyup.enter="searchCourses"
            class="flex-1 px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-950"
        />
        <button @click="searchCourses" class="px-5 py-2 bg-blue-950 text-white rounded-lg shadow hover:bg-blue-700 transition">
            검색
        </button>
    </div>

    <!-- 결과 리스트 -->
    <ul class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <li v-for="course in paginatedCourses" :key="course.contentid" class="bg-white border rounded-xl shadow hover:shadow-lg transition duration-200 overflow-hidden">
            <a :href="'course-info.do?contentId=' + course.contentid + '&contentTypeId=' + course.contenttypeid +'&lang=' + lang" class="block">
                <img :src="course.firstimage || 'default.jpg'" alt="썸네일" class="w-full h-52 object-cover" />
                <div class="p-4">
                    <p class="text-lg font-bold text-gray-800 truncate">{{ course.title }}</p>
                </div>
            </a>
        </li>
    </ul>

    <!-- 페이지네이션 -->
    <div class="mt-10 flex justify-center gap-2">
        <button
            v-for="page in totalPages"
            :key="page"
            :class="[
                'px-4 py-2 border rounded-md text-sm',
                currentPage === page
                    ? 'bg-blue-950 text-white font-semibold shadow'
                    : 'bg-white text-gray-700 hover:bg-gray-100'
            ]"
            @click="changePage(page)"
        >
            {{ page }}
        </button>
    </div>
</div>

<script>
const { createApp } = Vue;

createApp({
  data() {
    return {
        open: false,
        categories: [
            { code: 'A0101', label: '관광지' },
            { code: 'A0207', label: '축제공연행사' },
            { code: 'A0401', label: '쇼핑' },
            { code: 'A0206', label: '문화시설' },
        ],
        selectedCat2: 'A0101',
        searchKeyword: '',
        courses: [],
        filteredCourses: [],
        currentPage: 1,
        itemsPerPage: 12,
        lang: 'Kor',
        selectedLang: { code: 'Kor', label: '한국어', flag: 'https://flagcdn.com/w40/kr.png' },
        langList: [
            { code: 'Kor', label: '한국어', flag: 'https://flagcdn.com/w40/kr.png' },
            { code: 'Eng', label: '영어', flag: 'https://flagcdn.com/w40/us.png' },
            { code: 'Jpn', label: '일본어', flag: 'https://flagcdn.com/w40/jp.png' },
            { code: 'Chs', label: '중국어', flag: 'https://flagcdn.com/w40/cn.png' }
        ],
        selectedRegion: '',
    };
  },
  computed: {
    paginatedCourses() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      return this.filteredCourses.slice(start, start + this.itemsPerPage);
    },
    totalPages() {
      return Math.ceil(this.filteredCourses.length / this.itemsPerPage);
    },
  },
  methods: {
    async fetchCourses() {
      const apiKey = 'O5%2BkPtLkpnsqZVmVJiYW7JDeWEX4mC9Vx3mq4%2FGJs%2Fejvz1ceLY%2B0XySUsy15P%2BhpAdHcZHXHhdn4htsTUuvpA%3D%3D';
      const url = 'https://apis.data.go.kr/B551011/' + this.lang + 'Service1/areaBasedList1?serviceKey=' + apiKey + '&areaCode=' + this.selectedRegion + '&MobileApp=AppTest&MobileOS=ETC&cat2=' + this.selectedCat2 + '&_type=json&numOfRows=300&arrange=P';

      try {
        let self = this;
        const response = await fetch(url);
        const data = await response.json();
        const allCourses = data.response.body.items.item || [];
        self.courses = allCourses.filter(course => course.firstimage && course.firstimage.trim() !== '' && course.title && course.title.trim() !== '');
        self.filteredCourses = self.courses;
        self.currentPage = 1;
        console.log('URL:', url);
        console.log(allCourses);
      } catch (error) {
        console.error('API 호출 오류:', error);
      }
    },
    filterByCategory(cat2) {
      let self = this;
      self.selectedCat2 = cat2;
      self.fetchCourses();
    },
    fnSelectLang() {
      let self = this;
      self.fetchCourses();
    },
    selectLang(langItem) {
      let self = this;
      self.selectedLang = langItem;
      self.lang = langItem.code;
      self.open = false;
      self.fetchCourses();
    },
    filterByRegion() {
      let self = this;
      self.fetchCourses();
    },
    searchCourses() {
      let self = this;
      const keyword = self.searchKeyword.toLowerCase();
      self.filteredCourses = this.courses.filter((item) => {
        const title = item.title?.toLowerCase() || "";
        const addr1 = item.addr1?.toLowerCase() || "";
      return title.includes(keyword) || addr1.includes(keyword);
    });
      self.currentPage = 1;
    },
    changePage(page) {
      let self = this;
      self.currentPage = page;
    },
  },
  mounted() {
    let self = this;
    self.fetchCourses();
  },
}).mount('#app');
</script>

</body>
</html>
