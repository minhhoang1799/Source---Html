/*
 ////////////////////////////////////////////////////////
 // Bao Nguyen Apps
 // @version v1.0
 // @link https://baonguyenyam.github.io
 // @license MIT
 // @Coding by Bao Nguyen - 0969689893 - 0933112900
 // @baonguyenyam@gmail.com
 ////////////////////////////////////////////////////////
*/
"use strict";

var DOMAIN_URL = 'http://domain.com';
var CANHCAM_APP = {
	"ACTIVE_FIXED_HEADER": true,
	"HEADER_TRANPARENT": false,
	"NAV_CHANGE_ON": "sm",
	"ACTIVE_HEADER_POSITION": 1,
	"ACTIVE_PADDING_MAIN": true,
	"ACTIVE_FIXED_FOOTER": true,
	"DISPLAY_FOOTER": 600,
	"ACTIVE_RESPONSIVE": true,
	"ACTIVE_OFFCANVAS": true,
	"ACTIVE_BACKTOTOP": true,
	"DISPLAY_BACKTOTOP": 100,
	"CHANGE_GRID": 991,
	"DEV_MODE": true,
	"DEV_MODE_GIRD_FULL": false,
	"MEGA_MENU": false,
	"MEGA_MENU_COL": 5
};

function setAnchor() {

	if (window.location.hash) {
		var target = $(window.location.hash);
		callAnchor(target);
	}

	$('a[href*="#"]:not([href="#"])').click(function () {
		if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
			if (target.length) {
				callAnchor(target);
			}
		}
	});
}

function callAnchor(target) {
	var headerHeightAnchor = $("header").outerHeight();
	if ($(window).width() <= CANHCAM_APP.CHANGE_GRID) {
		$('html, body').animate({
			scrollTop: target.offset().top - headerHeightAnchor
		}, 500);
	} else {
		if (!CANHCAM_APP.ACTIVE_FIXED_HEADER) {
			$('html, body').animate({
				scrollTop: target.offset().top
			}, 500);
		} else {
			$('html, body').animate({
				scrollTop: target.offset().top - headerHeightAnchor
			}, 500);
		}
	}
}

$(document).ready(function () {
	// setAnchor();
});

$(window).resize(function () {
	// setAnchor();
});

function backToTop() {
	if ($('#back-to-top').length) {
		var backToTop = function backToTop() {
			var scrollTop = $(window).scrollTop();
			if (scrollTop > CANHCAM_APP.DISPLAY_BACKTOTOP) {
				$('#back-to-top').addClass('show');
			} else {
				$('#back-to-top').removeClass('show');
			}
		};
		backToTop();
		$(window).on('scroll', function () {
			backToTop();
		});
		$('#back-to-top').on('click', function (e) {
			e.preventDefault();
			$('html,body').animate({
				scrollTop: 0
			}, 700);
		});
	}
}

$(document).ready(function () {
	if (CANHCAM_APP.ACTIVE_BACKTOTOP) {
		backToTop();
	}
	$(".subject").append($('.breadcrumb li a').eq(1).find('span').html());
	// $("#productTabs").tabs({
	// 	event: "mouseover"
	// })
});

function VienSoiResponsive() {
	$('[bg-img]').each(function () {
		var bgimg = $(this).attr('bg-img');
		$(this).css({
			"background-image": "url(" + bgimg + ")",
			"background-position": "center center",
			"background-size": "cover"
		});
	});

	$('[bg-img-responsive]').each(function () {
		var bgimg = $(this).attr('bg-img-responsive');
		var bgimgsm = $(this).attr('bg-img-responsive-sm');
		var bgimgxs = $(this).attr('bg-img-responsive-xs');
		if ($(window).width() >= CANHCAM_APP.CHANGE_GRID) {
			$(this).css({
				"background-image": "url(" + bgimg + ")",
				"background-position": "center center",
				"background-size": "cover"
			});
		} else if ($(window).width() < CANHCAM_APP.CHANGE_GRID && $(window).width() > 575) {
			$(this).css({
				"background-image": "url(" + bgimgsm + ")",
				"background-position": "center center",
				"background-size": "cover"
			});
		} else {
			$(this).css({
				"background-image": "url(" + bgimgxs + ")",
				"background-position": "center center",
				"background-size": "cover"
			});
		}
	});

	$('[img-src-responsive]').each(function () {
		var bgimg2 = $(this).attr('img-src-responsive');
		var bgimg2sm = $(this).attr('img-src-responsive-sm');
		var bgimg2xs = $(this).attr('img-src-responsive-xs');
		if ($(window).width() >= CANHCAM_APP.CHANGE_GRID) {
			$(this).attr("src", "" + bgimg2 + "");
		} else if ($(window).width() < CANHCAM_APP.CHANGE_GRID && $(window).width() > 575) {
			$(this).attr("src", "" + bgimg2sm + "");
		} else {
			$(this).attr("src", "" + bgimg2xs + "");
		}
	});
};

