<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>약관 및 정책 | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
	<!-- <link rel="stylesheet" href="../../css/kapture-style.css"> -->
</head>
<body class="bg-gray-50 text-gray-800 font-sans">
    <jsp:include page="../common/header.jsp" />

    <div id="app" class="flex max-w-6xl mx-auto mt-12 bg-white rounded-lg shadow-md overflow-hidden min-h-[90vh]">
        
        <!-- 사이드바 -->
        <div class="w-64 bg-gray-100 border-r border-gray-200 p-6">
            <h2 class="text-lg font-semibold mb-4 text-gray-700">약관 및 정책</h2>
            <ul class="space-y-2">
                <li v-for="(menu, index) in menus" :key="index"
                    :class="['px-4 py-2 rounded cursor-pointer transition-all', selectedIndex === index  ? 
                    'bg-blue-950 text-white font-medium' : 'text-gray-600 hover:bg-blue-100']"
                    @click="selectMenu(index)">
                    {{ menu.title }}
                </li>
            </ul>
        </div>

        <!-- 콘텐츠 영역 -->
        <div class="flex-1 p-8 overflow-y-auto">
            <!-- <h3 class="text-2xl font-semibold text-pink-600 mb-6">{{ menus[selectedIndex].title }}</h3> -->
            <div v-html="htmlContent" class="prose max-w-full"></div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>

<script>
const app = Vue.createApp({
    data() {
        return {
            selectedIndex: 0,
            htmlContent: '',
            menus: [
                { title: '마케팅 정보 수신 동의', id: 1 },
                { title: '개인정보 처리방침', id: 2 },
                { title: '이용약관', id: 3 }
            ]
        };
    },
    methods: {
        selectMenu(index) {
            this.selectedIndex = index;
            const termsId = this.menus[index].id;
            this.fnGetTermsList(termsId);
        },
        fnGetTermsList(termsId) {
            let self = this;
            $.ajax({
                url: "/terms/getTerms.dox",
                type: "POST",
                data: { termsId : termsId },
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.terms) {
                        self.htmlContent = data.terms.content;
                    } else {
                        self.htmlContent = '<p class="text-red-500">❌ 약관 내용을 불러올 수 없습니다.</p>';
                    }
                },
                error: function () {
                    self.htmlContent = '<p class="text-red-500">❌ 서버 통신 오류가 발생했습니다.</p>';
                }
            });
        }
    },
    mounted() {
        this.fnGetTermsList(this.menus[this.selectedIndex].id);
    },
});
app.mount('#app');
</script>