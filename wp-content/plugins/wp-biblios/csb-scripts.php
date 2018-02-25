<?php
class CSScripts
{
	static function tabber()
	{
		wp_register_script('tabber', cs_var('bib-base') . '/assets/tabber-minimized.js');
		wp_enqueue_script('tabber');

		wp_register_style('tabber-css', cs_var('bib-base') . '/assets/tabber.css');
		wp_enqueue_style('tabber-css');
	}

	static function post_thumbnails()
	{
		self::bpopup();
		wp_register_script('posttn', cs_var('bib-base') . '/assets/post-thumbnails.js');
		wp_enqueue_script('posttn');
	}

	static function bpopup()
	{
		wp_register_script('bpopup', cs_var('bib-base') . '/assets/jquery.bpopup.min.js');
		wp_enqueue_script('bpopup');
	}

	static function accordion()
	{
		//https://jqueryui.com/accordion/
		wp_register_style('jquery-ui', cs_var('bib-base') . '/assets/jquery-ui.css');
		wp_enqueue_style('jquery-ui');
		wp_register_script('jquery-ui', cs_var('bib-base') . '/assets/jquery-ui.js', 'jquery');
		wp_enqueue_script('jquery-ui');
		add_action('wp_footer', array('CSScripts', 'active_tab'));
	}

	static function active_tab()
	{
		$tab = 0;
		if (stripos($_SERVER['REQUEST_URI'], '/works/') !== false) $tab = 1;
		echo '<script>var activeTab = ' . $tab . ';</script>' . PHP_EOL;
	}
	
	static function sidebar()
	{
		//https://github.com/leafo/sticky-kit
		wp_register_script('jquery-sidebar', cs_var('bib-base') . '/assets/jquery.sticky-kit.min.js', 'jquery');
		wp_enqueue_script('jquery-sidebar');
	}

	static function prettyPhoto()
	{
		wp_register_script('prettyPhoto', cs_var('bib-base') . '/assets/jquery.prettyPhoto.js');
		wp_enqueue_script('prettyPhoto');

		wp_register_style('prettyPhoto-css', cs_var('bib-base') . '/assets/prettyPhoto.css');
		wp_enqueue_style('prettyPhoto-css');
	}

	static function robots()
	{
		echo "Disallow: http://yieldmore.org/jssw/\n";
		echo "Disallow: http://yieldmore.org/wp-content/data/hindu/gita/\n";
	}
}

add_action('do_robots', array('CSScripts', 'robots'));
?>
