// sets scroll function of nav bar
$(document).ready(function () {
    var scroll_start = 0;
    var startchange = $('.uiStart');
    var offset = startchange.offset();
    if (startchange.length) {
        $(document).scroll(function () {
            scroll_start = $(this).scrollTop();
            if (scroll_start > offset.top) {
                $('nav.navbar-static-top').removeClass('navbar-static-top').addClass('navbar-fixed-top');
            } else {
                $('nav.navbar-fixed-top').removeClass('navbar-fixed-top').addClass('navbar-static-top');
            }
        });
    }
});