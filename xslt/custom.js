"use strict";
var siteRoot = "";
$(document).ready(function () {
	CollectionsApp.init();
});
var CollectionsApp = {
	loadWaiting: false,
	init: function () {
		this.loadWaiting = false;
		if ($("body").hasClass("product-detail-page")) {
			$(".collections-template-list").remove();
		} else {
			if ($(".collections-template-list").length > 0) {
				$(".collections-template-list").show();
				$(".product-lists").remove();
			}
		}
	},

	setLoadWaiting: function (display) {
		this.loadWaiting = display;
	},
	setupScriptAfterLoadAjax: function () {
		$('.collections-template-detail .main-slick .slick-wrapper').slick();
		$('.collections-template-detail .tabslet').tabslet();
		let buttonViewMore = $('.the-workshop-product-2 .main-product-bottom .view-more');
		buttonViewMore.on('click', function () {
			// console.log(1);
			$(this).prev('.full-content').toggleClass('active');
			$(this).slideUp();
		})
		let heightFull = $('.the-workshop-product-2 .main-product-bottom .tabslet-content .full-content').outerHeight()
		if (heightFull <= 450) {
			buttonViewMore.hide()
		}
	},
	getCollectionsDetailAndChangeTemplate: function ($button, $event) {
		$event.preventDefault();
		CollectionsApp.changeLayoutCollectionDetail();
		CollectionsApp.getCollectionsDetail($button, $event);
		return;
	},
	getCollectionsDetail: function ($button, $event) {
		$($button).parents(".product-item").addClass("active");
		$event.preventDefault();
		let pageurl = $($button).attr("href");
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);
		$.ajax({
			url: pageurl,
			success: function (data) {
				let htmlDetail = $(data).find('.product-detail-page-2').html();
				$(".collections-template-detail .product-detail-page-1").html(htmlDetail);
				CollectionsApp.setupScriptAfterLoadAjax();
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure
		});
		return;
	},
	changeLayoutCollectionDetail: function () {
		$(".collections-template-list").hide(300);
		$(".collections-template-detail").show(600);
	},
	resetLoadWaiting: function () {
		CollectionsApp.setLoadWaiting(false);
	},

	ajaxFailure: function () {
		alert('Failed to process checkout. Please refresh the page and try one more time.');
	}
}