$(function () {
	if (CANHCAM_APP.ACTIVE_RESPONSIVE) {
		VienSoiResponsive();
	}
});

$(window).resize(function () {
	if (CANHCAM_APP.ACTIVE_RESPONSIVE) {
		VienSoiResponsive();
	}
});

$(function () {
	$('[data-toggle="tooltip"]').tooltip();
	$('[data-toggle="popover"]').popover({
		trigger: 'focus'
	});
});

function clickCall(val) {
	window.location.href = 'tel:' + val;
}
$(function () {
	if ($('.clients').length) {
		$('.clients .owl-carousel').owlCarousel({
			animateIn: 'fadeIn',
			animateOut: 'fadeOut',
			items: 1,
			loop: true,
			center: false,
			margin: 20,
			navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
			nav: true,
			dots: false,
			autoplay: true,
			autoplayTimeout: 3000,
			autoplayHoverPause: false,
			callbacks: true,
			responsive: {
				480: {
					items: 2
				},
				768: {
					items: 3
				},
				992: {
					items: 4,
					nav: false,
					dots: true
				},
				1140: {
					items: 6,
					nav: false,
					dots: true
				}
			}
		});
	}
});

function setFooter() {
	var bodyHeight = $("body").outerHeight(),
		headerHeight = $("header").outerHeight(),
		footerHeight = $("footer").outerHeight(),
		mainHeight = $("main").outerHeight(),
		curentHeight = mainHeight + headerHeight + footerHeight,
		curentfixedHeight = mainHeight + footerHeight,
		newHeight = bodyHeight - (headerHeight + footerHeight),
		newfixedHeight = bodyHeight - footerHeight;
	// if ($(window).width() > CANHCAM_APP.DISPLAY_FOOTER) {
	// if ($(window).width() <= CANHCAM_APP.CHANGE_GRID) {
	// $("main").css('min-height', newfixedHeight + 'px');
	// } else {
	// if (!CANHCAM_APP.ACTIVE_FIXED_HEADER) {
	// $("main").css('min-height', newHeight + 'px');
	// } else {
	// $("main").css('min-height', newfixedHeight + 'px');
	// }
	// }
	// } else {
	// $("main").css('min-height', 'initial');
	// }
};
$(document).ready(function () {

	$('.product-details .slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
		autoplay: false,
		asNavFor: '.slider-nav'
	});

	$('.product-details .slider-nav').slick({
		slidesToShow: 5,
		slidesToScroll: 5,
		asNavFor: '.slider-for',
		dots: false,
		arrows: true,
		focusOnSelect: true,
		infinite: false,
		vertical: true,
		verticalSwiping: true,
		swipe: true,
		swipeToSlide: true,
		responsive: [{
			breakpoint: 1199,
			settings: {
				slidesToShow: 5,
				slidesToScroll: 5,
			}
		}, {
			breakpoint: 991,
			settings: {
				slidesToShow: 4,
				slidesToScroll: 4
			}
		}, {
			breakpoint: 767,
			settings: {
				slidesToShow: 4,
				slidesToScroll: 1,
				infinite: false,
				vertical: false,
				verticalSwiping: false,
				swipe: false,
				swipeToSlide: false,
			}
		}, {
			breakpoint: 543,
			settings: {
				slidesToShow: 3,
				slidesToScroll: 1,
				infinite: false,
				vertical: false,
				verticalSwiping: false,
				swipe: false,
				swipeToSlide: false,
			}
		}]
	});

	if (CANHCAM_APP.ACTIVE_FIXED_FOOTER) {
		setFooter();
	}
});

