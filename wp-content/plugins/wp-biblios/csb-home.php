<?php
//http://presscustomizr.com/snippet/three-techniques-to-alter-the-query-in-wordpress/
add_action( 'pre_get_posts', 'csb_home_query' );
function csb_home_query($query)
{
	if (!is_home()) return;
	//print_r($query); die();
	$query->query_vars['post_type'] = array('page', 'post', 'work');
	$query->query_vars['post__not_in'] = array(
		3, //works
		21, //users
	);
	$query->query_vars['posts_per_page'] = -1;
	$query->query_vars['orderby'] = 'ID';
}
?>
