if (typeof($) == 'undefined') $ = jQuery.noConflict(); // added by Imran@cselian.com to use in wordpress

$(document).ready(function() {
	$(window).trigger('resize');
});

$.doTabberInit = true;
$(window).resize(function() {
  if ($.doTabberInit)
  {
    $.doTabberInit = false;
    setTimeout(tabberInit, 2000);
    return;
  }

  if ($(window).width() < 1000)
    $('#wrap-left').css('height', $('#wrap-header').height() + $('#wrap-sidebar').height());
  else 
    $('#wrap-left').css('height', $(window).height() - 60); //leave out footer
  var biggerHeight = $('#wrap-left').height() > $('#wrap-content').height() ? $('#wrap-left').height() : $('#wrap-content').height();
  $('#wrap-footer').show().css('top', biggerHeight + 60);
  $('body').height(biggerHeight + 60);
});
function tabberInit()
{
	$(window).trigger('resize');
}
