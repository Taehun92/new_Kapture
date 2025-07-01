<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/@vuepic/vue-datepicker/dist/main.css">
        <script src="https://unpkg.com/@vuepic/vue-datepicker@latest"></script>
        <title>관광지 목록</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .container {
                width: 80%;
                margin: auto;
            }

            /* 주요 관광지 + 지역 선택 버튼 그룹 */
            .tour-header-group {
                background-color: #f0f0f0;
                padding: 20px;
                text-align: center;
                margin-bottom: 10px;
            }

            .tour-header {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .tour-buttons {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .tour-buttons button {
                padding: 10px 15px;
                border: 1px solid #ccc;
                background-color: #f8f8f8;
                cursor: pointer;
            }

            /* 경로 표시 */
            .breadcrumb {
                margin: 10px 0;
                font-size: 14px;
            }

            hr {
                border: 1px solid #ccc;
            }

            /* 사이드바 및 고정 기능 */
            .content {
                display: flex;
                gap: 10px;
            }

            .sidebar {
                width: 160px;
                min-width: 160px;
                /* 최소 너비 유지 */
                height: 600px;
                padding: 10px;
                border: 1px solid #ddd;
                position: sticky;
                top: 0;
                background: white;
                transition: top 0.3s;
                overflow-y: overlay;

            }

            .filter {
                width: 160px;
                margin-bottom: 10px;
                border-bottom: 1px solid #ddd;
                padding-bottom: 5px;
            }

            .filter-content {

                padding: 5px 10px;
            }

            .filter button {
                width: 100%;
                background: none;
                border: none;
                font-size: 16px;
                text-align: left;
                cursor: pointer;

                transition: background-color 0.2s;
            }

            .filter button:hover {
                background-color: #e0e0e0;
                /* 밝은 회색으로 변경 */
            }

            /* 체크박스 라벨 스타일 */
            .filter-content label {
                display: block;

                transition: background-color 0.2s;
                cursor: pointer;
            }

            .filter-content label:hover {
                background-color: #f5f5f5;
                /* 밝은 회색 */
            }

            /* 상품 카드 (폴라로이드 스타일) */
            .tour-list {
                flex-grow: 1;
                display: flex;
                flex-wrap: wrap;
                gap: 15px;
            }

            .tour-card {
                width: 200px;
                height: 257px;
                background: white;
                border: 2px solid black;
                padding: 10px;
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .tour-card img {
                width: 180px;
                height: 150px;
                object-fit: cover;
            }

            .tour-card .desc {
                width: 100%;
                background: white;
                padding: 10px;
            }
        </style>
    </head>

    <body>

        <jsp:include page="../common/header.jsp" />
        <div id="app" class="container">
            <!-- 주요 관광지 그룹 -->

            <div class="tour-header-group">

            </div>

            <!-- 현재 경로 -->
            <div class="breadcrumb">홈 > 상품</div>
            <hr>

            <!-- 콘텐츠 영역 -->
            <div class="content">
                <!-- 사이드바 -->
                <div class="sidebar">
                    <div class="filter">
                        <button @click="toggleFilter('date')">여행기간 {{ filters.date ? '∧' : '∨' }}</button>
                        <div class="filter-content" v-if="filters.date">

                            <div>날짜 선택: {{ dates }}</div>
                            <vue-date-picker v-model="dates" multi-calendars model-auto range :min-date="new Date()"
                                @input="params.startDate = _formatedDatepicker($event)" :teleport="true" />
                        </div>

                    </div>
                    <div class="filter">
                        <button @click="toggleFilter('language')">가이드 언어 {{ filters.date ? '∧' : '∨' }}</button>
                        <div class="filter-content" v-if="filters.language">
                            <template v-for="language in languages">
                                <label>
                                    <input @change="fnToursList" type="checkbox" v-model="selectedLanguages"
                                        :value="language.eng">
                                    {{language.kor}}
                                </label><br>
                            </template>
                        </div>
                    </div>
                    <div class="filter">
                        <button @click="toggleFilter('region')">지역별 {{ filters.date ? '∧' : '∨' }}</button>
                        <div class="filter-content" v-if="filters.region">
                            <template v-for="item in regionList">
                                <label><input @change="fnToursList" type="checkbox" v-model="selectedRegions"
                                        :value="item.siNo">
                                    {{item.siName}}
                                </label><br>
                            </template>
                        </div>
                    </div>
                    <div class="filter">
                        <button @click="toggleFilter('theme')">테마별 {{ filters.date ? '∧' : '∨' }}</button>
                        <div class="filter-content" v-if="filters.theme">
                            <template v-for="theme in themeList">
                                <label><input @change="fnToursList" type="checkbox" v-model="selectedThemes"
                                        :value="theme.themeNo">
                                    {{theme.themeName}}
                                </label><br>
                            </template>
                        </div>
                    </div>
                </div>

                <!-- 관광지 리스트 -->
                <div class="tour-list">
                    <div v-for="tour in toursList" class="tour-card" @click="goToTourInfo(tour.tourNo)">
                        <img :src="tour.filePath" alt="Tour Image">
                        <div class="desc">
                            <p>{{ tour.title }}</p>
                            <p>{{ tour.price }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

    </html>
    <script>

        const app = Vue.createApp({
            data() {
                return {
                    dates: null,
                    languages: [{ eng: "Korean", kor: "한국어" }, { eng: "English", kor: "영어" }, { eng: "Chinese", kor: "중국어" }, { eng: "Japanese", kor: "일본어" }],
                    filters: {
                        date: false,
                        language: false,
                        region: false,
                        theme: false
                    },
                    toursList: [],
                    regionList: [],
                    themeList: [],
                    selectedDates: [],
                    selectedRegions: [],
                    selectedLanguages: [],
                    selectedThemes: [],
                    siNo: "",
                    initFlg: false,


                };
            },
            components: {
                VueDatePicker
            },
            methods: {
                toggleFilter(type) {
                    let self = this;
                    self.filters[type] = !self.filters[type];

                },
                fnToursList() {
                    let self = this;

                    let nparmap = {};
                    if (!self.initFlg) {
                        console.log("siNo" + self.siNo);
                        nparmap = { siNo: self.siNo }
                        self.initFlg = true;
                    } else {
                        nparmap = {
                            selectedDates: JSON.stringify(self.selectedDates),
                            selectedRegions: JSON.stringify(self.selectedRegions),
                            selectedLanguages: JSON.stringify(self.selectedLanguages),
                            selectedThemes: JSON.stringify(self.selectedThemes),
                        };
                    }

                    $.ajax({
                        url: "/tours/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log("DATA", data);
                            self.toursList = data.toursList;
                            self.regionList = data.regionList;
                            self.themeList = data.themeList;
                        }
                    });
                },
                goToTourInfo(tourNo) {
                    location.href="/tours/tour-info.do?tourNo=" + tourNo;
                },

            },
            mounted() {
                let self = this;
                const params = new URLSearchParams(window.location.search);
                self.siNo = params.get("siNo") || "";
                self.fnToursList();
            }
        });

        app.mount('#app');
    </script>