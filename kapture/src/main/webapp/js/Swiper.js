const swiper = new Swiper('.swiper', {
	// 기본 옵션 설정
	loop: true, // 반복
	
	autoplay: {
		delay: 2500,
	},
	pagination: {
		el: '.swiper-pagination',
		clickable: true,
	},
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},
});