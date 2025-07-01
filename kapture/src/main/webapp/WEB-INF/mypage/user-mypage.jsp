<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>마이페이지 | kapture</title>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- Vue.js -->
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <style>
            [v-cloak] {
                display: none !important;
            }
        </style>
    </head>

    <body class="bg-white text-gray-800 text-[16px] tracking-wide">
        <jsp:include page="../common/header.jsp" />

        <div id="app" class="flex max-w-6xl mx-auto px-6 py-8 gap-10 min-h-[700px]">
            <!-- 사이드바 -->
            <div class="w-56 bg-white shadow-md p-4 rounded">
                <ul class="space-y-2 font-semibold">
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'user-mypage.do' }"
                            href="/mypage/user-mypage.do" class="block px-3 py-2 rounded hover:bg-blue-950">
                            회원 정보수정
                        </a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'user-purchase-history.do' }"
                            href="/mypage/user-purchase-history.do" class="block px-3 py-2 rounded hover:bg-blue-100">
                            구매한 상품
                        </a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'user-schedule.do' }"
                           href="/mypage/user-schedule.do"
                           class="block px-3 py-2 rounded hover:bg-blue-100">나의 일정</a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'user-reviews.do' }" 
                        href="/mypage/user-reviews.do" class="block px-3 py-2 rounded hover:bg-blue-100">
                            이용후기 관리
                        </a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'qna.do' }"
                            href="/cs/qna.do" class="block px-3 py-2 rounded hover:bg-blue-100">
                            문의하기
                        </a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'user-qna.do' }"
                            href="/mypage/user-qna.do" class="block px-3 py-2 rounded hover:bg-blue-100">
                            문의 내역 확인
                        </a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'user-unregister.do' }"
                            href="/mypage/user-unregister.do" class="block px-3 py-2 rounded hover:bg-blue-100">
                            회원 탈퇴
                        </a>
                    </li>
                </ul>
            </div>

            <!-- 콘텐츠 영역 -->
            <div class="flex-1 space-y-6">
                <div v-if="!pwdCheckFlg" class="flex justify-center items-center h-80 space-x-4">
                    <label class="font-semibold">비밀번호 :</label>
                    <input type="password" v-model="confirmPassword" placeholder="비밀번호를 입력해주세요."
                        class="border border-gray-300 px-4 py-2 rounded w-64" @keyup.enter="fnCheckPassword">
                    <button @click="fnCheckPassword" class="bg-blue-950 text-white px-4 py-2 rounded">확인</button>
                </div>

                <div v-else class="space-y-6">
                    <!-- 회원 정보 -->
                    <div class="bg-white border rounded shadow p-6">
                        <div class="text-lg font-bold mb-4">회원 정보</div>
                        <div class="mb-4">
                            <button @click="fnNewPassword" class="bg-blue-950 text-white px-4 py-2 rounded">비밀번호
                                변경</button>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block font-semibold mb-1">FirstName <span
                                        class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.userFirstName"
                                    class="w-full border px-3 py-2 rounded" disabled />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">LastName</label>
                                <input type="text" v-model="userInfo.userLastName"
                                    class="w-full border px-3 py-2 rounded" />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">연락처 <span class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.phone" class="w-full border px-3 py-2 rounded" />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">이메일 <span class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.email" class="w-full border px-3 py-2 rounded"
                                    disabled />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">주소</label>
                                <input type="text" v-model="userInfo.address" class="w-full border px-3 py-2 rounded" />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">생년월일 <span class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.birthday" class="w-full border px-3 py-2 rounded"
                                    disabled />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">성별 <span class="text-red-500">*</span></label>
                                <div class="flex items-center gap-4">
                                    <label class="flex items-center gap-2">
                                        <input type="radio" value="M" v-model="userInfo.gender"> 남성
                                    </label>
                                    <label class="flex items-center gap-2">
                                        <input type="radio" value="F" v-model="userInfo.gender"> 여성
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 푸시알림 동의 -->
                    <div class="bg-white border rounded shadow p-6">
                        <div class="text-lg font-bold mb-4">푸쉬알림 동의여부</div>
                        <div class="flex items-center gap-4">
                            <label class="flex items-center gap-2">
                                <input type="radio" value="Y" v-model="userInfo.pushYN"> 예
                            </label>
                            <label class="flex items-center gap-2">
                                <input type="radio" value="N" v-model="userInfo.pushYN"> 아니요
                            </label>
                        </div>
                    </div>

                    <!-- 저장 버튼 -->
                    <div class="text-right">
                        <button @click="saveInfo" class="bg-blue-950 text-white px-6 py-2 rounded">저장하기</button>
                    </div>
                </div>
            </div>


            <!-- 모달 -->
            <div v-cloak v-show="showPasswordModal"
                class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
                <div
                    class="bg-white rounded shadow-lg w-full max-w-md p-6 m-auto transform transition-all duration-300">
                    <h2 class="text-lg font-bold mb-4">비밀번호 변경</h2>
                    <div class="space-y-4">
                        <div>
                            <label class="block font-semibold mb-1">비밀번호 <span class="text-red-500">*</span></label>
                            <input type="password" v-model="newPassword1" @input="validateNewPassword"
                                class="w-full border px-3 py-2 rounded" />
                            <div v-if="newPassword1.length > 0 && !passwordValid" class="text-sm mt-2 space-y-1">
                                <p
                                    :class="{ 'text-green-600': passwordRules.length, 'text-red-500': !passwordRules.length }">
                                    {{ passwordRules.length ? '✅ 6자 이상' : '❌ 6자 이상' }}</p>
                                <p
                                    :class="{ 'text-green-600': passwordRules.number, 'text-red-500': !passwordRules.number }">
                                    {{ passwordRules.number ? '✅ 숫자 포함' : '❌ 숫자 포함' }}</p>
                                <p
                                    :class="{ 'text-green-600': passwordRules.upper, 'text-red-500': !passwordRules.upper }">
                                    {{ passwordRules.upper ? '✅ 대문자 포함' : '❌ 대문자 포함' }}</p>
                                <p
                                    :class="{ 'text-green-600': passwordRules.lower, 'text-red-500': !passwordRules.lower }">
                                    {{ passwordRules.lower ? '✅ 소문자 포함' : '❌ 소문자 포함' }}</p>
                                <p
                                    :class="{ 'text-green-600': passwordRules.special, 'text-red-500': !passwordRules.special }">
                                    {{ passwordRules.special ? '✅ 특수문자 포함' : '❌ 특수문자 포함' }}</p>
                            </div>
                        </div>
                        <div>
                            <label class="block font-semibold mb-1">비밀번호 확인 <span class="text-red-500">*</span></label>
                            <input type="password" v-model="newPassword2" @input="validateNewPassword"
                                @keyup.enter="fnChangePassword" class="w-full border px-3 py-2 rounded" />
                            <div v-if="newPassword2.length > 0 && passwordValid"
                                :class="passwordsMatch ? 'text-green-600' : 'text-red-500'" class="text-sm mt-1">
                                {{ passwordsMatch ? '✅ 비밀번호 일치' : '❌ 비밀번호 불일치' }}
                            </div>
                        </div>
                    </div>
                    <div class="mt-6 flex justify-end gap-2">
                        <button @click="closeModal" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">취소</button>
                        <button @click="fnChangePassword"
                            class="px-4 py-2 bg-blue-950 text-white rounded hover:bg-blue-700">변경</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />

        <script>
            const app = Vue.createApp({
                data() {
                    return {
                        // 예: 이미 인증된 이메일 정보(샘플)
                        userInfo: {
                            birthday: "",
                            gender: "",
                            address: "",
                        },
                        confirmPassword: "",
                        sessionId: "${sessionId}",
                        sessionRole: "${sessionRole}",
                        pwdCheckFlg: false,
                        currentPage: "",
                        showPasswordModal: false,
                        newPassword1: "",
                        newPassword2: "",
                        passwordRules: { length: false, upper: false, lower: false, special: false, number: false },
                        passwordValid: false,
                        passwordsMatch: false
                    };
                },
                methods: {
                    // '저장하기' 버튼 클릭 시
                    saveInfo() {
                        // 간단한 유효성 검사 예시
                        let self = this;
                        if (!self.userInfo.phone) {
                            alert("연락처를 입력해주세요.");
                            return;
                        }
                    
                        if (!self.userInfo.gender) {
                            alert("성별을 입력해주세요.");
                            return;
                        }
                        if (self.userInfo.socialType === "SOCIAL" && self.userInfo.password === "Test1234!") {
                            alert("비밀번호를 변경해주세요.");
                            return;
                        }
                        
                        // 서버로 전송할 데이터
                        let nparmap = {
                            userLastName: self.userInfo.userLastName,
                            phone: self.userInfo.phone,
                            address: self.userInfo.address,
                            gender: self.userInfo.gender,
                            birthday: self.userInfo.birthday,
                            pushYN: self.userInfo.pushYN,
                            sessionId: self.sessionId,
                        };

                        // Ajax 요청
                        $.ajax({
                            url: "/mypage/info-edit.dox", // 실제 처리할 URL로 수정
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                console.log("서버 응답:", data);
                                if(data.result === "success"){
                                    alert("회원정보가 저장되었습니다.");
                                    // location.href = "/mypage/user-purchase-history.do";
                                } else{
                                    alert("회원정보가 저장이 실패했습니다.");
                                }
                            },
                            error: function (err) {
                                console.log(err);
                                alert("오류가 발생했습니다.");
                            }
                        });
                    },
                    fnGetInfo() {
                        let self = this;
                        let nparmap = {
                            sessionId: self.sessionId,
                        };
                        console.log(self.sessionId);
                        $.ajax({
                            url: "/mypage/user-info.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                if (data.result == "success") {
                                    console.log(data);
                                    self.userInfo = data.userInfo;
                                    if(self.userInfo.socialType === 'SOCIAL' && self.userInfo.password === 'Test1234!'){
                                         self.pwdCheckFlg = true;
                                         self.userInfo.phone = null;
                                    }
                                    if(self.userInfo.userLastName === 'N/A'){
                                        self.userInfo.userLastName = null; 
                                    }

                                } else {
                                    alert("정보를 가지고 오는데 실패했습니다.");
                                }
                            }
                        });
                    },
                    fnCheckPassword() {
                        let self = this;
                        let nparmap = {
                            sessionId: self.sessionId,
                            confirmPassword: self.confirmPassword
                        };
                        console.log(self.sessionId);
                        $.ajax({
                            url: "/mypage/user-checkPwd.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                if (data.result == "success") {
                                    console.log(data);
                                    self.pwdCheckFlg = true;
                                } else if (data.result == "fail") {
                                    alert("비밀번호를 확인해주세요");
                                } else {
                                    alert("정보를 가지고 오는데 실패했습니다.");
                                }
                            }
                        });
                    },
                    fnNewPassword() {
                        // 비밀번호 변경 버튼 클릭 시 팝업을 띄웁니다.
                        this.showPasswordModal = true;
                    },
                    validateNewPassword() {
                        const pw = this.newPassword1;
                        const pw2 = this.newPassword2;
                        this.passwordRules.length = pw.length >= 6;
                        this.passwordRules.upper = /[A-Z]/.test(pw);
                        this.passwordRules.lower = /[a-z]/.test(pw);
                        this.passwordRules.special = /[^A-Za-z0-9]/.test(pw);
                        this.passwordRules.number = /[0-9]/.test(pw);
                        this.passwordValid = this.passwordRules.length && this.passwordRules.upper &&
                            this.passwordRules.lower && this.passwordRules.special && this.passwordRules.number;
                        this.passwordsMatch = pw && pw2 && (pw === pw2);
                    },
                    fnChangePassword() {
                        // 실제 비밀번호 변경 AJAX 요청 추가 가능
                        let self = this;
                        let nparmap = {
                            newPassword1: self.newPassword1,
                            sessionId: self.sessionId,
                        };
                        console.log(self.sessionId);
                        $.ajax({
                            url: "/mypage/changePassword.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                if (data.result == "success") {
                                    console.log(data);
                                    self.showPasswordModal = false;
                                    self.newPassword1 = "";
                                    self.newPassword2 = "";
                                    self.passwordRules = { length: false, upper: false, lower: false, special: false, number: false };
                                    self.passwordValid = false;
                                    self.passwordsMatch = false;
                                    self.userInfo.password = self.newPassword1;
                                    alert("비밀번호가 변경되었습니다.");
                                } else {
                                    alert("비밀번호 변경에 실패했습니다.");
                                }
                            }
                        });
                    },
                    closeModal() {
                        this.showPasswordModal = false;
                        this.newPassword1 = "";
                        this.newPassword2 = "";
                        this.passwordRules = { length: false, upper: false, lower: false, special: false, number: false };
                        this.passwordValid = false;
                        this.passwordsMatch = false;
                    },
                },
                mounted() {
                    // 페이지 로드시 필요한 초기화 로직
                    // 세션롤이 가이드가 아니거나 세션아이디가 널이면 알림창
                    console.log(this.sessionId);
                    if (!this.sessionId || this.sessionRole === 'GUIDE') {
                        alert("일반회원만 이용가능합니다.");
                        location.href = "/main.do";
                    }
                    this.currentPage = window.location.pathname.split('/').pop();
                    console.log("Current page:", this.currentPage);

                    this.fnGetInfo();
                }
            });
            app.mount('#app');
        </script>
    </body>

    </html>