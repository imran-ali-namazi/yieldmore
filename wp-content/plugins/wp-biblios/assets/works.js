if (typeof($) == 'undefined') $ = jQuery.noConflict(); // added by Imran@cselian.com to use in wordpress

$(document).ready(function() {
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
	$(window).trigger('resize');

	if (typeof $.ui.accordion === 'function')
		$("#wrap-sidebar").accordion({header: 'div div h2', active: activeTab, heightStyle: 'content'});
	$("#wrap-left").stick_in_parent();
});

$.doTabberInit = true;
$(window).resize(function() {
  if ($.doTabberInit)
  {
    $.doTabberInit = false;
    setTimeout(tabberInit, 2000);
    return;
  }

  var biggerHeight = $('#wrap-left').height() > $('#wrap-content').height() ? $('#wrap-left').height() : $('#wrap-content').height();
  $('#wrap-footer').show().css('top', biggerHeight + 60);
  $('body').height(biggerHeight);
});
function tabberInit()
{
	$(window).trigger('resize');
}
