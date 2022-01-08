<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

include_once '../../amadeus/framework/core.php';
include_once '_functions.php';

//cs_var('live', endsWith(__DIR__,'-live'));
cs_var('local', $local = $_SERVER['HTTP_HOST'] ==='localhost');

bootstrap(array(
	'name' => 'Legacy YM',
	'safeName' => 'yieldmore-legacy',

	'byline' => 'Quality / Growth / Sharing',
	'start_year' => 2013,

	'version' => [ 'id' => '002', 'date' => '9 Jan 2022' ],

	'support_page_parameters' => true,
	'menu_active_class' => 'active', //TODO: 

	'theme' => 'tm-xtra',

	'styles' => ['styles'],
	'scripts' => ['main', 'contents'],
	'head_hooks' => [__DIR__ . '/_ga.php'],

	'url' => $local ? 'http://localhost/yieldmore/legacy/' : 'https://legacy.yieldmore.org/',
	'path' => __DIR__,
	'stats' => true,
));

//load_amadeus_module('markdown');

render();
?>
