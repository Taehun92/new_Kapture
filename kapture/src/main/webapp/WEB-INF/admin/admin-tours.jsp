<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.snow.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.min.js"></script>
        <title>관리자 페이지</title>
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

            select {
                margin: 10px 5px 10px 0;
                padding: 5px;
            }

            .tours-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            .tours-table th,
            .tours-table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            .tours-table th {
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

            /* 모달 관련 CSS */
            .order-modal {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999;
            }

            .modal-content {
                position: relative;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                width: 90%;
                max-width: 800px;
                /* 화면이 넓으면 최대 800px까지 */
                width: 90%;
                /* 모바일/태블릿에서도 반응형으로 보이도록 */
                max-height: 80vh;
                /* 화면 높이의 80%까지만 사용 */
                overflow-y: auto;
                /* 내용이 많으면 스크롤 */
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
                z-index: 10000;
            }

            .modal-header {
                position: relative;
                height: 60px;
                /* 높이 지정 (필수) */
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
            }

            .modal-header h2 {
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                margin: 0;
                font-weight: bold;
                font-size: 22px;
            }

            .close-btn {
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 28px;
                cursor: pointer;
            }

            .modal-body table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            .modal-body th,
            .modal-body td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .modal-body input[type="text"],
            .modal-body input[type="date"],
            .modal-body textarea,
            .modal-body select {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                width: auto;
                min-width: 150px;
                max-width: 220px;
            }

            .modal-body th {
                background-color: #f9f9f9;
            }

            /* 에디터 크기 */
            #editor {
                width: 100%;
                height: 300px;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 10px;
                overflow-y: auto;
                box-sizing: border-box;
            }

            .table-button {
                margin: 5px;
                padding: 2px 5px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }

            .table-button:hover {
                background-color: #0056b3;
            }

            /* 이미지 스타일 */
            .tour-thumbNail-wrapper {
                width: 140px;
                height: 140px;
            }

            .tour-thumbNail {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 5px;
            }

            [v-cloak] {
                display: none;
            }
        </style>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div id="app" v-cloak>
            <!-- 제목 추가 -->
            <div class="page-title">상품 관리</div>
            <hr class="title-hr">
            <div class="content">
                <input type="date" v-model="startDate" class="search-date">
                ~　
                <input type="date" v-model="endDate" class="search-date">
                <select v-model="statusFilter" class="search-select">
                    <option value="">전체</option>
                    <option value="tourNo">상품번호</option>
                    <option value="title">제목</option>
                    <option value="siName">지역명</option>
                    <option value="themeName">테마명</option>
                </select>
                <input type="text" v-model="keyword" class="search-input" @keyup.enter="loadFilteredData"
                    placeholder="상품번호 / 제목 / 지역명 / 테마명 검색">
                <button class="search-button" @click="loadFilteredData">검색</button>
                <div v-if="loaded">
                    <table class="tours-table">
                        <thead>
                            <tr>
                                <th>상품 번호</th>
                                <th>사진</th>
                                <th>상품 제목</th>
                                <th>여행 날짜</th>
                                <th>여행 기간</th>
                                <th>가격</th>
                                <th>판매 상태</th>
                                <th>지역</th>
                                <th>테마</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-if="toursList.length === 0">
                                <td colspan="10">검색 결과가 없습니다.</td>
                            </tr>
                            <tr v-for="tour in toursList">
                                <td>{{ tour.tourNo }}</td>
                                <td class="tour-thumbNail-wrapper">
                                    <template v-if="tour.thumbNail === 'Y'">
                                        <img :src="tour.filePath" class="tour-thumbNail">
                                    </template>
                                </td>
                                <td>{{ tour.title }}</td>
                                <td v-html="formatDate(tour.tourDate)"></td>
                                <td>{{ tour.duration }}</td>
                                <td>{{ formatCurrency(tour.price) }}</td>
                                <td>
                                    <span v-if="(tour.deleteYN === 'N' && new Date(tour.tourDate) < today)"
                                        style=" color: red">
                                        미판매
                                    </span>
                                    <span v-if="(tour.deleteYN === 'N' && new Date(tour.tourDate) >= today)"
                                        style=" color: green">
                                        판매중
                                    </span>
                                    <span v-if="(tour.deleteYN === 'Y' && new Date(tour.tourDate) >= today)"
                                        style=" color: blue">
                                        판매완료
                                    </span>
                                    <span v-if="(tour.deleteYN === 'Y' && new Date(tour.tourDate) < today)"
                                        style=" color: blue">
                                        거래완료
                                    </span>
                                </td>
                                <td>{{ tour.siName }}</td>
                                <td>{{ tour.themeName }}</td>
                                <td>
                                    <button class="table-button" @click="fnGetTourEdit(tour)">수정</button>
                                    <button class="table-button" @click="fnRemoveTour(tour.tourNo)">삭제</button>
                                </td>
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
                <p v-else style="text-align:center;">데이터를 불러오는 중입니다...</p>
                <!-- 주문 상세 모달 (아까 올린 이미지와 동일한 디자인) -->
                <div v-if="showEditModal" class="order-modal" @click.self="fnTourEditClose">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>상품 상세 정보</h2>
                            <span class="close-btn" @click="fnTourEditClose">&times;</span>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <th class="w-24">제목 :</th>
                                    <td colspan="3">
                                        <input v-model="editTour.title" type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>소요시간 :</th>
                                    <td>
                                        <select v-model="editTour.duration">
                                            <option value="">:: 선택 ::</option>
                                            <option value="오전">오전</option>
                                            <option value="오후">오후</option>
                                            <option value="종일">종일</option>
                                        </select>
                                    </td>
                                    <th>가격 :</th>
                                    <td>
                                        <input v-model="editTour.price" type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>날짜 :</th>
                                    <td colspan="3">
                                        <input type="date" v-model="editTour.tourDate" :min="minDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>시 :</th>
                                    <td>
                                        <select @change="fnSelectGu()" v-model="siName">
                                            <option value="">:: 선택 ::</option>
                                            <template v-for="item in siList">
                                                <option :value="item.siName">{{item.siName}}</option>
                                            </template>
                                        </select>
                                    </td>
                                    <th>구 :</th>
                                    <td>
                                        <select v-model="guName">
                                            <option value="">:: 선택 ::</option>
                                            <template v-for="item in guList">
                                                <option :value="item.guName">{{item.guName}}</option>
                                            </template>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상위테마 :</th>
                                    <td>
                                        <select @change="fnSelectTheme()" v-model="themeParent">
                                            <option value="">:: 선택 ::</option>
                                            <template v-for="item in themeParentList">
                                                <option :value="item.themeName">{{item.themeName}}</option>
                                            </template>
                                        </select>
                                    </td>
                                    <th>테마 :</th>
                                    <td>
                                        <select v-model="themeName">
                                            <option value="">:: 선택 ::</option>
                                            <template v-for="item in themeNameList">
                                                <option :value="item.themeName">{{item.themeName}}</option>
                                            </template>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="align-top">내용 :</th>
                                    <td colspan="3">
                                        <div id="editor"></div>
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: right;">
                                <button @click="fnSave" class="table-button">저장</button>
                            </div>
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
                    sessionId: "${sessionId}",
                    sessionRole: "${sessionRole}",
                    toursList: [],
                    editTour: {},
                    today: new Date(),
                    siName: "",
                    siList: [],
                    guName: "",
                    guList: [],
                    themeParent: "",
                    themeParentList: [],
                    themeList: [],
                    themeName: "",
                    themeNameList: [],
                    imgList: [],
                    thumbnail: "",
                    startDate: "",
                    endDate: "",
                    keyword: "",
                    page: 1,
                    size: 10,
                    totalCount: 0,
                    totalPages: 1,
                    statusFilter: "",
                    showEditModal: false,
                    minDate: new Date().toISOString().split("T")[0],
                    loaded: false
                };
            },
            methods: {
                loadFilteredData() {
                    this.page = 1;
                    this.fnGetToursManagement();
                },
                fnGetToursManagement() {
                    let self = this;
                    let nparmap = {
                        startDate: self.startDate,
                        endDate: self.endDate,
                        statusFilter: self.statusFilter,
                        keyword: self.keyword,
                        page: self.page,
                        size: self.size,
                    };
                    $.ajax({
                        url: "/admin/toursManagement.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            self.toursList = data.toursList;
                            self.totalCount = data.totalCount;
                            self.totalPages = Math.ceil(self.totalCount / self.size);
                            self.toursList = data.toursList;
                            self.totalCount = data.totalCount;
                            self.totalPages = Math.ceil(self.totalCount / self.size);
                            self.loaded = true;
                        }
                    });
                },
                goPage(p) {
                    if (p < 1 || p > this.totalPages) return;
                    this.page = p;
                    this.fnGetToursManagement();
                },
                formatCurrency(val) { return "₩ " + Number(val).toLocaleString(); },
                formatDate(dateStr) {
                    // dateStr 예: "Apr 2, 2025, 12:00:00 AM"
                    let d = new Date(dateStr);
                    if (isNaN(d)) return dateStr; // 유효하지 않은 날짜인 경우 원본 반환

                    let year = d.getFullYear();
                    let month = ('0' + (d.getMonth() + 1)).slice(-2);
                    let day = ('0' + d.getDate()).slice(-2);


                    return year + "-" + month + "-" + day;
                },
                fnGetTourEdit(tour) {
                    let self = this;
                    self.editTour = tour;
                    self.showEditModal = true;
                    self.$nextTick(() => {
                        self.fnQuill(); // 모달 DOM이 렌더링 된 후 에디터를 초기화
                    });
                    if (self.editTour.tourDate.includes(" ")) {
                        self.editTour.tourDate = self.editTour.tourDate.split(" ")[0];
                    }
                    self.fnGetSi();
                    self.fnGetThemeParent();
                    self.fnGetThemeName();
                },
                fnTourEditClose() {
                    let self = this;
                    self.showEditModal = false;
                    self.editTour = {};
                    // self.tempTour = {};
                },
                fnSave() {
                    let self = this;
                    // self.editTour = self.tempTour;
                    let nparmap = {
                        title: self.editTour.title,
                        description: self.editTour.description,
                        duration: self.editTour.duration,
                        price: self.editTour.price,
                        tourDate: self.editTour.tourDate,
                        siName: self.siName,
                        guName: self.guName,
                        // sessionId: self.sessionId,
                        themeName: self.themeName,
                        tourNo: self.editTour.tourNo,

                        // 썸네일 이미지로 설정할 이미지 URL
                        // thumbnail: self.thumbnail
                    };

                    if (self.sessionId == "" || self.sessionId == "TOURIST") {
                        alert("로그인 후 이용 가능합니다.");
                        location.href = "/login.do";
                        return;
                    }

                    if (self.editTour.title == "") {
                        alert("제목을 입력하세요.");
                        return;
                    }

                    if (self.editTour.duration == "") {
                        alert("소요시간을 선택하세요.");
                        return;
                    }

                    if (self.editTour.price == "") {
                        alert("가격을 입력하세요.");
                        return;
                    }

                    if (isNaN(self.editTour.price)) {
                        alert("가격은 숫자만 입력 가능합니다.");
                        return;
                    }

                    if (self.editTour.price < 0) {
                        alert("가격은 0보다 커야합니다.");
                        return;
                    }

                    if (self.editTour.tourDate == "") {
                        alert("날짜를 입력하세요.");
                        return;
                    }

                    if (self.siName == "") {
                        alert("시를 선택하세요.");
                        return;
                    }

                    if (self.guName == "") {
                        alert("구를 선택하세요.");
                        return;
                    }

                    if (self.themeParent == "") {
                        alert("상위테마를 선택하세요.");
                        return;
                    }

                    if (self.themeName == "") {
                        alert("테마를 선택하세요.");
                        return;
                    }

                    if (self.editTour.description == "") {
                        alert("내용을 입력하세요.");
                        return;
                    }

                    $.ajax({
                        url: "/admin/tourUpdate.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            if (data.result == 'success') {
                                console.log('data : ', data);
                                self.showEditModal = false;
                                self.editTour = {};
                                alert("수정되었습니다.");

                                if (self.imgList.length > 0) {
                                    self.fnUpdateImgList(self.editTour.tourNo);
                                } else {
                                    // 이미지 추가 없을 경우
                                    if (self.thumbnail != "") {
                                        // 본문에 이미지 존재 
                                        console.log('본문에 이미지 존재');
                                        self.fnSetThumbnail();
                                    } else {
                                        // 썸네일 초기화
                                        console.log('본문에 이미지 없음');
                                        self.fnResetThumbnail();
                                    }
                                }
                            }
                        }
                    });
                },

                fnSelectSi() {
                    let self = this;
                    let nparmap = {
                        // siList:self.siList,
                        // selectsi:self.selectsi
                    };
                    $.ajax({
                        url: "/common/getSiList.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.siList = data.siList;
                        }
                    });
                },

                fnSelectGu() {
                    let self = this;
                    // if(){}
                    let nparmap = {
                        siName: self.siName
                    };
                    $.ajax({
                        url: "/common/getGuList.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.guList = data.guList;
                        }
                    });
                },

                fnGetThemeParentList() {
                    let self = this;
                    let nparmap = {
                    };
                    $.ajax({
                        url: "/common/getThemeParentList.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.themeParentList = data.themeParentList;
                        }
                    });
                },

                fnSelectTheme() {
                    let self = this;
                    let nparmap = {
                        themeParent: self.themeParent
                    };
                    $.ajax({
                        url: "/common/getThemeList.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.themeNameList = data.themeNameList;
                            self.fnGetThemeName();
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
                    console.log('imgList : ', self.imgList);
                    $.ajax({
                        url: "/mypage/updateImg.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            if (data.result == 'success') {
                                alert("이미지 추가되었습니다.");
                                location.href = "/tours/tour-info.do?tourNo=" + self.tourNo;
                            }
                        }
                    })
                },

                fnGetSi() {
                    let self = this;
                    let nparmap = {
                        siNo: self.editTour.siNo
                    };
                    $.ajax({
                        url: "/common/getSi.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            self.siName = data.si.siName;
                            self.fnSelectGu();
                            self.fnGetGu();
                            console.log('siName : ', self.siName);
                        }
                    });


                },

                fnGetGu() {
                    let self = this;
                    let nparmap = {
                        guNo: self.editTour.guNo,
                        siNo: self.editTour.siNo
                    };
                    $.ajax({
                        url: "/common/getGu.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            self.guName = data.gu.guName;
                            console.log('guName : ', self.guName);
                        }
                    });
                },

                fnGetThemeParent() {
                    let self = this;
                    let nparmap = {
                        themeParentNo: self.editTour.themeParentNo
                    };
                    $.ajax({
                        url: "/common/getThemeParent.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log('ThemeParentName : ', data);
                            self.themeParent = data.themeParent.themeName;
                            self.fnSelectTheme();
                        }
                    });
                },

                fnGetThemeName() {
                    let self = this;
                    let nparmap = {
                        themeNo: self.editTour.themeNo
                    };
                    $.ajax({
                        url: "/common/getTheme.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log('ThemeName : ', data);
                            self.themeName = data.themeName.themeName;
                        }
                    });

                },
                fnQuill() {
                    let self = this;
                    let quill = new Quill('#editor', {
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
                                                    let range = quill.getSelection();
                                                    quill.insertEmbed(range.index, 'image', result.imageUrl);

                                                    let thumbnailFlag = self.imgList.length === 0 ? "Y" : "N";

                                                    self.imgList.push({
                                                        url: result.imageUrl,
                                                        thumbnail: thumbnailFlag
                                                    });


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

                    quill.root.innerHTML = self.editTour.description;

                    quill.on('text-change', function () {
                        self.editTour.description = quill.root.innerHTML;

                        // 본문에 있는 이미지 URL을 추출하여 썸네일 설정
                        if (self.getImageUrlsFromHtml(self.editTour.description).length > 0) {
                            self.thumbnail = self.getImageUrlsFromHtml(self.editTour.description)[0];
                        } else {
                            self.thumbnail = ""; // 이미지가 없을 경우 썸네일 초기화
                        }
                        console.log('썸네일 : ', self.thumbnail);
                    });
                },

                // 본문에 있는 이미지 URL을 추출하는 함수
                getImageUrlsFromHtml(html) {
                    let div = document.createElement("div");
                    div.innerHTML = html;
                    let imgs = div.querySelectorAll("img");
                    return Array.from(imgs).map(img => img.getAttribute("src"));
                },

                // 썸네일 초기화
                fnResetThumbnail() {
                    let self = this;
                    let nparmap = {
                        tourNo: self.editTour.tourNo
                    }
                    $.ajax({
                        url: "/mypage/resetThumbnail.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            // location.href = "/tours/tour-info.do?tourNo=" + self.tourNo;
                        }
                    });
                },

                // 썸네일 설정
                fnSetThumbnail() {
                    let self = this;
                    let nparmap = {
                        tourNo: self.editTour.tourNo,
                        thumbnail: self.thumbnail
                    }
                    $.ajax({
                        url: "/mypage/setThumbnail.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            // location.href = "/tours/tour-info.do?tourNo=" + self.tourNo;
                        }
                    });
                },
                fnRemoveTour(tourNo) {
                    let self = this;
                    if (!confirm("정말 삭제하시겠습니까?")) {
                        return;
                    }
                    let nparmap = {
                        tourNo: tourNo,
                    }
                    $.ajax({
                        url: "/admin/removeTour.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            if (data.result === "success") {
                                alert("삭제되었습니다.");
                                location.reload();
                            } else {
                                alert("삭제에 실패했습니다.")
                            }
                        }, error: function (err) {
                            console.error(err);
                            alert("삭제 중 오류가 발생했습니다.");
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
                self.fnSelectSi();
                self.fnGetThemeParentList();
                self.fnGetToursManagement();
            }
        });
        app.mount('#app');
    </script>