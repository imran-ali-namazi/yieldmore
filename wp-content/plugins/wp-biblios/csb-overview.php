<?php
if (!isset($_GET['o'])) return;
class BibliosOverview
{
	function init()
	{
		if ($_GET['o'] == 'all')
		{
			self::head(get_bloginfo( 'name' ) . ' - All Content');
			self::all();
		}
		else
		{
			self::head('YieldMore.org - All Sites');
			self::multisite();
		}
		die ('</body></html>');
	}

	function head($title)
	{
		echo '<html>
	<head><title>' . $title . '</title></head>
	<body>' . PHP_EOL;
	}

	function all()
	{
		self::pages();
	}
	
	function multisite()
	{
		$sites = wp_get_sites();
		$editor = current_user_can('editor');
		foreach($sites as $site)
		{
			//print_r($site);
			//print_r(gettype($site->blog_id)); die();
			switch_to_blog($site['blog_id']);
			$ed = $editor ? sprintf(' <a href="%s/wp-admin/" target="_blank">dashboard</a>', $site['domain']) : '';
			echo sprintf('<h1><a href="http://%s" target="_blank">%s</a> <a href="%s/?o=pages" target="_blank">Page List</a>' . $ed . '</h1>', $site['domain'], get_bloginfo('name'), $site['domain']);
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
}
add_action('init', array('BibliosOverview', 'init'));
?>