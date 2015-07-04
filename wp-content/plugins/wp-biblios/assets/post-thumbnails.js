$(document).ready(function(){
	var $postShown, $postIndex, $postCount, $posts;
	$('.post-thumbnails .post').click(function(e){
		$('#post-preview-content').html($(this).html());
		$postShown = $(this);
		$posts = $('.post-thumbnails .post');
		$postCount = $posts.length;
		$postIndex = $posts.index($(this)) + 1;
		$('#post-preview-index').html($postIndex + ' of ' + $postCount);
		$('#post-preview').bPopup({scrollBar: true});
		//$('#post-preview-content').tinyscrollbar();
	});
	$('#post-preview .nav').click(function(e){
		if ($(this).attr('id') == 'post-preview-close')
		{
			$('#post-preview').bPopup().close();
			return;
		}

		if ($(this).attr('id') == 'post-preview-next') {
			$next = $postShown.next('.post');
			$postIndex += 1;
			if ($next.length == 0) {
				$next = $('.post-thumbnails .post').first();
				$postIndex = 1;
			}
		} else {
			$next = $postShown.prev('.post');
			$postIndex -= 1;
			if ($next.length == 0) {
				$next = $('.post-thumbnails .post').last();
				$postIndex = $postCount;
			}
		}
		$('#post-preview-content').html($next.html());
		$postShown = $next;
		$('#post-preview-index').html($postIndex + ' of ' + $postCount);
		$('#post-preview').bPopup({scrollBar: true});
		//$('#post-preview-content').tinyscrollbar();
	});
})
