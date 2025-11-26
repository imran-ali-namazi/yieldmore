$(document).ready(function(){
	var $postShown, $postIndex, $postCount, $posts;
	$('.post-thumbnails .post-thumb a').click(function(e){
		if (!$(this).parent().hasClass('post-format'))
			e.preventDefault();
	});
	$('.post-thumbnails .post-thumb').click(function(e){
		$('#post-preview-content').html($(this).html());
		$postShown = $(this);
		$posts = $('.post-thumbnails .post-thumb');
		$postCount = $posts.length;
		$postIndex = $posts.index($(this)) + 1;
		$('#post-preview-index').html($postIndex + ' of ' + $postCount);
		$('#post-preview').bPopup({follow: false, position: ['auto', $(window).scrollTop() + 20]});
	});
	if ($('.post-thumbnails #post-1').length == 0) $('#post-preview-about').hide();
	if ($('.site-1').length == 0 || $('.post-thumbnails #post-3').length == 0) $('#post-preview-works').hide();
	$('#post-preview .nav').click(function(e){
		$id = $(this).attr('id');
		if ($id == 'post-preview-close')
		{
			$('#post-preview').bPopup().close();
			return;
		}
		else if ($id == 'post-preview-about')
		{
			$('.post-thumbnails #post-1').trigger('click');
			return;
		}
		else if ($id == 'post-preview-works')
		{
			$('.post-thumbnails #post-3').trigger('click');
			return;
		}

		if ($id == 'post-preview-next') {
			$next = $postShown.next('.post-thumb');
			$postIndex += 1;
			if ($next.length == 0) {
				$next = $('.post-thumbnails .post-thumb').first();
				$postIndex = 1;
			}
		} else {
			$next = $postShown.prev('.post-thumb');
			$postIndex -= 1;
			if ($next.length == 0) {
				$next = $('.post-thumbnails .post-thumb').last();
				$postIndex = $postCount;
			}
		}
		$('#post-preview-content').html($next.html());
		$postShown = $next;
		$('#post-preview-index').html($postIndex + ' of ' + $postCount);
		$('#post-preview').bPopup({follow: true});
		//$('#post-preview-content').tinyscrollbar();
	});
})
