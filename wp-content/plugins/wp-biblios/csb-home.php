<?php
//http://presscustomizr.com/snippet/three-techniques-to-alter-the-query-in-wordpress/
add_action( 'pre_get_posts', 'csb_home_query' );
function csb_home_query($query)
{
	if (!is_home()) return;
	//print_r($query); die();
	$query->query_vars['post_type'] = array('page', 'post', 'work');
	$query->query_vars['post__not_in'] = array(
		//3, //works
		21, //users
	);
	$query->query_vars['posts_per_page'] = -1;
	$query->query_vars['orderby'] = 'ID';
}

//http://wordpress.stackexchange.com/a/170640
function highlight_results($text)
{
	if(is_search() && !is_admin())
	{
		$keys = implode('|', explode(' ', get_search_query()));
		$r = '<span class="match">\0</span>';

		if (stripos($text, '[info]') === false) {
			$text = preg_replace('/(' . $keys .')/iu', $r, $text);
		} else {
			$top = substr($text, 0, stripos($text, '[/info]')) . '[/info]';
			$bot = substr($text, strlen($top));
			$bot = preg_replace('/(' . $keys .')/iu', $r, $bot);
			$text = $top . $bot;
		}
	}
	return $text;
}
add_filter('the_content', 'highlight_results');
add_filter('the_title', 'highlight_results');

?>
