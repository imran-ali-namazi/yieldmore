if (typeof($) == 'undefined') $ = jQuery.noConflict(); // added by Imran@cselian.com to use in wordpress

$(document).ready(function() {
	$('.footnote').click(function() {
		$id = '#note-' + $(this).attr('id');
		$($id).bPopup({follow: false, position: ['auto', $(window).scrollTop() + 80]});
	});
	$(".data-slide .item").first().show();
	$(".data-slide .prev").click(function() {
		$sel = $(".data-slide .item:visible");
		$sel.hide();
		$nxt = $sel.prev();
		if ($nxt.length == 0) $nxt = $(".data-slide .item:last");
		$nxt.show();
	});
	$(".data-slide .next").click(function() {
		$sel = $(".data-slide .item:visible");
		$sel.hide();
		$nxt = $sel.next();
		if ($nxt.length == 0) $nxt = $(".data-slide .item:first");
		$nxt.show();
	});
	$(".bookmark").click(function(e) {
		$url = $(this).attr('href');
		$('#bkurl').val($url);
		$('#frmBookmark').submit(); // TODO: ajax
		e.preventDefault();
	});
	if ($.ui && $.ui.accordion)
		$("#wrap-sidebar").accordion({header: 'div div h2', active: activeTab, heightStyle: 'content'});
	//if ($.fn.stick_in_parent)
	//	$("#wrap-left").stick_in_parent({enable_bottoming: false});
	$(".toolbar .icon-help, .splash-link").click(function(e){
		$('#info-body').bPopup({follow: false, position: ['auto', $(window).scrollTop() + 20]});
		e.preventDefault();
	});
	if (location.hash == '#info-link' || location.hash == '#splash') $(".splash-link").trigger('click');
	if (typeof showYMInfo != 'undefined')
	{
		if (document.cookie.indexOf('homeinfoshown') == -1)
		{
			$("#info-link").trigger('click');
			document.cookie = 'homeinfoshown';
		}
	}
	$('.toggle-version').click(function() {
		var input = $('input', $(this));
		var divs = $('div.' + input.data('version'));
		if (input.is(':checked')) divs.show(); else divs.hide();
	});
	if ($.prettyPhoto)
	$(".photos a").prettyPhoto({
		animation_speed:'normal',
		theme:'light_square',
		slideshow:3000,
		autoplay_slideshow: false,
		social_tools:''
	});
});
