function HomeNewsAjax() {
    $("body").on("click", ".home-4 .heading-wrapper .tab-wrapper ul li a", function () {
        $(".home-4 .heading-wrapper .tab-wrapper ul li").removeClass("active"), $(this).parent().addClass("active");
        var e = $(this).attr("data-page");
        $.ajax({
            url: e,
            type: "POST",
            data: {
                isajax: !0
            },
            success: function (e) {
                $(".home-4 .list-item-wrapper").remove(), $(".home-4 .container").append($(e).find(".list-item-wrapper"))
            }
        })
    })
}
// daihy