$(window).resize(function () {
	if (CANHCAM_APP.ACTIVE_FIXED_FOOTER) {
		setFooter();
	}
});

function setHeader(elm) {
	if (elm >= CANHCAM_APP.ACTIVE_HEADER_POSITION) {
		$("header").addClass('active');
	} else {
		$("header").removeClass('active');
	}
}

$(document).ready(function () {
	if (CANHCAM_APP.ACTIVE_FIXED_HEADER) {
		$("header").addClass('fixedheader');
	}

	if ($(window).scrollTop() >= CANHCAM_APP.ACTIVE_HEADER_POSITION) {
		setHeader($(window).scrollTop());
	}
	if ($("header").hasClass("fixedheader")) {
		$("main").addClass('main-fixedheader');
	}
});

$(window).scroll(function () {
	setHeader($(document).scrollTop());
});

$(document).ready(function () {
	if (CANHCAM_APP.ACTIVE_OFFCANVAS) {
		$('body').on('click', function () {});
	}
});

function setMain() {
	var headerHeight = $("header").outerHeight();
	if ($(window).width() <= CANHCAM_APP.CHANGE_GRID) {
		$("main").css('padding-top', headerHeight + 'px');
	} else {
		if (!CANHCAM_APP.ACTIVE_PADDING_MAIN) {
			$("main").css('padding-top', '0px');
		} else {
			if (!CANHCAM_APP.ACTIVE_FIXED_HEADER) {
				$("main").css('padding-top', 'initial');
			} else {
				$("main").css('padding-top', headerHeight + 'px');
			}
		}
	}
}

$(document).ready(function () {
	setMain();
});

$(window).resize(function () {
	setMain();
});

$(document).ready(function () {

	$(".lightgallery").lightGallery();
});
$(document).ready(function () {
	if ($('#gmap, #gmap_canvas')) {
		$('#gmap, #gmap_canvas').kmaps();
	}
});
if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
	var msViewportStyle = document.createElement('style');
	msViewportStyle.appendChild(document.createTextNode('@-ms-viewport{width:auto!important}'));
	document.head.appendChild(msViewportStyle);
}

