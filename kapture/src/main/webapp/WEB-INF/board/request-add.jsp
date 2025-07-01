<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.snow.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/quill@1.3.7/dist/quill.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>요청 등록 | kapture</title>
    </head>

    <body class="bg-white text-gray-800 font-sans text-[16px] tracking-wide">
        <jsp:include page="../common/header.jsp" />
        <div id="app" class="max-w-5xl mx-auto py-10">
            <table class="w-full table-fixed border border-gray-300 text-base bg-white shadow rounded overflow-hidden">
                <tr class="bg-gray-100">
                    <th class="w-1/6 px-4 py-3 border text-right font-semibold">제목</th>
                    <td colspan="3" class="px-4 py-3 border">
                        <input v-model="title" placeholder="제목 입력"
                            class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
                    </td>
                </tr>
                <tr>
                    <th class="px-4 py-3 border text-right font-semibold">지역</th>
                    <td class="px-4 py-3 border">
                        <input v-model="region" placeholder="지역 입력"
                            class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
                    </td>
                    <td colspan="2" class="px-4 py-3 border">
                        <div class="flex items-center space-x-3">
                            <span class="font-semibold w-12 text-right">예산</span>
                            <input :value="formattedBudget" @input="onBudgetInput" placeholder="금액 입력"
                                class="flex-1 border border-gray-300 rounded px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-400" />
                            <select v-model="currency" class="w-32 border border-gray-300 rounded px-3 py-3">
                                <option value="KRW">원 (₩)</option>
                                <option value="USD">달러 ($)</option>
                                <option value="JPY">엔 (¥)</option>
                                <option value="CNY">위안 (元)</option>
                            </select>
                        </div>
                        <div class="text-sm text-gray-500 mt-2" v-if="currency !== 'KRW'">
                            원(₩) 기준: <span class="font-semibold">{{ convertedBudget.toLocaleString() }}원</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="px-4 py-3 border text-right font-semibold align-top">내용</th>
                    <td colspan="3" class="px-4 py-3 border">
                        <div id="editor" class="h-[400px]"></div>
                    </td>
                </tr>
            </table>
            <div class="mt-6 text-right">
                <button class="px-6 py-3 bg-blue-800 text-white font-semibold rounded hover:bg-blue-900 transition"
                    @click="fnSave">
                    저장
                </button>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    title: "",
                    contents: "",
                    region: "",
                    budget: "",
                    currency: "KRW",
                    sessionId: "${sessionId}",
                    exchangeRates: {
                        USD: 1350,
                        JPY: 9.2,
                        CNY: 185
                    }
                };
            },
            computed: {
                convertedBudget() {
                    if (this.currency === "KRW") return this.budget;
                    const rate = this.exchangeRates[this.currency];
                    return Math.round(this.budget * rate);
                },
                formattedBudget() {
                    if (!this.budget) return '';
                    return parseInt(this.budget).toLocaleString();
                }
            },
            methods: {
                fnSave() {
                    var self = this;
                    var nparmap = {
                        title: self.title,
                        contents: self.contents,
                        userNo: self.sessionId,
                        region: self.region,
                        budget: self.budget,
                        currency: self.currency
                    };
                    $.ajax({
                        url: "/request/add.dox",
                        type: "POST",
                        dataType: "json",
                        data: nparmap,
                        success: function (data) {
                            if (data.num > 0) {
                                alert("입력되었습니다.");
                                location.href = "/request/list.do";
                            }
                        }
                    });
                },
                onBudgetInput(event) {
                    const raw = event.target.value.replace(/[^0-9]/g, '');
                    this.budget = raw;
                }
            },
            mounted() {
                var self = this;
                var quill = new Quill('#editor', {
                    theme: 'snow',
                    modules: {
                        toolbar: [
                            [{ 'header': [1, 2, 3, false] }],
                            ['bold', 'italic', 'underline'],
                            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                            ['link', 'image'],
                            [{ 'color': [] }, { 'background': [] }],
                            [{ 'align': [] }],
                            ['clean']
                        ]
                    }
                });

                quill.on('text-change', function () {
                    self.contents = quill.root.innerHTML;
                });
            }
        });
        app.mount('#app');
    </script>

    </html>