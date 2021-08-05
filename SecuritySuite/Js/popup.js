$(document).ready(function () {

    var $box = $('.box');

    $('.metro li ').each(function () {
        var test = this.toString() + ".aspx";
        var color = $(this).css('backgroundColor');
        var content2 = $(this).html();
        var page = $(this).find('span').text();
        var content = "<iframe src='//alice/securitysuite/PopupMenus/" + page + ".html' runat='server' style='border:none' width='860 px' height='80%'></iframe>";
        
        $(this).click(function () {
            $box.css('backgroundColor', color);
            $box.addClass('open');
            $box.find('p').html(content2);
            $box.find('div').html(content);
        });

        $('.close').click(function () {
            $box.removeClass('open');
            $box.css('backgroundColor', 'transparent');
        });

    });

});