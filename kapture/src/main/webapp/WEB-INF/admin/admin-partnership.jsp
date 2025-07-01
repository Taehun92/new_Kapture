<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">

        <title>관리자 페이지</title>
        <style>
            /* 테이블 스타일 */
            .content table {
                width: 100%;
                margin: 20px 0;
                border-collapse: collapse;
                font-size: 14px;
            }

            .content th,
            .content td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: center;
                vertical-align: middle;
            }

            .content th {
                background-color: #f4f4f4;
            }

            /* 버튼 */
            .btn-manage {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 5px 8px;
                margin: 5px;
                border-radius: 3px;
                cursor: pointer;
            }

            .btn-manage:hover {
                background-color: #0056b3;
            }

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

            /* 모달 오버레이 (뒷배경) */
            .modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.4);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 9999;
            }

            /* 모달 내용 컨테이너 */
            .modal-content {
                background-color: #fff;
                width: 600px;
                /* 모달 폭 */
                padding: 20px;
                border-radius: 5px;
                max-height: 90vh;
                overflow-y: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
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

            .css-select {
                padding: 5px 5px;
                height: 30px;
                border: 1px solid #ccc;
                border-radius: 6px;
                box-sizing: border-box;
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

            .status-wait,
            .status-done,
            .status-reject {
                display: inline-block;
                /* 텍스트 크기만큼만 너비 차지 */
                background-color: #ffd400;
                /* 기본은 승인대기용 */
                color: white;
                font-weight: bold;
                padding: 4px 8px;
                /* 살짝만 여백 */
                border-radius: 6px;
                font-size: 14px;
            }

            /* 각각 다른 상태별로 배경색 */
            .status-done {
                background-color: #007bff;
                /* 승인완료용 파란색 */
            }

            .status-reject {
                background-color: #dc3545;
                /* 승인거부용 빨간색 */
            }

            [v-cloak] {
                display: none;
            }
        </style>
        </style>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div id="app" v-cloak>
            <!-- 제목 추가 -->
            <div class="page-title">제휴문의 관리</div>
            <hr>
            <div class="content">
                <!-- 제휴문의 -->
                <div v-if="loaded">
                    <table>
                        <thead>
                            <tr>
                                <th>제휴번호</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>이메일</th>
                                <th>제목</th>
                                <th>내용</th>
                                <th>제휴상태</th>
                                <th>신청일</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-if="waitingList.length === 0">
                                <td colspan="10">데이터가 없습니다.</td>
                            </tr>
                            <!-- 제휴문의 리스트 반복 출력 -->
                            <template v-for="partnership in waitingList">
                                <tr v-if="partnership.psStatus != '승인완료'">
                                    <!-- 제휴번호 -->
                                    <td>{{ partnership.partnershipNo }}</td>
                                    <!-- 이름 -->
                                    <td>{{ partnership.name }}</td>
                                    <!-- 연락처-->
                                    <td>{{ partnership.phone }}</td>
                                    <!-- 이메일-->
                                    <td>{{ partnership.email }}</td>
                                    <!-- 제목 -->
                                    <td>{{ partnership.title }}</td>
                                    <!-- 내용 -->
                                    <td>{{ partnership.content }}</td>
                                    <!-- 제휴상태 -->
                                    <td>
                                        <span :class="{
                                          'status-wait': partnership.psStatus === '승인대기',
                                          'status-done': partnership.psStatus === '승인완료',
                                          'status-reject': partnership.psStatus === '승인거부'
                                        }">
                                            {{partnership.psStatus}}
                                        </span>
                                    </td>
                                    <!-- 신청일-->
                                    <td>{{ partnership.psCreatedAt.substring(0, 10) }}</td>
                                    <td>
                                        <select class="css-select" v-model="partnership.psStatus"
                                            @change="fnStatusEdit(partnership)">
                                            <option value="승인대기">승인대기</option>
                                            <option value="승인완료">승인완료</option>
                                            <option value="승인거부">승인거부</option>
                                        </select>
                                    </td>
                                </tr>
                            </template>
                        </tbody>
                    </table>
                    <div style="margin-top: 20px; text-align: center;">
                        <button class="tab-btn" @click="waitingPage--; fnGetPartnershipList"
                            :disabled="waitingPage === 1">이전</button>
                        <button v-for="p in waitingPages" :key="p" class="tab-btn"
                            :class="{ active: p === waitingPage }" @click="waitingPage=p; fnGetPartnershipList">
                            {{ p }}
                        </button>
                        <button class="tab-btn" @click="waitingPage++; fnGetPartnershipList"
                            :disabled="waitingPage === waitingPages">다음</button>
                    </div>
                </div>
                <p v-else style="text-align:center;">데이터를 불러오는 중입니다...</p>
                <hr class="title-hr">
                <!-- 제휴 중 -->
                <div v-if="loaded">
                    <table>
                        <thead>
                            <tr>
                                <th>제휴번호</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>이메일</th>
                                <th>제목</th>
                                <th>내용</th>
                                <th>신청일</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-if="approvedList.length === 0">
                                <td colspan="10">데이터가 없습니다.</td>
                            </tr>
                            <!-- 제휴문의 리스트 반복 출력 -->
                            <template v-for="partnership in approvedList">
                                <tr v-if="partnership.psStatus === '승인완료'">
                                    <!-- 제휴번호 -->
                                    <td>{{ partnership.partnershipNo }}</td>
                                    <!-- 이름 -->
                                    <td>{{ partnership.name }}</td>
                                    <!-- 연락처-->
                                    <td>{{ partnership.phone }}</td>
                                    <!-- 이메일-->
                                    <td>{{ partnership.email }}</td>
                                    <!-- 제목 -->
                                    <td>{{ partnership.title }}</td>
                                    <!-- 내용 -->
                                    <td>{{ partnership.content }}</td>
                                    <!-- 신청일-->
                                    <td>{{ partnership.psCreatedAt.substring(0, 10) }}</td>
                                    <td>
                                        <button class="btn-manage" @click="fnPartnershipInfo(partnership)">
                                            보기
                                        </button>
                                    </td>
                                </tr>
                            </template>
                        </tbody>
                    </table>
                    <div style="margin-top: 20px; text-align: center;">
                        <button class="tab-btn" @click="approvedPage--; fnGetPartnershipList"
                            :disabled="approvedPage === 1">이전</button>
                        <button v-for="p in approvedPages" :key="p" class="tab-btn"
                            :class="{ active: p === approvedPage }" @click="approvedPage=p; fnGetPartnershipList">
                            {{ p }}
                        </button>
                        <button class="tab-btn" @click="approvedPage++; fnGetPartnershipList"
                            :disabled="approvedPage === approvedPages">다음</button>
                    </div>
                </div>
                <p v-else style="text-align:center;">데이터를 불러오는 중입니다...</p>
            </div>
            <div v-if="showPartnershipModal" class="modal-overlay" @click.self="fnClosePartnershipModal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>제휴 문의</h2>
                        <span class="close-btn" @click="fnClosePartnershipModal">&times;</span>
                    </div>
                    <!-- 테이블 시작 -->
                    <table style="width: 100%; border-collapse: collapse; margin-top: 10px;">
                        <tbody>
                            <!-- 상태 -->
                            <tr>
                                <td style="width: 120px; background-color: #f4f4f4; text-align: center; 
										   border: 1px solid #ccc; padding: 10px;">
                                    제휴번호
                                </td>
                                <td style="border: 1px solid #ccc; padding: 10px;">
                                    <input type="text" v-model="partnershipInfo.partnershipNo" readonly
                                        style="width: 97%; padding: 5px;" />
                                </td>
                                <td style="width: 120px; background-color: #f4f4f4; text-align: center; 
										   border: 1px solid #ccc; padding: 10px;">
                                    제휴상태
                                </td>
                                <td style="border: 1px solid #ccc; padding: 10px;">
                                    <select class="css-select" v-model="editPsStatus">
                                        <option value="승인대기">승인대기</option>
                                        <option value="승인완료">승인완료</option>
                                        <option value="승인거부">승인거부</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- 이름, 연락처 -->
                            <tr>
                                <td style="width: 120px; background-color: #f4f4f4; text-align: center; 
										   border: 1px solid #ccc; padding: 10px;">
                                    이름
                                </td>
                                <td style="border: 1px solid #ccc; padding: 10px;">
                                    <input type="text" v-model="partnershipInfo.name" readonly
                                        style="width: 97%; padding: 5px;" />
                                </td>
                                <td style="background-color: #f4f4f4; text-align: center; 
										   border: 1px solid #ccc; padding: 10px;">
                                    연락처
                                </td>
                                <td style="border: 1px solid #ccc; padding: 10px;">
                                    <input type="text" v-model="partnershipInfo.phone" readonly
                                        style="width: 97%; padding: 5px;" />
                                </td>
                            </tr>
                            <!-- 이메일 -->
                            <tr>
                                <td style="background-color: #f4f4f4; text-align: center; 
										   border: 1px solid #ccc; padding: 10px;">
                                    이메일
                                </td>
                                <td colspan="3" style="border: 1px solid #ccc; padding: 10px;">
                                    <input type="text" v-model="partnershipInfo.email" readonly
                                        style="width: 97%; padding: 5px;" />
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #f4f4f4; text-align: center; 
										   border: 1px solid #ccc; padding: 10px;">
                                    제목
                                </td>
                                <td colspan="3" style="border: 1px solid #ccc; padding: 10px;">
                                    <input type="text" v-model="partnershipInfo.title" readonly
                                        style="width: 97%; padding: 5px;" />
                                </td>
                            </tr>
                            <!-- 문의내용 -->
                            <tr>
                                <td style="background-color: #f4f4f4; text-align: center; 
										   border: 1px solid #ccc; padding: 10px;">
                                    문의내용
                                </td>
                                <td colspan="3" style="border: 1px solid #ccc; padding: 10px;">
                                    <textarea v-model="partnershipInfo.content" readonly
                                        style="width: 97%; height: 100px; padding: 5px; resize: none;"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="margin-top: 20px;">
                        <button class="btn-manage" @click="fnStatusEdit()">저장</button>
                    </div>
                </div>
            </div>
            <!-- [모달 끝] -->
        </div>
    </body>

    </html>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    waitingList: [],
                    approvedList: [],
                    sessionId: "${sessionId}",
                    sessionRole: "${sessionRole}",
                    showPartnershipModal: false,// 답변 모달 표시 여부
                    partnershipInfo: {},
                    editPsStatus: null, // 현재 선택된 문의 정보
                    waitingPage: 1,
                    approvedPage: 1,
                    size: 10,
                    countWaiting: 0,
                    waitingPages: 1,
                    countApproved: 0,
                    approvedPages: 1,
                    loaded: false
                };
            },
            methods: {
                // 문의 목록 불러오기
                fnGetPartnershipList() {
                    let self = this;
                    let nparmap = {
                        waitingPage: self.waitingPage,
                        approvedPage: self.approvedPage,
                        size: self.size,
                    };
                    $.ajax({
                        url: "/admin/partnership.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log("데이터-=========== ");
                            console.log(data);
                            if (data.result === "success") {
                                // 승인대기, 승인거부 목록
                                self.waitingList = data.waitingList;
                                self.countWaiting = data.countWaiting;
                                self.waitingPages = Math.max(1, Math.ceil(self.countApproved / self.size));
                                // 승인완료 목록
                                self.approvedList = data.approvedList;
                                self.countApproved = data.countApproved;
                                self.approvedPages = Math.max(1, Math.ceil(self.countApproved / self.size));
                                self.loaded = true;
                            } else {
                                alert("데이터를 불러오는데 실패했습니다.");
                            }
                        },
                        error: function (err) {
                            console.error(err);
                        }
                    });
                },
                fnStatusEdit(partnership) {
                    let self = this;
                    let nparmap;

                    if (partnership) {
                        nparmap = {
                            partnershipNo: partnership.partnershipNo,
                            psStatus: partnership.psStatus,
                            targetUserNo: partnership.psUserNo,
                            referenceType: "PARTNERSHIP_STATUS"
                        };
                    } else {
                        // 모달에서 저장 버튼을 누를 때
                        nparmap = {
                            partnershipNo: self.partnershipInfo.partnershipNo,
                            psStatus: self.editPsStatus,
                            targetUserNo: self.partnershipInfo.psUserNo,
                            referenceType: "PARTNERSHIP_STATUS"
                        };
                    }

                    $.ajax({
                        url: "/admin/partnership-edit.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            if (data.result === "success") {
                                alert("변경되었습니다.");
                                self.fnClosePartnershipModal();
                                self.fnGetPartnershipList(); // 목록 갱신
                            } else {
                                alert("변경 실패");
                            }
                        },
                        error: function (err) {
                            console.error(err);
                            alert("변경 중 오류가 발생했습니다.");
                        }
                    });
                },
                // '답변' 버튼 클릭 시 모달 열기
                fnPartnershipInfo(partnership) {
                    this.showPartnershipModal = true;
                    this.partnershipInfo = partnership;
                    this.editPsStatus = partnership.psStatus; // 원본 답변 복사
                },

                // 모달 닫기
                fnClosePartnershipModal() {
                    this.showPartnershipModal = false;
                    this.partnershipInfo = {};
                    this.editPsStatus = "";
                },
            },
            mounted() {
                let self = this;
                if (!self.sessionId || self.sessionRole != 'ADMIN') {
                    alert("관리자만 이용가능합니다.");
                    location.href = "/main.do";
                }
                self.fnGetPartnershipList();
            }
        });
        app.mount('#app');
    </script>


    <!-- 백업 -->
    <!-- 검색기능 -->
    <!-- <div class="search-container">
                    <input type="date" v-model="startDate" class="search-date">
                    ~
                    <input type="date" v-model="endDate" class="search-date">
                    <select v-model="statusFilter" class="search-select">
                        <option value="">전체</option>
                        <option value="partnershipNo">제휴번호</option>
                        <option value="name">이름</option>
                        <option value="email">이메일</option>
                        <option value="title">제목</option>
                    </select>
                    <input type="text" v-model="keyword" class="search-input" @keyup.enter="loadFilteredData"
                        placeholder="제휴번호/이름/이메일/제목 검색">
                    <button class="search-button" @click="loadFilteredData">검색</button>
                </div> -->