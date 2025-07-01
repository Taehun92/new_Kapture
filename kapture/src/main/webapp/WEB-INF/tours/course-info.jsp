<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>여행지 상세 정보</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/vue@3"></script>
</head>
<body>
    <div id="app" class="max-w-3xl mx-auto mt-12 px-6 py-8 bg-white rounded-2xl shadow-xl border border-gray-100">
        <div>
          <!-- 이미지 -->
          <img
            :src="place.firstimage"
            alt="썸네일"
            class="w-full h-64 object-cover rounded-xl mb-6 shadow-md"
            v-if="place.firstimage"
          />
      
          <!-- 제목 -->
          <h1 class="text-3xl font-extrabold text-gray-900 mb-3">
            {{ place.title }}
          </h1>
      
          <!-- 주소 -->
          <p class="text-gray-500 text-sm mb-5">
            <i class="fa-solid fa-location-dot mr-1 text-blue-500"></i>{{ place.addr1 }}
          </p>
      
          <!-- 개요 -->
          <div class="text-gray-800 leading-loose text-base whitespace-pre-wrap prose max-w-none" v-html="place.overview"></div>
        </div>
      </div>

  <script>
    const { createApp } = Vue;

    createApp({
      data() {
        return {
            place: {},
            contentId : '<%= request.getParameter("contentId") %>',
            contentType : '<%= request.getParameter("contentTypeId") %>',
            lang : '<%= request.getParameter("lang") %>'
        };
      },
      methods: {
        async fetchCourses() {
            let self = this;
            const apiKey = 'O5%2BkPtLkpnsqZVmVJiYW7JDeWEX4mC9Vx3mq4%2FGJs%2Fejvz1ceLY%2B0XySUsy15P%2BhpAdHcZHXHhdn4htsTUuvpA%3D%3D';
            const url = 'http://apis.data.go.kr/B551011/'
            + self.lang
            +'Service1/detailCommon1?ServiceKey='
            + apiKey
            +'&contentTypeId='
            + self.contentType
            +'&contentId='
            + self.contentId
            +'&MobileOS=ETC&MobileApp=AppTest&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&_type=json'

            console.log('url' , url);
            try {
              const response = await fetch(url);
              const data = await response.json();
              this.place = data.response.body.items.item[0];
              console.log(this.place);
            } catch (error) {
              console.error('API 호출 오류:', error);
            }
          },
      },
      mounted() {
        this.fetchCourses();
      }
    }).mount('#app');
  </script>
</body>
</html>