$(function () {
	var nua = navigator.userAgent;
	var isAndroid = nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1 && nua.indexOf('Chrome') === -1;
	if (isAndroid) {
		$('select.form-control').removeClass('form-control').css('width', '100%');
	}
});
$(document).ready(function () {});
$(function () {
	$('.lazy').lazy({
		beforeLoad: function beforeLoad(element) {},
		afterLoad: function afterLoad(element) {},
		onError: function onError(element) {},
		onFinishedAll: function onFinishedAll() {}
	});
});
var LOGOMAIN = '<?xml version="1.0" encoding="utf-8"?><!-- Coding bay Bao Nguyen - 0969689893 --><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 295.6 132.1" enable-background="new 0 0 295.6 132.1" xml:space="preserve"><g id="labs"><path fill="#000000" d="M26,80.1l-4-10.8l21.9-26.4h10v27.2h6v10h-6v8h-10v-8L26,80.1L26,80.1z M33.2,70.1h10.7V57.4L33.2,70.1z"/><g><polygon fill="#000000" points="151.5,35.4 141.8,35.4 141.8,88.8 173.1,88.8 173.1,79.4 151.5,79.4 "/><path fill="#000000" d="M205.6,51.4c-2.9-2.6-6.8-3.9-12-3.9c-3.3,0-6.1,0.4-8.6,1.3c-2.3,0.8-5,2.2-7.7,4l-1.6,1l4.3,7.5l1.8-1.2c3.8-2.6,7.3-3.9,10.7-3.9c2.6,0,4.7,0.6,6.1,1.8c1.2,1.1,1.8,2.7,1.8,4.9v0.2h-10.2c-4.9,0-8.7,1.1-11.5,3.3c-3,2.3-4.5,5.4-4.5,9.3c0,2.4,0.6,4.7,1.9,6.8c1.1,2,2.8,3.6,5.2,4.9c2.2,1.1,4.7,1.7,7.5,1.7c4.8,0,8.8-1.2,11.9-3.5v3.2h9.4L210,62.2C209.9,57.5,208.4,54,205.6,51.4z M196.9,78.4c-2.1,1.3-4.3,1.9-6.9,1.9c-2.1,0-3.7-0.4-5-1.4c-1.1-0.8-1.5-1.9-1.5-3.3c0-1.2,0-4,7.4-4h9.5v2.1C199.8,75.6,198.7,77.2,196.9,78.4z"/><path fill="#000000" d="M250.6,50.1L250.6,50.1c-3.1-1.8-6.5-2.7-10.2-2.7c-3.6,0-6.7,0.8-9.6,2.4c-1,0.6-1.9,1.2-2.7,2V32.4h-9.5v56.4h9.5v-4.2c0.8,0.7,1.8,1.4,2.7,1.9c2.7,1.7,5.9,2.5,9.7,2.5s7.3-0.9,10.3-2.7c2.8-1.6,5.3-4.2,7-7.4c1.6-3,2.4-6.6,2.4-10.6c0-3.9-0.8-7.4-2.5-10.7C256,54.4,253.7,51.9,250.6,50.1z M233.4,58c1.7-1,3.6-1.5,5.9-1.5c2.2,0,4.1,0.5,5.8,1.5c1.8,1.1,3.1,2.4,4,4.1c1,1.9,1.5,3.9,1.5,6.2s-0.5,4.3-1.5,6.2c-0.9,1.7-2.2,3.1-4,4.1c-1.6,1-3.6,1.5-5.8,1.6c-2.3,0-4.2-0.5-5.9-1.5c-1.8-1.1-3.1-2.4-4-4.1c-1-1.9-1.5-4-1.5-6.3c0-2.2,0.5-4.3,1.5-6.2C230.4,60.4,231.7,59,233.4,58z"/><path fill="#000000" d="M290.5,69.5c-1.4-1.6-3-2.9-4.8-3.8c-1.7-0.8-3.8-1.6-6.6-2.4H279c-1.8-0.4-3.2-0.9-4.3-1.4l-0.1-0.1c-0.8-0.3-1.4-0.7-2.1-1.3c-0.3-0.3-0.5-0.8-0.5-1.4c0-0.9,0.3-1.6,1-2c1-0.6,2.4-0.9,4.3-0.9c1.4,0,2.9,0.2,4.7,0.7c1.5,0.4,3,1.1,4.4,2l1.9,1.2l3.8-7.9l-1.3-1c-1.6-1.2-3.6-2.1-6-2.8c-2.5-0.7-5.1-1-7-1.1c-4.2,0-7.6,0.9-10.4,2.8c-3,2.1-4.6,5.2-4.6,9.3c0,2.6,0.7,4.8,2.2,6.7c1.4,1.6,2.9,2.8,4.7,3.6c1.7,0.8,3.9,1.6,6.5,2.4c2.1,0.6,4.7,1.5,6.1,2.4c0.8,0.5,1.2,1.2,1.2,2.3c0,1.1-0.4,1.9-1.3,2.4c-1.1,0.7-2.7,1.1-4.6,1.1c-2.1,0-4-0.4-6-1.2c-1.8-0.7-3.5-1.7-5.1-3l-1.9-1.7l-3.9,7.8l1.1,1c1.9,1.8,4.3,3.2,7.1,4.2c2.8,1,5.7,1.5,8.5,1.5c4.3,0,7.9-1,10.8-3.1c3.2-2.2,4.8-5.4,4.8-9.5C292.7,73.7,292,71.4,290.5,69.5z"/></g><polygon fill="#000000" points="86.4,57.7 75,42.7 62.4,42.7 80.1,65.9 63.3,88 76,88 86.4,74.2 96.8,88 109.4,88 92.6,65.9 119.7,30.4 119.7,120.1 11.7,120.1 11.7,12.1 108,12.1 115.5,2.1 1.7,2.1 1.7,130.1 129.7,130.1 129.7,2.1 "/></g></svg>';

$(function () {
	$('[site-logo]').html(LOGOMAIN);
});

