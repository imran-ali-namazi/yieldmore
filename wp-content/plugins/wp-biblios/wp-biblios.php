<?php
/*
Plugin Name: Cselian Biblios
Plugin URI: http://github.com/ImranCS/wp-cselian/wiki/Biblios
Description: Powers the site yieldmore.org (Biblios) - Creates post type work, adds editor for settings, nav and presents content in book form.
Version: 1.3
Author: <a href="mailto:imran@cselian.com">Imran Ali Namazi</a>
Author URI: http://cselian.com/blog/about
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

if (!function_exists('cs_var')) {
function cs_var($name, $val = null)
{
	global $cscore;
	if (!isset($cscore)) $cscore = array();
	if ($val != null)
		$cscore[$name] = $val;
	else
		return isset($cscore[$name]) ? $cscore[$name] : false;
} }

include_once '3p/CHtml.php';
include_once 'csb-scripts.php';
include_once 'csb-config.php'; // used in functions
include_once 'functions.php';
cs_var('bib-file', __FILE__);
include_once 'csb-work.php';
include_once 'csb-cache.php';
include_once 'csb-nav.php';
include_once 'csb-menu.php';
include_once 'csb-widgets.php';
include_once 'csb-shortcodes.php';
include_once 'csb-login.php';
include_once 'csb-home.php';
include_once 'csb-bookmark.php';
include_once 'csb-webparts.php';
include_once 'csb-overview.php';
include_once 'csb-redirect.php';
include_once 'cs-multisite.php';
?>
