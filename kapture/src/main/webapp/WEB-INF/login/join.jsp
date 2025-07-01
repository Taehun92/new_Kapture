<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>Join | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
  </head>

  <body class="bg-gray-100">
    <jsp:include page="../common/header.jsp" />
    <!-- 뒤로가기 버튼
    <div class="absolute top-5 left-5">
      <button onclick="window.history.back()" class="text-black text-lg font-bold hover:underline">
        <i class="fas fa-arrow-left"></i> Back
      </button>
    </div> -->
    <div id="app" class="max-w-md mx-auto mt-20 mb-20 p-8 bg-white shadow-lg rounded-lg">
      <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Join Kapture</h2>

      <!-- 국적 선택 -->
      <div class="flex gap-6 justify-center mb-4">
        <label class="flex items-center gap-2 text-sm">
          <input type="radio" value="N" v-model="user.isForeigner" class="accent-blue-600" /> 내국인
        </label>
        <label class="flex items-center gap-2 text-sm">
          <input type="radio" value="Y" v-model="user.isForeigner" class="accent-blue-600" /> 외국인
        </label>
      </div>

      <!-- 이메일 -->
      <label class="block text-sm font-bold text-gray-700">이메일</label>
      <input type="text"
        class="w-full mt-1 mb-2 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
        placeholder="Email" v-model="user.email" :disabled="emailVerified" />
      <div v-if="emailCheckMessage && !emailVerified" class="text-xs mb-2" :style="{ color: emailCheckColor }">
        {{ emailCheckMessage }}
      </div>
      <button @click="sendVerificationCode"
        class="w-full bg-blue-700 hover:bg-blue-800 text-white py-2 rounded mb-4">Send Code</button>

      <div v-if="emailCodeSent && !emailVerified">
        <label class="block text-sm font-bold text-gray-700">인증번호</label>
        <input type="text"
          class="w-full mt-1 mb-2 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
          v-model="userInputCode" placeholder="Enter verification code" />
        <button @click="verifyCode"
          class="w-full bg-blue-700 hover:bg-blue-800 text-white py-2 rounded mb-4">Verify</button>
      </div>
      <div v-if="emailVerified" class="text-green-600 text-sm mb-4">✅ Email verified successfully.</div>
      <div v-if="emailError" class="text-red-500 text-sm mb-4">{{ emailError }}</div>

      <!-- 비밀번호 -->
      <label class="block text-sm font-bold text-gray-700">비밀번호</label>
      <input type="password"
        class="w-full mt-1 mb-2 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
        v-model="user.password" placeholder="Password" />
      <div v-if="user.password.length > 0 && !passwordValid" class="text-xs space-y-1 mb-4">
        <div :class="{ 'text-green-600': passwordRules.length, 'text-orange-500': !passwordRules.length }">
          {{ passwordRules.length ? '✅ 최소 6자 이상' : '❌ 최소 6자 이상' }}
        </div>
        <div :class="{ 'text-green-600': passwordRules.number, 'text-orange-500': !passwordRules.number }">
          {{ passwordRules.number ? '✅ 숫자 포함' : '❌ 숫자 포함' }}
        </div>
        <div :class="{ 'text-green-600': passwordRules.upper, 'text-orange-500': !passwordRules.upper }">
          {{ passwordRules.upper ? '✅ 대문자 포함' : '❌ 대문자 포함' }}
        </div>
        <div :class="{ 'text-green-600': passwordRules.lower, 'text-orange-500': !passwordRules.lower }">
          {{ passwordRules.lower ? '✅ 소문자 포함' : '❌ 소문자 포함' }}
        </div>
        <div :class="{ 'text-green-600': passwordRules.special, 'text-orange-500': !passwordRules.special }">
          {{ passwordRules.special ? '✅ 특수문자 포함' : '❌ 특수문자 포함' }}
        </div>
      </div>

      <!-- 비밀번호 확인 -->
      <label class="block text-sm font-bold text-gray-700">비밀번호 확인</label>
      <input type="password"
        class="w-full mt-1 mb-2 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
        v-model="user.password2" placeholder="Re-enter Password" />
      <div v-if="user.password2.length > 0 && !passwordsMatch" class="text-sm text-red-500 mb-4">
        ❌ Passwords do not match.
      </div>
      <div v-if="user.password2.length > 0 && passwordValid && passwordsMatch" class="text-sm text-green-600 mb-4">
        ✅ Passwords match.
      </div>

      <!-- 이름 -->
      <label class="block text-sm font-bold text-gray-700">이름</label>
      <input v-if="user.isForeigner === 'N'" type="text" v-model="user.firstName" placeholder="Name"
        class="w-full mt-1 mb-4 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
      <div v-else class="space-y-2 mb-4">
        <input type="text" v-model="user.firstName" placeholder="First Name"
          class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <input type="text" v-model="user.lastName" placeholder="Last Name"
          class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
      </div>

      <!-- 연락처 -->
      <label class="block text-sm font-bold text-gray-700">연락처</label>
      <input type="text" v-model="user.phone" placeholder="Phone Number"
        class="w-full mt-1 mb-4 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
      <div v-if="user.phone.length > 0 && !isPhoneValid()" class="text-red-500 text-xs mb-4">❌ Phone number must contain
        digits only</div>

      <!-- 생년월일 -->
      <label class="block text-sm font-bold text-gray-700">생년월일</label>
      <div class="flex gap-2 mt-1 mb-4">
        <input type="text" v-model="birth.mm" maxlength="2" placeholder="MM"
          class="w-1/4 px-3 py-2 border border-gray-300 rounded text-center focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <input type="text" v-model="birth.dd" maxlength="2" placeholder="DD"
          class="w-1/4 px-3 py-2 border border-gray-300 rounded text-center focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <input type="text" v-model="birth.yyyy" maxlength="4" placeholder="YYYY"
          class="w-1/2 px-3 py-2 border border-gray-300 rounded text-center focus:outline-none focus:ring-2 focus:ring-blue-500" />
      </div>
      <div v-if="!isBirthdayValid" class="text-red-500 text-xs mb-4">❌ 생년월일을 올바르게 입력해주세요.</div>

      <!-- 성별 -->
      <label class="block text-sm font-bold text-gray-700">성별</label>
      <div class="flex gap-6 mb-6 mt-1">
        <label class="flex items-center gap-2 text-sm">
          <input type="radio" value="M" v-model="user.gender" class="accent-blue-600" /> 남자
        </label>
        <label class="flex items-center gap-2 text-sm">
          <input type="radio" value="F" v-model="user.gender" class="accent-blue-600" /> 여자
        </label>
      </div>

      <!-- 약관 동의 -->
      <h3 class="text-lg font-bold text-gray-800 mb-2">이용 약관 동의</h3>
      <div class="space-y-2 text-sm">
        <label class="flex items-center gap-2">
          <input type="checkbox" v-model="allAgreed" @change="toggleAllTerms" class="accent-blue-600" /> 전체 약관에 동의합니다
        </label>
        <label class="flex items-center justify-between">
          <div class="flex items-center gap-2">
            <input type="checkbox" v-model="terms.use" class="accent-blue-600" /> 이용약관 동의 (필수)
          </div>
          <a href="#" class="text-blue-600 hover:underline text-xs" @click.prevent="openTerms('use')">[보기]</a>
        </label>
        <label class="flex items-center justify-between">
          <div class="flex items-center gap-2">
            <input type="checkbox" v-model="terms.privacy" class="accent-blue-600" /> 개인정보 수집 및 이용 동의 (필수)
          </div>
          <a href="#" class="text-blue-600 hover:underline text-xs" @click.prevent="openTerms('privacy')">[보기]</a>
        </label>
        <label class="flex items-center justify-between">
          <div class="flex items-center gap-2">
            <input type="checkbox" v-model="terms.marketing" class="accent-blue-600" /> 마케팅 정보 수신 동의 (선택)
          </div>
          <a href="#" class="text-blue-600 hover:underline text-xs" @click.prevent="openTerms('marketing')">[보기]</a>
        </label>
      </div>

      <!-- 모달 -->
      <div v-if="modalVisible" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
        @click.self="closeTerms">
        <div class="bg-white rounded-lg shadow-lg w-full max-w-2xl max-h-[80vh] relative overflow-hidden flex flex-col">
          <div class="flex justify-end items-center px-4 py-2 border-b sticky top-0 bg-white z-10">
            <button @click="closeTerms" class="text-gray-500 hover:text-gray-800 text-xl font-bold">✕</button>
          </div>
          <div class="overflow-y-auto px-6 py-4 text-sm text-gray-800 leading-relaxed">
            <div v-html="termsContent"></div>
          </div>
        </div>
      </div>

      <!-- 회원가입 버튼 -->
      <button @click="fnJoin" :disabled="!canSubmit" class="w-full mt-6 text-white font-bold py-2 rounded transition"
        :class="canSubmit ? 'bg-blue-700 hover:bg-blue-800 cursor-pointer' : 'bg-gray-400 cursor-not-allowed'">
        회원가입
      </button>

      <p class="text-center text-xs mt-4 text-gray-500">
        By creating an account, you agree to Kapture's <br />
        <a href="#" class="text-blue-500 hover:underline">Conditions</a> of Use and
        <a href="#" class="text-blue-500 hover:underline">Privacy Notice</a>.
      </p>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script>
      const app = Vue.createApp({
        data() {
          return {
            user: {
              email: '',
              password: '',
              password2: '',
              firstName: '',
              lastName: null,
              phone: '',
              birthday: '',
              gender: 'M',
              isForeigner: 'Y',
              pushYn: 'N'
            },
            birth: {
              mm: '',
              dd: '',
              yyyy: ''
            },
            isBirthdayValid: true,
            userInputCode: '',
            emailCodeSent: false,
            emailVerified: false,
            emailError: '',
            emailCheckMessage: '',
            emailCheckColor: '',
            emailCheckTimer: null,
            emailValid: false,
            emailAvailable: false,
            passwordRules: { length: false, upper: false, lower: false, special: false },
            passwordValid: false,
            passwordsMatch: false,
            agreeChecked: false,
            modalVisible: false,
            termsContent: '',
            currentTermsType: '',
            terms: {
              use: false,
              privacy: false,
              marketing: false
            }
          };
        },
        watch: {
          'user.password'(val) {
            this.validatePassword();
          },
          'user.password2'(val) {
            this.validatePassword();
          },
          'user.email'(val) {
            clearTimeout(this.emailCheckTimer);
            if (!val) {
              this.emailCheckMessage = '';
              return;
            }
            this.emailCheckTimer = setTimeout(() => {
              this.fnIdCheck();
            }, 500);
          },
          'birth.mm': 'validateBirthdayParts',
          'birth.dd': 'validateBirthdayParts',
          'birth.yyyy': 'validateBirthdayParts'
        },
        computed: {
          canSubmit() {
            return (
              this.emailValid &&
              this.emailAvailable &&
              this.emailVerified &&
              this.passwordValid &&
              this.passwordsMatch &&
              this.user.firstName &&
              this.user.phone &&
              this.user.birthday &&
              this.isPhoneValid() &&
              this.terms.use &&           // 🔒 필수 약관
              this.terms.privacy          // 🔒 필수 약관

            );
          },
          allAgreed() {
            return this.terms.use && this.terms.privacy && this.terms.marketing;
          },

          allRequiredAgreed() {
            return this.terms.use && this.terms.privacy;
          }
        },
        methods: {
          debouncedCheck() {
            clearTimeout(this.emailCheckTimer);
            this.emailCheckTimer = setTimeout(() => {
              this.fnIdCheck();
            }, 500);
          },

          validatePassword() {
            const pw = this.user.password;
            const pw2 = this.user.password2;

            this.passwordRules.length = pw.length >= 6;
            this.passwordRules.upper = /[A-Z]/.test(pw);
            this.passwordRules.lower = /[a-z]/.test(pw);
            this.passwordRules.special = /[^A-Za-z0-9]/.test(pw);
            this.passwordRules.number = /[0-9]/.test(pw);

            this.passwordValid =
              this.passwordRules.length &&
              this.passwordRules.upper &&
              this.passwordRules.lower &&
              this.passwordRules.special &&
              this.passwordRules.number;

            this.passwordsMatch = pw && pw2 && pw === pw2;
          },

          isValidEmail(email) {
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return regex.test(email);
          },
          isPhoneValid() {
            return /^[0-9]*$/.test(this.user.phone);
          },

          fnIdCheck() {
            const email = this.user.email;
            if (!email) {
              this.emailCheckMessage = '';
              this.emailValid = false;
              this.emailAvailable = false;
              return;
            }
            if (!this.isValidEmail(email)) {
              this.emailCheckMessage = '⚠️ Invalid email format.';
              this.emailCheckColor = 'orange';
              this.emailValid = false;
              this.emailAvailable = false;
              return;
            }
            this.emailValid = true;
            $.ajax({
              url: '/check.dox',
              type: 'POST',
              dataType: 'json',
              data: { email },
              success: (data) => {
                if (data.count === 0) {
                  this.emailCheckMessage = '✅ This email is available.';
                  this.emailCheckColor = 'green';
                  this.emailAvailable = true;
                } else {
                  this.emailCheckMessage = '❌ This email is already in use.';
                  this.emailCheckColor = 'red';
                  this.emailAvailable = false;
                }
              },
              error: () => {
                this.emailCheckMessage = '⚠️ Failed to check email.';
                this.emailCheckColor = 'red';
                this.emailAvailable = false;
              }
            });
          },

          verifyCode() {
            if (!this.userInputCode) {
              alert("Enter the code you received.");
              return;
            }

            $.ajax({
              url: "/login/email/verify.dox",
              type: "POST",
              data: {
                email: this.user.email,
                code: this.userInputCode
              },
              success: (data) => {
                if (data.result === "success") {
                  this.emailVerified = true;
                  this.emailError = "";
                  alert("Email successfully verified!");
                } else {
                  this.emailVerified = false;
                  this.emailError = data.message;
                }
              }
            });
          },

          validateBirthdayParts() {
            const mmNum = parseInt(this.birth.mm);
            const ddNum = parseInt(this.birth.dd);
            const yyyyNum = parseInt(this.birth.yyyy);

            // 기본 유효성 검사
            const isBasicValid =
              this.birth.yyyy.length === 4 &&
              this.birth.mm.length >= 1 &&
              this.birth.dd.length >= 1 &&
              !isNaN(yyyyNum) && !isNaN(mmNum) && !isNaN(ddNum) &&
              mmNum >= 1 && mmNum <= 12 &&
              ddNum >= 1 && ddNum <= 31 &&
              yyyyNum >= 1900 && yyyyNum <= 2100;

            if (!isBasicValid) {
              this.isBirthdayValid = false;
              this.user.birthday = null;
              return;
            }

            // 날짜 조합 및 Date 객체 생성
            var paddedMM = (mmNum < 10 ? "0" + mmNum : mmNum);
            var paddedDD = (ddNum < 10 ? "0" + ddNum : ddNum);
            var birthStr = yyyyNum + "-" + paddedMM + "-" + paddedDD;
            var birthDate = new Date(birthStr);

            var today = new Date();
            today.setHours(0, 0, 0, 0);
            birthDate.setHours(0, 0, 0, 0);

            // 미래 날짜는 유효하지 않음
            if (birthDate > today) {
              this.isBirthdayValid = false;
              this.user.birthday = null;
              return;
            }

            // 유효할 경우 YY/MM/DD 형식 저장
            this.isBirthdayValid = true;
            var yy = yyyyNum.toString().slice(2);
            this.user.birthday = yy + "/" + paddedMM + "/" + paddedDD;
          },

          fnJoin() {
            const self = this;
            this.validateBirthdayParts();

            if (!this.canSubmit || !this.isBirthdayValid) {
              alert("Please complete all required fields correctly.");
              return;
            }

            console.log("전송 전 birthday:", this.user.birthday);

            if (!self.terms.marketing) {
              self.user.pushYn = 'N'
            } else {
              self.user.pushYn = 'Y'
            }


            $.ajax({
              url: "join.dox",
              type: "POST",
              dataType: "json",
              data: {
                email: self.user.email,
                password: self.user.password,
                firstName: self.user.firstName,
                lastName: self.user.lastName,
                phone: self.user.phone,
                birthday: self.user.birthday,
                gender: self.user.gender,
                isForeigner: self.user.isForeigner,
                pushYn: self.user.pushYn
              },
              success: function (data) {
                alert("Congratulations on becoming a member.");
                location.href = "/login.do";
              }
            });
          },

          sendVerificationCode() {
            let self = this;
            let nparmap = {
              email: self.user.email
            };
            $.ajax({
              url: "/login/email/send.dox",
              type: "POST",
              data: nparmap,
              success: function (data) {
                console.log("✅ 응답 확인:", data); // ← 실제 응답 구조 확인용

                if (data.result === "success") {
                  alert("✅ " + data.message);
                  self.emailCodeSent = true;

                } else {
                  alert("❌ 인증 메일 전송 실패: " + (data.message || "알 수 없는 오류"));
                }
              },
              error: function (xhr, status, err) {
                console.error("❌ 서버 오류:", xhr.responseText);
                alert("❌ 서버 통신 오류 발생");
              }
            });
          },

          toggleAllTerms() {
            const newValue = !this.allAgreed;
            this.terms.use = newValue;
            this.terms.privacy = newValue;
            this.terms.marketing = newValue;
          },

          openTerms(type) {
            if (!type) {
              console.warn("❗ 약관 타입(type)이 정의되지 않았습니다.");
              return;
            }
            this.currentTermsType = type;
            this.modalVisible = true;
            this.loadTerms(type);
          },

          loadTerms(type) {
            if (!type) return;

            // 🔁 문자열 → 숫자 매핑
            const typeToIdMap = {
              use: 3,
              privacy: 2,
              marketing: 1
            };

            const termsId = typeToIdMap[type];

            fetch("/terms/getTermsGetMethod.dox?termsId=" + termsId)
              .then(res => res.json())
              .then(data => {
                if (data.result === "success") {
                  this.termsContent = data.terms.content;
                } else {
                  this.termsContent = "<p>⚠️ 약관을 불러오지 못했습니다.</p>";
                }
              })
              .catch(() => {
                this.termsContent = "<p>⚠️ 서버 통신 오류</p>";
              });
          },

          closeTerms() {
            this.modalVisible = false;
          }


        }
      });
      app.mount("#app");
    </script>
  </body>

  </html>