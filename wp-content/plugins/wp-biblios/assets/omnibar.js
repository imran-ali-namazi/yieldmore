$(document).ready(function() {
  $.hlPlayer = { el: $('#menu-highlights'), paused: false, toPause: false, index: -1 };
  if ($.hlPlayer.el.length) {
      $.hlPlayer.data = $('#top-menu a').filter(function() { return $(this).attr('data-highlight'); });
      $.hlPlayer.pauseButton = $('#omnibar .highlights .pause');
    //hl.html(hlData.html() + ' - ' + hlData.length);
    setInterval(function(){
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
    $.hlPlayer.el.on('hover', function() { $.hlPlayer.pause = true; }).on('mouseout', function() { if (!$.hlPlayer.all) $.hlPlayer.pause = false; });
  }
  $('#omnibar .highlights span').click(function(){
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

  $('#omnibar .toolbar span').click(function(){
    var el = $(this);
    if (el.attr('data-scroll')) $(el.attr('data-scroll'))[0].scrollIntoView();
    if (el.attr('data-focus'))  $(el.attr('data-focus')).focus();
  });
});
