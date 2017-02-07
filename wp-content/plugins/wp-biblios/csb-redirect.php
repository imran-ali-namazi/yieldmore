<?php
if (!isset($_GET['r'])) return;
class BibliosRedirect
{
	private static $redirects = array(
		'About YM',
		'pr' => 'https://docs.google.com/document/d/1b-mWCmPgAsem7zWF2jjaa3LwJOaNbuAPIezfK-RoTYM',
		'what' => 'https://docs.google.com/document/d/1ggB1BzlIJ-ZSps8FIaK26_dbA5bfFjKrNK3S2BlA8es',
		'what-ppt' => 'https://docs.google.com/presentation/d/1HFwhF3H3O3qJYTbbpepxfgqx40NKYSdC9jacAaoGTn0',
		'intro' => 'https://docs.google.com/document/d/1HAhSJvCjnXunhqnjTni74DuFc60ZyRNfL5iKHbruNaI',
		'about' => 'http://yieldmore.org/about',
		'dir' => 'https://drive.google.com/folderview?id=0B0dXGzszO_q2Z3JBZHQ1dkhBZWM&usp=sharing',
		'help' => 'https://docs.google.com/spreadsheets/d/1Cwc7pW80uHb5KBTYgxTKGITfvYIvFRT2TWL-r9erqMc',
		'learn' => 'http://learn.yieldmore.org/about',
		'heal' => 'http://heal.yieldmore.org/about',
		'share' => 'http://share.yieldmore.org/about',
		'print' => 'http://yieldmore.org/wp-content/data/print',

		'Facebook',
		'fb' => 'https://facebook.com/groups/YieldMore',
		'fb-shasa' => 'https://facebook.com/shasa.ym',
		'fb-page' => 'https://facebook.com/YieldMoreOrg',
		'fb-learn' => 'https://facebook.com/groups/LearnYM',
		'fb-heal' => 'https://facebook.com/groups/HealYM',
		'fb-share' => 'https://facebook.com/groups/ServeYM',
		'fb-writers' => 'https://facebook.com/groups/WritersYM',
		'fb-artists' => 'https://facebook.com/Artists.YM',
		'fb-memoriam' => 'https://facebook.com/groups/InMemoriamYM',

		'Other Social Media',
		'yt' => 'https://www.youtube.com/channel/UC_iHhVADe1oSjP3oAi5bnnw/playlists',
		'yt-shasa' => 'https://www.youtube.com/playlist?list=PLsuI89eMBnMEURG757yRUSVSxd5S96nIx',
		'yt2' => 'https://www.youtube.com/channel/UC1xoOUJaIw74Nn3HyD6Wdhw',
		'li' => 'https://www.linkedin.com/company/yieldmore-org',
		'discuss' => 'https://groups.google.com/forum/#!forum/yieldmore',
		'books' => 'https://books.google.co.in/books?uid=111519852770312117046',

		'Contributors',
		'imran' => 'http://yieldmore.org/incubate/essays-to-a-swan/',
		'about-imran' => 'https://docs.google.com/document/d/1qU01Chgtuqw160D6KIpicyhALkXWU14xWZY8s4XhQV8',
		'bookworm' => 'http://share.yieldmore.org/why',
		'vv' => 'http://yieldmore.org/speak/ethos/life/?node=life-is-complicated',

		'Content',
		'allah' => 'http://yieldmore.org/wp-content/data/pdfs/allah-99-names.pdf',
		'death' => 'http://yieldmore.org/topics/death/?node=prayer-rebirth',
		'gita' => 'http://yieldmore.org/works/essays-on-the-gita/',
		'harmony' => 'http://yieldmore.org/movements/harmony/',
		'india' => 'http://yieldmore.org/people/sri-aurobindo/?node=independance',
		'peace' => 'http://yieldmore.org/practices/prayer/?node=peace',
		'prayer' => 'http://yieldmore.org/practices/prayer',
		'religion' => 'http://yieldmore.org/topics/religion',
		'tolkien' => 'http://yieldmore.org/books/the-silmarillion/?node=ainulindale',
		'vs' => 'http://yieldmore.org/works/vishnu-sahasranamam/',

		'Content in Google Docs / Forms',
		'peace-doc' => 'https://docs.google.com/document/d/1ySo1iRxvRiGlL6nPmP0BenlCkEgovBZXEOKJUScs8eA',
		'harmony-form' => 'https://docs.google.com/a/cselian.com/forms/d/1vBmQQ2z17wDkK6e0T_-62Mvq04SD_QQ53LaLimXTDZ4',
		'harmony-doc' => 'https://docs.google.com/document/d/1hn3I5O5_LTAVXYJuTqKu3903tvo82N357F3h2WGce9o',

		'Content about events and projects',
		'trika' => 'http://learn.yieldmore.org/conferences/trika16/',
		'7s' => 'http://share.yieldmore.org/projects/seven-sisters/',

		'Organizations',
		'sycm' => 'http://share.yieldmore.org/helpers/sycm',
		'sinchana' => 'http://learn.yieldmore.org/helpers/sinchana/',
		'3a' => 'http://share.yieldmore.org/helpers/3a',
		'fb-3a' => 'https://www.facebook.com/groups/AmmaiApparAgam/',

		'Affiliates / Other Organizations',
		'orgs' => 'https://docs.google.com/document/d/10C-swmuhHxEeXafAsghbGu4GS2e1OPN97CyD9ViblH0', //
		'brainsync' => 'http://yieldmore.org/programs/brainsync/',
		'ppdo' => 'https://peoplesproblems.org/chatroom.php',
		'ions' => 'http://yieldmore.org/organizations/institute-of-noetic-sciences/',
		'mm' => 'http://mindfulmotherhood.org',
		'j4d' => 'http://jobsfordyslexics.org/',

		'iandeye' => 'http://iandeye.in/',
		'yt-blink' => 'https://www.youtube.com/watch?v=6_3cB8Trcec&index=4&list=PLynUsr5OWn2EyfDw3J4G8VjVjIp_gulVM',

		//'Apps Links',
		//'chakra-meditation' => ''

		/*'Other People',
		'vamsa' => 'http://indiatemple.blogspot.in/2016/10/vamsa-quest-for-divine-calling.html',
		'vamsa-amazon'=> 'http://www.amazon.in/Vamsa-Divine-Calling-Kavitha-Kalyan/dp/194612947X/ref=sr_1_1',
		'vamsa-google'=> 'https://books.google.co.in/books?id=BvlEDQAAQBAJ',*/
	);


	function init()
	{
		if ($_GET['r'] == 'all' || $_GET['r'] == '' || $_GET['r'] == '1')
		{
			self::head('All Redirects - YieldMore.org');
			foreach (self::$redirects as $key=>$value)
			echo is_numeric($key) ? "<br/><b>$value</b><br/>" : sprintf('<a href="/?r=%s" target="_blank">%s</a> &mdash;> <a href="%s" target="_blank">%s</a><br />' . PHP_EOL, $key, $key, $value, $value);
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