<?php
include_once 'functions.php';

//am_var('live', endsWith(__DIR__,'-live'));
am_var(VARLocal, $local = $_SERVER['HTTP_HOST'] ==='localhost');

bootstrap(array(
	'name' => 'Legacy YM',
	'safeName' => 'yieldmore-legacy',

	'byline' => 'Quality / Growth / Sharing',
	'start_year' => 2013,

	'version' => [ 'id' => '003', 'date' => '14 Jul 2024' ],

	'support_page_parameters' => true,
	'folder' => 'content/',

	'theme' => 'biz-land',
	'image-in-logo' => '-rectangle.jpg',

	'styles' => ['styles'],
	'scripts' => ['%app%themes/biz-land/assets/vendor/jquery/jquery.min', 'main', 'contents'],

	VAREmail => 'team@yieldmore.org',
	VARPhone => '+919841223313',
	'social' => [],

	'url' => $local ? 'http://localhost/yieldmore/legacy/' : 'https://legacy.yieldmore.org/',
	'path' => SITEPATH,
));

render();
?>
