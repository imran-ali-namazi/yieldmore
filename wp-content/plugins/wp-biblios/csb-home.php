<?php
//http://presscustomizr.com/snippet/three-techniques-to-alter-the-query-in-wordpress/
add_action( 'pre_get_posts', 'csb_home_query' );
function csb_home_query($query)
{
	if (!is_home()) return;
	//print_r($query); die();
	if (get_current_blog_id() != 1 && cs_var('csb_home_query')) return;
	$query->query_vars['post_type'] = array('page', 'post', 'work');

	$exclude = array(
		1 => array(21), //Root: users
		3 => array(2), //Learn: users
	);
	if (isset($exclude[get_current_blog_id()]))
		$query->query_vars['post__not_in'] = $exclude[get_current_blog_id()];

	$query->query_vars['posts_per_page'] = -1;
	$query->query_vars['orderby'] = 'ID';
	cs_var('csb_home_query', true);
}

add_action('widget_categories_args', 'csb_categories');
function csb_categories($args)
{
	if (get_current_blog_id() != 1) return;
	if (!cs_var('csb_categories')) //first
		$args['exclude'] = 27; //to exclude all children of 27, hierarchical must be set to true
	else
		$args['child_of'] = 27;
	cs_var('csb_categories', true);
	return $args;
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
