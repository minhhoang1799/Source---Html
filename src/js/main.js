const App = {
	InitLazyLoad: () => {
		return new LazyLoad({
			elements_selector: ".lazyload"
		});
	}
}

function height(el) {
	var height = 0;
	$(el).each(function () {
		var thisHeight = $(this).height();
		if (thisHeight > height) {
			height = thisHeight;
		}
		setTimeout(() => {
			$(el).height(height)
		}, 100)
	})
}
let header = {
	scrollActive: function () {
		let height = $('header').height()
		if ($(window).scrollTop() > height) {
			$('header').addClass('active')
		} else {
			$('header').removeClass('active')
		}
	},
}

function setBackgroundElement() {
	$('[setBackground]').each(function () {
		var background = $(this).attr('setBackground')
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-size": "cover",
			"background-position": "center center"
		})
	})
	$('[setBackgroundRepeat]').each(function () {
		var background = $(this).attr('setBackgroundRepeat')
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-repeat": "repeat"
		})
	})
}

function mappingMenu() {
	$('header .bottom-wrapper .list-main-menu').mapping({
		mobileWrapper: 'header .mobile-wrap',
		mobileMethod: 'appendTo',
		desktopWrapper: 'header .bottom-wrapper .right-wrap .main-account',
		desktopMethod: 'insertBefore',
		breakpoint: 1025
	})
}

function menuMobile() {
	$('header .button-hambuger').on('click', function () {
		if ($('header .button-hambuger .burger-bt-inner span').css('opacity') == 1) {
			$('header .button-hambuger').addClass('close')
			$('header .mobile-wrap').addClass('active')
		} else if ($('header .button-hambuger .burger-bt-inner span').css('opacity') == 0) {
			$('header .button-hambuger').removeClass('close')
			$('header .mobile-wrap').removeClass('active')
		}
	})
}

function bannerHomeSlide() {
	
}

function fancyboxModal() {
	$(".btn-open-newsfancybox").click(function (e) {
		console.log(1)
		e.preventDefault();
		$.fancybox.open({
			src: '#modal',
			type: 'inline',
			opts: {
				afterShow: function (instance, current) {
					$(".fancybox-is-open").appendTo("main");
				}
			}
		});
		return false;
	});
}
$(document).on('scroll', function () {
	header.scrollActive()
})
$(document).ready(function () {
	// lazyload
	// App.InitLazyLoad()
	
	// menu
	// mappingMenu()
	// menuMobile()

	// set background
	// setBackgroundElement()

	// fancyboxModal
	// fancyboxModal()
	// cropImage()

	// swiper
	bannerHomeSlide()
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 3,
		slidesPerColumn: 2,
		spaceBetween: 30,
		slidesPerColumnFill: "row",
		pagination: {
		  el: '.swiper-pagination',
		  clickable: true,
		},
	  });
})

function cropImage() {
	// vars
	let result = document.querySelector('.result'),
		img_result = document.querySelector('.img-result'),
		img_w = document.querySelector('.img-w'),
		img_h = document.querySelector('.img-h'),
		options = document.querySelector('.options'),
		save = document.querySelector('.save'),
		cropped = document.querySelector('.cropped'),
		dwn = document.querySelector('.download'),
		upload = document.querySelector('#file-input'),
		cropper = '';

	// on change show image with crop options
	upload.addEventListener('change', (e) => {
		if (e.target.files.length) {
			// start file reader
			const reader = new FileReader();
			reader.onload = (e) => {
				if (e.target.result) {
					// create new image
					let img = document.createElement('img');
					img.id = 'image';
					img.src = e.target.result
					// clean result before
					result.innerHTML = '';
					// append new image
					result.appendChild(img);
					// show save btn and options
					save.classList.remove('hide');
					options.classList.remove('hide');
					// init cropper
					cropper = new Cropper(img);
				}
			};
			reader.readAsDataURL(e.target.files[0]);
		}
	});

	// save on click
	save.addEventListener('click', (e) => {
		e.preventDefault();
		// get result to data uri
		let imgSrc = cropper.getCroppedCanvas({
			width: img_w.value // input value
		}).toDataURL();
		// remove hide class of img
		cropped.classList.remove('hide');
		img_result.classList.remove('hide');
		// show image cropped
		cropped.src = imgSrc;
		dwn.classList.remove('hide');
		dwn.download = 'imagename.png';
		dwn.setAttribute('href', imgSrc);
	});
}

