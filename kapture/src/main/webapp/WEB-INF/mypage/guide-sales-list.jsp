<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>상품목록 | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
  </head>

  <body class="bg-white text-gray-800 text-[16px] tracking-wide">
    <jsp:include page="../common/header.jsp" />
    <div id="app" class="flex max-w-7xl mx-auto px-6 py-8 gap-8 min-h-[700px]">
      <!-- 사이드바 -->
      <div class="w-56 bg-white shadow-md p-4 rounded">
        <ul class="space-y-2 font-semibold">
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-schedule.do' }"
              href="/mypage/guide-schedule.do" class="block px-3 py-2 rounded hover:bg-blue-100">나의 스케줄</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-mypage.do' }" href="/mypage/guide-mypage.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">가이드 정보수정</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-add.do' }" href="/mypage/guide-add.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">여행상품 등록</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-sales-list.do' }"
              href="/mypage/guide-sales-list.do" class="block px-3 py-2 rounded hover:bg-blue-950">상품 목록</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'qna.do' }" href="/cs/qna.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">문의하기</a></li>
          <li><a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-qna.do' }" href="/mypage/guide-qna.do"
              class="block px-3 py-2 rounded hover:bg-blue-100">문의 내역 확인</a></li>
        </ul>
      </div>

      <!-- 메인 콘텐츠 -->
      <div class="flex-1">
        <!-- 필터 영역 -->
        <div class="flex flex-wrap gap-4 items-center mb-6">
          <select v-model="statusFilter" class="border px-3 py-2 rounded-md text-sm">
            <option value="">전체</option>
            <option value="tourNo">상품번호</option>
            <option value="title">제목</option>
            <option value="siName">지역명</option>
            <option value="themeName">테마명</option>
          </select>
          <input type="text" v-model="keyword" placeholder="회원명/상품 검색"
            class="border px-3 py-2 rounded-md text-sm w-60" />
          <button @click="loadFilteredData"
            class="bg-blue-950 hover:bg-blue-700 text-white px-4 py-2 rounded-md text-sm">검색</button>
        </div>

        <!-- 반복 영역 시작 -->
        <div v-for="tour in transactions" :key="tour.tourNo"
          class="flex border rounded-lg shadow-sm hover:shadow-md bg-white w-full p-4 mb-4">

          <!-- 썸네일 -->
          <div class="w-32 flex-shrink-0 flex items-center justify-center">
            <img :src="tour.filePath" class="w-32 h-32 rounded-full object-cover border" alt="썸네일" />
          </div>

          <!-- 정보 테이블 -->
          <div class="flex-1 px-6 text-[15px]">
            <table class="w-full table-fixed">
              <tbody>
                <!-- 제목 / 날짜 / 상태 -->
                <tr>
                  <td class="font-black w-16 py-2 align-middle">제목</td>
                  <td class="truncate py-2 font-black align-middle">{{ tour.title }}</td>
                  <td class="font-black w-12 py-2 align-middle">날짜</td>
                  <td class="whitespace-nowrap py-2 align-middle">
                    {{ formatDate(tour.tourDate) }} / {{ tour.duration }}
                  </td>
                  <td class="font-black py-2 w-16 align-middle">상태</td>
                  <td class="font-black py-2 align-middle" :class="{
                'text-green-600': tour.deleteYN === 'N' && new Date(tour.tourDate) >= today,
                'text-red-500': tour.deleteYN === 'N' && new Date(tour.tourDate) < today,
                'text-blue-600': tour.deleteYN === 'Y' && new Date(tour.tourDate) >= today,
                'text-gray-500': tour.deleteYN === 'Y' && new Date(tour.tourDate) < today
              }">
                    {{ tour.deleteYN === 'N' && new Date(tour.tourDate) >= today
                    ? '판매중'
                    : tour.deleteYN === 'N' && new Date(tour.tourDate) < today ? '미판매' : tour.deleteYN==='Y' && new
                      Date(tour.tourDate)>= today
                      ? '판매완료'
                      : '거래완료' }}
                  </td>
                </tr>

                <!-- 지역 / 테마 / 가격 -->
                <tr>
                  <td class="font-black py-2 align-middle">지역</td>
                  <td class="py-2 align-middle text-gray-800">{{ tour.siName }}</td>
                  <td class="font-black py-2 align-middle">테마</td>
                  <td class="py-2 align-middle text-gray-800">{{ tour.themeName }}</td>
                  <td class="font-black py-2 align-middle">가격</td>
                  <td class="whitespace-nowrap font-bold text-base py-2 align-middle">
                    {{ formatCurrency(tour.price) }}
                  </td>
                </tr>

                <!-- 요청사항 / 차량 -->
                <tr>
                  <td
                    :class="['font-black py-2 align-middle', (!tour.etc || tour.etc.trim() === '') ? 'invisible' : '']">
                    요청사항
                  </td>
                  <td colspan="3" class="py-2 text-[18px] align-middle">
                    <span :class="{ 'invisible': !tour.etc || tour.etc.trim() === '' }">
                      {{ tour.etc }}
                    </span>
                  </td>
                  <td class="font-black py-2 align-middle">차량</td>
                  <td class="py-2 align-middle text-gray-800">
                    {{ tour.vehicle === 'PUBLIC'
                    ? '대중교통'
                    : tour.vehicle === 'GUIDE'
                    ? '가이드 차량'
                    : '회사 차량' }}
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- 수정/삭제/재게시 버튼 -->
          <div class="flex flex-col items-end justify-between w-20 min-h-[112px]"> <!-- 높이 고정 -->
            <!-- 판매 관련 버튼 영역: 항상 공간 확보 -->
            <div class="h-[36px]">
              <!-- 재판매 버튼: 날짜 지난 경우 -->
              <button v-if="isPastTour(tour.tourDate)" @click="fnOpenResaleModal(tour)"
                class="px-3 py-1 rounded text-sm text-white bg-gray-500 hover:bg-gray-600">
                재판매
              </button>
              <!-- 재게시 버튼: deleteYN === 'Y' && 날짜 안 지난 경우 && 판매내역이 없을 경우 -->
              <button v-if="tour.deleteYN === 'Y' && !tour.paymentNo && new Date(tour.tourDate) >= today"
                @click="fnToggleDeleteYN(tour)"
                class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded text-sm">
                재게시
              </button>
              <!-- 판매중지 버튼: deleteYN === 'N' && 날짜 안 지난 경우 -->
              <button v-else-if="tour.deleteYN === 'N' && new Date(tour.tourDate) >= today"
                @click="fnToggleDeleteYN(tour)"
                class="px-3 py-1 rounded text-sm text-white bg-yellow-500 hover:bg-yellow-600">
                판매중지
              </button>
            </div>

            <!-- 수정 버튼 -->
            <button v-if="!(tour.deleteYN === 'Y' && new Date(tour.tourDate) >= today)" @click="fnEditTour(tour)"
              class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded text-sm">
              수정
            </button>

            <!-- 삭제 버튼 -->
            <button v-if="!(tour.deleteYN === 'Y' && new Date(tour.tourDate) >= today)"
              @click="fnRemoveTour(tour.tourNo)"
              class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded text-sm">
              삭제
            </button>
          </div>
        </div>
        <!-- 페이징 -->
        <div class="flex justify-center mt-6">
          <button @click="goPage(page - 1)" :disabled="page === 1"
            class="px-3 py-1 border rounded hover:bg-gray-100 disabled:opacity-50">이전</button>
          <button v-for="p in totalPages" :key="p" @click="goPage(p)" :class="[
            'px-3 py-1 border rounded mx-1',
            p === page ? 'bg-blue-950 text-white' : 'hover:bg-gray-100'
          ]">
            {{ p }}
          </button>
          <button @click="goPage(page + 1)" :disabled="page === totalPages"
            class="px-3 py-1 border rounded hover:bg-gray-100 disabled:opacity-50">다음</button>
        </div>
      </div>

      <!-- 주문 상세 모달 -->
      <div v-if="showEditModal" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50"
        @click.self="fnTourEditClose">
        <div class="bg-white rounded-lg shadow-lg w-[1000px] h-[750px] max-h-[90vh] overflow-y-auto">
          <!-- 모달 헤더 -->
          <div class="flex justify-between items-center px-6 py-4 border-b">
            <h2 class="text-xl font-bold">상품 상세 정보</h2>
            <button @click="fnTourEditClose" class="text-gray-500 hover:text-black text-2xl">&times;</button>
          </div>

          <!-- 모달 바디 -->
          <div class="px-6 py-4">
            <table class="w-full text-sm">
              <!-- 제목 -->
              <tr class="align-top">
                <th class="text-left font-semibold w-28 py-1">제목</th>
                <td colspan="3" class="py-1">
                  <input v-model="editTour.title" type="text"
                    class="border rounded w-full px-2 py-1 bg-gray-100 cursor-not-allowed" disabled />
                </td>
              </tr>

              <!-- 소요시간 & 가격 -->
              <tr>
                <th class="text-left font-semibold py-1 w-28">소요시간</th>
                <td class="py-1 pr-4">
                  <select v-model="editTour.duration" class="border rounded px-2 py-1 w-full">
                    <option value="">:: 선택 ::</option>
                    <option value="오전">오전</option>
                    <option value="오후">오후</option>
                    <option value="종일">종일</option>
                  </select>
                </td>
                <th class="text-left font-semibold py-1 w-16">가격</th>
                <td class="py-1">
                  <input v-model="editTour.price" type="number" class="border rounded px-2 py-1 w-full" />
                </td>
              </tr>

              <!-- 날짜 -->
              <tr>
                <th class="text-left text-lg text-red-600 font-black py-1 w-28">※ 날 짜 ※</th>
                <td colspan="3" class="py-1">
                  <input type="date" v-model="editTour.tourDate" :min="minDate"
                    class="border rounded px-2 py-1 w-1/3" />
                </td>
              </tr>

              <!-- 지역 (시/구) -->
              <tr>
                <th class="text-left font-semibold py-1 w-28">시</th>
                <td class="py-1 pr-4">
                  <select v-model="editTour.siNo" @change="onChangeSiNo(editTour)"
                    class="border rounded px-2 py-1 w-full">
                    <option value="">:: 선택 ::</option>
                    <template v-for="item in siList">
                      <option :value="item.siNo">{{ item.siName }}</option>
                    </template>
                  </select>
                </td>
                <th class="text-left font-semibold py-1 w-16">구</th>
                <td class="py-1">
                  <select v-model="editTour.guNo" class="border rounded px-2 py-1 w-full">
                    <option value="">:: 선택 ::</option>
                    <template v-for="item in guList">
                      <option :value="item.guNo">{{ item.guName }}</option>
                    </template>
                  </select>
                </td>
              </tr>

              <!-- 테마 (상위테마 / 테마) -->
              <tr>
                <th class="text-left font-semibold py-1 w-28">상위테마</th>
                <td class="py-1 pr-4">
                  <select v-model="editTour.themeParentNo" @change="onChangeThemeParentNo(editTour)"
                    class="border rounded px-2 py-1 w-full">
                    <option value="">:: 선택 ::</option>
                    <template v-for="item in themeParentList">
                      <option :value="item.themeNo">{{ item.themeName }}</option>
                    </template>
                  </select>
                </td>
                <th class="text-left font-semibold py-1 w-16">테마</th>
                <td class="py-1">
                  <select v-model="editTour.themeNo" class="border rounded px-2 py-1 w-full">
                    <option value="">:: 선택 ::</option>
                    <template v-for="item in themeList">
                      <option :value="item.themeNo">{{ item.themeName }}</option>
                    </template>
                  </select>
                </td>
              </tr>

              <!-- 차량 선택 -->
              <tr>
                <th class="text-left font-semibold py-1 w-28">차량</th>
                <td colspan="3" class="py-1">
                  <select v-model="editTour.vehicle" class="border rounded px-2 py-1 w-1/3">
                    <option value="">:: 선택 ::</option>
                    <option value="PUBLIC">대중교통</option>
                    <option value="GUIDE">가이드 차량</option>
                    <option value="COMPANY">회사 차량</option>
                  </select>
                </td>
              </tr>

              <!-- 상세내용 -->
              <tr>
                <th class="text-left font-semibold py-1 w-28 align-top">내용</th>
                <td colspan="3" class="py-1">
                  <div id="editor" class="border rounded p-2 h-[300px] overflow-y-auto"></div>
                </td>
              </tr>
            </table>
          </div>

          <!-- 모달 푸터 -->
          <div class="flex justify-end px-6 py-4 gap-2 border-t">
            <button @click="fnSaveEditTour"
              class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">재판매</button>
            <button @click="fnTourEditClose"
              class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">취소</button>
          </div>
        </div>
      </div>

    </div> <!--app-->
    <jsp:include page="../common/footer.jsp" />
  </body>
  <script>
    const app = Vue.createApp({
      data() {
        return {
          keyword: '',
          statusFilter: "",
          transactions: [],
          page: 1,
          size: 10,
          totalPages: 1,
          sessionId: "${sessionId}",
          currentPage: '',
          today: new Date(),
          showEditModal: false,
          editTour: {
            tourNo: null,
            title: '',
            duration: '',
            price: 0,
            tourDate: '',
            siNo: '',
            siName: '',
            guNo: '',
            guName: '',
            themeParentNo: '',
            themeNo: '',
            themeName: '',
            vehicle: '',
            description: '', // 에디터에서 사용될 내용
          },

          siList: [],
          guList: [],
          themList: [],
          themParentList: [],

          imgList: [],

          // 아래는 선택된 지역/테마용 변수들 (모달에서 select와 연결)
          deleteYN: '',
          minDate: new Date().toISOString().split('T')[0] // 오늘 이후만 선택 가능하도록
        };
      },
      methods: {
        isPastTour(dateStr) {
          const today = new Date();
          today.setHours(0, 0, 0, 0);

          const formatted = dateStr.replace(" ", "T");
          const tourDate = new Date(formatted);
          tourDate.setHours(0, 0, 0, 0);
          return tourDate <= today;
        },

        setCurrentPage() {
          const path = window.location.pathname;
          this.currentPage = path.substring(path.lastIndexOf("/") + 1);
        },
        loadFilteredData() {
          this.page = 1;
          this.fnGetTransactions();
        },
        fnGetTransactions() {
          let self = this;
          let nparam = {
            keyword: self.keyword,
            page: self.page,
            size: self.size,
            sessionId: self.sessionId
          };
          $.ajax({
            url: '/mypage/getTransactionList.dox',
            method: 'POST',
            data: nparam,
            dataType: 'json',
            success(res) {
              self.transactions = res.list;
              self.siList = res.siList;
              self.themeParentList = res.themeParentList;
              self.totalPages = Math.ceil(res.totalCount / self.size);
            }
          });
        },
        goPage(p) {
          if (p < 1 || p > this.totalPages) return;
          this.page = p;
          this.fnGetTransactions();
        },

        formatCurrency(val) {
          return '₩ ' + Number(val).toLocaleString();
        },

        formatDate(date) {
          if (!date) return '-'; // null, undefined 방지
          var d = new Date(date);
          if (isNaN(d)) return '-'; // 유효하지 않은 날짜일 경우
          var year = d.getFullYear();
          var month = ('0' + (d.getMonth() + 1)).slice(-2);
          var day = ('0' + d.getDate()).slice(-2);
          return year + '-' + month + '-' + day;
        },

        fnEditTour(item) {
          location.href = "/mypage/guide-edit.do?tourNo=" + item.tourNo;
        },

        fnRemoveTour(tourNo) {
          if (confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
              url: "/mypage/guide-delete.dox",
              method: "POST",
              data: { tourNo: tourNo },
              dataType: "json",
              success: (res) => {
                if (res.result === 'success') {
                  alert("삭제되었습니다.");
                  this.fnGetTransactions();
                }
              }
            });
          }
        },

        fnToggleDeleteYN(item) {
          let self = this;
          let toggleTo = item.deleteYN === "Y" ? "N" : "Y";
          $.ajax({
            url: "/tours/toggleTourDeleteYn.dox",
            method: "POST",
            data: { tourNo: item.tourNo, deleteYN: toggleTo },
            dataType: "json",
            success: function (res) {
              if (res.num > 0) {
                alert("상태가 변경되었습니다.");
                self.fnGetTransactions();
              }
            }
          });
        },

        fnUpdateImgList(tourNo) {
          let self = this;
          let imageUrls = self.imgList.map(img => img.url);
          let nparmap = {
            tourNo: tourNo,
            imgList: JSON.stringify(imageUrls), // URL만 전송
            thumbnailList: JSON.stringify(self.imgList) // 전체 데이터도 전송 (썸네일 구분용)
          };
          $.ajax({
            url: "/mypage/updateImg.dox",
            dataType: "json",
            type: "POST",
            data: nparmap,
            success: function (data) {
              if (data.result == 'success') {
                location.href = "/mypage/guide-sales-list.do";
              }
            }
          })
        },

        onChangeSiNo(tour) {
          const self = this;
          $.ajax({
            url: "/common/getGuListBysiNo.dox",
            method: "POST",
            dataType: "json",
            data: { siNo: tour.siNo },
            success(res) {
              self.guList = res.guList;
            }
          });
        },

        // 상위테마 변경 시 하위테마 리스트 호출
        onChangeThemeParentNo(tour) {
          const self = this;
          $.ajax({
            url: "/common/getThemeListByParentNo.dox",
            method: "POST",
            dataType: "json",
            data: { themeParentNo: tour.themeParentNo },
            success(res) {
              self.themeList = res.themeList;
            }
          });
        },

        // 모달 열기 시 실행
        fnOpenResaleModal(tour) {
          let self = this;
          if (!tour) return;

          self.showEditModal = true;

          // 구/테마 리스트 먼저 로드 → editTour 셋업
          this.fnGetGuList(tour.siNo, () => {
            this.fnGetThemeList(tour.themeParentNo, () => {
              self.editTour = {
                guideNo: tour.guideNo,
                fileNo: tour.fileNo,
                tourNo: tour.tourNo,
                title: tour.title || '',
                duration: tour.duration || '',
                price: tour.price || 0,
                tourDate: tour.tourDate || '',
                vehicle: tour.vehicle || '',
                siNo: tour.siNo || '',
                siName: tour.siName || '',
                guNo: tour.guNo || '',
                guName: tour.guName || '',
                themeParentNo: tour.themeParentNo || '',
                themeNo: tour.themeNo || '',
                themeName: tour.themeName || '',
                deleteYN: tour.deleteYN || '',
                description: tour.description || ''
              };

              self.$nextTick(() => {
                const editorEl = document.getElementById("editor");

                // Quill 초기화
                if (editorEl) {
                  if (window.quill) {
                    // 기존 에디터 제거 및 초기화
                    window.quill = null;
                    editorEl.innerHTML = '';
                  }
                  window.quill = new Quill(editorEl, {
                    theme: 'snow',
                    modules: {
                      toolbar: {
                        container: [
                          [{ 'header': [1, 2, 3, false] }],
                          ['bold', 'italic', 'underline'],
                          [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                          ['link', 'image'],
                          [{ 'color': [] }, { 'background': [] }],
                          [{ 'align': [] }],
                          ['clean']
                        ],
                        handlers: {
                          image: function () {
                            let input = document.createElement('input');
                            input.setAttribute('type', 'file');
                            input.setAttribute('accept', 'image/*');
                            input.click();

                            input.onchange = async () => {
                              let file = input.files[0];
                              if (!file) return;

                              let formData = new FormData();
                              formData.append("file", file);

                              try {
                                let response = await fetch("/upload/image", {
                                  method: "POST",
                                  body: formData
                                });

                                let result = await response.json();
                                if (result.success) {
                                  let range = window.quill.getSelection();
                                  window.quill.insertEmbed(range.index, 'image', result.imageUrl);

                                  let thumbnailFlag = self.imgList.length === 0 ? "Y" : "N";
                                  self.imgList.push({ url: result.imageUrl, thumbnail: thumbnailFlag });
                                } else {
                                  alert("이미지 업로드 실패");
                                }
                              } catch (error) {
                                console.error("이미지 업로드 중 오류 발생:", error);
                              }
                            };
                          }
                        }
                      }
                    }
                  });

                  // text-change 핸들러
                  window.quill.on('text-change', function () {
                    self.editTour.description = window.quill.root.innerHTML;
                  });
                }

                // 내용 채우기
                if (window.quill) {
                  window.quill.root.innerHTML = self.editTour.description || '';
                }
              });
            });
          });
        },


        // 구 리스트 불러오기
        fnGetGuList(siNo, callback) {
          let self = this;
          $.ajax({
            url: "/common/getGuListBysiNo.dox",
            dataType: "json",
            type: "POST",
            data: { siNo: siNo },
            success: function (data) {
              self.guList = data.guList || [];
              if (typeof callback === "function") callback();
            }
          });
        },

        // 테마 리스트 불러오기
        fnGetThemeList(themeParentNo, callback) {
          let self = this;
          $.ajax({
            url: "/common/getThemeListByParentNo.dox",
            dataType: "json",
            type: "POST",
            data: { themeParentNo: themeParentNo },
            success: function (data) {
              self.themeList = data.themeList || [];
              if (typeof callback === "function") callback();
            }
          });
        },

        fnTourEditClose() {
          this.showEditModal = false;

          if (window.quill) {
            window.quill.root.innerHTML = '';
            window.quill = null; // 완전 초기화
          }

          const editorEl = document.getElementById("editor");
          if (editorEl) editorEl.innerHTML = ''; // 백업
        },

        fnSaveEditTour: async function () {
          const self = this;

          if (window.quill) {
            // 1. 에디터 내용 가져오기
            const rawHtml = window.quill.root.innerHTML;

            const tempDiv = document.createElement("div");
            tempDiv.innerHTML = rawHtml;

            const imgTags = tempDiv.querySelectorAll("img");
            self.imgList = [];

            for (let i = 0; i < imgTags.length; i++) {
              const src = imgTags[i].getAttribute("src");

              // base64 이미지 제외
              if (src.startsWith("data:")) continue;

              try {
                // 2. 이미지 fetch → blob → 재업로드
                const response = await fetch(src);
                const blob = await response.blob();

                const formData = new FormData();
                formData.append("file", blob, "resale-img-" + i + ".jpg");

                const uploadRes = await fetch("/upload/image", {
                  method: "POST",
                  body: formData
                });

                const result = await uploadRes.json();

                if (result.success) {
                  const newUrl = result.imageUrl;

                  // 3. 에디터 이미지 src 교체
                  imgTags[i].setAttribute("src", newUrl);

                  // 4. imgList에 추가
                  self.imgList.push({
                    url: newUrl,
                    thumbnail: i === 0 ? "Y" : "N"
                  });
                } else {
                  console.error("❌ 이미지 업로드 실패:", src);
                }
              } catch (err) {
                console.error("❌ 이미지 처리 실패:", err);
              }
            }

            // 5. 최종 description HTML 갱신
            self.editTour.description = tempDiv.innerHTML;
          }

          // 유효성 검사
          if (
            !self.editTour.title ||
            !self.editTour.duration ||
            !self.editTour.price ||
            !self.editTour.tourDate ||
            !self.editTour.siNo ||
            !self.editTour.guNo ||
            !self.editTour.themeParentNo ||
            !self.editTour.themeNo ||
            !self.editTour.vehicle
          ) {
            alert("모든 항목을 입력해주세요.");
            return;
          }

          const today = new Date();
          const selectedDate = new Date(self.editTour.tourDate);
          today.setHours(0, 0, 0, 0);
          selectedDate.setHours(0, 0, 0, 0);

          if (selectedDate <= today) {
            alert("날짜는 내일 이후로만 선택할 수 있습니다.");
            return;
          }

          // 6. 재판매 상품 등록
          $.ajax({
            url: '/mypage/guide-add.dox',
            method: 'POST',
            data: {
              ...self.editTour,
              sessionId: self.sessionId
            },
            dataType: 'json',
            success(res) {
              if (res.result === 'success') {
                alert("재판매 상품이 등록되었습니다.");

                if (self.imgList.length > 0) {
                  self.fnUpdateImgList(res.tourNo); // 이미지 별도 저장
                } else {
                  location.href = "/mypage/guide-sales-list.do";
                }

                self.fnTourEditClose();
                self.fnGetTransactions();
              } else {
                alert("등록에 실패했습니다.");
              }
            },
            error(err) {
              console.error(err);
              alert("서버 오류가 발생했습니다.");
            }
          });
        }


      },
      mounted() {
        let self = this;
        if (!this.sessionId || this.sessionRole === 'TOURIST') {
          alert("가이드만 이용가능합니다.");
          location.href = "http://localhost:8080/main.do";
        }
        this.setCurrentPage();
        this.fnGetTransactions();

      }
    });
    app.mount('#app');
  </script>
  </body>

  </html>