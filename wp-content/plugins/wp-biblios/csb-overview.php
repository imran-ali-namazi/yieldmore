<?php
if (!isset($_GET['o'])) return;
class BibliosOverview
{
	function init()
	{
		if ($_GET['o'] == 'msall')
		{
			self::head('YieldMore.org - All Sites');
			self::multisite();
		}
		else
		{
			self::head(get_bloginfo( 'name' ) . ' - All Content');
			self::all();
		}
		die ('</body></html>');
	}

	function head($title)
	{
		echo '<html>
	<head><title>' . $title . '</title>
<style type="text/css">
body { font: 12pt Verdana; }
a { color: #713D44; text-decoration: none; }
h1 { font-size: 18pt; } h1 span { font-size: 15pt; margin-left: 30px; }
</style>
	</head>
	<body>' . PHP_EOL;
	}

	function all()
	{
		self::pages();
		self::posts();
		self::forums();
	}

	function multisite()
	{
		$sites = wp_get_sites();
		$editor = current_user_can('editor');
		foreach($sites as $site)
		{
			switch_to_blog($site['blog_id']);
			$ed = $editor ? sprintf(' <a href="%s/wp-admin/" target="_blank">Dashboard</a>', $site['domain']) : '';
			echo sprintf('<h1><a href="http://%s" target="_blank">%s</a> <span><a href="http://%s/?o=1" target="_blank">Overview</a>' . $ed . '</span></h1>', $site['domain'], get_bloginfo('name'), $site['domain']);
			if ($_GET['o'] == 'msall') {
				self::all();
			} else {
				$cats = get_categories('order=1&hierarchical=true');
				foreach($cats as $cat)
					echo sprintf('<a href="%s" target="_blank">%s</a> ' . PHP_EOL,
						get_category_link($cat->term_id), $cat->name);
			}
		}
	}

	function pages()
	{
		$pages = get_pages();
		$editor = current_user_can('editor');
		$op = array();
		foreach($pages as $p)
		{
			$ed = $editor ? sprintf(' <a href="%s" target="_blank">&hellip;</a>', get_edit_post_link($p->ID)) : '';
			$op[] = sprintf('<a href="%s" target="_blank">%s</a>%s',
				get_page_link($p->ID), $p->post_title, $ed);
		}
		$ed = $editor ? sprintf('<a href="%s" target="_blank">edit</a> / ', site_url('/wp-admin/edit.php?post_type=page')) : '';
		echo '<b>Pages:</b> ' . $ed . implode(', ' . PHP_EOL, $op) . '<br/>' . PHP_EOL;
	}

	function posts()
	{
		$cats = get_categories('order=1&hierarchical=true');
		$editor = current_user_can('editor');
		foreach($cats as $cat)
		{
			echo sprintf('<b><a href="%s" target="_blank">%s</a></b>: ' . PHP_EOL,
				get_category_link($cat->term_id), $cat->name);
			$posts = get_posts("numberposts=0&category=$cat->cat_ID");
			foreach($posts as $post)
			{
				$ed = $editor ? sprintf(' <a href="%s" target="_blank">&hellip;</a>', get_edit_post_link($post->ID)) : '';
				echo sprintf('  <a href="%s" target="_blank">%s</a>%s' . PHP_EOL, 
get_permalink($post->ID), $post->post_title, $ed);
			}
			echo '<br/>';
		}
	}

	function forums()
	{
		echo '<b>Forums:</b> ';
		$query = new WP_Query( array( //from bbpress\includes\common\widgets.php
			'post_type'           => bbp_get_forum_post_type(),
			//'post_parent'         => $settings['parent_forum'],
			'post_status'         => bbp_get_public_status_id(),
			'posts_per_page'      => get_option( '_bbp_forums_per_page', 50 ),
			'ignore_sticky_posts' => true,
			'no_found_rows'       => true,
			'orderby'             => 'menu_order title',
			'order'               => 'ASC'
		) );
		if ($query->post_count == 0) echo 'None';
		while ( $query->have_posts() ) {
			$query->the_post();
			echo '<br/><a href="'; bbp_forum_permalink($query->post->ID);
			echo '">'; bbp_forum_title($query->post->ID);
			echo '</a> ';
			
			//from bbpress\includes\topics\template.php
			$topic_query = new WP_Query();
			$topic_query->query_vars['post_type'] = bbp_get_topic_post_type();
			$topic_query->in_the_loop             = true;
			$topic_query->post                    = get_post( $query->post->ID );
			//echo do_shortcode('[bbp-single-topic id=' . $query->post->ID . ']');
			while ( $topic_query->have_posts() ) {
				$topic_query->the_post();
				echo '<a href="'; bbp_topic_permalink($topic_query->post->ID);
				echo '">'; bbp_topic_title($topic_query->post->ID);
				echo '</a> ';
			}
		}
	}
}
add_action('init', array('BibliosOverview', 'init'));
?>