console.log('%cCanhCam', 'font-size:100px;color:#000000;text-shadow:0 1px 0 #404040,0 2px 0 #404040 ,0 3px 0 #404040 ,0 4px 0 #404040 ,0 5px 0 #404040 ,0 6px 1px rgba(0,0,0,.1),0 0 5px rgba(0,0,0,.1),0 1px 3px rgba(0,0,0,.3),0 3px 5px rgba(0,0,0,.2),0 5px 10px rgba(0,0,0,.25),0 10px 10px rgba(0,0,0,.2),0 20px 20px rgba(0,0,0,.15);');
console.log('%c CanhCam ' + '%c - Thiáº¿t Káº¿ Website ChuyĂªn Nghiá»‡p', 'border-radius: 2px; padding: 3px; background: #000000; color: #FFF', 'color: #000000');
console.warn("CanhCam warning: This is a browser feature intended for developers. If someone told you to copy and paste something here to enable a 4xlabs feature or 'hack' someone's account, it is a scam and will give them access to your 4xlabs account.");

document.onkeyup = function (e) {
	var e = e || window.event;
	if (e.altKey && e.ctrlKey && e.shiftKey && e.which == 13) {
		$('body');
		alert('BAO NGUYEN - 0969689893\nEmail: baonguyenyam@gmail.com\nWeb: baonguyenyam.github.io');
		return false;
	}
};

if (CANHCAM_APP.MEGA_MENU) {
	$(document).ready(function () {
		$('header').addClass('mega-menu');
		$('header').addClass("mega-menu-col-" + CANHCAM_APP.MEGA_MENU_COL);
	});
}

$(document).ready(function () {

	$(".select2").select2({
		placeholder: "Select one"
	});

	$('.select2').on("select2:select", function (e) {
		var valSelect = $(e.currentTarget).val();
	});
	$('.select2').on("select2:unselect", function (e) {
		var valUnselect = $(e.currentTarget).val();
	});
});

function selectResset(e) {
	$(e).val(null).trigger("change", 0);
}
$(document).ready(function () {
	$('[data-toggle="validator"]').validator({
		feedback: {
			success: 'fa fa-check',
			error: 'fa fa-close'
		}
	}).on('submit', function (e) {
		if (e.isDefaultPrevented()) {
			$('[data-toggle="validator"]').find('select').parent('.form-group').addClass('has-danger');
		}
	});
	if ($('[data-toggle="validator"]').find('select').hasClass('has-success')) {
		this.removeClass('has-danger');
	}
	$(".canhcam-home-page .slider-lists").slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 5000,
		dots: true,
		arrows: false
	});
	$(".canhcam-product-page .slider-lists, .canhcam-about-page .slider-lists, .canhcam-contact-page .slider-lists, .canhcam-news-page .slider-lists").slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		dots: false,
		arrows: true
	});
});


;
$(function () {
	$('.counter').each(function () {
		var $this = $(this),
			countTo = $this.attr('data-count'),
			durationTo = parseInt($this.attr('data-duration'));
		$({
			countNum: $this.text()
		}).animate({
			countNum: countTo
		}, {
			duration: durationTo,
			easing: 'linear',
			step: function step() {
				$this.text(Math.floor(this.countNum));
			},
			complete: function complete() {
				$this.text(this.countNum);
			}
		});
	});

	if ($(window).width() < 767) {
		$('#filterSearch').addClass('collapse');
	} else {
		$('#filterSearch').removeClass('collapse');
	}

});

$(window).resize(function () {
	if ($(window).width() < 767) {
		$('#filterSearch').addClass('collapse');
	} else {
		$('#filterSearch').removeClass('collapse');
	}
});

$("#price").slider({
	formatter: function formatter(value) {
		return value;
	}
});

$("#price").on("slide", function (slideEvt) {
	$("#geVal").text(slideEvt.value);
});



function changeNewsItem() {
	if ($(window).width() > 767) {
		var geth = $('.canhcam-news-page .top-list .item:first-child figure').outerHeight();
		var countitem = $('.canhcam-news-page .part-list').find('.item').length;
		$('.canhcam-news-page .part-list .item figure').each(function () {
			$(this).css({
				'height': 'calc(' + geth / countitem + 'px - 1rem)'
			});
		});
	} else {
		$('.canhcam-news-page .part-list .item figure').each(function () {
			$(this).css({
				'height': 'initial'
			});
		});
	}
}

