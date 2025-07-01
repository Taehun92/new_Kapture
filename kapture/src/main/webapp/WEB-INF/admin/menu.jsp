<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@3.5.13/dist/vue.global.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../../css/kapture-style.css">
        <title>첫번째 페이지</title>
    </head>
    <style>
        /* 사이드바 스타일 */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 200px;
            height: 100vh;
            background-color: #333;
            color: white;
            padding: 20px !important;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
			box-sizing: content-box
        }

        /* 메뉴 리스트 스타일 */
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #555;
        }

        /* 메뉴와 본문이 겹치지 않도록 여백 추가 */
        .content {
            margin-left: 240px;
            padding: 20px;
        }

        .toggle-submenu {
            display: flex !important;
            justify-content: space-between;
            /* 텍스트와 화살표를 양쪽 끝에 배치 */
            align-items: center;
            width: 95%;
        }

        .submenu-items {
            /* 전체 하위메뉴를 들여쓰기 하고 싶다면 */
            padding-left: 20px !important;
        }
    </style>

    <body>
        <div class="sidebar bg-gray-800 text-white fixed top-0 left-0 w-[200px] h-screen shadow-md px-5 py-6">
            <a href="/main.do">
                <img id="logo" src="../../img/white.png" class="w-full mb-6" />
            </a>
            <ul class="space-y-2">
                <li><a href="/admin.do" class="block px-3 py-2 rounded hover:bg-gray-700">대시보드</a></li>
                <li><a href="/admin/tours.do" class="block px-3 py-2 rounded hover:bg-gray-700">상품 관리</a></li>
                <li><a href="/admin/guide.do" class="block px-3 py-2 rounded hover:bg-gray-700">가이드 관리</a></li>

                <li class="submenu">
                    <a href="javascript:void(0)"
                        class="toggle-submenu flex justify-between items-center px-3 py-2 rounded hover:bg-gray-700">
                        거래 관리 <span class="arrow">∨</span>
                    </a>
                    <ul class="submenu-items pl-4 hidden">
                        <li><a href="/admin/order.do" class="block px-2 py-1 text-sm rounded hover:bg-gray-600">주문내역
                                관리</a></li>
                        <li><a href="/admin/pay.do" class="block px-2 py-1 text-sm rounded hover:bg-gray-600">결제 및 수익
                                관리</a></li>
                    </ul>
                </li>

                <li><a href="/admin/review.do" class="block px-3 py-2 rounded hover:bg-gray-700">리뷰 및 평점 관리</a></li>

                <li class="submenu">
                    <a href="javascript:void(0)"
                        class="toggle-submenu flex justify-between items-center px-3 py-2 rounded hover:bg-gray-700">
                        고객 관리 <span class="arrow">∨</span>
                    </a>
                    <ul class="submenu-items pl-4 hidden">
                        <li><a href="/admin/customer.do" class="block px-2 py-1 text-sm rounded hover:bg-gray-600">고객 정보
                                관리</a></li>
                        <li><a href="/admin/customer-inquiry.do"
                                class="block px-2 py-1 text-sm rounded hover:bg-gray-600">고객 문의 관리</a></li>
                    </ul>
                </li>
				<li><a href="/admin/partnership.do" class="block px-3 py-2 rounded hover:bg-gray-700">제휴문의 관리</a></li>
                
                <li class="submenu">
                    <a href="javascript:void(0)"
                        class="toggle-submenu flex justify-between items-center px-3 py-2 rounded hover:bg-gray-700">
                        운영 및 설정 관리 <span class="arrow">∨</span>
                    </a>
                    <ul class="submenu-items pl-4 hidden">
                        <li><a href="/admin/setting.do" class="block px-2 py-1 text-sm rounded hover:bg-gray-600">약관 내용 관리</a></li>
                        <li><a href="/admin/badWords.do" class="block px-2 py-1 text-sm rounded hover:bg-gray-600">금칙어 관리</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </body>

    </html>
    <script>
        $(document).ready(function () {
            // 현재 페이지 이름 추출
            let currentPage = window.location.pathname.split('/').pop();
            console.log("Current page:", currentPage);
            // 거래 관리 하위메뉴: 주문내역 관리, 결제 및 수익 관리
            if (currentPage === "order.do" || currentPage === "pay.do") {
                // 첫 번째 submenu (거래 관리)에 대해서만 작동
                $('.submenu').eq(0).find('.toggle-submenu .arrow').text('∧');
                $('.submenu').eq(0).find('.submenu-items').show();
            }
            // 고객 관리 하위메뉴: 고객 정보 관리, 고객 문의 관리
            else if (currentPage === "customer.do" || currentPage === "customer-inquiry.do") {
                // 두 번째 submenu (고객 관리)에 대해서만 작동
                $('.submenu').eq(1).find('.toggle-submenu .arrow').text('∧');
                $('.submenu').eq(1).find('.submenu-items').show();
            } else if (currentPage === "setting.do" || currentPage === "badWords.do") {
                // 세 번째 submenu (운영 및 설정 관리)에 대해서만 작동
                $('.submenu').eq(2).find('.toggle-submenu .arrow').text('∧');
                $('.submenu').eq(2).find('.submenu-items').show();
            }
            $('.toggle-submenu').click(function (e) {
                e.preventDefault(); // a 태그 기본 이동 막기

                // 1) 화살표 모양 변경
                let $arrow = $(this).find('.arrow');
                if ($arrow.text() === '∨') {
                    $arrow.text('∧');
                } else {
                    $arrow.text('∨');
                }

                // 2) 하위 메뉴 열고 닫기
                $(this).next('.submenu-items').slideToggle();
            });
        });
    </script>
