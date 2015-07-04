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

		//wp_register_script('tinyscroll', cs_var('bib-base') . '/assets/jquery.tinyscrollbar.js');
		//wp_enqueue_script('tinyscroll');

	}
}
?>