$(document).ready(function () {
	changeNewsItem();
	$('#searchbox .se').click(function (event) {
		event.preventDefault();
		$('#searchbox').toggleClass('active');
	});
	$('.news-list #list').click(function (event) {
		event.preventDefault();
		$(this).addClass('active');
		$('.news-list #grid').removeClass('active');
		$('#products').addClass('list-group-wrapper').removeClass('grid-group-wrapper');
	});
	$('.news-list #grid').click(function (event) {
		event.preventDefault();
		$(this).addClass('active');
		$('.news-list #list').removeClass('active');
		$('#products').removeClass('list-group-wrapper').addClass('grid-group-wrapper');
	});
	$(".canhcam-home-page .examples-slider").slick({
		slidesToShow: 3,
		slidesToScroll: 3,
		autoplay: true,
		dots: false,
		arrows: true,
		responsive: [{
			breakpoint: 991,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 2,
				dots: true,
				arrows: false
			}
		}, {
			breakpoint: 480,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1,
				dots: true,
				arrows: false
			}
		}]
	});
	$(".canhcam-home-page .customers-slider").slick({
		slidesToShow: 3,
		slidesToScroll: 3,
		autoplay: true,
		dots: false,
		arrows: true,
		responsive: [{
			breakpoint: 991,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 2,
				dots: true,
				arrows: false
			}
		}, {
			breakpoint: 480,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1,
				dots: true,
				arrows: false
			}
		}]
	});
	$(".product-relates-slider").slick({
		slidesToShow: 4,
		slidesToScroll: 4,
		autoplay: true,
		dots: false,
		arrows: true,
		responsive: [{
			breakpoint: 1140,
			settings: {
				slidesToShow: 3,
				slidesToScroll: 3,
				dots: false,
				arrows: true
			}
		}, {
			breakpoint: 768,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 2,
				dots: true,
				arrows: false
			}
		}, {
			breakpoint: 480,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1,
				dots: true,
				arrows: false
			}
		}]
	});
	$(".product-lists .menu-side-wrap .menu-side>li").on("click", function () {
		$(this).toggleClass("active")
	});
	if ($(window).width() < 992) {

		$(".product-lists .menu-side-wrap h2").on("click", function () {
			$(this).parent().find('.menu-side').slideToggle();
		});
	};



	$('.product-img .item a').fancybox({
		buttons: [
			"close"
		],
		'width': 860,
		'height': 860,
		'autoSize': false,
		afterShow: function buttonFancy() {
			var i = $(".fancybox-image-wrap").outerWidth(),
				t = (window.innerWidth - i) / 2;

			var g = $('.fancybox-image-wrap').innerHeight()
			h = ((window.innerHeight - g) / 2);
			console.log(g)
			$('.fancybox-button--arrow_left').css({
				'left': t,
				'display': 'block'
			});
			$('.fancybox-button--arrow_right').css({
				'right': t,
				'display': 'block'
			});
			$('.fancybox-toolbar').css({
				'right': t,
				'top': h,
			});
			$('.fancybox-button--close').css({
				'display': 'block'
			});
			$('.fancybox-infobar').css({
				'left': t,
				'top': h,
				'width': i,
				'display': 'block'
			})
		}
	})
});
// function buttonFancy(){
// 	var i = $(".fancybox-image-wrap").outerWidth(),
// 		t = (window.innerWidth - i) / 2;
// 	$('.fancybox-button--arrow_left').css({
// 		'left': t + 10
// 	}); $('.fancybox-button--arrow_right').css({
// 		'right': t + 10
// 	});
// }

$(window).resize(function () {
	changeNewsItem();
});


function changeIcon(e) {
	var getimg = e.find('img');
	if (getimg.attr('src').indexOf("active") > -1) {
		getimg.attr("src", getimg.attr('src').replace('-active.png', '.png'));
	} else {
		getimg.attr("src", getimg.attr('src').replace('.png', '-active.png'));
	}
}

// $('.covernav .nav-item').each(function () {
// 	if ($(this).hasClass("active")) {
// 		changeIcon($(this));
// 	}
// 	$(this).hover(function () {
// 		if (!$(this).hasClass("active")) {
// 			changeIcon($(this));
// 		}
// 	}, function () {
// 		if (!$(this).hasClass("active")) {
// 			changeIcon($(this));
// 		}
// 	});
// });
