$(document).ready(function () {
	showFullContent();
})


function showFullContent() {
	let buttonViewMore = $('.the-workshop-product-2 .main-product-bottom .view-more')
	buttonViewMore.on('click', function () {
		console.log(1);
		$(this).prev('.full-content').toggleClass('active')
		$(this).slideUp();
	})
}
