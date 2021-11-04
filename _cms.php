<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

include_once '../../../amadeus/framework/core.php';
include_once '_functions.php';

//cs_var('live', endsWith(__DIR__,'-live'));
cs_var('local', $local = $_SERVER['HTTP_HOST'] ==='localhost');

bootstrap(array(
	'name' => 'Legacy YieldMore.org',
	'safeName' => 'yieldmore-legacy',

	'byline' => 'Peacefuness Quality Growth Sharing',
	'start_year' => 2013,

	'version' => [ 'id' => '001', 'date' => '4 Nov 2021' ],

	'support_page_parameters' => true,
	'menu_active_class' => 'active', //TODO: 

	'theme' => 'tm-xtra',

	//'styles' => ['styles'],
	//'scripts' => ['contents'],
	'head_hooks' => [__DIR__ . '/_ga.php'],

	'url' => $local ? 'http://localhost/yieldmore/old/legacy/' : 'https://yieldmore.org/',
	'path' => __DIR__,
));

load_amadeus_module('markdown');

render();
?>
