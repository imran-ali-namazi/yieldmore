<?php
if (!isset($_GET['r'])) return;
class BibliosRedirect
{
	private static $redirects = array(
		'fb' => 'https://facebook.com/groups/YieldMore',
		'fb-page' => 'https://facebook.com/YieldMoreOrg',
		'fb-learn' => 'https://facebook.com/groups/LearnYM',
		'fb-heal' => 'https://facebook.com/groups/HealYM',
		'fb-share' => 'https://facebook.com/groups/ServeYM',
		'fb-writers' => 'https://facebook.com/groups/WritersYM',
		'fb-artists' => 'https://facebook.com/Artists.YM',
		'fb-memoriam' => 'https://facebook.com/groups/InMemoriamYM',
		null,
		'yt' => 'https://www.youtube.com/channel/UC_iHhVADe1oSjP3oAi5bnnw/playlists',
		'yt2' => 'https://www.youtube.com/channel/UC1xoOUJaIw74Nn3HyD6Wdhw',
		'li' => 'https://www.linkedin.com/company/yieldmore-org',
		'discuss' => 'https://groups.google.com/forum/#!forum/yieldmore',
		null,
		'3a' => 'https://www.facebook.com/groups/AmmaiApparAgam/',
		'yt-blink' => 'https://www.youtube.com/watch?v=6_3cB8Trcec&index=4&list=PLynUsr5OWn2EyfDw3J4G8VjVjIp_gulVM',
		null,
		'vamsa' => 'http://indiatemple.blogspot.in/2016/10/vamsa-quest-for-divine-calling.html',
		'vamsa-amazon'=> 'http://www.amazon.in/Vamsa-Divine-Calling-Kavitha-Kalyan/dp/194612947X/ref=sr_1_1?ie=UTF8&qid=1475688279&sr=8-1&keywords=vamsa',
	);


	function init()
	{
		if ($_GET['r'] == 'all' || $_GET['r'] == '' || $_GET['r'] == '1')
		{
			self::head('YieldMore.org - All Redirects');
			foreach (self::$redirects as $key=>$value)
			echo $value == null ? '<br />' : sprintf('<a href="/?r=%s" target="_blank">%s</a> - <a href="%s" target="_blank">%s</a><br />' . PHP_EOL, $key, $key, $value, $value);
			die (PHP_EOL . '</body></html>');
		}
		if (!isset(self::$redirects[$_GET['r']]))
			die('Unable to find a redirect for: ' . $_GET['r']);
		header("Location: " . self::$redirects[$_GET['r']]);
	}

	function head($title)
	{
		echo '<html>
	<head><title>' . $title . '</title>
<style type="text/css">
body { font: 12pt Verdana; }
a { color: #713D44; text-decoration: none; }
h1 { font-size: 18pt; border: 1px solid #333; } h1 span { font-size: 15pt; margin-left: 30px; }
</style>
	</head>
	<body>' . PHP_EOL;
	}
}
add_action('init', array('BibliosRedirect', 'init'));
?>