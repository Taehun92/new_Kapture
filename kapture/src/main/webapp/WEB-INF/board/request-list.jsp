<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>요청게시판 | kapture</title>
    </head>

    <body>
        <jsp:include page="../common/header.jsp" />

        <div id="app" class="w-[70%] mx-auto py-8">
            <div class="mb-6">
                <div class="flex justify-between items-end">
                    <div>
                        <h2 class="text-3xl font-bold text-gray-800 mb-1">📌 요청 게시판</h2>
                        <p class="text-lg text-gray-600">고객님이 직접 원하는 여행을 요청해보세요!</p>
                    </div>
                    <div class="flex items-center">
                        <input type="text" v-model="keyword"
                            class="px-5 py-3 text-base border border-gray-300 rounded w-72 placeholder-gray-400"
                            placeholder="제목 또는 작성자 검색" @keyup.enter="fnSearch">
                        <button @click="fnSearch"
                            class="ml-2 px-5 py-3 bg-blue-950 hover:bg-blue-700 text-white rounded">검색</button>
                    </div>
                </div>
            </div>

            <div class="min-h-[600px]">
                <table class="w-full table-auto text-base border-t border-gray-300">
                    <thead class="bg-blue-950 text-white">
                        <tr>
                            <th class="py-4 px-3">번호</th>
                            <th class="py-4 px-3">제목</th>
                            <th class="py-4 px-3">작성자</th>
                            <th class="py-4 px-3">요청상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in list" :key="item.requestNo"
                            class="text-center border-b border-gray-200 hover:bg-gray-50">
                            <td class="py-3 px-2">{{ item.requestNo }}</td>
                            <td class="py-3 px-2 text-blue-800 font-medium cursor-pointer">
                                <a href="javascript:;" @click="fnRequestView(item.requestNo)">{{ item.title }}</a>
                            </td>
                            <td class="py-3 px-2">{{ item.userFirstName }} {{ item.userLastName }}</td>
                            <td class="py-3 px-2">
                                <span :class="['px-3 py-1 rounded text-white text-sm font-semibold',
                                    item.status === '0' ? 'bg-yellow-400' :
                                    item.status === '1' ? 'bg-blue-600' :
                                    item.status === '2' ? 'bg-green-600' : 'bg-gray-400']">
                                    {{ getStatusLabel(item.status) }}
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 글쓰기 버튼 -->
            <div class="mt-1 text-right">
                <button v-if="sessionId !== '' && sessionRole === 'TOURIST'"
                    class="px-6 py-3 text-base bg-blue-950 hover:bg-blue-700 text-white rounded shadow" @click="fnAdd">
                    글쓰기
                </button>
            </div>

            <!-- 페이징 -->
            <div class="flex justify-center mt-2 space-x-2 text-base">
                <button @click="changePage(currentPage - 1)" :disabled="currentPage === 1"
                    class="px-4 py-2 rounded border border-gray-300 disabled:opacity-50">이전</button>
                <button v-for="page in totalPages" :key="page" @click="changePage(page)"
                    :class="['px-4 py-2 rounded border', currentPage === page ? 'bg-blue-950 text-white' : 'border-gray-300']">
                    {{ page }}
                </button>
                <button @click="changePage(currentPage + 1)" :disabled="currentPage === totalPages"
                    class="px-4 py-2 rounded border border-gray-300 disabled:opacity-50">다음</button>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>

    <script>
        const app = Vue.createApp({
            data() {
                return {
                    list: [],
                    keyword: '',
                    sessionId: "${sessionId}",
                    sessionRole: "${sessionRole}",
                    currentPage: 1,        // 현재 페이지
                    pageSize: 10,          // 한 페이지당 게시글 수
                    totalPages: 1
                };
            },
            methods: {
                fnRequestList() {
                    const self = this;
                    const offset = (self.currentPage - 1) * self.pageSize;
                    $.ajax({
                        url: "/request/list.dox",
                        type: "POST",
                        dataType: "json",
                        data: {
                            keyword: self.keyword,
                            page: self.currentPage,
                            pageSize: self.pageSize,
                            offset: offset
                        },
                        success: function (data) {
                            console.log(data);
                            self.list = data.requestList;
                            self.totalPages = data.totalPages || 1;
                        }
                    });
                },
                fnSearch() {
                    this.currentPage = 1;
                    this.fnRequestList();
                },
                changePage(page) {
                    if (page >= 1 && page <= this.totalPages) {
                        this.currentPage = page;
                        this.fnRequestList();
                    }
                },
                fnRequestView(requestNo) {
                    location.href = "/request/view.do?requestNo=" + requestNo;
                },
                fnAdd() {
                    location.href = "/request/add.do";
                },
                getStatusLabel(status) {
                    switch (status) {
                        case '0': return '답변 대기';
                        case '1': return '답변 중';
                        case '2': return '답변 완료';
                        default: return '-';
                    }
                },
                getStatusClass(status) {
                    switch (status) {
                        case '0': return 'bg-yellow-500'; // 답변 대기
                        case '1': return 'bg-blue-600';   // 답변 중
                        case '2': return 'bg-green-600';  // 답변 완료
                        default: return 'bg-gray-400';
                    }
                }
            },
            mounted() {
                this.fnRequestList();
            }
        });
        app.mount('#app');
    </script>

    </html>