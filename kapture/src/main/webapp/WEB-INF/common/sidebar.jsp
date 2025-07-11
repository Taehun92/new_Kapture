<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <title>사이드바</title>
    </head>

    <body class="bg-white text-gray-800 font-sans text-[16px] tracking-wide overflow-x-hidden">
        <div id="sidebar" class="sidebar">

            <!-- 날씨 버튼 -->
            <button v-show="!showWeather" class="open-chat-btn" @click="showWeather = true"
                :style="{ position: 'fixed', bottom: bottomOffset + 60 + 'px', right: '20px', zIndex: 1100 }">
                🤖날씨 열기
            </button>
            <!-- 챗봇 버튼 -->
            <button v-show="!showChat" class="open-chat-btn" @click="showChat = true"
                :style="{ position: 'fixed', bottom: bottomOffset + 'px', right: '20px', zIndex: 1100 }">
                🤖챗봇 열기
            </button>

            <div class="chatbot-overlay" v-if="showChat"
                :style="{ bottom: bottomOffset + 'px', position: 'fixed', right: '20px', zIndex: 9999 }">
                <div class="chat-container">
                    <div class="chat-header">
                        K-apture 챗봇
                        <button class="close-btn" @click="showChat = false">✕</button>
                    </div>
                    <div class="chat-box" ref="chatBox">
                        <div v-for="msg in messages" :class="['message', msg.type]">
                            {{ msg.text }}
                        </div>
                    </div>
                    <div class="chat-input">
                        <textarea v-model="userInput" placeholder="메시지를 입력하세요..." @keyUp.enter="sendMessage"></textarea>
                        <button @click="sendMessage">전송</button>
                    </div>
                </div>
            </div>

            <div class="weather-overlay" v-if="showWeather"
                :style="{ bottom: bottomOffset + 'px', top : '400px', right: '20px', position: 'fixed', zIndex: 9999 }">
                <div class="weather-container bg-white shadow-lg rounded-xl p-4 w-100">
                    <div class="flex justify-between items-center mb-4">
                        <h2 class="text-lg font-semibold text-gray-800"> {{ regionName }} {{ regionDetailName }} 날씨 정보</h2>
                        <button class="text-gray-400 hover:text-gray-600" @click="showWeather = false">✕</button>
                    </div>
                    <div class="weather-box">
                        <div>
                            <div class="">
                                <div v-if="isLoadingWeather" class="text-center py-4">
                                    <span class="text-blue-600 font-semibold animate-pulse">날씨 정보를 불러오는 중...</span>
                                </div>
                                <div v-if="mergedForecast.length">
                                    <table class="table-auto border-collapse border border-gray-300 text-center text-sm w-full">
                                        <thead class="bg-gray-100">
                                        <tr>
                                            <th class="border p-1">날짜</th>
                                            <th class="border p-1">하늘</th>
                                            <th class="border p-1">강수</th>
                                            <th class="border p-1">최저</th>
                                            <th class="border p-1">최고</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="(day, index) in mergedForecast" :key="index">
                                            <td class="border p-1">{{ day.date }}</td>
                                            <td class="border p-1">{{ day.sky }}</td>
                                            <td class="border p-1">{{ day.pty }}</td>
                                            <td class="border p-1">{{ day.tmn }}</td>
                                            <td class="border p-1">{{ day.tmx }}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>

    <script>
        const sidebar = Vue.createApp({
            data() {
                return {
                    userInput: "",
                    messages: [],
                    showChat: false,
                    showWeather: true,
                    temp: "",
                    cloud: "",
                    nx: "",
                    ny: "",
                    weatherInfo: {
                        tmp: '',
                        sky: '',
                        pty: '',
                        tmn: '',
                        tmx: ''
                    },
                    weatherForecast: [],
                    weatherForecastDaily: [],
                    isLoadingWeather: false,
                    bottomOffset: 40,
                    latitude : null,
                    longitude : null,
                    regionName : "",
                    regId : "",
                    midForecast : [],
                    regionDetailName: "",
                    apiKey : "O5%2BkPtLkpnsqZVmVJiYW7JDeWEX4mC9Vx3mq4%2FGJs%2Fejvz1ceLY%2B0XySUsy15P%2BhpAdHcZHXHhdn4htsTUuvpA%3D%3D",
                    mergedForecast : []
                };
            },

            methods: {
                sendMessage() {
                    if (this.userInput.trim() === "") return;
                    const prePrompt = `당신은 한국 투어 상품 전문 쇼핑몰 ‘Kapture’의 고객 상담용 챗봇입니다. 사용자의 질문에 친절하고 이해하기 쉬운 말투로 응답하세요.
                        당신의 주요 역할은 다음과 같습니다:
                        1. 투어 상품(예: 지역, 일정, 가격, 포함 사항 등)에 대한 정보를 제공
                        2. 예약 절차 및 문의 방법 안내
                        3. 자주 묻는 질문에 빠르게 대응
                        4. 사용자가 무엇을 원하는지 파악하여 추천 상품 안내

                        다만, 다음의 지침을 따르세요:
                        - 사용자에게 반말은 절대 사용하지 않습니다.
                        - 모르는 질문에는 정확하지 않은 답을 하지 말고, “죄송합니다, 해당 정보는 확인이 필요합니다.”라고 안내하세요.
                        - 불필요하게 긴 설명은 피하고 핵심만 간결히 전달하세요.
                        - **질문의 언어를 감지하고, 그 언어로 응답하세요.** 예: 사용자가 영어로 질문하면 영어로, 한국어로 질문하면 한국어로 답변하십시오.
                        - 반드시 한 가지 언어로 일관되게 답변하고, 중간에 언어를 혼용하지 마세요.
                        예시 말투:
                        - “고객님, 이 상품은 2박 3일 일정으로 구성되어 있으며...”
                        - “예약은 홈페이지에서 가능하시며, 절차는 다음과 같습니다.”

                        이제 사용자의 질문에 응답할 준비가 되었습니다.`;

                    const combinedInput = prePrompt + this.userInput;

                    this.messages.push({ text: this.userInput, type: 'user' });
                    const inputText = this.userInput;
                    this.userInput = "";
                    this.scrollToBottom();

                    $.ajax({
                        url: "/gemini/chat",
                        type: "GET",
                        data: { input: combinedInput },
                        success: (response) => {
                            this.messages.push({ text: response, type: 'bot' });
                            this.scrollToBottom();
                        },
                        error: (xhr) => {
                            this.messages.push({ text: "오류 발생: " + xhr.responseText, type: 'bot' });
                            this.scrollToBottom();
                        }
                    });
                },

                scrollToBottom() {
                    this.$nextTick(() => {
                        const chatBox = this.$refs.chatBox;
                        chatBox.scrollTop = chatBox.scrollHeight;
                    });
                },

                bindScrollEvent() {
                    let self = this;
                    if (self.scrollListenerAdded) return; // 중복 방지
                    window.addEventListener("scroll", function () {
                        const footer = document.querySelector("#footer");
                        if (!footer) return;

                        const scrollY = window.scrollY;
                        const windowHeight = window.innerHeight;
                        const footerTop = footer.getBoundingClientRect().top + scrollY;
                        const buffer = 20;
                        const baseOffset = 40;
                        const scrollBottom = scrollY + windowHeight;

                        let newOffset = baseOffset;
                        if (scrollBottom >= footerTop + buffer) {
                            const overlap = scrollBottom - (footerTop + buffer);
                            newOffset = baseOffset + overlap;
                        }

                        self.bottomOffset = newOffset;
                    }, { passive: true });

                    self.scrollListenerAdded = true; // 플래그 세팅
                },
                //날씨 정보 가져오기
                fnWeather() {
                    let self = this;
                    self.isLoadingWeather = true;
                    const today = new Date();
                    today.setDate(today.getDate() - 1);
                    const year = today.getFullYear();
                    const month = String(today.getMonth() + 1).padStart(2, '0');
                    const day = String(today.getDate()).padStart(2, '0');
                    const baseDate = year + month + day;
                    // 날씨 정보 표시
                    let xhr = new XMLHttpRequest();
                    let url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst';
                    let queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'O5%2BkPtLkpnsqZVmVJiYW7JDeWEX4mC9Vx3mq4%2FGJs%2Fejvz1ceLY%2B0XySUsy15P%2BhpAdHcZHXHhdn4htsTUuvpA%3D%3D';
                    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
                    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000');
                    queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON');
                    queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(baseDate);
                    queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('2300');
                    queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(self.nx);
                    queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(self.ny);
                    xhr.open('GET', url + queryParams);
                    xhr.onreadystatechange = function () {
                        if (this.readyState == 4) {
                            console.log('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
                        }
                    };

                    xhr.send('');
                    xhr.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            const response = JSON.parse(this.responseText);
                            const items = response.response.body.items.item; // ✅ 여기에 item 리스트 있음

                            const hours = String(today.getHours()).padStart(2, '0');
                            const minutes = today.getMinutes();
                            const timeSlots = [0, 3, 6, 9, 12, 15, 18, 21];

                            // 현재 시각 기준으로 가장 가까운 timeSlot 찾기
                            let nearestHour = timeSlots.reduce((prev, curr) => {
                                return Math.abs(curr - hours) < Math.abs(prev - hours) ? curr : prev;
                            }, timeSlots[0]);

                            // 30분 이전이면 한 단계 전으로
                            if (minutes < 30) {
                                const index = timeSlots.indexOf(nearestHour);
                                nearestHour = index > 0 ? timeSlots[index - 1] : timeSlots[timeSlots.length - 1]; // 0시에서 뒤로 가면 21시
                            }

                            // fcstTime 형식으로 변환
                            const forecastHour = String(nearestHour).padStart(2, '0') + '00';

                            const filteredItems = items.filter(item => item.fcstTime === forecastHour);
                            const TMPList = filteredItems.filter(i => i.category === 'TMP');
                            const SKYList = filteredItems.filter(i => i.category === 'SKY');
                            const PTYList = filteredItems.filter(i => i.category === 'PTY');
                            const tmnList = items.filter(i => i.category === 'TMN');
                            const tmxList = items.filter(i => i.category === 'TMX');

                            const TMP = filteredItems.find(i => i.category === 'TMP')?.fcstValue || '-';
                            const SKY = filteredItems.find(i => i.category === 'SKY')?.fcstValue || '-';
                            const PTY = filteredItems.find(i => i.category === 'PTY')?.fcstValue || '-';
                            const TMN = items.find(i => i.category === 'TMN')?.fcstValue || '-';
                            const TMX = items.find(i => i.category === 'TMX')?.fcstValue || '-';

                            self.weatherInfo = {
                                tmp: TMP + "°C",
                                sky: self.mapSky(SKY),
                                pty: self.mapPty(PTY),
                                tmn: TMN + "°C",
                                tmx: TMX + "°C"
                            };
                            const forecastList = items.filter(i => i.category === 'TMP' && i.fcstTime === '1100').slice(0, 3);

                            self.weatherForecast = forecastList.map(i => ({
                                fcstDate: i.fcstDate,
                                fcstTime: i.fcstTime,
                                fcstValue: i.fcstValue
                            }));

                            const groupByDate = {};
                            items.forEach(i => {
                                if (!groupByDate[i.fcstDate]) {
                                    groupByDate[i.fcstDate] = [];
                                }
                                groupByDate[i.fcstDate].push(i);
                            });

                            // 3일치만 뽑아서 정보 구성
                            const dailyForecast = Object.keys(groupByDate).sort().slice(0, 4).map(date => {
                                const dayItems = groupByDate[date];
                                const TMP = dayItems.find(i => i.category === 'TMP')?.fcstValue || '-';
                                const SKY = dayItems.find(i => i.category === 'SKY')?.fcstValue || '-';
                                const PTY = dayItems.find(i => i.category === 'PTY')?.fcstValue || '-';
                                const TMN = dayItems.find(i => i.category === 'TMN')?.fcstValue || '-';
                                const TMX = dayItems.find(i => i.category === 'TMX')?.fcstValue || '-';

                                const TMN_INT = TMN !== '-' ? parseInt(TMN) : '-';
                                const TMX_INT = TMX !== '-' ? parseInt(TMX) : '-';

                                return {
                                    date: date,
                                    tmp: TMP + "°C",
                                    sky: self.mapSky(SKY),
                                    pty: self.mapPty(PTY),
                                    tmn: TMN_INT + "°C",
                                    tmx: TMX_INT + "°C"
                                };
                            });
                            self.weatherForecastDaily = dailyForecast;
                            self.weatherForecastDaily.forEach(d => {
                                self.mergedForecast.push({
                                    date: `\${d.date.slice(0,4)}-\${d.date.slice(4,6)}-\${d.date.slice(6,8)}`,
                                    sky: d.sky,
                                    pty: d.pty,
                                    tmn: d.tmn,
                                    tmx: d.tmx
                                });
                                self.mergedForecast.sort((a, b) => {
                                    return new Date(a.date) - new Date(b.date);
                                });
                            });
                            self.isLoadingWeather = false; // 로딩 완료
                        }
                    };

                },

                mapSky(code) {
                    const skyValue = parseInt(code);
                    if (skyValue >= 0 && skyValue <= 5) {
                        return '☀️ 맑음';
                    } else if (skyValue >= 6 && skyValue <= 8) {
                        return '⛅ 구름 많음';
                    } else if (skyValue >= 9 && skyValue <= 10) {
                        return '☁️ 흐림';
                    } else {
                        return '알 수 없음';
                    }
                },
                mapPty(code) {
                    switch (code) {
                        case '0': return '🌈 없음';
                        case '1': return '🌧️ 비';
                        case '2': return '🌨️ 비/눈';
                        case '3': return '❄️ 눈';
                        case '4': return '🌫️ 소나기';
                        default: return '알 수 없음';
                    }
                },

                adjustButtonBottom() {
                    const footer = document.querySelector("#footer");
                    const openChatButton = document.querySelector(".open-chat-btn");
                    const openWeatherButton = document.querySelector(".open-weather-btn");

                    if (!footer) return;

                    const scrollY = window.scrollY;
                    const windowHeight = window.innerHeight;
                    const footerTop = footer.getBoundingClientRect().top + scrollY;
                    const baseOffset = 40;
                    const buffer = 20;
                    const scrollBottom = scrollY + windowHeight;

                    let newOffset = baseOffset;
                    if (scrollBottom >= footerTop + buffer) {
                        const overlap = scrollBottom - (footerTop + buffer);
                        newOffset = baseOffset + overlap;
                    }

                    this.bottomOffset = newOffset;
                },
                fnMidWeather() {
                    let self = this;
                    const today = new Date();
                    const year = today.getFullYear();
                    const month = String(today.getMonth() + 1).padStart(2, '0');
                    const day = String(today.getDate()).padStart(2, '0');
                    const hour = String(today.getHours()).padStart(2, '0');

                    // 예보 기준 시간 설정 (6시 또는 18시 기준)
                    const tmFc = year + month + day + "0600";

                    const landUrl = `https://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst?serviceKey=\${self.apiKey}&pageNo=1&numOfRows=10&dataType=JSON&regId=\${self.regId}&tmFc=\${tmFc}`;
                    const taUrl = `https://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey=\${self.apiKey}&pageNo=1&numOfRows=10&dataType=JSON&regId=\${self.regId}&tmFc=\${tmFc}`;
                    Promise.all([fetch(landUrl), fetch(taUrl)])
                        .then(responses => Promise.all(responses.map(r => r.json())))
                        .then(([landData, taData]) => {
                            const midLand = landData.response.body.items.item[0];
                            const midTa = taData.response.body.items.item[0];

                            const midForecast = [];
                            for (let i = 4; i <= 10; i++) {
                                let rnStAm = "-";
                                let rnStPm = "-";
                                let am = "-";
                                let pm = "-";

                                if (i <= 7) {
                                    rnStAm = midLand[`rnSt\${i}Am`] + "%";
                                    rnStPm = midLand[`rnSt\${i}Pm`] + "%";
                                    am = midLand[`wf\${i}Am`];
                                    pm = midLand[`wf\${i}Pm`];
                                } else {
                                    // D+8 ~ D+10: 오전/오후 구분 없음
                                    const rnSt = midLand[`rnSt\${i}`] + "%";
                                    rnStAm = rnStPm = rnSt;

                                    const wf = midLand[`wf\${i}`]; // 날씨도 Am/Pm 없이 전체
                                    am = pm = wf;
                                }

                                midForecast.push({
                                    taMin: midTa[`taMin\${i}`] + "°C",
                                    taMax: midTa[`taMax\${i}`] + "°C",
                                    rnStAm,
                                    rnStPm
                                });
                            }

                            self.midForecast = midForecast;
                            for (let i = 0; i < self.midForecast.length; i++) {
                                const dPlus = i + 4;
                                const date = self.formatMidDate(dPlus);

                                const rnStAmValue = parseInt(self.midForecast[i].rnStAm.replace('%', '')) || 0;
                                const rnStPmValue = parseInt(self.midForecast[i].rnStPm.replace('%', '')) || 0;

                                // SKY 코드 결정
                                let skyCode = '0';
                                if (rnStAmValue >= 60) {
                                    skyCode = '10'; // 흐림 + 비 느낌
                                } else if (rnStAmValue >= 50) {
                                    skyCode = '9'; // 흐림
                                } else if (rnStAmValue >= 30) {
                                    skyCode = '7'; // 구름 많음
                                }

                                // PTY 코드 결정
                                let ptyCode = '0';
                                if (rnStPmValue >= 60) {
                                    ptyCode = '1'; // 비
                                }

                                self.mergedForecast.push({
                                    date,
                                    sky: self.mapSky(skyCode),
                                    pty: self.mapPty(ptyCode),
                                    tmn: self.midForecast[i].taMin,
                                    tmx: self.midForecast[i].taMax
                                });
                            }
                            self.mergedForecast.sort((a, b) => {
                                return new Date(a.date) - new Date(b.date);
                            });


                        })
                        .catch(err => {
                            console.error("중기 예보 오류:", err);
                        });

                },

                // 시 이름 추출
                extractSiName(addressData) {
                    if (!addressData?.response.result?.length) return null;
                    const level1 = addressData.response.result[0].structure.level1;  // 예: 인천광역시
                    const level2 = addressData.response.result[0].structure.level2;  // 예: 부평구

                    // 시(광역시, 특별시 제거) + 구
                    const si = level1.replace(/광역시|특별시|자치시/, '').trim();
                    const gu = level2.trim();

                    this.regionName = si;              // 예: 인천
                    this.regionDetailName = gu;        // 예: 부평구

                    return `\${si} \${gu}`;
                },
                // RegId 조회
                getRegId() {
                    let self = this;
                    let nparmap = {
                        regionName: self.regionName
                    };
                    $.ajax({
                        url: "/weather/getRegId.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.regId = data.regId.regId;
                            self.fnMidWeather();

                        }
                    });
                },
                // ✅ 위도/경도 → 기상청 격자 좌표로 변환 함수
                dfs_xy_conv(lat, lon) {
                    const RE = 6371.00877;
                    const GRID = 5.0;
                    const SLAT1 = 30.0;
                    const SLAT2 = 60.0;
                    const OLON = 126.0;
                    const OLAT = 38.0;
                    const XO = 43;
                    const YO = 136;
                    const DEGRAD = Math.PI / 180.0;
                    const re = RE / GRID;
                    const slat1 = SLAT1 * DEGRAD;
                    const slat2 = SLAT2 * DEGRAD;
                    const olon = OLON * DEGRAD;
                    const olat = OLAT * DEGRAD;

                    let sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
                    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
                    let sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
                    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
                    let ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
                    ro = re * sf / Math.pow(ro, sn);

                    let ra = Math.tan(Math.PI * 0.25 + lat * DEGRAD * 0.5);
                    ra = re * sf / Math.pow(ra, sn);
                    let theta = lon * DEGRAD - olon;
                    if (theta > Math.PI) theta -= 2.0 * Math.PI;
                    if (theta < -Math.PI) theta += 2.0 * Math.PI;
                    theta *= sn;

                    return {
                        nx: Math.floor(ra * Math.sin(theta) + XO + 0.5),
                        ny: Math.floor(ro - ra * Math.cos(theta) + YO + 0.5),
                    };
                },
                formatMidDate(dPlus) {
                    const today = new Date();
                    today.setDate(today.getDate() + dPlus);
                    const year = today.getFullYear();
                    const month = String(today.getMonth() + 1).padStart(2, '0');
                    const day = String(today.getDate()).padStart(2, '0');
                    return `\${year}-\${month}-\${day}`;
                },


            }, // methods

            watch: {
                showChat(val) {
                    if (val) {
                        this.$nextTick(() => {
                            this.adjustButtonBottom();
                        });
                    }
                },
                showWeather(val) {
                    if (val) {
                        this.$nextTick(() => {
                            this.adjustButtonBottom();
                        });
                    }
                }
            },

            mounted() {
                let self = this;
                this.showWeather = false;
                this.showChat = false;
                navigator.geolocation.getCurrentPosition(
                    function (position) {
                        let lat = position.coords.latitude;
                        let lon = position.coords.longitude;
                        self.longitude = lon;
                        self.latitude = lat;
                        // 위치 -> 주소 변환
                        $.ajax({
                            url: "https://api.vworld.kr/req/address?",
                            type: "GET",
                            dataType: "jsonp",
                            data: {
                                service: "address",
                                request: "getaddress",
                                version: "2.0",
                                crs: "EPSG:4326",
                                type: "BOTH",
                                point: `\${self.longitude},\${self.latitude}`,
                                format: "json",
                                errorformat: "json",
                                key: "04896F0E-6E1E-304E-B548-2F885CFA0E9E"
                            },
                            success: function (result) {
                                self.extractSiName(result);
                                // RegId 가져오기
                                self.getRegId();

                                const { nx, ny } = self.dfs_xy_conv(self.latitude, self.longitude);
                                self.nx = nx;
                                self.ny = ny;

                                self.fnWeather();
                            }
                        });
                    },
                    function (error) {
                        console.error("위치 정보 가져오기 실패", error);
                    }
                );

                window.addEventListener("scroll", this.adjustButtonBottom);
                this.adjustButtonBottom(); // 초기화

            }
        });
        sidebar.mount("#sidebar");
    </script>