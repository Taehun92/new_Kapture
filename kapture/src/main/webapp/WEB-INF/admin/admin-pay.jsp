<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>결제 및 수익 관리</title>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
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

            .date-header {
                font-size: 24px;
                font-weight: bold;
                display: flex;
                gap: 20px;
                margin-left: 240px;
                margin-bottom: 30px;
                justify-content: center;
                /* ✅ 가운데 정렬 */
                align-items: center;
                /* 세로 중앙 정렬 (선택 사항) */
                color: #333;
            }

            .card-container {
                display: flex;
                gap: 20px;
                margin-left: 240px;
                margin-bottom: 30px;
                justify-content: center;
                /* ✅ 가운데 정렬 */
                align-items: center;
                /* 세로 중앙 정렬 (선택 사항) */
            }

            .card-icon {
                font-size: 20px;
                margin-bottom: 10px;
            }

            .card h3 {
                font-size: 18px;
                margin-bottom: 10px;
                color: #555;
            }

            .card .value {
                font-size: 24px;
                font-weight: bold;
                color: #333;
            }

            .card .subtext {
                font-size: 14px;
                color: #999;
                margin-top: 5px;
            }

            select {
                margin: 10px 5px 10px 0;
                padding: 5px;
            }

            .transaction-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            .transaction-table th,
            .transaction-table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            .transaction-table th {
                background-color: #f1f1f1;
            }

            .search-input,
            .search-select,
            .search-date {
                padding: 10px 14px;
                font-size: 16px;
                height: 40px;
                border: 1px solid #ccc;
                border-radius: 6px;
                margin-right: 10px;
                box-sizing: border-box;
            }

            .search-button {
                padding: 10px 20px;
                font-size: 16px;
                height: 40px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }

            .search-button:hover {
                background-color: #0056b3;
            }

            .search-input {
                width: 300px;
            }

            .card {
                background: #f8f9fa;
                border-radius: 12px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 30px;
            }

            .tab-btn {
                margin-right: 10px;
                padding: 8px 12px;
                border: 1px solid #ccc;
                background: #f4f4f4;
                cursor: pointer;
                border-radius: 4px;
            }

            .tab-btn.active {
                background-color: #007bff;
                color: white;
            }

            .chart-wrapper .card {
                background: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                padding: 20px;
                border-radius: 12px;
                margin-bottom: 30px;
            }

            .chart-grid {
                display: flex;
                flex-wrap: wrap;
                gap: 16px;
                padding: 30px;
                margin-left: 220px;
                box-sizing: border-box;
                align-items: start;
            }

            .chart-card {
                flex: 0 0 calc(33.333% - 12px);
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
                padding: 20px;
                margin-bottom: 20px;
                box-sizing: border-box;
                height: 400px
            }

            .chart-card>div[id^="chart1"],
            div[id^="chart2"],
            div[id^="chart3"],
            div[id^="chart4"],
            div[id^="chart5"],
            div[id^="chart6"] {
                height: 360px;
            }



            .card:hover {
                transform: translateY(-4px);
            }

            .chart-card.wide {
                flex: 0 0 100%;
            }
        </style>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div id="app">
            <!-- 제목 추가 -->
            <div class="page-title">결제 및 수익 관리</div>
            <hr class="title-hr">
            <div class="date-header" v-text="today"></div>

            <div class="card-container">
                <div class="card">
                    <div class="card-icon">💳</div>
                    <h3>총 거래 금액</h3>
                    <div class="value">{{ formatCurrency(summary.totalAmount) }}</div>
                    <div class="subtext">어제 거래 금액: {{ formatCurrency(summary.yesterdayAmount) }}</div>
                </div>
                <div class="card">
                    <div class="card-icon">👥</div>
                    <h3>총 이용 인원</h3>
                    <div class="value">{{ summary.totalUsers }}명</div>
                    <div class="subtext">총 이용 및 인원 수</div>
                </div>
                <div class="card">
                    <div class="card-icon">📋</div>
                    <h3>거래 내역</h3>
                    <div class="value">{{ summary.approved + summary.rejected }}건</div>
                    <div class="subtext">승인: {{ summary.approved }}건 / 취소: {{ summary.rejected }}건</div>
                </div>
            </div>

            <!-- <select v-model="selectedYear" @change="loadChart1">
                <option v-for="year in years" :key="year" :value="year">{{ year }}년</option>
            </select>
            <select v-show="tab === 'themeByRegion'" v-model="selectedRegion" @change="loadChart2">
                <option disabled value="">지역 선택</option>
                <option v-for="region in regionList" :key="region" :value="region">{{ region }}</option>
            </select>
            <select v-if="tab === 'day'" v-model="selectedMonth" @change="loadChart3">
                <option v-for="m in months" :value="m">{{ m }}월</option>
            </select>

            <div>
                <button class="tab-btn" :class="{ active: tab === 'month' }" @click="switchTab('month')">월별</button>
                <button class="tab-btn" :class="{ active: tab === 'themeByRegion' }"
                    @click="switchTab('themeByRegion')">지역 + 테마별 + 타이틀</button>
                <button class="tab-btn" :class="{ active: tab === 'day' }" @click="switchTab('day')">일별</button>
            </div>

            <div class="chart-wrapper">
                <div v-show="tab === 'month'" class="card">
                    <h3>월별 매출</h3>
                    <div id="chart1" style="height: 500px;"></div>
                </div>

                <div v-show="tab === 'themeByRegion'" class="card">
                    <h3>지역 + 테마별 + 타이틀</h3>
                    <select v-model="selectedRegion" @change="loadChart2">
                        <option disabled value="">지역 선택</option>
                        <option v-for="region in regionList" :key="region" :value="region">{{ region }}</option>
                    </select>
                    <div id="chart2" style="height: 500px;"></div>
                </div>

                <div v-show="tab === 'day'" class="card">
                    <h3>일별 매출</h3>
                    <select v-model="selectedMonth" @change="loadChart3">
                        <option v-for="m in months" :value="m">{{ m }}월</option>
                    </select>
                    <div id="chart3" style="height: 500px;"></div>
                </div>
            </div> -->
            <div class="chart-grid">
                <div class="chart-card">
                    <div id="chart4"></div>
                </div>
                <div class="chart-card">
                    <h3>월별 매출</h3>
                    <select v-model="selectedYear" @change="loadChart1">
                        <option v-for="year in years" :key="year" :value="year">{{ year }}년</option>
                    </select>
                    <div id="chart1"></div>
                </div>
                <div class="chart-card">
                    <h3>일별 매출</h3>
                    <select v-model="selectedMonth" @change="loadChart3">
                        <option v-for="m in months" :value="m">{{ m }}월</option>
                    </select>
                    <div id="chart3"></div>
                </div>
                <!-- <div class="chart-card">
                    <div id="chart6"></div>
                </div> -->
                <div class="chart-card">
                    <h3>인기 테마 TOP5</h3>
                    <div id="chart5"></div>
                </div>
                <div class="chart-card">
                    <h3>지역 + 테마별 + 타이틀</h3>
                    <select v-model="selectedRegion" @change="loadChart2">
                        <option disabled value="">지역 선택</option>
                        <option v-for="region in regionList" :key="region" :value="region">{{ region }}</option>
                    </select>
                    <div id="chart2"></div>
                </div>
            </div>
            <div>
                <div class="content">
                    <input type="date" v-model="startDate" class="search-date">
                    ~　
                    <input type="date" v-model="endDate" class="search-date">
                    <select v-model="statusFilter" class="search-select">
                        <option value="">전체</option>
                        <option value="결제완료">결제완료</option>
                        <option value="거래완료">거래완료</option>
                        <option value="환불요청">환불요청</option>
                        <option value="환불완료">환불완료</option>
                    </select>
                    <input type="text" v-model="keyword" class="search-input" @keyup.enter="loadFilteredData"
                        placeholder="회원명/상품 검색">
                    <button class="search-button" @click="loadFilteredData">검색</button>

                    <table class="transaction-table">
                        <thead>
                            <tr>
                                <th>결제일</th>
                                <th>회원 이름</th>
                                <th>상품 제목</th>
                                <th>결제 금액</th>
                                <th>상태</th>
                                <th>인원</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-if="transactions.length === 0">
                                <td colspan="10">검색 결과가 없습니다.</td>
                            </tr>
                            <tr v-for="item in transactions" :key="item.PAYMENT_DATE + item.USER_FIRSTNAME + item.TITLE">
                                <td>{{ item.PAYMENT_DATE }}</td>
                                <td>{{ item.USER_FIRSTNAME }}</td>
                                <td>{{ item.TITLE }}</td>
                                <td>{{ formatCurrency(item.AMOUNT) }}</td>
                                <td :style="{ color: item.PAYMENT_STATUS === 'PAID' ? 'green' : 'red' }">
                                    {{ item.PAYMENT_STATUS }}
                                </td>
                                <td>{{ item.NUM_PEOPLE }}명</td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="margin-top: 20px; text-align: center;">
                        <button class="tab-btn" @click="goPage(page - 1)" :disabled="page === 1">이전</button>
                        <button v-for="p in totalPages" :key="p" class="tab-btn" :class="{ active: p === page }"
                            @click="goPage(p)">
                            {{ p }}
                        </button>
                        <button class="tab-btn" @click="goPage(page + 1)" :disabled="page === totalPages">다음</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function numberWithCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
            const app = Vue.createApp({
                data() {
                    const now = new Date();
                    const currentMonth = String(now.getMonth() + 1).padStart(2, '0'); // '01' ~ '12'

                    return {
                        sessionId: "${sessionId}",
                        sessionRole: "${sessionRole}",
                        startDate: '',
                        endDate: '',
                        statusFilter: '',
                        keyword: '',
                        transactions: [],
                        page: 1,
                        size: 10,
                        totalCount: 0,
                        totalPages: 1,
                        today: '날짜 로딩 중...',
                        tab: 'month',
                        years: ['2023', '2024', '2025'], selectedYear: '2025',
                        selectedRegion: '서울특별시', regionList: [],
                        months: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'], selectedMonth: currentMonth,
                        chart1: null,
                        chart2: null,
                        chart3: null,
                        summary: { totalAmount: 0, yesterdayAmount: 0, totalUsers: 0, approved: 0, rejected: 0 },

                    };
                },
                methods: {
                    loadFilteredData() {
                        let self = this;
                        self.page = 1;
                        self.fnGetTransactions();
                    },
                    fn() {
                        let self = this;
                        self.loadChart1();
                        self.loadChart2();
                        self.loadChart3();
                        self.loadChart4();
                        self.loadChart5();
                        // self.loadChart6();
                    },
                    loadChart1() {
                        let self = this;
                        $.ajax({
                            url: "/admin/chart.dox",
                            type: "POST",
                            dataType: "json",
                            data: { type: "month", year: self.selectedYear },
                            success: (res) => {
                                const list = res.list || [];
                                const options = {
                                    series: [{ name: "월별 매출", data: list.map(i => Number(i.TOTAL) || 0) }],
                                    chart: { type: "line", height: '100%', zoom: { enabled: false } },
                                    colors: ["#3B82F6"],
                                    stroke: { curve: "straight", width: 3 },
                                    markers: { size: 5 },
                                    dataLabels: { enabled: false },
                                    xaxis: { categories: list.map(i => i.LABEL), labels: { rotate: -45 } },
                                    yaxis: { title: { text: "₩ (만원)" } },
                                    fill: { opacity: 1 },
                                    tooltip: { y: { formatter: val => "₩ " + val.toLocaleString() + " 만원" } },
                                    grid: { padding: { left: 10, right: 10, top: 10, bottom: 10 }, row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 } },
                                    noData: { text: "데이터가 없습니다 😥", align: "center", verticalAlign: "middle", style: { fontSize: "16px" } }
                                };
                                if (self.chart1) self.chart1.destroy();
                                self.chart1 = new ApexCharts(document.querySelector("#chart1"), options);
                                self.chart1.render();
                            },
                            error: err => console.error("chart1 로딩 실패", err)
                        });
                    },
                    loadChart2() {
                        let self = this;

                        $.ajax({
                            url: "/admin/chart.dox",
                            type: "POST",
                            dataType: "json",
                            data: { type: "themeByRegion", year: self.selectedYear, month: self.selectedMonth, region: self.selectedRegion },
                            success: (res) => {
                                const options = {
                                    series: res.series,
                                    chart: { type: "bar", height: '100%', stacked: false },
                                    plotOptions: { bar: { horizontal: false, columnWidth: "50%", borderRadius: 5 } },
                                    stroke: { show: true, width: 2, colors: ["transparent"] },
                                    dataLabels: { enabled: false },
                                    xaxis: { categories: res.categories, labels: { rotate: 0 } },
                                    yaxis: { title: { text: "₩ (만원)" } },
                                    fill: { opacity: 1 },
                                    tooltip: { y: { formatter: val => "₩ " + val.toLocaleString() + " 만원" } },
                                    grid: { padding: { left: 10, right: 10, top: 10, bottom: 10 } },
                                    noData: { text: "데이터가 없습니다 😥", align: "center", verticalAlign: "middle", style: { fontSize: "16px" } }
                                };
                                if (self.chart2) self.chart2.destroy();
                                self.chart2 = new ApexCharts(document.querySelector("#chart2"), options);
                                self.chart2.render();
                            },
                            error: err => console.error("chart2 로딩 실패", err)
                        });
                    },
                    loadChart3() {
                        let self = this;
                        $.ajax({
                            url: "/admin/chart.dox",
                            type: "POST",
                            dataType: "json",
                            data: { type: "day", year: self.selectedYear, month: self.selectedMonth },
                            success: (res) => {
                                const list = res.list || [];
                                const options = {
                                    series: [{ name: "일별 매출", data: list.map(i => Number(i.TOTAL) || 0) }],
                                    chart: { type: "line", height: '100%', zoom: { enabled: false } },
                                    colors: ["#3B82F6"],
                                    stroke: { curve: "straight", width: 3 },
                                    markers: { size: 5 },
                                    dataLabels: { enabled: false },
                                    xaxis: { categories: list.map(i => i.LABEL), labels: { rotate: -45 } },
                                    yaxis: { title: { text: "₩ (만원)" } },
                                    fill: { opacity: 1 },
                                    tooltip: { y: { formatter: val => "₩ " + val.toLocaleString() + " 만원" } },
                                    grid: { padding: { left: 10, right: 10, top: 10, bottom: 10 }, row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 } },
                                    noData: { text: "데이터가 없습니다 😥", align: "center", verticalAlign: "middle", style: { fontSize: "16px" } }
                                };
                                if (self.chart3) self.chart3.destroy();
                                self.chart3 = new ApexCharts(document.querySelector("#chart3"), options);
                                self.chart3.render();
                            },
                            error: err => console.error("chart3 로딩 실패", err)
                        });
                    },
                    loadChart4() {
                        $.ajax({
                            url: "/admin/sales/summary.dox",
                            type: "POST",
                            dataType: "json",
                            success: function (res) {
                                console.log(res);
                                const chart4Years = res.salesList.map(item => item.YEAR);
                                const totals = res.salesList.map(item => item.TOTALSALES);

                                const options = {
                                    series: [{ name: '년도별 매출', data: totals }],
                                    chart: { type: 'bar', height: '100%' },
                                    dataLabels: {
                                        enabled: true,
                                        formatter: function (val) {
                                            return numberWithCommas(val) + '원';
                                        },
                                        style: {
                                            fontWeight: 'bold',
                                            colors: ['#FFA500'] // ✅ 주황색
                                        }
                                    },
                                    xaxis: {
                                        categories: chart4Years,
                                        labels: {
                                            formatter: function (val) {
                                                return val + '년'; // ✅ '2023년' 형태로
                                            }
                                        }
                                    },
                                    yaxis: {
                                        labels: {
                                            formatter: function (val) {
                                                return numberWithCommas(val) + ' 원';
                                            }
                                        }
                                    },
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
                                const chart4 = new ApexCharts(document.querySelector("#chart4"), options);
                                chart4.render();
                            },
                            error: function () {
                                console.error("chart4 매출 데이터 불러오기 실패");
                            }
                        });
                    },
                    loadChart5() {
                        $.ajax({
                            url: "/admin/theme/summary.dox",
                            type: "POST",
                            dataType: "json",
                            success: function (res) {
                                if (!res.themeList || res.themeList.length === 0) {
                                    $("#chart5").html("<p style='text-align:center;'>데이터가 없습니다</p>");
                                    return;
                                }

                                const total = res.totalCount;
                                const top5 = res.themeList.slice(0, 5);
                                const labels = top5.map(item => item.THEME);
                                const counts = top5.map(item => item.COUNT);

                                const options = {
                                    series: counts,
                                    chart: { type: 'pie', height: '100%' },
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

                                const chart5 = new ApexCharts(document.querySelector("#chart5"), options);
                                chart5.render();
                            },
                            error: function () {
                                console.error("chart5 테마 데이터 불러오기 실패");
                            }
                        });
                    },
                    // loadChart6() {
                    //     $.ajax({
                    //         url: "/admin/sales/monthly.dox",
                    //         type: "POST",
                    //         dataType: "json",
                    //         success: (res) => {
                    //             console.log("월별 매출 차트 응답 확인 ✅", res);

                    //             if (!res.monthlyList || res.monthlyList.length === 0) {
                    //                 $("#chart6").html("<p style='text-align:center;'>데이터가 없습니다</p>");
                    //                 return;
                    //             }

                    //             const months = res.monthlyList.map(item => item.MONTH);
                    //             const totals = res.monthlyList.map(item => item.TOTALSALES);

                    //             console.log("🗓️ months", months);
                    //             console.log("💰 totals", totals);

                    //             const options = {
                    //                 series: [{
                    //                     name: "월별 매출",
                    //                     data: totals
                    //                 }],
                    //                 chart: {
                    //                     height: '100%',
                    //                     type: 'line',
                    //                     zoom: { enabled: false }
                    //                 },
                    //                 xaxis: { categories: months },
                    //                 dataLabels: {
                    //                     enabled: true,
                    //                     formatter: function (val) {
                    //                         return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                    //                     }
                    //                 },
                    //                 tooltip: {
                    //                     y: {
                    //                         formatter: function (val) {
                    //                             return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                    //                         }
                    //                     }
                    //                 },
                    //                 title: { text: '월별 매출 그래프', align: 'left' }
                    //             };

                    //             const chart6 = new ApexCharts(document.querySelector("#chart6"), options);
                    //             chart6.render();
                    //         },
                    //         error: () => {
                    //             console.error("❌ 월 매출 데이터 불러오기 실패");
                    //         }
                    //     });
                    // },
                    setToday() {
                        let self = this;
                        const now = new Date();
                        const days = ['일', '월', '화', '수', '목', '금', '토'];
                        const year = now.getFullYear(); const month = String(now.getMonth() + 1).padStart(2, '0');
                        const date = String(now.getDate()).padStart(2, '0'); const day = days[now.getDay()];
                        self.today = year + "/" + month + "/" + date + "(" + day + ")";
                    },
                    loadSummary() {
                        let self = this;
                        $.ajax({
                            url: '/admin/getSummary.dox', method: 'POST', dataType: 'json',
                            success: res => { self.summary = res.summary; },
                            error: err => console.error("요약 정보 로딩 실패", err)
                        });
                    },
                    fnGetTransactions() {
                        let self = this;
                        let nparmap = {
                            startDate: self.startDate,
                            endDate: self.endDate,
                            status: self.statusFilter,
                            keyword: self.keyword,
                            page: self.page, size: self.size
                        };
                        $.ajax({
                            url: "/admin/getTransactionList.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: data => {
                                self.transactions = data.list;
                                self.totalCount = data.totalCount;
                                self.totalPages = Math.ceil(data.totalCount / self.size);
                            },
                            error: err => console.error("거래 내역 불러오기 실패", err)
                        });
                    },
                    goPage(p) {
                        let self = this;
                        if (p < 1 || p > self.totalPages) return;
                        self.page = p;
                        self.fnGetTransactions();
                    },
                    switchTab(tabName) {
                        let self = this;
                        self.tab = tabName;
                        if (tabName === 'month') {
                            self.loadChart1();
                        } else if (tabName === 'themeByRegion') {
                            if (self.regionList.length === 0) self.loadRegionList();
                            self.loadChart2();
                        } else if (tabName === 'day') {
                            self.loadChart3();
                        }
                    },
                    formatCurrency(val) {
                        return "₩ " + Number(val).toLocaleString();
                    },
                    loadRegionList() {
                        let self = this;
                        $.ajax({
                            url: '/admin/getRegionList.dox', type: 'POST', dataType: 'json',
                            success: function (res) {
                                self.regionList = res.list;
                            },
                            error: err => console.error("❌ 지역 리스트 불러오기 실패", err)
                        });
                    }
                },
                created() { this.setToday(); },
                mounted() {
                    let self = this;
                    if (!self.sessionId || self.sessionRole != 'ADMIN') {
                        alert("관리자만 이용가능합니다.");
                        location.href = "/main.do";
                    }
                    this.loadSummary();
                    this.fn();
                    this.fnGetTransactions();
                    this.loadRegionList();
                }
            });
            app.mount('#app');
        </script>
    </body>

    </html>