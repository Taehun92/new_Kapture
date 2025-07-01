<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>검색 결과 | kapture</title>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f9f9fb;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1000px;
                margin: 40px auto;
                padding: 20px;
            }

            h2 {
                margin-top: 40px;
                font-size: 22px;
                font-weight: bold;
            }

            .item {
                background: white;
                padding: 18px 24px;
                margin-bottom: 12px;
                border-radius: 10px;
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
                cursor: pointer;
            }

            .answer {
                padding-top: 10px;
                color: #444;
            }

            .no-result {
                margin-top: 40px;
                font-size: 18px;
                color: #999;
            }
        </style>
    </head>

    <body>
        <jsp:include page="../common/header.jsp" />
        <div id="app" class="container">
            <h1>'{{ searchKeyword }}' 검색 결과</h1>

            <div v-if="faqList.length > 0">
                <h2>📌 FAQ</h2>
                <div class="item" v-for="item in faqList" :key="item.faq_no" @click="item.open = !item.open">
                    <div>{{item.CATEGORY}}</div>
                    <div>{{ item.QUESTION }}</div>
                    <div class="answer" v-if="item.open">{{ item.ANSWER }}</div>
                </div>
            </div>

            <div v-if="qnaList.length > 0">
                <h2>📌 NOTICES</h2>
                <div class="item" v-for="item in qnaList" :key="item.qna_no" @click="item.open = !item.open">
                    <div>{{ item.TITLE }}</div>
                    <div class="answer" v-if="item.open">{{ item.CONTENT }}</div>
                </div>
            </div>

            <div v-if="faqList.length === 0 && qnaList.length === 0 && loaded" class="no-result">
                '{{ searchKeyword }}'에 대한 검색 결과가 없습니다.
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>

    <script>
        const app = Vue.createApp({
            data() {
                return {
                    searchKeyword: "",
                    faqList: [],
                    qnaList: [],
                    loaded: false
                };
            },
            methods: {
                fetchSearchResults() {
                    let self = this;
                    $.ajax({
                        url: "/cs/search.dox",
                        type: "POST",
                        dataType: "json",
                        data: { keyword: self.searchKeyword || "" }, // ✅ keyword가 없을 경우 대비
                        success(data) {
                            self.faqList = data.faqList.map(item => ({ ...item, open: false }));
                            self.qnaList = data.qnaList.map(item => ({ ...item, open: false }));
                            self.loaded = true;
                            console.log(self.faqList);
                            console.log(self.qnaList);
                            
                        },
                        error() {
                            alert("검색 중 오류가 발생했습니다.");
                            self.loaded = true;
                        }
                    });
                }
            },
            mounted() {
                console.log("✅ mounted 실행됨");  // 이게 안 찍히면 Vue mount 문제

                const params = new URLSearchParams(location.search);
                const rawKeyword = params.get("searchKeyword");
                console.log("🔍 URLSearchParams 결과:", rawKeyword);

                this.searchKeyword = rawKeyword ? decodeURIComponent(rawKeyword) : "";
                console.log("📌 검색어(searchKeyword):", this.searchKeyword);

                if (this.searchKeyword.trim() !== "") {
                    this.fetchSearchResults();
                } else {
                    this.loaded = true;
                }
            }
        });
        app.mount("#app");
    </script>

    </html>