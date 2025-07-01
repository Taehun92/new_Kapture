<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>나의 스케줄 | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
    <style>
      .fc .fc-toolbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1rem;
        font-weight: 600;
      }

      .fc .fc-toolbar-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: #1f2937;
      }

      .fc .fc-button {
        background-color: #1f2937;
        border: 1px solid #d1d5db;
        padding: 6px 10px;
        color: #ffffff;
        font-size: 1rem;
        margin: 0 4px;
        border-radius: 6px;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        transition: all 0.2s;
      }

      .fc .fc-button:hover {
        background-color: #1f2937;
        border-color: #9ca3af;
        transform: translateY(-1px);
      }

      .fc .fc-button:disabled {
        background-color: #1f2937;
        color: #9ca3af;
        cursor: not-allowed;
      }
    </style>
  </head>

  <body class="bg-white font-sans text-gray-800">
    <jsp:include page="../common/header.jsp" />

    <div id="app" class="flex max-w-6xl mx-auto px-6 py-8 gap-10 min-h-[700px]">
      <!-- 사이드바 -->
      <div class="w-56 bg-white shadow-md p-4 rounded">
        <ul class="space-y-2 font-semibold">
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-schedule.do' }"
              href="/mypage/guide-schedule.do" class="block px-3 py-2 rounded hover:bg-blue-950">나의 스케줄</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-mypage.do' }" href="/mypage/guide-mypage.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">가이드 정보수정</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-add.do' }" href="/mypage/guide-add.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">여행상품 등록</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-sales-list.do' }"
              href="/mypage/guide-sales-list.do" class="block px-3 py-2 rounded hover:bg-blue-100">상품 목록</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'qna.do' }" href="/cs/qna.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">문의하기</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-qna.do' }" href="/mypage/guide-qna.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">문의 내역 확인</a></li>
        </ul>
      </div>

      <!-- 메인 콘텐츠 -->
      <div class="flex-1">
        <!-- 색상 안내 -->
        <ul class="flex gap-4 mb-6 text-sm font-bold">
          <li class="flex items-center"><span class="text-blue-600 mr-2 text-lg">●</span>종일</li>
          <li class="flex items-center"><span class="text-red-500 mr-2 text-lg">●</span>오전</li>
          <li class="flex items-center"><span class="text-green-600 mr-2 text-lg">●</span>오후</li>
        </ul>
        <div ref="calendar" class="bg-white p-4 border border-gray-200 rounded shadow-sm"></div>
      </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

    <script>
      const app = Vue.createApp({
        data() {
          return {
            sessionId: "${sessionId}",
            sessionRole: "${sessionRole}",
            schedule: [],
            currentPage: ""
          };
        },
        methods: {
          fnGetSchedule(callback) {
            let self = this;
            $.post("/mypage/guide-schedule.dox", { userNo: self.sessionId }, function (data) {
              if (data.result === "success") {
                self.schedule = data.schedule;
                if (callback) callback();
              }
            }, 'json');
          }
        },
        mounted() {
          if (!this.sessionId || this.sessionRole === 'TOURIST') {
					  alert("가이드만 이용가능합니다.");
					  location.href = "http://localhost:8080/main.do";
				  }

          this.fnGetSchedule(() => {
            const colorMapping = {
              "오전": "red",
              "오후": "green",
              "종일": "#3788d8"
            };

            const events = this.schedule.map(item => ({
              id: item.tourNo,
              title: item.title || '투어',
              start: item.tourDate,
              allDay: true,
              backgroundColor: colorMapping[item.duration] || 'gray',
              borderColor: colorMapping[item.duration] || 'gray'
            }));

            const calendar = new FullCalendar.Calendar(this.$refs.calendar, {
              initialView: 'dayGridMonth',
              validRange: { start: new Date() },
              headerToolbar: {
                left: 'today',
                center: 'title',
                right: 'prev,next'
              },
              events,
              eventClick(info) {
                info.jsEvent.preventDefault();
                location.href = "/tours/tour-info.do?tourNo=" + info.event.id;
              }
            });
            calendar.render();
          });

          this.currentPage = window.location.pathname.split('/').pop();
        }
      });
      app.mount('#app');
    </script>
  </body>

  </html>