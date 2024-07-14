<?php
include_once 'functions.php';

//am_var('live', endsWith(__DIR__,'-live'));
am_var('local', $local = $_SERVER['HTTP_HOST'] ==='localhost');

bootstrap(array(
	'name' => 'Legacy YM',
	'safeName' => 'yieldmore-legacy',

	'byline' => 'Quality / Growth / Sharing',
	'start_year' => 2013,

	'version' => [ 'id' => '003', 'date' => '14 Jul 2024' ],

	'support_page_parameters' => true,
	'folder' => 'content/',

	'theme' => 'biz-land',

	'styles' => ['styles'],
	'scripts' => ['%app%themes/biz-land/assets/vendor/jquery/jquery.min', 'main', 'contents'],

	'email' => 'team@yieldmore.org',
	'phone' => '+919841223313',
	'social' => [],

	'url' => $local ? 'http://localhost/subdomains/yieldmore/legacy/' : 'https://legacy.yieldmore.org/',
	'path' => SITEPATH,
	'stats' => true,
));

render();
?>
