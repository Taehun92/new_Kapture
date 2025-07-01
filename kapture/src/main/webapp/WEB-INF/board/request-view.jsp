<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>요청 게시판 | kapture</title>
    </head>

    <body class="bg-white text-gray-800">
        <jsp:include page="../common/header.jsp" />

        <div id="app" class="w-[70%] mx-auto py-8">
            <!-- 요청 정보 표시 영역 -->
            <section class="mb-6">
                <table class="w-full table-fixed border border-gray-300 text-base">
                    <tr>
                        <th class="w-1/6 px-6 py-4 border text-center text-lg font-bold bg-gray-100">제목</th>
                        <td class="px-6 py-6 border text-center text-2xl font-bold tracking-wide bg-white" colspan="3">
                            {{ info.title }}
                        </td>
                    </tr>
                    <tr>
                        <th class="px-4 py-3 border bg-gray-100">지역</th>
                        <td class="px-4 py-3 border">{{ info.region }}</td>
                        <th class="px-4 py-3 border bg-gray-100">예산</th>
                        <td class="px-4 py-3 border">
                            <span v-if="info.budget">
                                {{ Number(info.budget).toLocaleString() }} {{ getCurrencyLabel(info.currency) }}
                            </span>
                            <span v-else>
                                {{ getCurrencyLabel(info.currency) }}
                            </span>
                            <br>
                            <span v-if="info.currency != 'KRW'">
                                원화(￦) 기준: {{ getConvertedBudgetToKRW().toLocaleString() }} 원
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th class="px-4 py-3 border align-top bg-gray-100">내용</th>
                        <td class="px-4 py-3 border" colspan="3">
                            <div v-html="info.description" class="prose max-w-none min-h-[420px]"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="px-4 py-3 border bg-gray-100">작성자</th>
                        <td class="px-4 py-3 border">{{ info.userFirstName }} {{ info.userLastName }}</td>
                        <th class="px-4 py-3 border bg-gray-100">요청상태</th>
                        <td class="px-4 py-3 border">
                            <template v-if="info.status === '0'">답변 대기</template>
                            <template v-if="info.status === '1'">답변 중</template>
                            <template v-if="info.status === '2'">답변 완료</template>
                        </td>
                    </tr>
                </table>

                <!-- 글 바로 밑 버튼 영역: 댓글쓰기(왼쪽), 수정/삭제(오른쪽) -->
                <div class="flex justify-between items-center mt-6">
                    <div v-if="canWriteAnswer && !replyFlg && !commentFlg && !answerFlg">
                        <button @click="fnAnswer"
                            class="px-4 py-2 bg-blue-700 hover:bg-blue-900 text-white rounded">댓글쓰기</button>
                    </div>
                    <div v-if="canEdit" class="flex gap-3">
                        <button class="px-4 py-2 bg-yellow-500 text-white rounded" @click="fnEdit">수정</button>
                        <button class="px-4 py-2 bg-red-600 text-white rounded" @click="fnRemove">삭제</button>
                    </div>
                </div>
            </section>

            <!-- 댓글 영역 -->
            <section class="space-y-4">
                <comment-item v-for="comment in commentList" :key="comment.commentNo" :comment="comment" :depth="0"
                    :session-id="sessionId" :session-role="sessionRole" :request-status="info.status"
                    :request-user-no="info.userNo" :active-reply-no="commentNo" :reply-flg="replyFlg"
                    :answer-comment="answerComment"  @reply="fnReply" @edit="fnEditComment"
                    @remove="fnRemoveComment" @add-reply="fnAddReply" @back="fnBack"
                    @accept-comment="fnAcceptComment" />
            </section>

            <!-- 댓글 입력창 (최하단) -->
            <section v-if="answerFlg && !replyFlg && !commentFlg" class="mt-4 space-y-3">
                <div class="text-lg font-semibold">
                    {{ sessionFirstName }} {{ sessionLastName }} :
                </div>
                <textarea v-model="answerComment" rows="6" class="w-full border rounded p-3"></textarea>
                <div class="flex gap-3">
                    <button @click="fnAddReply" class="px-4 py-2 bg-blue-700 text-white rounded">작성</button>
                    <button @click="fnBack" class="px-4 py-2 bg-gray-400 text-white rounded">취소</button>
                </div>
            </section>

            <!-- 댓글 수정창 -->
            <section v-if="commentFlg" class="mt-4">
                <textarea v-model="editComment" rows="4" class="w-full border rounded p-3"></textarea>
                <div class="text-right mt-2 space-x-2">
                    <button @click="fnUpdateComment(commentNo)" class="px-4 py-2 bg-green-600 text-white rounded">수정
                        완료</button>
                    <button @click="fnBack" class="px-4 py-2 bg-gray-400 text-white rounded">취소</button>
                </div>
            </section>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>

    <script>
        const commentItem = {
            props: {
                comment: Object,
                depth: Number,
                sessionId: String,
                sessionRole: String,
                requestStatus: String,
                requestUserNo: [String, Number],
                replyFlg: Boolean,
                activeReplyNo: [String, Number],
            },
            emits: ['reply', 'edit', 'remove', 'add-reply', 'back'],
            data() {
                return {
                    localAnswerComment: ""
                };
            },
            computed: {
                canAnswer() {
                    return this.requestStatus !== '2' &&
                        (this.sessionRole === 'GUIDE' || this.sessionId === (String)(this.requestUserNo));
                },
                canReply() {
                    return this.requestStatus !== '2' &&
                        (this.sessionRole === 'ADMIN' || this.sessionRole === 'GUIDE' || this.sessionId === (String)(this.comment.userNo) || this.sessionId == (String)(this.requestUserNo));
                },
                canEditDelete() {
                    return (this.requestStatus !== '2' && this.sessionId === (String)(this.comment.userNo));
                },
                canAccept() {
                    return this.requestStatus !== '2' && this.sessionId == (String)(this.requestUserNo) && (this.comment.userNo) !== (this.requestUserNo);
                },
            },
            methods: {
                submitReply() {
                    if (!this.localAnswerComment || this.localAnswerComment.trim() === "") {
                        alert("댓글을 입력해주세요.");
                        return;
                    }
                    this.$emit('add-reply', {
                        commentNo: this.comment.commentNo,
                        message: this.localAnswerComment
                    });
                    this.localAnswerComment = ""; // 입력값 초기화
                },
                convertUrls(text) {
                    if (!text) return '';
                    return text.replace(
                        /(https?:\/\/[^\s]+)/g,
                        '<a href="$1" target="_blank" class="text-blue-600 underline hover:text-blue-800">$1</a>'
                    );
                }
            },
            template: `
            <section :class="[depth > 0 ? 'ml-4 border-l-2 border-gray-200 pl-4' : '']" class="bg-white rounded-md shadow-sm p-3 space-y-2 transition-all">
                <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between" :class="{ 'opacity-50 italic': comment.deleted }">
                    <div class="flex items-center space-x-2">
                        <span v-if="parseInt(comment.parentCommentNo) !== 0" class="text-gray-400">↳</span>
                        <span class="font-semibold text-gray-800 w-[80px] truncate">{{ comment.userFirstName }}</span>
                        <span class="text-gray-700" v-html="convertUrls(comment.message)"></span>
                    </div>

                    <!-- 버튼 영역 -->
                    <div class="mt-1 sm:mt-0 flex space-x-3 text-sm text-right">
                        <span v-if="depth < 9 && (!comment.children || comment.children.length === 0) && canReply && !comment.deleted"
                            class="text-gray-500 hover:underline cursor-pointer" @click="$emit('reply', comment.commentNo)">
                            댓글쓰기
                        </span>
                        <button v-if="canEditDelete" @click="$emit('edit', comment)" class="text-blue-600 hover:underline">수정</button>
                        <button v-if="canEditDelete" @click="$emit('remove', comment.commentNo)" class="text-red-600 hover:underline">삭제</button>
                        <button v-if="canAccept && !comment.deleted" @click="$emit('accept-comment', comment.commentNo)"
                            class="ml-4 px-3 py-1 bg-blue-800 text-white text-sm rounded hover:bg-blue-900">
                            채택
                        </button>
                    </div>
                </div>

                <!-- 대댓글 입력창 -->
                <div v-if="replyFlg && activeReplyNo === comment.commentNo" class="mt-3 space-y-2">
                    <input v-model="localAnswerComment" placeholder="댓글을 입력하세요" class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm" />
                    <div class="flex gap-2 justify-end">
                        <button @click="submitReply" class="px-4 py-1 bg-blue-600 text-white text-sm rounded">작성</button>
                        <button @click="$emit('back')" class="px-4 py-1 bg-gray-400 text-white text-sm rounded">취소</button>
                    </div>
                </div>

                <!-- 대댓글 재귀 렌더링 -->
                <comment-item v-for="child in comment.children" :key="child.commentNo" :comment="child" :depth="depth + 1"
                    :session-id="sessionId" :session-role="sessionRole" :request-status="requestStatus" :request-user-no="requestUserNo"
                    :active-reply-no="activeReplyNo" :reply-flg="replyFlg" :can-accept="canAccept"
                    @reply="$emit('reply', $event)" @edit="$emit('edit', $event)" @remove="$emit('remove', $event)"
                    @add-reply="$emit('add-reply', $event)" @back="$emit('back')" @accept-comment="$emit('accept-comment', $event)" />
            </section> `
        };


        function buildTree(flatList) {
            const map = {};
            const tree = [];

            flatList.forEach(item => {
                item.children = [];

                // 삭제 처리
                if (item.deleteYn === 'Y') {
                    item.message = '삭제된 댓글입니다.';
                    item.userFirstName = '';
                    item.userLastName = '';
                    item.deleted = true;
                }

                map[item.commentNo] = item;
            });

            flatList.forEach(item => {
                const parent = map[item.parentCommentNo];
                if (item.parentCommentNo && parent !== undefined) {
                    // 삭제되었더라도 연결은 유지
                    parent.children.push(item);
                } else {
                    tree.push(item);
                }
            });

            return tree;
        }

        const app = Vue.createApp({
            data() {
                return {
                    requestNo: "",
                    sessionId: "${sessionId}",
                    sessionRole: "${sessionRole}",
                    sessionFirstName: "${sessionFirstName}",
                    sessionLastName: "${sessionLastName}",
                    info: {},
                    commentList: [],
                    answerFlg: false,
                    commentFlg: false,
                    replyFlg: false,
                    answerComment: "",
                    editComment: "",
                    commentNo: "",
                    reply: "",
                    exchangeRateMap: {
                        USD: 0,
                        JPY: 0,
                        CNY: 0
                    }
                };
            },
            computed: {
                canEditRequest() {
                    return this.sessionId === (String)(this.info.userNo) || this.sessionRole == 'ADMIN';
                },
                canWriteAnswer() {
                    return this.info.status !== '2' && (this.sessionRole === 'ADMIN' || this.sessionRole === 'GUIDE' || this.sessionId == (String)(this.info.userNo));
                },
                canEdit() {
                    return (this.info.status !== '2' && this.sessionId === (String)(this.info.userNo));
                }
            },
            methods: {
                getConvertedKRW(amount, code) {
                    const rates = {
                        USD: 1350,
                        JPY: 9.1,
                        CNY: 185
                    };
                    if (code == "KRW") return Number(amount);
                    const rate = rates[code];
                    if (!rate || isNaN(amount)) return 0;
                    return Math.round(Number(amount) * rate);
                },
                getCurrencyLabel(code) {
                    const labels = {
                        KRW: "원(₩)",
                        USD: "달러($)",
                        JPY: "엔(¥)",
                        CNY: "위안(元)"
                    };
                    return labels[code] || "원(₩)";
                },
                getNestedComments(parentNo) {
                    if (!Array.isArray(this.commentList)) return [];
                    console.log("부모번호>>>" + parentNo);
                    const result = this.commentList.filter(function (item) {
                        const itemParent = item.parentCommentNo != null ? String(item.parentCommentNo) : "0";
                        const match = String(itemParent) === String(parentNo); // ← 숫자 기준 비교로 고정
                        console.log("[getNestedComments] match check ➜ item:", item, "itemParent:", itemParent, "parentNo:", parentNo, "match:", match);
                        return match;
                    });

                    console.log("[getNestedComments] parentNo:", parentNo, "result:", result);
                    return result;
                },

                // 들여쓰기 계산 함수
                depthMargin(depth) {
                    return (depth * 24) + 'px';
                },
                canEditComment(comment) {
                    return this.info.status != '2' && (this.sessionId == comment.userNo || this.sessionRole == 'ADMIN');
                },
                fnview() {
                    var self = this;
                    $.ajax({
                        url: "/request/view.dox",
                        type: "POST",
                        dataType: "json",
                        data: { requestNo: self.requestNo },
                        success: function (data) {
                            self.info = data.info;
                            self.commentList = buildTree(data.commentList); // 🌳 트리 구조로 변환!
                            console.log("[fnview] 트리 구조 댓글:", JSON.stringify(self.commentList, null, 2));
                        }
                    });
                },
                fnEdit() {
                    location.href = "/request/edit.do?requestNo=" + this.requestNo;
                },
                fnRemove() {
                    var self = this;
                    if (!confirm("해당 게시글을 삭제 하시겠습니까?")) {
                        return;
                    }
                    $.ajax({
                        url: "/request/remove.dox",
                        type: "POST",
                        dataType: "json",
                        data: { requestNo: self.requestNo },
                        success: function (data) {
                            if (data.num > 0) {
                                alert("삭제 되었습니다.");
                                location.href = "/request/list.do";
                            }
                        }
                    });
                },
                fnAnswer() {
                    this.answerFlg = true;
                },
                fnBack() {
                    this.answerFlg = false;
                    this.replyFlg = false;
                    this.commentFlg = false;
                    this.editComment = "";
                    this.reply = "";
                },
                fnReply(commentNo) {
                    this.commentNo = commentNo;  // 어떤 댓글에 대해 답글 쓸지 기억
                    this.replyFlg = true;
                },
                fnRegisterCommentAlarm(commentNo, targetUserNo) {
                    console.log("commentNo============>", commentNo);
                    console.log("commentNo============>", targetUserNo);
                    const self = this;
                    $.ajax({
                        url: "/request/registerCommentAlarm.dox",
                        type: "POST",
                        dataType: "json",
                        data: {
                            userNo: targetUserNo, // 요청 작성자 번호
                            referenceType: "COMMENT",
                            referenceId: commentNo,
                            urlParam: self.requestNo
                        },
                        success(res) {
                            console.log("✅ 댓글 알림 등록 성공", res);
                        },
                        error() {
                            console.error("❌ 댓글 알림 등록 실패");
                        }
                    });
                },
                fnAddReply(payload) {
                    var self = this;

                    var parentCommentNo = "";
                    var message = "";

                    if (payload && payload.commentNo && payload.message !== undefined) {
                        parentCommentNo = payload.commentNo;
                        message = payload.message;
                    } else {
                        parentCommentNo = "0";
                        message = self.answerComment;
                    }

                    if (!message || message.trim() === "") {
                        alert("댓글을 입력해주세요.");
                        return;
                    }

                    $.ajax({
                        url: "/request/comment/add.dox",
                        type: "POST",
                        dataType: "json",
                        data: {
                            requestNo: self.requestNo,
                            userNo: self.sessionId,
                            parentCommentNo: parentCommentNo,
                            comments: message
                        },
                        success: function (data) {
                            console.log("data.comment===>", data.COMMENT_NO);
                            if (data.num > 0 && data.comment) {
                                if (parentCommentNo === "0") {
                                    self.commentList.push(data.comment);
                                } else {
                                    const parent = self.findCommentInTree(self.commentList, parentCommentNo);
                                    if (parent) {
                                        if (!parent.children) parent.children = [];
                                        parent.children.push(data.comment);
                                    }
                                }
                                const isReply = parentCommentNo !== "0";
                                // 1. 게시글 작성자에게 알림
                                self.fnRegisterCommentAlarm(data.comment.COMMENT_NO, self.info.userNo);
                                // 2. 대댓글이면 부모 댓글 작성자에게도 알림
                                if (isReply) {
                                    const parent = self.findCommentInTree(self.commentList, parentCommentNo);
                                    if (parent && parent.userNo != self.info.userNo) {
                                        // 게시글 작성자와 다를 경우에만 중복 방지
                                        self.fnRegisterCommentAlarm(data.comment.COMMENT_NO, parent.userNo);
                                    }
                                }

                                alert("댓글이 등록 되었습니다.");
                                self.replyFlg = false;
                                self.answerFlg = false;
                                self.answerComment = "";
                                self.commentNo = "";
                                self.fnview();

                                // ✅ 헤더 알림 정보 즉시 갱신
                                // 알림 재조회 → 다음 tick에서 실행되게 해서 렌더링 반영 유도
                                if (window.header && typeof window.header.fnGetAlarms === "function") {
                                    setTimeout(() => {
                                        window.header.fnGetAlarms();
                                    }, 100); // 짧은 delay (보통 50~100ms면 충분)
                                }
                            }
                        }
                    });
                },

                findCommentInTree(list, commentNo) {
                    for (let item of list) {
                        if (String(item.commentNo) === String(commentNo)) {
                            return item;
                        }
                        if (item.children) {
                            const found = this.findCommentInTree(item.children, commentNo);
                            if (found) return found;
                        }
                    }
                    return null;
                },
                fnEditComment(comment) {
                    this.editComment = comment.message; // 수정할 내용 입력창에 넣기
                    this.commentFlg = true;
                    this.commentNo = comment.commentNo; // 수정 대상 기억
                },
                fnUpdateComment(commentNo) {
                    const self = this;
                    $.ajax({
                        url: "/request/comment/edit.dox",
                        type: "POST",
                        dataType: "json",
                        data: {
                            commentNo: commentNo,
                            comments: self.editComment
                        },
                        success: function (data) {
                            if (data.num > 0) {
                                const target = self.findCommentInTree(self.commentList, commentNo);
                                if (target) {
                                    target.message = self.editComment; // 트리 구조 내 수정 반영
                                }
                                alert("답변이 수정 되었습니다.");
                                self.commentFlg = false;
                                self.editComment = "";
                            }
                        }
                    });
                },
                findCommentInTree(list, commentNo) {
                    for (let item of list) {
                        if (String(item.commentNo) === String(commentNo)) {
                            return item;
                        }
                        if (item.children) {
                            const found = this.findCommentInTree(item.children, commentNo);
                            if (found) return found;
                        }
                    }
                    return null;
                },

                fnRemoveComment(commentNo) {
                    const self = this;
                    if (!confirm("해당 답변을 삭제 하시겠습니까?")) {
                        return;
                    }

                    $.ajax({
                        url: "/request/comment/remove.dox",
                        type: "POST",
                        dataType: "json",
                        data: { commentNo: commentNo },
                        success: function (data) {
                            if (data.num > 0) {
                                const comment = self.findCommentInTree(self.commentList, commentNo);
                                if (comment) {
                                    comment.message = "삭제된 댓글입니다.";
                                    comment.userFirstName = "";
                                    comment.userLastName = "";
                                    comment.deleted = true;  // ✅ 삭제 플래그
                                }

                                alert("답변이 삭제 되었습니다.");
                            }
                        }
                    });
                },
                removeCommentFromTree(list, commentNo) {
                    for (let i = 0; i < list.length; i++) {
                        const item = list[i];
                        if (String(item.commentNo) === String(commentNo)) {
                            list.splice(i, 1); // 현재 위치에서 삭제
                            return true;
                        }
                        if (item.children) {
                            const removed = this.removeCommentFromTree(item.children, commentNo);
                            if (removed) return true;
                        }
                    }
                    return false;
                },
                fnRegisterAcceptAlarm(commentNo, targetUserNo) {
                    $.ajax({
                        url: "/request/registerCommentAlarm.dox",
                        type: "POST",
                        dataType: "json",
                        data: {
                            userNo: targetUserNo,
                            referenceType: "ACCEPT",
                            referenceId: commentNo,
                            urlParam: this.requestNo
                        },
                        success(res) {
                            console.log("✅ 채택 알림 등록 성공", res);
                        },
                        error() {
                            console.error("❌ 채택 알림 등록 실패");
                        }
                    });
                },
                fnAcceptComment(commentNo) {
                    var self = this;
                    if (!confirm("채택하시겠습니까? 채택 후 수정 / 삭제는 불가능합니다.")) {
                        return;
                    }
                    $.ajax({
                        url: "/request/accept.dox",
                        type: "POST",
                        dataType: "json",
                        data: {
                            requestNo: self.requestNo,
                            commentNo: commentNo
                        },
                        success: function (data) {
                            if (data.num > 0) {
                                alert("답변이 채택 되었습니다.");
                                self.fnview();
                                // ✅ 채택된 유저에게 알림 전송
                                const acceptedComment = self.findCommentInTree(self.commentList, commentNo);
                                if (acceptedComment) {
                                    self.fnRegisterAcceptAlarm(commentNo, acceptedComment.userNo);
                                }

                                // ✅ 헤더 알림 최신화
                                if (window.header && typeof window.header.fnGetAlarms === "function") {
                                    setTimeout(() => window.header.fnGetAlarms(), 100);
                                }
                            }
                        }
                    });
                },

                getExchangeRates() {
                    const self = this;
                    $.ajax({
                        url: "/exchangeRate/all",
                        type: "GET",
                        dataType: "json",
                        success(data) {
                            console.log(data);
                            self.exchangeRateMap.USD = data.USD;
                            self.exchangeRateMap.JPY = data.JPY;
                            self.exchangeRateMap.CNY = data.CNY;
                        },
                        error() {
                            alert("환율 정보를 불러오는 데 실패했습니다.");
                        }
                    });
                },

                getConvertedBudgetToKRW() {
                    const self = this;

                    const rawBudget = self.info.budget;
                    if (!rawBudget) return 0;

                    const budgetNumber = parseFloat(String(rawBudget).replace(/,/g, ''));
                    if (isNaN(budgetNumber)) return 0;

                    console.log("budget:", rawBudget);
                    console.log("parsed:", budgetNumber);
                    console.log("rate:", self.exchangeRateMap[self.info.currency]);

                    if (self.info.currency === 'KRW') {
                        return budgetNumber;
                    } else if (self.exchangeRateMap[self.info.currency]) {
                        return Math.round(budgetNumber * self.exchangeRateMap[self.info.currency]);
                    } else {
                        return 0;
                    }
                }

            },
            mounted() {
                const params = new URLSearchParams(window.location.search);
                this.requestNo = params.get("requestNo") || "";
                this.fnview();
                this.getExchangeRates();

            }
        });
        app.component('comment-item', commentItem);
        app.mount('#app');
    </script>