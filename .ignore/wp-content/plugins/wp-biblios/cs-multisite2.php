<?php
function cs_pre_wp_nav_menu2($args) {
	$id = get_current_blog_id();
	$sites = wp_get_sites();
	$editor = current_user_can('editor');

	$down = '<svg class="icon icon-angle-down" aria-hidden="true" role="img"> <use href="#icon-angle-down" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-angle-down"></use></svg>';
	
	$r = '<div class="menu-topmenu-container"><ul id="top-menu" class="menu">';

	$so = []; $site;
	foreach($sites as $s)
	{
		if ($s['deleted'] || $s['path'] == '/i/') continue;
		switch_to_blog($s['blog_id']);
		if ($id == $s['blog_id']) { $s['name'] = get_bloginfo('name'); $site = $s; }
		$so[$s['path']] = sprintf('<li%s><a href="http://legacy.yieldmore.org%s">%s, <small>%s</small></a></li>',
			$id == $s['blog_id'] ? ' class="current-menu-item"' : '', $s['path'], get_bloginfo('name'), get_bloginfo('description'));
	}
	sort($so);
	$r .= '<li class="menu-item menu-item-has-children"><a href="http://legacy.yieldmore.org'.$site['path'].'">SITE: ' . $site['name'] . $down . '</a><ul class="sub-menu">';
	$r .= implode(PHP_EOL, $so);
	$r .= '</ul></li>';

	switch_to_blog($id);

	global $post;
	$cid = is_home() || is_front_page() ? false : get_query_var('cat');
	if (!$cid && $post && $post->ID && $cid !== false) $cid = get_the_category()[0]->term_id;

	$cats = get_categories();

	$so = []; $category;
	foreach($cats as $c)
	{
		if ( $cid == $c->term_id) { $category = $c; $c->link = get_category_link($c->term_id); }
		$so[] .= sprintf('<li%s><a href="%s">%s</a></li>' . PHP_EOL, $cid == $c->term_id ? ' class="current-menu-item"' : '', get_category_link($c->term_id), $c->name);
	}
	$r .= '<li class="menu-item-has-children"><a href="' . ($category ? $category->link : '') . '">CATEGORY: ' . ($category ? $category->name : 'Home') . $down . '</a><ul class="sub-menu">';
	$r .= implode(PHP_EOL, $so);
	$r .= '</ul></li>';

	$posts = get_posts($cid ? array('numberposts' => -1, 'category' => $cid) : array('numberposts' => 10));
	$r .= '<li class="menu-item-has-children"><a href="/">POSTS' . $down . '</a><ul class="sub-menu">';
	foreach($posts as $p) $r .= sprintf('<li><a href="%s">%s</a></li>' . PHP_EOL, get_permalink($p->ID), $p->post_title);
	$r .= '</ul></li>';

	$pages = get_pages(array('numberposts' => -1, 'sort_column' => 'post_title'));
	$r .= '<li class="menu-item-has-children"><a href="/">PAGES' . $down . '</a><ul class="sub-menu">';
	foreach($pages as $p) $r .= sprintf('<li><a href="%s">%s</a></li>' . PHP_EOL, get_permalink($p->ID), $p->post_title);
	$r .= '</ul></li>';

	$featured = [
		['Spontaneous Love (Imran)', 'incubate/spontaneous-love/', 'New collection of poems by Imran'],
		['Essays to a Swan (Imran)', 'incubate/essays-to-a-swan/', 'Imran\'s older prose and poetry'],
		['Penned in Joint', 'incubate/penned-in-joint/', 'Jointly written prose and poetry'],
		['Media > Bhagavad Gita', 'media/sanskrit/gita/" target="_blank', 'a site for playing (devotional) mp3s with transcripts'],
		['Media > No Complaints Lord', 'media/world/prayers/kurai-ondrum-illai/" target="_blank', 'Our first [Tamil] Devotional mp3 sung by Bhuvana'],
		['Entheos', 'topics/religion/', 'a platform for religious discussion and harmony'],
		['Movements', 'movements/', 'such as Sharing Love, Spreading Harmony and World Unity, Nation Building, Loving Nature, Environment'],
		['Speak (old)', 'speak/', 'old channel with videos from Hans Wilhelm / Jay Lakhani'],
		['Express > Imran', 'express/imran/', 'articles from YM founder Imran'],
		['Speak > Imran', 'speak/imran/', 'old articles from YM founder Imran'],
		['Speak > Shasa', 'speak/shasa/7-id-2018/', 'Imran\s Speeches (2013 - present)'],
		//['Podcasts', 'http://yieldmore.org/media/2018/001', 'series of podcasts with transcripts'],
		['Songs', 'curate/songs/', 'curated songs - includes list (school) of 150 songs for children and people of all ages'],
		['Movies', 'curate/movies/', 'some of our most loved movies'],
		['Movies (Excel)', 'movies-doc', 'a Google Document listing our favourite 150 movies (now has a separate sheet for kids)'],
	];
	$r .= '<li class="menu-item-has-children"><a href="/featured-content/">Featured' . $down . '</a><ul class="sub-menu">';
	foreach($featured as $f) $r .= sprintf('<li><a href="http://yieldmore.org/%s" title="%s">%s</a></li>' . PHP_EOL, $f[1], $f[2], $f[0]);
	$r .= '</ul></li>';

	$friends = get_ms_webring();
	$r .= '<li class="menu-item-has-children"><a href="/directory/">Friends' . $down . '</a><ul class="sub-menu">';
	foreach($friends as $f) $r .= sprintf('<li><a href="%s" title="%s" target="_blank">%s</a></li>' . PHP_EOL, $f[1], $f[2], $f[0]);
	$r .= '</ul></li>';

	$more = [
		['Ventures and Offerings', 'about/?node=ventures', 'All our ventures and ideas'],
		['All Our Menus (Highlights)', 'about/#highlights" class="highlights-link', 'All 40 of our menus expanded with a description of each - new Omnibar feature'],
		['Splash Popup', 'about/#splash" class="splash-link', 'a basic intro to our site available on logo click in the header'],
		['Sitemap', '?o=1', 'a list of all the links on our site'],
		['[this] Sitemap',  substr($site['path'], 1) . '?o=0', 'a list of links on this site'],
		['Short Links', 'r', 'all the short links (like yieldmore.org/swan will take you to Imran\s poetry)'],
		['YouTube', 'yt', 'Our Youtube Channel with videos from us / people supporting us'],
		['YouTube (Curated)', 'ytc', 'Our Youtube Channel for curated content'],
		['Google Group', 'google', 'The Google Group Forum for discussion and newsletters / updates'],
		['Twitter', 'twitter', 'Our twitter account, for daily updates and links back to content'],
		['Twitter (Learn)', 'twitter-learn', 'Our LearnYMO twitter account run by Rani, a special educator in support of /pact/'],
		['Meetings [Hangouts]', 'meet', 'A place for meetings on Hangouts (usually the last Sunday of the Month at 3:30pm IST)'],
	];
	$r .= '<li class="menu-item-has-children"><a href="http://yieldmore.org'.$site['path'] . '?o=0">More' . $down . '</a><ul class="sub-menu">';
	foreach($more as $m) $r .= sprintf('<li><a href="http://yieldmore.org/%s" title="%s" target="_blank">%s</a></li>' . PHP_EOL, $m[1], $m[2], $m[0]);
	$r .= '</ul></li>';

	$r .= '</ul></div>';
	return $r;
}

add_filter('pre_wp_nav_menu', 'cs_pre_wp_nav_menu2');

?>