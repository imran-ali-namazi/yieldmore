<?php
if (!isset($_GET['r'])) return;
class BibliosRedirect
{
	private static $redirects = array(
		'About YM',
		'pr' => 'https://docs.google.com/document/d/1FbJ2u2W_GMacKo1jZ2YsMv7VoZMGpjjSZpmCs3_JOsU',
			'pr-new' => 'https://docs.google.com/document/d/1FbJ2u2W_GMacKo1jZ2YsMv7VoZMGpjjSZpmCs3_JOsU',
		'pr-old' => 'https://docs.google.com/document/d/1b-mWCmPgAsem7zWF2jjaa3LwJOaNbuAPIezfK-RoTYM',
		'what' => 'https://docs.google.com/document/d/1ggB1BzlIJ-ZSps8FIaK26_dbA5bfFjKrNK3S2BlA8es',
		'what-ppt' => 'https://docs.google.com/presentation/d/1HFwhF3H3O3qJYTbbpepxfgqx40NKYSdC9jacAaoGTn0',
		'intros-all' => 'https://docs.google.com/document/d/1HAhSJvCjnXunhqnjTni74DuFc60ZyRNfL5iKHbruNaI', //Orgs / YieldMore - defunct
		'video' => 'https://www.youtube.com/watch?v=PTIqjpkF5Ss',
		'video-ppt' => 'https://docs.google.com/presentation/d/1fS_cAjxmNRoT3dUtKNePVMc-eTOM64JH-IMSGgqzw8Q',
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
		'fb-share' => 'https://facebook.com/groups/ShareYMO',
		'fb-change' => 'https://facebook.com/groups/ChangeYM',
		'fb-writers' => 'https://facebook.com/groups/WritersYM',
		'fb-artists' => 'https://facebook.com/Artists.YM',
		'fb-memoriam' => 'https://facebook.com/groups/InMemoriamYM',

		'Other Social Media',
		'discuss' => 'https://groups.google.com/forum/#!forum/yieldmore',
		'li' => 'https://www.linkedin.com/company/yieldmore-org',
		'books' => 'https://books.google.co.in/books?uid=111519852770312117046',
		'yt' => 'https://www.youtube.com/channel/UC_iHhVADe1oSjP3oAi5bnnw/playlists',
		'yt-shasa' => 'https://www.youtube.com/playlist?list=PLsuI89eMBnMEURG757yRUSVSxd5S96nIx',
		'yt-scribe' => 'https://www.youtube.com/channel/UCESPy4vMsnv3htBqvHJh51Q/playlists',
		'yt-vas' => 'https://www.youtube.com/channel/UC5oSnANyOydEOQjKwNjF_HA',
		'yt-blink' => 'https://www.youtube.com/watch?v=6_3cB8Trcec&list=PLynUsr5OWn2EyfDw3J4G8VjVjIp_gulVM',
		'yt-tolle' => 'https://www.youtube.com/watch?v=dTFDfR47dl4&list=PLsuI89eMBnMH4JKkgy2Q_MGXsCHCJIUsV',
		'yt-awakenings' => 'https://www.youtube.com/watch?v=6lsify2ml6E&list=PLsuI89eMBnMHoBX7GlG5BYjPUNxUk4P0X',
		'yt-sama' => 'https://www.youtube.com/watch?v=XVF6edFgqqs&list=PLsuI89eMBnMGZab7xKLfGJ-JZ9H2126Q0',
		
		'Whatsapp Groups et al',
		'wa-americas' => 'https://chat.whatsapp.com/CItx47G3tnr1eI1TeDaE74',
		'wa-europe' => 'https://chat.whatsapp.com/KqVbKV2YuGe5pZSsMgUUAN',
		'wa-bangalore' => 'https://chat.whatsapp.com/7ZsaQT9lluoBu442I52235',
		'wa-curators' => 'https://chat.whatsapp.com/FRsUI2b7mfV9nGGVsfWlsD',
		'wa-players' => 'https://chat.whatsapp.com/JqzmMEJPvNo8X2r5vo1UhJ',
		'wa-youth' => 'https://chat.whatsapp.com/Aq5Cc2KiUV4FtOsMMruRAy', //Inspiring Youth
		'wa-forum' => 'https://chat.whatsapp.com/G2p8ytvH1NgBFt1hJXcWsv', //Better Living Forum YM
		'tl-iran' => 'https://web.telegram.org/#/im?p=g210063115',

		'Ventures',
		'youth-doc' => 'https://docs.google.com/document/d/1zVd6qPowYaBraA4B4UH_3Oj-tCTJKbtaQU7N-hwrdRU',
		'change-harmony' => 'https://www.change.org/p/indian-chief-ministers-promote-harmony-and-adopt-this-2-min-program-against-violence-throughout-india',
		'change-big-program' => 'https://www.change.org/p/indian-chief-ministers-promote-harmony-and-adopt-this-2-min-program-against-violence-throughout-india',

		'Contributors',
		'imran' => 'http://yieldmore.org/incubate/essays-to-a-swan/',
		'imran-essays' => 'http://yieldmore.org/speak/imran/',
		'imran-txt' => 'http://yieldmore.org/wp-content/data/users/shasa/swan/',
		'imran-doc' => 'https://docs.google.com/document/d/1qU01Chgtuqw160D6KIpicyhALkXWU14xWZY8s4XhQV8',
		'veena' => 'http://yieldmore.org/speak/veena/',
		'chris' => 'http://heal.yieldmore.org/helpers/chris/',

		'Content',
		'allah' => 'http://yieldmore.org/wp-content/data/pdfs/allah-99-names.pdf',
		'anthem' => 'http://yieldmore.org/songs/short-and-sweet',
		'brother' => 'http://yieldmore.org/incubate/essays-to-a-swan/?node=dear-brother',
		'chakras' => 'http://yieldmore.org/practices/meditation/?node=chakras',
		'chakras-app' => 'https://play.google.com/store/apps/details?id=com.panagola.app.chakra',
		'cl' => 'http://yieldmore.org/books/curious-lives/',
		'death' => 'http://yieldmore.org/topics/death/?node=prayer-rebirth',
		'gita' => 'http://yieldmore.org/works/essays-on-the-gita/',
		'harmony' => 'http://yieldmore.org/movements/harmony/',
		'india' => 'http://yieldmore.org/people/sri-aurobindo/?node=independance',
		'love' => 'http://yieldmore.org/movements/sharing-love/',
		'meditation' => 'http://yieldmore.org/practices/meditation/',
		'movies' => 'http://english.yieldmore.org/movies/all/',
		'movies-doc' => 'https://docs.google.com/spreadsheets/d/1gU105PZZ6hE6RC_iEp06H1wlMcNyNapL5NGnx6RvMQY',
		'niggle' => 'http://yieldmore.org/works/leaf-by-niggle/',
		'peace' => 'http://yieldmore.org/practices/prayer/?node=peace',
		'prayer' => 'http://yieldmore.org/practices/prayer/?node=sivananda',
		'religion' => 'http://yieldmore.org/topics/religion',
		'st' => 'http://english.yieldmore.org/series/star-trek/',
		'tolkien' => 'http://yieldmore.org/books/the-silmarillion/?node=ainulindale',
		'vs' => 'http://yieldmore.org/works/vishnu-sahasranamam/',
		'yoga' => 'http://yieldmore.org/practices/yoga/',
		'yoga-ppt' => 'https://docs.google.com/presentation/d/1JuWWnWVdQC4-Cd_9QmoeAW4lsSUm3ou0XaNJ0i9fb3I',

		'Content in Google Docs / Forms',
		'peace-doc' => 'https://docs.google.com/document/d/1ySo1iRxvRiGlL6nPmP0BenlCkEgovBZXEOKJUScs8eA',
		'harmony-form' => 'https://docs.google.com/a/cselian.com/forms/d/1vBmQQ2z17wDkK6e0T_-62Mvq04SD_QQ53LaLimXTDZ4',
		'harmony-doc' => 'https://docs.google.com/document/d/1hn3I5O5_LTAVXYJuTqKu3903tvo82N357F3h2WGce9o',
		'diabetes-doc' => 'https://docs.google.com/presentation/d/1kfTax908_HXS80PAjcnNL0Xp_nKkjKmQ0K18tIIevlM', //Viji
		'dyslexia-handbook' => 'https://docs.google.com/document/d/1Dx_H22k8oAMrebj4i1gRLmB7HHSi6XmvpkkkD-BycfY',
		
		'Content on the web',
		'bible' => 'https://www.cph.org/t-tlsb.aspx',

		'Content about events and projects',
		'trika' => 'http://learn.yieldmore.org/conferences/trika16/',
		'7s' => 'http://share.yieldmore.org/projects/seven-sisters/',

		'Organizations Hosted',
		'mini' => 'http://sites.yieldmore.org/electronics/mini',
		
		'Organizations',
		'orgs' => 'https://docs.google.com/document/d/10C-swmuhHxEeXafAsghbGu4GS2e1OPN97CyD9ViblH0', //Ads
		'affiliates' => 'https://docs.google.com/document/d/1ZC3z2iZudMyIJiYVSaPTd5uFPFZFXmEx6tmGUuWW5ls',
		'syc' => 'http://share.yieldmore.org/helpers/syc',
		'iandeye' => 'http://iandeye.in/',
		'brainsync' => 'http://yieldmore.org/programs/brainsync/',
		'ions' => 'http://yieldmore.org/organizations/institute-of-noetic-sciences/',
			'mm' => 'http://www.noetic.org/education/self-study/mindful-motherhood-course',
			'mm-doc' => 'https://docs.google.com/document/d/1cO4ciMcV9FVfN79L-AfndkhDYzz0uxMXPFOHmBl5fBE',
		'ppdo' => 'https://peoplesproblems.org/chatroom.php',
		'3a' => 'http://share.yieldmore.org/helpers/3a',
		'fb-3a' => 'https://www.facebook.com/groups/AmmaiApparAgam/',
		'jfd' => 'http://learn.yieldmore.org/helpers/jobs-for-dyslexics/',
		'sinchana' => 'http://learn.yieldmore.org/helpers/sinchana/',
		'goodcountry' => 'http://share.yieldmore.org/helpers/good-country',
			'ted-goodcountry' => 'https://www.ted.com/talks/simon_anholt_which_country_does_the_most_good_for_the_world',
			'goodcountry-ppt' => 'https://docs.google.com/presentation/d/1pQsxWUcb3fJJ_xbNlfmXdjnl2Mh1w-5sQAav8TR1JXE',
			'goodcountry-video' => 'https://www.youtube.com/watch?v=9eV0oOJSRuU',
		'esther' => 'http://heal.yieldmore.org/helpers/wisdoms-whisper-spirits-scribe/',
		'specialsources' => 'http://specialsources.com',
		'jeevan' => 'http://share.yieldmore.org/helpers/jeevan/?node=million-cells',


		/*'Other People',
		'vamsa' => 'http://indiatemple.blogspot.in/2016/10/vamsa-quest-for-divine-calling.html',
		'vamsa-amazon'=> 'http://www.amazon.in/Vamsa-Divine-Calling-Kavitha-Kalyan/dp/194612947X/ref=sr_1_1',
		'vamsa-google'=> 'https://books.google.co.in/books?id=BvlEDQAAQBAJ',*/
	);


	static function init()
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

	static function head($title)
	{
		echo '<html>
	<head><title>' . $title . '</title>
<style type="text/css">
body { font: 12pt Verdana; }
a { color: #713D44; text-decoration: none; }
h1 { font-size: 18pt; border: 1px solid #333; } h1 span { font-size: 15pt; margin-left: 30px; }
#menu a { display: inline-block; padding: 8px; background-color: #71C176; color: #fff; font-weight: bold; }
#menu .selected { text-decoration: underline; color: #FFE793; }
</style>
	</head>
	<body>' . PHP_EOL;
	echo '<div id="menu"><a href="/about/#splash">About YieldMore.org</a> / <a href="/?o=0">Sitemap (this)</a> / <a href="http://yieldmore.org/?o=1">Sitemap</a> / <a class="selected" href="http://yieldmore.org/?r=1">Redirects and Social Media Links</a></div>' . PHP_EOL;
	}
}

if (function_exists('add_action'))
	add_action('init', array('BibliosRedirect', 'init'));
else
	BibliosRedirect::init();
?>