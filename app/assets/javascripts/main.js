var browserW = $(window).width();
	browserH = $(window).height();
	headerH = $('.header').height();
var aboutTop;
var menuTop;
var eventTop;
var faqTop;
var contactTop;

$(document).ready(function(){
	$('body').transition({'opacity' : '1'}, 2000);

	$(document).foundation();
	assignSectionH();
	faqSlide();
	mobile_nav();

	$('ul.mainnav li, ul.mobile_topmenu li, .btn_down').click(function(){
		$('.toggle').removeClass('active');
		$('ul.mobile_topmenu').fadeOut('slow');

		var thisNum = $(this).attr('rel');
			aboutTop = $('.about').position().top;
			menuTop = $('.menu').position().top;
			eventTop = $('.event').position().top;
			faqTop = $('.faq').position().top;
			contactTop = $('.contact').position().top;

		switch(thisNum){
			case '1':
				$('body, html').animate({scrollTop: aboutTop}, 1000, 'easeOutQuart');
			break;
			case '2':
				$('body, html').animate({scrollTop: menuTop}, 1000, 'easeOutQuart');
			break;
			case '3':
				$('body, html').animate({scrollTop: eventTop}, 1000, 'easeOutQuart');
			break;
			case '4':
				$('body, html').animate({scrollTop: faqTop}, 1000, 'easeOutQuart');
			break;
			case '5':
				$('body, html').animate({scrollTop: contactTop}, 1000, 'easeOutQuart');
			break;
		}
	});
	/*$('ul.mobile_topmenu li').click(function(){
		$("ul.mobile_topmenu").stop().slideUp("slow");
	});*/

	$(window).scroll(function() {
		var scrollPos = $(document).scrollTop();
		$('ul.mainnav li').removeClass('active');
        if(scrollPos >= aboutTop && scrollPos < menuTop){
			//console.log('about');
			$('ul.mainnav li#btn_about').addClass('active');
		}else if(scrollPos >= menuTop && scrollPos < eventTop){
			//console.log('projects');
			$('ul.mainnav li#btn_menu').addClass('active');
		}else if(scrollPos >= eventTop && scrollPos < faqTop){
			//console.log('event');
			$('ul.mainnav li#btn_event').addClass('active');
		}else if(scrollPos >= faqTop && scrollPos < contactTop){
			//console.log('faq');
			$('ul.mainnav li#btn_faq').addClass('active');
		}else if(scrollPos >= contactTop){
			//console.log('contact');
			$('ul.mainnav li#btn_contact').addClass('active');
		}
	});

	$('.logo').click(function(){
		$('body, html').animate({scrollTop: 0}, 1000, 'easeOutQuart');
		$('ul.mainnav li').eq(1).addClass('active');
	});

	$(window).resize(function(){
		assignSectionH();
	});
	//clearing bug fix
	var clearing = $('.clearing-thumbs');
	    header =$('.header');
	    about =$('.about');

	$('a', clearing).click(function() {
	   
	    header.css('z-index', 80);
	    about.css('z-index', 80);
	});

	$('.clearing-close').click(function() {
	     header.css('z-index', 500);
	     about.css('z-index', 110);
	});


});

function assignSectionH(){
	var browserH = $(window).height(); 
	var sectionH = browserH - headerH;
	$('.container section').css({'min-height' : sectionH});
}
function btnDown(){
	$('.btn_down').animate({y: '-10px'}, 500).transition({y: '0px'}, 500, btnDown);
}
function faqSlide(){
	$('.question').click(function(){
		if($(this).find('.btn_faqOpen').hasClass('active')){
			$(this).find('.btn_faqOpen').removeClass('active');
		}else{
			$(this).find('.btn_faqOpen').addClass('active');
		}

		$(this).parent().find('.answer').slideToggle('slow', function() {
		});
	});
}


function mobile_nav(){
	$('.toggle').click(function () {
		$(this).toggleClass("active");
		$("ul.mobile_topmenu").stop().slideToggle("slow");
	});
}


