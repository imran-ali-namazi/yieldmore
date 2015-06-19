<?php
/*
Plugin Name: Cselian Admin
Plugin URI: http://github.com/ImranCS/wp-cselian/wiki/Admin
Description: Html Generator, common scripts / assets, Multisite (active plugins/theme) overview, Reseed wp_posts.
Version: 1.5
Author: <a href="mailto:imran@cselian.com">Imran Ali Namazi</a>
*/

/**
 * LICENSE: Free to use but recognition due.
 *
 * Copyright (c) <2013> <Imran Ali Namazi>
 *
 * @author		Imran Ali Namazi <imran@cselian.com>
 * @copyright 2013 Imran Ali Namazi
 * @license	 The CS Atribution License
 * }}}
 */

// Nice to have - a post id reseed using
// http://stackoverflow.com/a/5437720
// but wordpress doesnt use foreign keys in the first place

include_once 'functions.php';

include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
if (!cs_var('sitebase') && is_plugin_active('cs-sites/cs-sites.php'))
	include_once( ABSPATH . 'wp-content/plugins/cs-sites/cs-sites.php');

include_once 'csa-scripts.php';

class CSAdmin
{
	public static $instance;
	
	function __construct()
	{
		self::$instance = $this;

		add_action('admin_menu', array(&$this, 'register_admin'));
	}
	
	public static $reseedSlug = 'csadmin-reseed';
	public static $htmlSlug = 'csadmin-htmlgen';
	public static $multisiteSlug = 'csadmin-multisite';
	
	function register_admin()
	{
		// Made Other a plugin Multisite (if config found)
		add_submenu_page('tools.php', 'Reseed Posts', 'Reseed', 'manage_options', 
			self::$reseedSlug, array($this, 'pages_reseed'));

		add_submenu_page('tools.php', 'Generate Html for Pages', 'Html Gen', 'manage_options', 
			self::$htmlSlug, array($this, 'pages_htmlgen'));

		add_submenu_page('tools.php', 'View Plugins / Themes in All Sites', 'Multisite Overview', 'manage_options', 
			self::$multisiteSlug, array($this, 'pages_multisite'));
	}
	
	function pages_reseed() { include 'reseed.php'; }
	function pages_htmlgen() { include 'htmlgen.php'; }
	function pages_multisite() { include 'multisite.php'; }
}
new CSAdmin();
?>
