$(document).ready(function () {
	// showFullContent();
	// initSlide();
	// $('.the-workshop-product-2 .tabslet').tabslet()
})


function showFullContent() {
	let buttonViewMore = $('.the-workshop-product-2 .main-product-bottom .view-more')
	buttonViewMore.on('click', function () {
		console.log(1);
		$(this).prev('.full-content').toggleClass('active')
		$(this).slideUp();
	})
}

function initSlide() {
	// let productSlide = new Swiper(".the-workshop-product-2 .swiper-container", {
	// 	// slidesPerView: 3,
	// 	// slidesPerColumn: 2,
	// 	autoplay: {
	// 		delay: 4500,
	// 	},
	// 	spaceBetween: 30,
	// 	speed: 500,
	// 	loop: true,
	// 	navigation: {
	// 		nextEl: ".the-workshop-product-2 .button-next",
	// 		prevEl: ".the-workshop-product-2 .button-prev",
	// 	},
	// 	pagination: {
	// 		el: ".the-workshop-product-2 .swiper-pagination",
	// 		type: "bullets",
	// 		clickable: true,
	// 	},
	// });
	$('.the-workshop-product-2 .main-slick .slick-wrapper').slick();
}
