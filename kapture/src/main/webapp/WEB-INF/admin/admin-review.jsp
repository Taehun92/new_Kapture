<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <title>첫번째 페이지</title>
    </head>
    <style>
        /* 제목 스타일 */
        .page-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            /* margin-top: 20px; */
            margin-left: 240px;
            /* 사이드바 너비(200px) + 여백(20px) */
            padding: 20px;
            display: flex;
            justify-content: center;
            /* 수평 중앙 정렬 */
            align-items: center;
        }

        .title-hr {
            margin-bottom: 30px;
        }

        /* ✅ 콘텐츠 영역 - 여백 개선 + 너비 조정 */
        .content {
            margin-left: 220px;
            padding: 40px 60px;
            max-width: 100%;
            height: 100vh;
            background-color: #f7f9fc;
        }

        /* ✅ 제목 스타일 */
        h2 {
            font-size: 24px;
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 25px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }

        .review-list-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            /* 가운데 정렬 핵심! */
        }

        /* ✅ 리뷰 카드 */
        .review-box {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 24px;
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
            /* 기본은 전체 너비 */
            max-width: 800px;
            /* 너무 넓지 않게 */
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .review-box:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
        }

        /* ✅ 리뷰 정보 */
        .review-info {
            max-width: 85%;
        }

        .review-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
            color: #2c3e50;
        }

        .review-meta {
            font-size: 13px;
            color: #7f8c8d;
            margin-bottom: 12px;
        }

        .review-content {
            font-size: 15px;
            line-height: 1.7;
            color: #444;
        }

        /* ✅ 삭제 버튼 */
        .review-actions {
            text-align: right;
        }

        .review-actions button {
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 12px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        .review-actions button:hover {
            background-color: #2a80b9;
        }

        /* ✅ 페이징 버튼 */
        .content button {
            padding: 8px 14px;
            margin: 0 5px;
            border: none;
            border-radius: 6px;
            background-color: #3498db;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s, transform 0.2s;
        }

        .content button:disabled {
            background-color: #bdc3c7;
            cursor: not-allowed;
        }

        .content button:hover:enabled {
            background-color: #2980b9;
            transform: translateY(-1px);
        }

        .content span {
            font-weight: bold;
            font-size: 14px;
            margin: 0 10px;
        }

        .summary-box {
            background: #f4f6f8;
            border: 1px solid #d6d9dc;
            border-radius: 10px;
            padding: 20px 30px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            font-size: 16px;
            font-weight: 500;
            color: #2c3e50;
            transition: transform 0.2s ease-in-out;
        }

        .summary-box strong {
            font-size: 20px;
            color: #3498db;
        }

        .summary-box:hover {
            transform: scale(1.01);
        }

        [v-cloak] {
            display: none;
        }
    </style>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <!-- ✅ 이 영역만 Vue에서 리스트 출력 -->
        <div id="app" v-cloak>
            <!-- 제목 추가 -->
            <div class="page-title">리뷰 및 평점 관리</div>
            <hr class="title-hr">
            <div class="content">
                
                <h2>전체 리뷰 리스트</h2>
                <!-- ✅ 리뷰 요약 박스 -->
                <div v-if="loaded">
                    <div class="summary-box">
                        <div>📝 <span style="color:#34495e;">총 리뷰 수:</span> <strong>{{ summary.TOTALCOUNT }}</strong>건
                        </div>
                        <div style="display: flex; gap: 12px; align-items: center;">
                            <input type="text" v-model="keyword" placeholder="검색어 입력" @keyup.enter="onSearch"
                                style="padding: 6px; width: 200px; border-radius: 5px; border: 1px solid #ccc;">
                            <button @click="onSearch">🔍 검색</button>

                            <select v-model="sort" @change="fnReviewList"
                                style="padding: 6px; border-radius: 5px; border: 1px solid #ccc;">
                                <option value="">최신순</option>
                                <option value="rating_desc">평점 높은순</option>
                                <option value="rating_asc">평점 낮은순</option>
                            </select>
                        </div>
                        <div>⭐ <span style="color:#34495e;">평균 평점:</span> <strong>{{ summary.AVGRATING }}</strong>점
                        </div>

                    </div>

                    <div class="review-list-wrapper">
                        <div v-for="review in list" class="review-box">
                            <div class="review-info">
                                <div class="review-title"> {{ review.TITLE }}</div>
                                <div class="review-meta">
                                    작성자: {{ review.USERFIRSTNAME }} {{ review.USERRASTNAME }} &nbsp;|&nbsp;
                                    평점: ⭐ {{ review.RATING }} &nbsp;|&nbsp;
                                    상품 시간대: {{ review.DURATION }} &nbsp;|&nbsp;
                                    작성자 이메일: {{review.EMAIL}} &nbsp;|&nbsp;
                                    날짜: {{ review.CREATEDAT }}
                                </div>
                                <div class="review-content">
                                    {{ review.CONTENT }}
                                </div>
                            </div>
                            <div class="review-actions">
                                <button @click="fnDelete(review.REVIEWNO)">리뷰 삭제하기</button>
                            </div>
                        </div>
                    </div>
                    <div style="text-align:center; margin-top: 20px;">
                        <button @click="changePage(page - 1)" :disabled="page === 1">이전</button>
                        <span> {{ page }} / {{ totalPages }} </span>
                        <button @click="changePage(page + 1)" :disabled="page === totalPages">다음</button>
                    </div>
                </div>
                <p v-else style="text-align:center;">데이터를 불러오는 중입니다...</p>
            </div>
        </div>
    </body>

    </html>

    <script>
        const app = Vue.createApp({
            data() {
                return {
                    sessionId: "${sessionId}",
                    sessionRole: "${sessionRole}",
                    list: [],  // ✅ 서버에서 가져온 리뷰 저장
                    page: 1,              // 현재 페이지
                    pageSize: 10,         // 페이지당 항목 수
                    totalCount: 0,        // 전체 리뷰 수
                    totalPages: 0,         // 전체 페이지 수
                    summary: { totalCount: 0, avgRating: 0 },
                    keyword: "",
                    sort: "",
                    loaded: false

                };
            },
            methods: {
                fnReviewList() {
                    let self = this;
                    let nparmap = {
                        page: self.page,
                        pagegSize: self.pageSize,
                        keyword: self.keyword,
                        sort: self.sort
                    };
                    $.ajax({
                        url: "/admin-review.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.totalCount = data.totalCount;
                            self.totalPages = Math.max(1, Math.ceil(data.totalCount / self.pageSize));
                            self.loaded = true;
                            console.log("현재 page:", self.page);
                            console.log("totalPages:", self.totalPages);
                            if (self.page > self.totalPages) {
                                self.page = self.totalPages;
                                setTimeout(() => {
                                    self.fnReviewList();
                                }, 0);
                                return;
                            }

                            self.list = data.list;
                        },
                        error: function (err) {
                            console.error("리뷰 불러오기 실패", err);
                        }
                    });
                },
                fnGetSummary() {
                    let self = this;
                    $.ajax({
                        url: "/admin/review/summary.dox",
                        type: "POST",
                        dataType: "json",
                        success: function (data) {
                            self.summary = data;
                        },
                        error: function () {
                            alert("요약 정보 불러오기 실패");
                        }
                    });
                },
                changePage(newPage) {
                    if (newPage >= 1 && newPage <= this.totalPages) {
                        this.page = newPage;
                        this.fnReviewList();
                    }
                },
                onSearch() {
                    this.page = 1;
                    this.fnReviewList();
                },
                fnDelete(REVIEWNO) {
                    let self = this;
                    if (!confirm("이 리뷰를 정말 삭제하시겠습니까?")) return;

                    let nparmap = {
                        REVIEWNO: REVIEWNO

                    };

                    $.ajax({
                        url: "/admin/review/delete.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {

                            alert("삭제되었습니다.");
                            self.fnReviewList(); // 삭제 후 목록 다시 불러오기
                            self.fnGetSummary();
                        },
                        error: function () {
                            alert("삭제 실패");

                        }
                    });
                }
            },
            mounted() {
                let self = this;
                if (!self.sessionId || self.sessionRole != 'ADMIN') {
                    alert("관리자만 이용가능합니다.");
                    location.href = "/main.do";
                }
                this.fnReviewList(); // ✅ 최초 진입 시 데이터 불러오기
                this.fnGetSummary();
            }
        });
        app.mount('#app');
    </script>