<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/logo/favicon-96x96.png" />
    <link rel="shortcut icon" href="/img/logo/favicon-96x96.png" />
    <title>Find Account | kapture</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../../css/kapture-style.css">
  </head>

  <body class="bg-gray-100 text-gray-800">
    <jsp:include page="../common/header.jsp" />
    <div id="app" class="flex items-center justify-center py-32 min-h-[600px]">
      <div class="bg-white shadow-md rounded-lg p-10 w-full max-w-xl space-y-5">
        <h2 class="text-2xl font-bold text-center mb-6">
          {{ mode === 'findId' ? 'Find Your Email' : 'Reset Your Password' }}
        </h2>

        <div class="text-sm text-center mb-4 text-gray-600">
          <span v-if="mode === 'findId'">
            이미 아이디를 알고 계신가요?
            <a @click="mode = 'findPw'" class="text-blue-950 hover:underline cursor-pointer">비밀번호 찾기</a>
          </span>
          <span v-else>
            아이디를 모르시나요?
            <a @click="mode = 'findId'" class="text-blue-950 hover:underline cursor-pointer">아이디 찾기</a>
          </span>
        </div>

        <!-- 아이디 찾기 -->
        <template v-if="mode === 'findId'">
          <input v-model="user.firstName" @input="normalizeName('firstName')"
            placeholder="First Name (가이드는 여기 이름을 입력해주세요.)"
            class="w-full mb-3 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
          <input v-model="user.lastName" @input="normalizeName('lastName')" placeholder="Last Name"
            class="w-full mb-3 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
          <div class="flex gap-2 mb-3">
            <input v-model="birthday.MM" maxlength="2" placeholder="MM"
              class="w-1/3 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
            <input v-model="birthday.DD" maxlength="2" placeholder="DD"
              class="w-1/3 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
            <input v-model="birthday.YYYY" maxlength="4" placeholder="YYYY"
              class="w-1/3 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
          </div>
          <input v-model="user.phone" @input="normalizePhone" placeholder="Phone Number"
            class="w-full mb-4 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
          <button @click="findEmail"
            class="w-full bg-blue-950 text-white font-semibold py-2 rounded hover:bg-blue-700 transition">Find
            Email</button>

          <!-- 이메일 결과 -->
          <div v-if="foundEmails.length > 0" class="mt-6">
            <p class="text-sm font-semibold text-gray-700 mb-2">✅ 등록된 이메일 목록:</p>
            <div v-for="email in foundEmails" :key="email" class="mb-2">
              <label class="flex items-center gap-2 text-sm cursor-pointer">
                <input type="radio" name="selectedEmail" :value="email" v-model="selectedEmail"
                  class="accent-blue-950" />
                {{ email }}
              </label>
            </div>
            <button @click="askPasswordReset"
              class="w-full mt-4 bg-green-600 text-white font-semibold py-2 rounded hover:bg-green-700 transition">Reset
              Password?</button>
          </div>
        </template>

        <!-- 비밀번호 찾기 -->
        <template v-else>
          <input v-model="selectedEmail" :disabled="verified" placeholder="Your Email"
            class="w-full mb-4 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-950" />
          <button v-if="!verified" @click="askPasswordReset"
            class="w-full bg-blue-950 text-white font-semibold py-2 rounded hover:bg-blue-700 transition">Send
            Verification Code</button>
        </template>

        <div v-if="emailForReset && !verified" class="mt-4">
          <input v-model="verificationCode" placeholder="Enter verification code"
            class="w-full mb-2 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
          <button @click="verifyCode"
            class="w-full bg-blue-950 text-white font-semibold py-2 rounded hover:bg-blue-700 transition">Verify</button>
        </div>

        <div v-if="verified" class="text-green-600 text-center font-medium mt-4">✅ 인증이 완료되었습니다.</div>

        <div v-if="verified" class="mt-6">
          <input type="password" v-model="newPassword" placeholder="Enter new password"
            class="w-full mb-3 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
          <div v-if="newPassword.length > 0 && !passwordValid" class="text-sm text-red-500 mb-2 space-y-1">
            <p :class="passwordRules.length ? 'text-green-600' : 'text-red-500'">
              {{ passwordRules.length ? '✅ 6자 이상' : '❌ 6자 이상' }}
            </p>
            <p :class="passwordRules.upper ? 'text-green-600' : 'text-red-500'">
              {{ passwordRules.upper ? '✅ 대문자 포함' : '❌ 대문자 포함' }}
            </p>
            <p :class="passwordRules.lower ? 'text-green-600' : 'text-red-500'">
              {{ passwordRules.lower ? '✅ 소문자 포함' : '❌ 소문자 포함' }}
            </p>
            <p :class="passwordRules.number ? 'text-green-600' : 'text-red-500'">
              {{ passwordRules.number ? '✅ 숫자 포함' : '❌ 숫자 포함' }}
            </p>
            <p :class="passwordRules.special ? 'text-green-600' : 'text-red-500'">
              {{ passwordRules.special ? '✅ 특수문자 포함' : '❌ 특수문자 포함' }}
            </p>
          </div>

          <input type="password" v-model="confirmPassword" placeholder="Confirm new password"
            class="w-full mb-2 px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" />
          <div v-if="confirmPassword.length > 0" class="text-sm font-medium"
            :class="passwordsMatch ? 'text-green-600' : 'text-red-500'">
            {{ passwordsMatch ? '✅ 비밀번호가 일치합니다' : '❌ 비밀번호가 일치하지 않습니다' }}
          </div>

          <button @click="resetPassword"
            class="w-full mt-4 bg-blue-600 text-white font-semibold py-2 rounded hover:bg-blue-700 transition">Change
            Password</button>
        </div>
      </div>
    </div>
    <jsp:include page="../common/footer.jsp" />

    <script>
      const app = Vue.createApp({
        data() {
          return {
            mode: 'findId',
            user: { firstName: '', lastName: '', phone: '' },
            birthday: { MM: '', DD: '', YYYY: '' },
            foundEmails: [],
            selectedEmail: '',
            emailForReset: '',
            verificationCode: '',
            newPassword: '',
            confirmPassword: '',
            verified: false,
            emailCodeSent: false,
            codeMessage: '',
            passwordRules: { length: false, upper: false, lower: false, number: false, special: false },
            passwordValid: false,
            passwordsMatch: false
          }
        },
        watch: {
          newPassword() { this.validatePassword(); },
          confirmPassword() { this.validatePassword(); }
        },
        methods: {
          normalizeName(field) {
            let value = this.user[field] || "";
            value = value.trim().toLowerCase();
            value = value.charAt(0).toUpperCase() + value.slice(1);
            this.user[field] = value;
          },
          normalizePhone() {
            this.user.phone = this.user.phone.replace(/\s|-/g, '').replace(/[^0-9]/g, '');
          },
          formatBirthday() {
            const { YYYY, MM, DD } = this.birthday;
            if (!YYYY || !MM || !DD) return "";
            return YYYY.slice(-2) + '/' + MM.padStart(2, '0') + '/' + DD.padStart(2, '0');
          },

          findEmail() {
            let self = this;
            if (!self.user.firstName || !self.user.phone) {
              alert("모든 값을 입력해 주세요."); return;
            }
            const birthdayFormatted = this.formatBirthday();
            let nparam = {
              firstName: self.user.firstName,
              lastName: self.user.lastName,
              phone: self.user.phone,
              birthday: birthdayFormatted
            }
            $.ajax({
              url: "/find-email.dox",
              type: "POST",
              data: nparam,
              dataType: "json",
              success: function (data) {
                console.log(data);
                if (data.emailList > 0) {
                  this.foundEmails = data.emailList;
                  if (this.foundEmails.length === 1) { this.selectedEmail = this.foundEmails[0] };
                } else {
                  alert("❌ 일치하는 계정을 찾을 수 없습니다.");
                }
              }
            });
          },
          askPasswordReset() {
            if (!this.selectedEmail) {
              alert("이메일을 입력하거나 선택해주세요.");
              return;
            }
            this.emailForReset = this.selectedEmail;
            this.sendVerificationCode();
          },
          sendVerificationCode() {
            if (!this.emailForReset) return;
            alert("📨 인증 코드가 곧 전송됩니다. 이메일을 확인해주세요!");
            $.ajax({
              url: "/login/email/send.dox",
              type: "POST",
              data: { email: this.emailForReset },
              dataType: "json",
              success: data => {
                if (data.result === "success") this.emailCodeSent = true;
                else alert("❌ 인증 메일 전송 실패: " + (data.message || "알 수 없는 오류"));
              },
              error: xhr => alert("❌ 서버 오류: " + xhr.responseText)
            });
          },
          verifyCode() {
            if (!this.verificationCode) return alert("인증번호를 입력해주세요.");
            $.ajax({
              url: "/login/email/verify.dox",
              type: "POST",
              data: { email: this.emailForReset, code: this.verificationCode },
              dataType: "json",
              success: data => {
                if (data.result === "success") {
                  this.verified = true;
                  alert("✅ 인증이 완료되었습니다.");
                } else {
                  alert("❌ 인증 실패: " + data.message);
                  this.verificationCode = "";
                }
              }
            });
          },
          validatePassword() {
            const pw = this.newPassword;
            const pw2 = this.confirmPassword;
            this.passwordRules.length = pw.length >= 6;
            this.passwordRules.upper = /[A-Z]/.test(pw);
            this.passwordRules.lower = /[a-z]/.test(pw);
            this.passwordRules.number = /[0-9]/.test(pw);
            this.passwordRules.special = /[^A-Za-z0-9]/.test(pw);
            this.passwordValid = Object.values(this.passwordRules).every(Boolean);
            this.passwordsMatch = pw && pw2 && pw === pw2;
          },
          resetPassword() {
            if (!this.passwordValid || !this.passwordsMatch) return alert("❌ 비밀번호 조건을 확인해주세요.");
            $.ajax({
              url: "/login/reset-password.dox",
              type: "POST",
              data: { email: this.emailForReset, password: this.newPassword },
              contentType: "application/x-www-form-urlencoded",
              dataType: "json",
              success: data => {
                if (data.result === "success") {
                  alert("✅ 비밀번호가 성공적으로 변경되었습니다.");
                  location.href = "/login.do";
                } else {
                  alert("❌ 변경 실패: " + data.message);
                }
              }
            });
          }
        }
      });
      app.mount('#app');
    </script>
  </body>

  </html>