"use strict";
var siteRoot = "";
var CollectionsApp = {
	loadWaiting: false,
	init: function (usepopupnotifications) {
		this.loadWaiting = false;
	},

	setLoadWaiting: function (display) {
		this.loadWaiting = display;
	},
	setupScriptAfterLoadAjax: function () {
		$('.collections-template-detail .main-slick .slick-wrapper').slick();
		$('.collections-template-detail .tabslet').tabslet();
		let buttonViewMore = $('.the-workshop-product-2 .main-product-bottom .view-more');
		buttonViewMore.on('click', function () {
			console.log(1);
			$(this).prev('.full-content').toggleClass('active');
			$(this).slideUp();
		})
	},
	getCollectionsDetailAndChangeTemplate: function ($button, $event) {
		$event.preventDefault();
		CollectionsApp.changeLayoutCollectionDetail();
		CollectionsApp.getCollectionsDetail($button, $event);
		return;
	},
	getCollectionsDetail: function ($button, $event) {
		$event.preventDefault();
		let pageurl = $($button).attr("href");
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);
		$.ajax({
			url: pageurl,
			success: function (data) {
				let htmlDetail = $(data).find('.product-detail-page').html();
				$(".collections-template-detail .product-detail-page").html(htmlDetail);
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
