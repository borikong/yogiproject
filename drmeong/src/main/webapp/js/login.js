function wrapWindowByMask(){
        // 화면의 높이와 너비를 변수로 만듭니다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
        // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
        $('.mask').fadeIn(0);
        $('.mask').fadeTo("slow",0.8);
 
    
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
 
      
        $('.window').css({'left':left,'top':top, 'position':'absolute'});
 
       
        $('.window').show();
    }
 
    $(document).ready(function(){
       
       /*$('.btn').click(function(e){
    
            e.preventDefault();
            wrapWindowByMask();
        });
 
     
        $('.window .close').click(function (e) {
            e.preventDefault();
            $('.mask, .window').hide();
        });*/
 
   
        $('.mask').click(function () {
            $(this).hide();
            $('.window').hide();
        });
    });




$("#sidebar-toggle").click(function(){
  $("html").toggleClass("open");
});

$("#sidebar-close").click(function(){
  $("html").toggleClass("open");
});