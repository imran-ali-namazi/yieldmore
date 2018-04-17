$(document).ready(function() {
  $.hlPlayer = { el: $('#menu-highlights'), paused: false, toPause: false, index: -1, pausedByScroll: false };
  function isScrolledIntoView(el) {
    var rect = el.getBoundingClientRect();
    var elemTop = rect.top;
    var elemBottom = rect.bottom;

    // Only completely visible elements return true:
    var isVisible = (elemTop >= 0) && (elemBottom <= window.innerHeight);
    // Partially visible elements return true:
    //isVisible = elemTop < window.innerHeight && elemBottom >= 0;
    return isVisible;
  }
  if ($.hlPlayer.el.length) {
      $.hlPlayer.data = $('#top-menu a').filter(function() { return $(this).attr('data-highlight'); });
      $.hlPlayer.pauseButton = $('#omnibar .highlights .pause');
    //hl.html(hlData.html() + ' - ' + hlData.length);
    setInterval(function(){
      var isVisible = isScrolledIntoView($.hlPlayer.el[0]);
      if (!isVisible && !$.hlPlayer.pause) { 
        $.hlPlayer.pause = true;
        $.hlPlayer.pausedByScroll = true;
      } else if ($.hlPlayer.pausedByScroll && isVisible) {
        $.hlPlayer.pause = false;
        $.hlPlayer.pausedByScroll = false;
      }
      $.hlPlayer.pauseButton.html($.hlPlayer.pause ? '&raquo;' : '||');
      if ($.hlPlayer.pause) return;
      $.hlPlayer.all = false;
      $.hlPlayer.index++;
      if ($.hlPlayer.index > $.hlPlayer.data.length - 1) $.hlPlayer.index = 0;
      var itm = $($.hlPlayer.data[$.hlPlayer.index]);
      $.hlPlayer.el.html(($.hlPlayer.index + 1) + ' <a href="'+ itm.attr('href') +'"' + (itm.attr('target') ? ' target="_blank"' : '') + '><b class="' + (itm.find('svg').length ? 'top-level' : '') + '">' + itm.text() + '</b></a> - ' + itm.data('highlight'));
      if ($.hlPlayer.toPause) {
        $.hlPlayer.toPause = false;
        $.hlPlayer.pause = true;
      }
    }, 1000);
    $.hlPlayer.el.on('hover', function() { $.hlPlayer.pause = true; })
      .on('mouseout', function() { if (!$.hlPlayer.all) $.hlPlayer.pause = false; });
  }
  $('#omnibar .highlights span').click(function() {
    var action = $(this).attr('data-action');
    if (action == 'prev' || action == 'next') {
      if (action == 'prev')
        $.hlPlayer.index = ($.hlPlayer.index == 0 ? $.hlPlayer.data.length : $.hlPlayer.index) - 2;

      $.hlPlayer.pause = false;
      $.hlPlayer.toPause = true;
    }
    else if (action == 'pause') {
      $.hlPlayer.pause = !$.hlPlayer.pause;
    } else if (action == 'all') {
      $.hlPlayer.pause = true;
      $.hlPlayer.all = true;
      var all = [];
      $.each($.hlPlayer.data, function(ix, itm) { itm = $(itm); all.push((ix + 1) + ' <a href="'+ itm.attr('href') +'"' + (itm.attr('target') ? ' target="_blank"' : '') + '><b class="' + (itm.find('svg').length ? 'top-level' : '') + '">' + itm.text() + '</b></a> - ' + itm.data('highlight')); });
      $.hlPlayer.el.html('<br/>' + all.join('<br/>\r\n'));
    }
  });

  if (location.hash == '#highlights')
    $('#omnibar .highlights span.all').trigger('click');
  $('.highlights-link').click(function(){
    $('#omnibar .highlights span.all').trigger('click');
  });

  $('.toolbar span, .toolbar-button').click(function(){
    var el = $(this);

    if (el.hasClass('icon-toolbar')) {
      el.siblings().toggle();
      if (el.siblings().first().is(':visible')) $('.toolbar span').css('display', 'inline-block');
      return;
    }

    if (el.attr('data-toggle'))  $(el.attr('data-toggle')).toggle();
    if (el.attr('data-scroll')) $(el.attr('data-scroll'))[0].scrollIntoView();
    if (el.attr('data-show'))  $(el.attr('data-show')).toggle();
    if (el.attr('data-focus'))  $(el.attr('data-focus')).focus();
  });
  $('.icon-toolbar').trigger('click');
});
