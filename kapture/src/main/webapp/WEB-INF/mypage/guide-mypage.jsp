<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
        <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
        <title>마이페이지 | kapture</title>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <style>
            [v-cloak] {
                display: none !important;
            }
        </style>
    </head>

    <body class="bg-white font-sans text-gray-800">
        <jsp:include page="../common/header.jsp" />

        <div id="app" class="flex max-w-6xl mx-auto px-6 py-8 gap-10 min-h-[700px]">
            <!-- 사이드바 -->
            <div class="w-56 bg-white shadow-md p-4 rounded">
                <ul class="space-y-2 font-semibold">
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-schedule.do' }"
                            href="/mypage/guide-schedule.do" class="block px-3 py-2 rounded hover:bg-blue-100">나의
                            스케줄</a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-mypage.do' }"
                            href="/mypage/guide-mypage.do" class="block px-3 py-2 rounded hover:bg-blue-950">가이드
                            정보수정</a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-add.do' }"
                            href="/mypage/guide-add.do" class="block px-3 py-2 rounded hover:bg-blue-100">여행상품 등록</a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-sales-list.do' }"
                            href="/mypage/guide-sales-list.do" class="block px-3 py-2 rounded hover:bg-blue-100">상품
                            목록</a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'qna.do' }" href="/cs/qna.do"
                            class="block px-3 py-2 rounded hover:bg-blue-100">문의하기</a>
                    </li>
                    <li>
                        <a :class="{ 'bg-blue-950 text-white': currentPage === 'guide-qna.do' }"
                            href="/mypage/guide-qna.do" class="block px-3 py-2 rounded hover:bg-blue-100">문의 내역 확인</a>
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
                        <div class="text-lg font-bold mb-4">가이드 정보 수정</div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                            <!-- 프로필이미지 -->
                            <span class="form-group profile-upload-container">
                                <div
                                    class="w-[150px] h-[150px] overflow-hidden rounded-full border flex items-center justify-center bg-gray-50">
                                    <img v-if="userInfo.P_FILE_PATH && userInfo.P_FILE_PATH !== ''"
                                        :src="userInfo.P_FILE_PATH" alt="가이드사진" class="w-full h-full object-contain" />
                                    <span v-else class="text-gray-400 text-sm">
                                        NO Image
                                    </span>
                                </div>
                                <input type="file" @change="handleProfileUpload" />
                            </span>

                            <div>
                                <label class="block font-semibold mb-1">FIRSTNAME <span
                                        class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.USER_FIRSTNAME"
                                    class="w-full border px-3 py-2 rounded" disabled />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">LastName</label>
                                <input type="text" v-model="userInfo.USER_LASTNAME"
                                    class="w-full border px-3 py-2 rounded" />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">연락처 <span class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.PHONE" class="w-full border px-3 py-2 rounded" />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">이메일 <span class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.EMAIL" class="w-full border px-3 py-2 rounded"
                                    disabled />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">주소</label>
                                <input type="text" v-model="userInfo.ADDRESS" class="w-full border px-3 py-2 rounded" />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">생년월일 <span class="text-red-500">*</span></label>
                                <input type="text" v-model="userInfo.BIRTHDAY" class="w-full border px-3 py-2 rounded"
                                    disabled />
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">성별 <span class="text-red-500">*</span></label>
                                <div class="flex items-center gap-4">
                                    <label class="flex items-center gap-2">
                                        <input type="radio" value="M" v-model="userInfo.GENDER"> 남성
                                    </label>
                                    <label class="flex items-center gap-2">
                                        <input type="radio" value="F" v-model="userInfo.GENDER"> 여성
                                    </label>
                                </div>
                            </div>
                            <div>
                                <label class="block font-semibold mb-1">Language</label>
                                <input type="text" v-model="userInfo.LANGUAGE" class="w-full border px-3 py-2 rounded"
                                    placeholder="예:japanese, english, chinese" />
                            </div>

                            <div class="mb-4">
                                <button @click="fnNewPassword" class="bg-blue-950 text-white px-4 py-2 rounded">비밀번호
                                    변경</button>
                            </div>
                            <div class="md:col-span-2">
                                <label class="block font-semibold mb-1">경험 또는 자기소개</label>
                                <textarea v-model="userInfo.EXPERIENCE" rows="10"
                                    class="w-full border px-3 py-2 rounded resize-none"
                                    placeholder="여행 가이드로서의 경험이나 소개를 작성해주세요"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- 푸시알림 동의 -->
                    <div class="bg-white border rounded shadow p-6">
                        <div class="text-lg font-bold mb-4">푸쉬알림 동의여부</div>
                        <div class="flex items-center gap-4">
                            <label class="flex items-center gap-2">
                                <input type="radio" value="Y" v-model="userInfo.PUSHYN"> 예
                            </label>
                            <label class="flex items-center gap-2">
                                <input type="radio" value="N" v-model="userInfo.PUSHYN"> 아니요
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
                        userInfo: {
                            BIRTHDAY: "",
                            GENDER: "",
                            ADDRESS: "",
                            EXPERIENCE: "",
                            LANGUAGE: "",
                            P_FILE_PATH: "",
                            pFileNo: "",
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
                        let self = this;

                        // 서버로 전송할 데이터
                        let nparmap = {
                            userLastName: self.userInfo.USER_LASTNAME,
                            phone: self.userInfo.PHONE,
                            address: self.userInfo.ADDRESS,
                            gender: self.userInfo.GENDER,
                            birthday: self.userInfo.BIRTHDAY,
                            pushYN: self.userInfo.PUSHYN,
                            experience: self.userInfo.EXPERIENCE,
                            language: self.userInfo.LANGUAGE,
                            sessionId: self.sessionId,
                            pFileNo: self.userInfo.pFileNo,
                            guideNo: self.userInfo.GUIDE_NO,
                            pFilePath: self.userInfo.P_FILE_PATH,
                        };
                   
                        // Ajax 요청
                        $.ajax({
                            url: "/mypage/guide-info-edit.dox", // 실제 처리할 URL로 수정
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                console.log("서버 응답:", data);

                                if (data.result === "success") {
                                    alert("회원정보가 저장되었습니다.");
                                    // location.href = "/mypage/user-purchase-history.do";
                                } else {
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
                            url: "/mypage/guide-info.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {
                                console.log("불러온 데이터", data);
                                if (data.result == "success") {
                                    console.log(data);
                                    self.userInfo = data.userInfo;
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
                                    alert("비밀번호가 변경되었습니다.");
                                } else {
                                    alert("비밀번호 변경에 실패했습니다.");
                                }
                            }
                        });
                    },
                    handleProfileUpload(event) {
                        let self = this;
                        const profile = event.target.files[0];
                        if (!profile) return;
                        const formData = new FormData();
                        formData.append('profile', profile);
                        // 필요한 경우 가이드 번호나 사용자 번호도 함께 전송

                        $.ajax({
                            url: '/admin/guide-profile.dox', // 파일 업로드 처리 엔드포인트
                            type: 'POST',
                            data: formData,
                            processData: false,   // 파일 업로드 시 필수: 데이터를 문자열로 처리하지 않음
                            contentType: false,   // 필수: multipart/form-data로 전송
                            dataType: 'json',
                            success: function (data) {
                                if (data.result === 'success') {
                                    // 서버가 새 파일 경로를 반환한다고 가정: data.newFilePath
                                    self.userInfo.P_FILE_PATH = data.newFilePath;
                                    self.userInfo.pFileNo = data.pFileNo;
                                } else {
                                    alert('이미지 업로드에 실패했습니다.');
                                }
                            },
                            error: function (err) {
                                console.error('이미지 업로드 중 오류 발생:', err);
                                alert('이미지 업로드 중 오류가 발생했습니다.');
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
                    if (!this.sessionId || this.sessionRole === 'TOURIST') {
					    alert("가이드만 이용가능합니다.");
					    location.href = "http://localhost:8080/main.do";
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