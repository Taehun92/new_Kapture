<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.snow.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <title>관리자 페이지</title>
        <style>
            .page-title {
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                /* margin-top: 20px; */
                margin-left: 220px;
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
        </style>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div id="app">
            <!-- 제목 추가 -->
            <div class="page-title">운영 및 설정 관리</div>
            <hr class="title-hr">
            <div class="flex gap-8 ml-[240px] mt-8 px-6">
                <button class="font-semibold text-gray-600 hover:text-blue-700"
                    :class="{ 'text-blue-600 border-b-2 border-blue-600': selectedTermsId === 3 }" value="3"
                    @click="onClickTab($event)">
                    이용약관
                </button>

                <button class="font-semibold text-gray-600 hover:text-blue-700"
                    :class="{ 'text-blue-600 border-b-2 border-blue-600': selectedTermsId === 2 }" value="2"
                    @click="onClickTab($event)">
                    개인정보 처리방침
                </button>

                <button class="font-semibold text-gray-600 hover:text-blue-700"
                    :class="{ 'text-blue-600 border-b-2 border-blue-600': selectedTermsId === 1 }" value="1"
                    @click="onClickTab($event)">
                    마케팅 수신 동의
                </button>
            </div>

            <!-- 에디터 카드 영역 (탭과 수평 정렬되도록 ml-[240px] 동일 적용) -->
            <div class="ml-[240px] mt-6 px-6 max-w-[1200px]">
                <div class="bg-white p-6 rounded shadow border">
                    <h2 class="text-xl font-semibold mb-4">약관 내용 관리</h2>
                    <!-- 에디터 영역 -->

                    <!-- Quill Editor -->
                    <div id="editor" class="h-[400px] border rounded mb-4"></div>
                    <!-- 저장 버튼 -->
                    <div class="flex justify-end">
                        <button class="bg-blue-700 text-white px-5 py-2 rounded hover:bg-blue-600" @click="fnSaveTerms">
                            저장
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const app = Vue.createApp({
                data() {
                    return {
                        sessionId : "${sessionId}",
                        sessionRole : "${sessionRole}",
                        selectedTermsId: null,
                        quill: null,
                        termsList: []
                    };
                },
                methods: {
                    onClickTab(event) {
                        this.fnGetTermsList(parseInt(event.target.value));
                    },

                    fnGetTermsList(termsId) {
                        let self = this;
                        $.ajax({
                            url: "/terms/getTerms.dox",
                            type: "POST",
                            data: { termsId: termsId },
                            dataType: "json",
                            success: function (data) {
                                console.log(data);
                                self.selectedTermsId = termsId;
                                self.quill.root.innerHTML = data.terms.content;
                                // self.termsList = data.list;
                            }
                        });
                    },

                    fnSaveTerms() {
                        let self = this;
                        const html = self.quill.root.innerHTML;

                        $.ajax({
                            url: "/terms/saveTerms.dox",
                            type: "POST",
                            data: {
                                termsId: self.selectedTermsId,
                                content: html
                            },
                            success: function (res) {
                                if (res.num > 0) {
                                    alert("저장되었습니다.");
                                }
                                else {
                                    console.log("수정 error");
                                }
                            }
                        });
                    }
                },
                mounted() {
                    this.quill = new Quill('#editor', {
                        theme: 'snow'
                    });
                    let self = this;
                    if (!self.sessionId || self.sessionRole != 'ADMIN') {
                        alert("관리자만 이용가능합니다.");
                        location.href = "/main.do";
                    }
                    this.fnGetTermsList(3);
                }
            });
            app.mount('#app');
        </script>
    </body>

    </html>