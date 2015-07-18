<?php
class CSScripts
{
	function tabber()
	{
		wp_register_script('tabber', cs_var('bib-base') . '/assets/tabber-minimized.js');
		wp_enqueue_script('tabber');

		wp_register_style('tabber-css', cs_var('bib-base') . '/assets/tabber.css');
		wp_enqueue_style('tabber-css');
	}

	function post_thumbnails()
	{
		wp_register_script('bpopup', cs_var('bib-base') . '/assets/jquery.bpopup.min.js');
		wp_enqueue_script('bpopup');

		wp_register_script('posttn', cs_var('bib-base') . '/assets/post-thumbnails.js');
		wp_enqueue_script('posttn');
	}

	function accordion()
	{
		//https://jqueryui.com/accordion/
		wp_register_style('jquery-ui', cs_var('bib-base') . '/assets/jquery-ui.css');
		wp_enqueue_style('jquery-ui');
		wp_register_script('jquery-ui', cs_var('bib-base') . '/assets/jquery-ui.js', 'jquery');
		wp_enqueue_script('jquery-ui');
		add_action('wp_footer', array('CSScripts', 'active_tab'));
	}

	function active_tab()
	{
		$tab = 1;
		if (is_page()) $tab = 0;
		if (stripos($_SERVER['REQUEST_URI'], '/authors/') !== false) $tab = 2;
		echo '<script>var activeTab = ' . $tab . ';</script>' . PHP_EOL;
	}
	
	function sidebar()
	{
		wp_register_script('jquery-sidebar', cs_var('bib-base') . '/assets/sidebar.js', 'jquery');
		wp_enqueue_script('jquery-sidebar');
	}
}
?>
