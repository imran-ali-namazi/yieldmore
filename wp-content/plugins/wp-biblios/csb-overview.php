<?php
if (!isset($_GET['o'])) return;
class BibliosOverview
{
	function init()
	{
		if ($_GET['o'] == '1')
		{
			self::head('YieldMore.org - All Sites');
			self::multisite();
		}
		else if ($_GET['o'] == '2')
		{
			self::multisitedates(); die();
		}
		else
		{
			self::head(get_bloginfo( 'name' ) . ' - All Content');
			self::all();
		}
		die (PHP_EOL . '</body></html>');
	}

	function head($title)
	{
		echo '<html>
	<head><title>' . $title . '</title>
<style type="text/css">
body { font: 12pt Verdana; }
a { color: #713D44; text-decoration: none; }
h1 { font-size: 18pt; border: 1px solid #333; } h1 span { font-size: 15pt; margin-left: 30px; }
h1.deleted { background-color: #faa; }
#menu a { display: inline-block; padding: 8px; background-color: #71C176; color: #fff; font-weight: bold; }
#menu .selected { text-decoration: underline; color: #FFE793; }
</style>
	</head>
	<body>' . PHP_EOL;
	$sel = $_GET['o'] == 0 ? 'selected' : '';
	$all = $_GET['o'] == 1 ? 'selected' : '';
	echo '<div id="menu"><a href="/about/#splash">About YieldMore.org</a> / <a class="' . $sel . '" href="/?o=0">Sitemap (this)</a> / <a class="' . $all . '" href="http://yieldmore.org/?o=1">Sitemap</a> / <a href="http://yieldmore.org/?r=1">Redirects and Social Media Links</a></div>' . PHP_EOL;
	}

	function all()
	{
		echo '<br/>';
		self::pages();
		self::posts();
		echo '<br/>';
		self::works();
	}

	function multisite()
	{
		$sites = wp_get_sites();
		$editor = current_user_can('editor');
		foreach($sites as $site)
		{
			if ($site['deleted'] && $_GET['o'] != '2') continue;
			switch_to_blog($site['blog_id']);
			$ed = $editor ? sprintf(' <a href="http://%s/wp-admin/" target="_blank">Dashboard</a>', $site['domain']) : '';
			echo sprintf('<h1%s><a href="http://%s" target="_blank">%s</a> <span><a href="http://%s/?o=0" target="_blank">Overview</a>' . $ed . '</span></h1>', $site['deleted'] ? ' class="deleted"' : '', $site['domain'], get_bloginfo('name'), $site['domain']);
			if ($_GET['o'] == '1') {
				self::all();
			} else {
				$cats = get_categories('order=1&hierarchical=true');
				foreach($cats as $cat)
					echo sprintf('<a href="%s" target="_blank">%s</a> ' . PHP_EOL,
						get_category_link($cat->term_id), $cat->name);
			}
		}
	}

	function multisitedates()
	{
		$sites = wp_get_sites();
		$siteNames = array(
			1 => 'Root',
			2 => 'English',
			3 => 'Learn',
			4 => 'Heal',
			5 => 'Share',
			//6 => 'Recognize',
			//7 => 'Accredit',
			//8 => 'Stats',
			//9 => 'Less'
			10 => 'Directory'
		);
		echo 'Date Modified	Site - Id	Title	Description	Site	Type	Url';
		foreach($sites as $site)
		{
			$siteName = isset($siteNames[$site['blog_id']]) ? $siteNames[$site['blog_id']] : $site['domain'];
			switch_to_blog($site['blog_id']);
			$id = $site['blog_id'] . '-';
			$posts = get_posts(array('numberposts'=>20000,'orderby'=>'date',
				'post_type'=>array('post','page','forum','topic','work')));
			foreach($posts as $post)
			{
				echo PHP_EOL . sprintf('%s	\'%s	%s	%s	%s	%s	%s',
					date('d/m/Y', strtotime($post->post_date)), //date
					$id . $post->ID,
					$post->post_title,
					'[desc]',
					$siteName,
					strpos($post->post_content, '[work') === false ? 'Article' : 'Article / Text',
					get_permalink($post->ID)
				);
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
		echo '<b>Pages:</b> ' . $ed . implode(', ' . PHP_EOL, $op) . '<br/><br/>' . PHP_EOL;
	}

	function posts()
	{
		$cats = get_categories('orderby=name&hierarchical=true');
		$editor = current_user_can('editor');
		foreach($cats as $cat)
		{
			echo sprintf('<b><a href="%s" target="_blank">%s</a></b>: ' . PHP_EOL,
				get_category_link($cat->term_id), $cat->name);
			$posts = get_posts("orderby=name&order=ASC&numberposts=0&category=$cat->cat_ID");
			$op = array();
			foreach($posts as $post)
			{
				$ed = $editor ? sprintf(' <a href="%s" target="_blank">&hellip;</a>', get_edit_post_link($post->ID)) : '';
				$op[] = sprintf('  <a href="%s" target="_blank">%s</a>%s', 
get_permalink($post->ID), $post->post_title, $ed);
			}
			echo implode(', ' . PHP_EOL, $op) . '<br/>';
		}
	}

	function works()
	{
		$posts = get_posts('post_type=work&posts_per_page=-1');
		if (!count($posts)) return;

		echo '<b><a href="/works" target="_blank">Works</a></b>: ' . PHP_EOL;

		$op = array();
		foreach ($posts as $wk)
		{
			$id = $wk->ID;
			$name = $wk->post_title;
			$op[] = sprintf('<a href="%s" target="_blank">%s</a>', get_permalink($id), $name)
				. sprintf(' <a href="%s" target="_blank">&hellip;</a>', get_edit_post_link($id));
		}
		echo implode(', ' . PHP_EOL, $op) . '<br/>';
	}
}

if (function_exists('add_action'))
	add_action('init', array('BibliosOverview', 'init'));
else
	BibliosOverview::init();
?>
