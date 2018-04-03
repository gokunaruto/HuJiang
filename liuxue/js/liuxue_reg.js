//
$(function(){
    
    var reg = {
        load:function(){
            var $window = $(window),
            window_width = $window.width();
            $('#js_banner, #js_banner_img li').width(window_width);
            new $.Tab({
                target: $('#js_banner_img li'),
                effect: 'slide3d',
                animateTime: 1000,
                stay: 3500,
                autoPlay: true,
                merge: true,
                prevBtn: $('#js_banner_pre'),
                nextBtn: $('#js_banner_next')
            });
        },
        init:function(){
            reg.load();
        }
    }
    reg.init();
});
