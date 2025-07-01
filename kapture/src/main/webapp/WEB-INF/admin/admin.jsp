<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Admin 대시보드</title>
        <style>
            .dashboard {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                gap: 16px;
                padding: 30px;
                max-width: 1200px;
                /* ✅ 폭 제한 */
                margin: 0 auto;
                /* ✅ 가운데 정렬 */
                margin-left: 220px;
            }

            .card {
                flex: 0 0 48%;
                /* ✅ 한 줄 2개씩 */
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
                padding: 20px;
                margin-bottom: 20px;
                box-sizing: border-box;
                min-height: 250px;
                /* ✅ 높이 균일 */
                transition: transform 0.2s ease;
            }

            .card:hover {
                transform: translateY(-4px);
            }

            .card.wide {
                flex: 0 0 100%;
            }

            .detail-btn {
                background-color: #3498db;
                color: #fff;
                border: none;
                border-radius: 6px;
                padding: 6px 12px;
                font-size: 13px;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            .detail-btn:hover {
                background-color: #2980b9;
            }
        </style>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div id="app">
            <div class="dashboard">
                <div class="card">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <h3>년도 별 매출 현황</h3>
                        <button class="detail-btn" @click="goToDetail('sales')">상세보기</button>
                    </div>
                    <div id="chart1"></div>
                </div>

                <div class="card">
                    <h3>인기 테마 TOP5</h3>
                    <div id="chart2"></div>

                </div>

                <div class="card wide">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <h3>월 매출 그래프</h3>
                        <button class="detail-btn" @click="goToDetail('monthly')">상세보기</button>
                    </div>
                    <div id="chart3"></div>
                </div>

                <div class="card">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <h3>요청 게시판</h3>
                        <button class="detail-btn" @click="goToDetail('request')">요청 보기</button>
                    </div>

                    <div v-if="requestCount > 0" style="margin-top: 12px;">
                        <p>📨 총 {{ requestCount }}건의 요청이 있습니다.</p>

                        <ul style="margin-top: 10px; padding-left: 0;">
                            <li v-for="(r, idx) in requestList" :key="r.REQUEST_NO"
                                style="list-style: none; margin-bottom: 8px; border-bottom: 1px solid #eee; padding-bottom: 6px;">
                                <strong>{{ r.TITLE }}</strong><br />
                                <small style="color: gray;">{{ r.USER_FIRSTNAME }} {{ r.USER_LASTNAME }} · {{
                                    r.RQ_CREATED_AT }}</small><br />
                                <small :style="{ color: getStatusColor(r.STATUS) }">[{{ getStatusLabel(r.STATUS)
                                    }}]</small>
                            </li>
                        </ul>
                    </div>

                    <div v-else style="margin-top: 12px; color: gray;">
                        현재 도착한 요청이 없습니다.
                    </div>
                </div>

                <div class="card">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <h3>최근 판매 5건</h3>
                        <button class="detail-btn" @click="goToDetail('tours')">판매리스트</button>
                    </div>

                    <ul style="margin-top: 12px; padding-left: 0;">
                        <li v-for="(s, index) in salesList" :key="index"
                            style="display: flex; align-items: center; gap: 12px; padding: 10px 0; border-bottom: 1px solid #eee; list-style: none; min-height: 70px;">

                            <!-- ✅ 작게 고정된 썸네일 이미지 -->
                            <img :src="s.IMAGE_PATH || '../../img/ximage.jpg'" alt="썸네일"
                                style="width: 50px; height: 50px; object-fit: cover; border-radius: 6px; flex-shrink: 0;" />

                            <!-- ✅ 텍스트 정보 -->
                            <div style="flex: 1;">
                                <div style="font-weight: 600; font-size: 14px;">{{ s.TITLE }}</div>
                                <div style="color: #777; font-size: 13px;">{{ s.PAYMENT_DATE }} · {{ s.NUM_PEOPLE }}명
                                </div>
                                <div style="color: #999; font-size: 13px;">{{ numberWithCommas(s.AMOUNT) }}원</div>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="card wide">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <h3>최근 리뷰 5건</h3>
                        <button class="detail-btn" @click="goToDetail('theme')">상세보기</button>
                    </div>

                    <ul style="margin-top: 10px;">
                        <li v-for="r in reviewList" :key="r.TOUR_NO" style="margin-bottom: 12px;">
                            <strong>{{ r.TITLE }}</strong> ({{ r.RATING }}⭐)<br />
                            <span style="color:gray;">"{{ r.COMMENT }}"</span><br />
                            <small style="color: #888;">작성자: {{ r.USERFIRSTNAME }} {{ r.USERLASTNAME }}</small>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>

    </html>
    <script>
        // ✅ Vue 바깥 전역에 정의
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        const app = Vue.createApp({
            data() {
                return {
                    sessionId : "${sessionId}",
                    sessionRole : "${sessionRole}",
                    reviewList: [],
                    salesList: [],
                    requestCount: 0,
                    latestRequest: {},
                    requestList: []
                };
            },
            methods: {
                fn() {
                    this.loadChart1();  // chart1만 관리
                    this.loadChart2();
                    this.loadChart3();
                    this.loadLatestReviews();
                    this.loadLatestSales();
                    this.loadRequestSummary();
                },

                // ✅ chart1: 매출 차트 불러오기 (분리)
                loadChart1() {
                    $.ajax({
                        url: "/admin/sales/summary.dox",
                        type: "POST",
                        dataType: "json",
                        success: function (res) {
                            const years = res.salesList.map(item => item.YEAR);
                            const totals = res.salesList.map(item => item.TOTALSALES);

                            const options = {
                                series: [{ name: '년도별 매출', data: totals }],
                                chart: { type: 'bar', height: 250 },
                                dataLabels: {
                                    enabled: true,
                                    formatter: function (val) {
                                        return numberWithCommas(val) + '원';
                                    },
                                    style: { fontWeight: 'bold' }
                                },
                                xaxis: { categories: years },
                                tooltip: {
                                    y: {
                                        formatter: function (val) {
                                            return numberWithCommas(val) + '원';
                                        }
                                    }
                                },
                                title: { text: '년도별 매출 비교', align: 'left' },
                                fill: { opacity: 1 }
                            };

                            const chart1 = new ApexCharts(document.querySelector("#chart1"), options);
                            chart1.render();
                        },
                        error: function () {
                            console.error("chart1 매출 데이터 불러오기 실패");
                        }
                    });
                },

                // ✅ chart2
                loadChart2() {
                    $.ajax({
                        url: "/admin/theme/summary.dox",
                        type: "POST",
                        dataType: "json",
                        success: function (res) {
                            if (!res.themeList || res.themeList.length === 0) {
                                $("#chart2").html("<p style='text-align:center;'>데이터가 없습니다</p>");
                                return;
                            }

                            const total = res.totalCount;
                            const top5 = res.themeList.slice(0, 5);
                            const labels = top5.map(item => item.THEME);
                            const counts = top5.map(item => item.COUNT);

                            const options = {
                                series: counts,
                                chart: { type: 'pie', height: 250 },
                                labels: labels,
                                tooltip: {
                                    y: {
                                        formatter: function (val) {

                                            return numberWithCommas(val) + '건'; // ✅ 간단하게 숫자만
                                        }
                                    }
                                },
                                dataLabels: {
                                    enabled: true,
                                    formatter: function (val, opts) {
                                        const label = opts?.w?.config?.labels?.[opts.seriesIndex];
                                        return val.toFixed(1) + "%";
                                    },
                                    style: {
                                        fontSize: '14px',
                                        fontWeight: 'bold'
                                    }
                                },
                                responsive: [{
                                    breakpoint: 480,
                                    options: {
                                        chart: { width: 200 },
                                        legend: { position: 'bottom' }
                                    }
                                }]
                            };

                            const chart2 = new ApexCharts(document.querySelector("#chart2"), options);
                            chart2.render();
                        },
                        error: function () {
                            console.error("chart2 테마 데이터 불러오기 실패");
                        }
                    });
                },

                // ✅ chart3
                loadChart3() {
                    $.ajax({
                        url: "/admin/sales/monthly.dox",
                        type: "POST",
                        dataType: "json",
                        success: (res) => {
                            console.log("월별 매출 차트 응답 확인 ✅", res);

                            if (!res.monthlyList || res.monthlyList.length === 0) {
                                $("#chart3").html("<p style='text-align:center;'>데이터가 없습니다</p>");
                                return;
                            }

                            const months = res.monthlyList.map(item => item.MONTH);
                            const totals = res.monthlyList.map(item => item.TOTALSALES);

                            console.log("🗓️ months", months);
                            console.log("💰 totals", totals);

                            const options = {
                                series: [{
                                    name: "월별 매출",
                                    data: totals
                                }],
                                chart: {
                                    height: 300,
                                    type: 'line',
                                    zoom: { enabled: false }
                                },
                                xaxis: { categories: months },
                                dataLabels: {
                                    enabled: true,
                                    formatter: function (val) {
                                        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                                    }
                                },
                                tooltip: {
                                    y: {
                                        formatter: function (val) {
                                            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                                        }
                                    }
                                },
                                title: { text: '월별 매출 그래프', align: 'left' }
                            };

                            const chart3 = new ApexCharts(document.querySelector("#chart3"), options);
                            chart3.render();
                        },
                        error: () => {
                            console.error("❌ 월 매출 데이터 불러오기 실패");
                        }
                    });
                },
                goToDetail(type) {
                    if (type === 'sales') {
                        window.location.href = '/admin/pay.do';
                    }
                    if (type === 'theme') {
                        window.location.href = '/admin/review.do';
                    }
                    if (type === 'monthly') {
                        window.location.href = '/admin/pay.do'; // 👉 원하는 경로로 수정 가능
                    }
                    if (type === 'tours') {
                        window.location.href = '/admin/order.do'; // 👉 원하는 경로로 수정 가능
                    }
                    if (type === 'request') {
                        window.location.href = '/request/list.do';
                    }

                },
                numberWithCommas: function (x) {
                    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                },
                loadLatestReviews() {
                    $.ajax({
                        url: "/admin/review/latest.dox",
                        type: "POST",
                        dataType: "json",
                        success: (res) => {
                            console.log(res);
                            this.reviewList = res.reviews; // ✅ 바인딩만 하면 끝
                        },
                        error: () => {
                            console.error("리뷰 로딩 실패");
                        }
                    });
                },
                loadLatestSales() {
                    $.ajax({
                        url: "/admin/sales/latest.dox", // ✅ 컨트롤러에서 JSON 리턴하는 경로
                        type: "POST",
                        data: {
                            offset: 0,
                            limit: 5
                        },
                        dataType: "json",
                        success: (res) => {
                            console.log("📦 최근 판매 상품:", res);
                            this.salesList = res.salesList;
                        },
                        error: () => {
                            console.error("❌ 최근 판매 상품 로딩 실패");
                        }
                    });
                },
                loadRequestSummary() {
                    $.ajax({
                        url: "/admin/request/latest.dox",
                        type: "POST",
                        dataType: "json",
                        success: (res) => {
                            this.requestCount = Number(res.totalCount);
                            this.latestRequest = res.latest || {};
                            this.requestList = res.requestList || []; // ✅ 리스트 바인딩
                        },
                        error: () => {
                            console.error("요청 요약 실패");
                        }
                    });
                },
                getStatusLabel(status) {
                    if (status === "0") return "답변대기";
                    if (status === "1") return "답변중";
                    if (status === "2") return "답변완료";
                    return "알수없음";
                },
                getStatusColor(status) {
                    if (status === "0") return "tomato";
                    if (status === "1") return "orange";
                    if (status === "2") return "green";
                    return "#999";
                }






            },

            mounted() {
                let self = this;
				if (!self.sessionId || self.sessionRole != 'ADMIN') {
                    alert("관리자만 이용가능합니다.");
                    location.href = "/main.do";
                }
                this.fn();

            }
        });

        app.mount('#app');
    </script>