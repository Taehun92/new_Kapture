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
            

            
        </div>

        <script>
            const app = Vue.createApp({
                data() {
                    return {
                        sessionId : "${sessionId}",
                        sessionRole : "${sessionRole}",
                    };
                },
                methods: {
                    
                },
                mounted() {
                    let self = this;
                    if (!self.sessionId || self.sessionRole != 'ADMIN') {
                        alert("관리자만 이용가능합니다.");
                        location.href = "/main.do";
                    }
                    
                }
            });
            app.mount('#app');
        </script>
    </body>

    </html>