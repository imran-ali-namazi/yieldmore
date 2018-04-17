<?php
//if (!isset($_GET['r'])) return;
class BibliosRedirect
{
	private static $redirects = array(
		'About YM',
		'start' => 'http://yieldmore.org/about/#highlights',
		'exposition' => 'https://www.youtube.com/watch?v=MWAK3K7A6_Y&list=PLNEB1ItETG4WdNT2bBTQs0GsvU39LKqQq',
		'devaragam' => 'https://www.google.co.in/maps/place/13%C2%B003\'20.3%22N+80%C2%B014\'10.1%22E/@13.0556879,80.2351948,17.75z/data=!4m6!3m5!1s0x3a52665e5c35a129:0x5cbee4e5dfb93f47!7e2!8m2!3d13.0556448!4d80.2361275',
		'egmore' => 'https://www.google.co.in/maps/place/13%C2%B004\'03.5%22N+80%C2%B015\'26.3%22E/@13.0676401,80.2567711,19z/data=!4m6!3m5!1s0x3a52661255bdb707:0x818f9cfd03f05705!7e2!8m2!3d13.0676387!4d80.2573183',
		'cse' => 'https://cse.google.com/cse/publicurl?cx=001331742872338784437:4ecyp4weblg',

		'i' => 'https://docs.google.com/document/d/1ibvHWa3Z5l0j5WBpWCWE4hvV88_N0xSXtJ-NrqzpP7Q', //invitation
		'n' => 'https://docs.google.com/document/d/1z9efU_G-xh-5pHy_azVx55bk-BWAK2vaW3ewy29H9qY', //notice
		'v' => 'http://yieldmore.org/about/?node=ventures',
		'e' => 'http://yieldmore.org/peaceworks/services/english/',
		'ss' => 'http://yieldmore.org/peaceworks/services/supershare/',
		'm' => 'http://yieldmore.org/peaceworks/services/mentoring/',
		'p' => 'http://yieldmore.org/peaceworks/',
		'l' => 'https://docs.google.com/presentation/d/11w77dcnzNIRtzAJygL4Di7bwl4Dsk9LDs8xEF7GqifA', //launch
		//offerings
		'o' => 'https://docs.google.com/document/d/12BgU1Ry9GAeQPnjCkkq1_1LCT9HYjDFyjThqF_ZDzYE',
		'f' => 'http://yieldmore.org/forwards/',
		'meet' => 'https://hangouts.google.com/hangouts/_/cselian.com/meetings',
		'meet-big' => 'https://hangouts.google.com/hangouts/_/cselian.com/buildindiagroup',

		'pr' => 'https://docs.google.com/document/d/1FbJ2u2W_GMacKo1jZ2YsMv7VoZMGpjjSZpmCs3_JOsU',
			'pr-new' => 'https://docs.google.com/document/d/1FbJ2u2W_GMacKo1jZ2YsMv7VoZMGpjjSZpmCs3_JOsU',
		'pr-old' => 'https://docs.google.com/document/d/1b-mWCmPgAsem7zWF2jjaa3LwJOaNbuAPIezfK-RoTYM',
		'what' => 'https://docs.google.com/document/d/1ggB1BzlIJ-ZSps8FIaK26_dbA5bfFjKrNK3S2BlA8es',
		'what-ppt' => 'https://docs.google.com/presentation/d/1HFwhF3H3O3qJYTbbpepxfgqx40NKYSdC9jacAaoGTn0',
		'intros-all' => 'https://docs.google.com/document/d/1HAhSJvCjnXunhqnjTni74DuFc60ZyRNfL5iKHbruNaI', //Orgs / YieldMore - defunct
		'video' => 'https://www.youtube.com/watch?v=PTIqjpkF5Ss',
		'video-ppt' => 'https://docs.google.com/presentation/d/1fS_cAjxmNRoT3dUtKNePVMc-eTOM64JH-IMSGgqzw8Q',
		'dir' => 'https://drive.google.com/folderview?id=0B0dXGzszO_q2Z3JBZHQ1dkhBZWM&usp=sharing',
		'help-doc' => 'https://docs.google.com/spreadsheets/d/1Cwc7pW80uHb5KBTYgxTKGITfvYIvFRT2TWL-r9erqMc',
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
		'google' => 'https://groups.google.com/forum/#!forum/yieldmore',
		'twitter' => 'https://twitter.com/YieldMoreOrg',
		'twitter-learn' => 'https://twitter.com/LearnYMO',
		'li' => 'https://www.linkedin.com/company/yieldmore-org',
		'books' => 'https://books.google.co.in/books?uid=111519852770312117046',
		'ytc' => 'https://www.youtube.com/channel/UC_iHhVADe1oSjP3oAi5bnnw/playlists',
		'yt-shasa' => 'https://www.youtube.com/playlist?list=PLsuI89eMBnMEURG757yRUSVSxd5S96nIx',
		'yt' => 'https://www.youtube.com/channel/UCESPy4vMsnv3htBqvHJh51Q/playlists',
		//'yt-vas' => 'https://www.youtube.com/channel/UC5oSnANyOydEOQjKwNjF_HA',
		//'yt-blink' => 'https://www.youtube.com/watch?v=6_3cB8Trcec&list=PLynUsr5OWn2EyfDw3J4G8VjVjIp_gulVM',
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
		'wa-meet' => 'https://chat.whatsapp.com/9btOR0cGdPfDqQpvsretLy',
		//'tl-iran' => 'https://web.telegram.org/#/im?p=g210063115',

		'Ventures',
		'youth-doc' => 'https://docs.google.com/document/d/1zVd6qPowYaBraA4B4UH_3Oj-tCTJKbtaQU7N-hwrdRU',
		'change-harmony' => 'https://www.change.org/p/indian-chief-ministers-promote-harmony-and-adopt-this-2-min-program-against-violence-throughout-india',
		'change-big-program' => 'https://www.change.org/p/indian-chief-ministers-promote-harmony-and-adopt-this-2-min-program-against-violence-throughout-india',

		'Sites', //and brochures
		'b' => 'https://docs.google.com/document/d/1zGxuZiRvQTplhCReKnWZBFsfNKaQhYv4RBmUMNxwSDE',
		//pact
		'pl' => 'http://yieldmore.org/pact/links/',
		'pb' => 'https://docs.google.com/document/d/1ZeRwOEJXZdqd0Aapp-891BSyrzCfuWqida4kAOImKQA',
		'ie' => 'http://yieldmore.org/pact/programs/instrumental-enrichment/',
		'wve' => 'http://noetic.org/education/worldview/overview',
		'school' => 'http://yieldmore.org/curate/songs/school/',
		//'values' => 'http://yieldmore.org/learn/students/values/',
		'tct' => 'http://thecompassteam.in',
		'pactg' => 'https://groups.google.com/d/forum/pact-ym',
		//heal
		's' => 'http://yieldmore.org/heal/positive-thinking/',
		'sb' => 'https://docs.google.com/document/d/1Elc0XF8u8vIrlE3waStiVIiRDa6pykobzUUpAl_imPM',
		//peaceworks
		'pw' => 'http://yieldmore.org/peaceworks/',
		'pwb' => 'https://docs.google.com/document/d/1NHkMggFDiuzbGENlAOMr7ZnCprpztVFRnWjvjufPWkI',
		//jsw
		'swi' => 'https://docs.google.com/document/d/1fAhLcwftGnnmYCycoWfuEzhe9cY7ElaHDDq_R-RJGN0',
		'swb' => 'https://docs.google.com/document/d/1bJq8_yLO1wLKFDn7pw0ZUbpSAtVJZaPxIz-qrTHNG7Y',

		'Contributors',
		'swan' => 'http://yieldmore.org/incubate/essays-to-a-swan/',
		'imran' => 'http://yieldmore.org/speak/imran/',
		'love' => 'http://yieldmore.org/incubate/spontaneous-love/',
		//'imran-txt' => 'http://yieldmore.org/wp-content/data/users/shasa/swan/',
		'imran-doc' => 'https://docs.google.com/document/d/1qU01Chgtuqw160D6KIpicyhALkXWU14xWZY8s4XhQV8',
		'hans' => 'http://yieldmore.org/speak/hans-wilhelm/',
		'george' => 'http://yieldmore.org/speak/george-gilchrist/',
		'jay' => 'http://yieldmore.org/speak/jay-lakhani/',
		'jay-yt' => 'https://www.youtube.com/watch?v=I2NpvKBpljE&list=PLsuI89eMBnMFSdA7IIA_4yGQxCVCIA5k0',
		'mustafa' => 'http://yieldmore.org/peaceworks/people/mustafa/',
		'srividya' => 'http://yieldmore.org/incubate/essays-to-a-swan/tether/',
		//'mustafa' => '',

		'Articles by Imran and People',
		'boy' => 'http://yieldmore.org/incubate/spontaneous-love/boy/',
		'brother' => 'http://yieldmore.org/incubate/essays-to-a-swan/dear-brother/',
		'charter' => 'http://yieldmore.org/incubate/essays-to-a-swan/charter/',
		'divine' => 'http://yieldmore.org/incubate/essays-to-a-swan/divine/',
		'divine-video' => 'https://www.youtube.com/watch?v=JY7aU0Q_ms0&list=PLsuI89eMBnMEURG757yRUSVSxd5S96nIx',
		'harmony' => 'http://yieldmore.org/movements/harmony/',
		'join' => 'http://yieldmore.org/speak/shasa/6-join-us/',
		'values' => 'http://yieldmore.org/speak/imran/our-values/',

		'jk' => 'http://yieldmore.org/people/jiddu-krishnamurti/',
		'sa' => 'http://yieldmore.org/people/sri-aurobindo/',

		'Content',
		'aghora' => 'https://archive.org/stream/AghoraAtTheLeftHandOfGod/Aghora+At+the+Left+Hand+of+God_djvu.txt',
		'allah' => 'http://yieldmore.org/wp-content/data/pdfs/allah-99-names.pdf',
		'anthem' => 'http://yieldmore.org/songs/short-and-sweet',
		'brahman' => 'http://yieldmore.org/works/essays-on-the-gita/?find=brahman',
		'breath' => 'http://yieldmore.org/practices/yoga/breath/',
		'chakras' => 'http://yieldmore.org/practices/meditation/chakras/',
		'chakras-app' => 'https://play.google.com/store/apps/details?id=com.panagola.app.chakra',
		'cl' => 'http://yieldmore.org/books/curious-lives/',
		'deconstruction' => 'http://yieldmore.org/topics/deconstruction/',
		'death' => 'http://yieldmore.org/topics/death/prayer-rebirth/',
		'faroese' => 'http://yieldmore.org/quotes/faroese/',
		'gita' => 'http://yieldmore.org/works/essays-on-the-gita/',
		'hidden-curriculum' => 'http://yieldmore.org/speak/george-gilchrist/hidden-curriculum/',
		'ie' => 'http://yieldmore.org/programs/instrumental-enrichment/',
		'india' => 'http://yieldmore.org/people/sri-aurobindo/independance/',
		'jls' => 'http://yieldmore.org/works/jonathan-livingston-seagull/?in=1&find=love',
		//'love' => 'http://yieldmore.org/movements/sharing-love/',
		'meditation' => 'http://yieldmore.org/practices/meditation/',
		'movies' => 'http://yieldmore.org/curate/movies/all/',
		'movies-doc' => 'https://docs.google.com/spreadsheets/d/1gU105PZZ6hE6RC_iEp06H1wlMcNyNapL5NGnx6RvMQY',
		'niggle' => 'http://yieldmore.org/works/leaf-by-niggle/',
		'peace' => 'http://yieldmore.org/practices/prayer/peace/',
		'prayer' => 'http://yieldmore.org/practices/prayer/sivananda/',
		'religion' => 'http://yieldmore.org/topics/religion',
			'ulc' => 'http://yieldmore.org/topics/religion/universal-life-church/',
		'spartacus' => 'http://yieldmore.org/books/various/four-times-in-life/',
		'st' => 'http://yieldmore.org/curate/series/star-trek/',
		'tolkien' => 'http://yieldmore.org/books/the-silmarillion/ainulindale/',
		'veganactivist' => 'http://yieldmore.org/movements/loving-nature/vegan-activist/',
		'vegan' => 'http://yieldmore.org/movements/loving-nature/veganism/',
		'vs' => 'http://yieldmore.org/works/vishnu-sahasranamam/',
		'women' => 'http://yieldmore.org/forwards/1711-women/',
		'world-anthem' => 'http://yieldmore.org/practices/prayer/sikh-arti/',
		'yourself' => 'http://yieldmore.org/people/sri-aurobindo/power-supreme/',
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

		//'Content about events and projects',
		//'trika' => 'http://learn.yieldmore.org/conferences/trika16/',
		//'7s' => 'http://share.yieldmore.org/projects/seven-sisters/',

		'Organizations Hosted',
		//'mini' => 'http://sites.yieldmore.org/electronics/mini',
		'3a' => 'http://yieldmore.org/help/ngos/3a',
		'ankuram' => 'http://yieldmore.org/share/ngos/ankuram/',

		'Organizations',
		'orgs' => 'https://docs.google.com/document/d/10C-swmuhHxEeXafAsghbGu4GS2e1OPN97CyD9ViblH0', //Ads
		'affiliates' => 'https://docs.google.com/document/d/1ZC3z2iZudMyIJiYVSaPTd5uFPFZFXmEx6tmGUuWW5ls',
		'syc' => 'http://yieldmore.org/share/ngos/syc/',
		'iandeye' => 'http://iandeye.in/',
		'brainsync' => 'http://yieldmore.org/programs/brainsync/',
		'ions' => 'http://yieldmore.org/organizations/institute-of-noetic-sciences/',
			'mm' => 'http://www.noetic.org/education/self-study/mindful-motherhood-course',
			'mm-doc' => 'https://docs.google.com/document/d/1cO4ciMcV9FVfN79L-AfndkhDYzz0uxMXPFOHmBl5fBE',
		'ppdo' => 'https://peoplesproblems.org/chatroom.php',
		'3a' => 'http://yieldmore.org/share/ngos/3a/',
		'fb-3a' => 'https://www.facebook.com/groups/AmmaiApparAgam/',
		'jfd' => 'http://yieldmore.org/learn/helpers/jobs-for-dyslexics/',
		'jfd-video' => 'https://www.youtube.com/watch?v=v9F1cd_qKMM',
		'jfd-yt' => 'https://www.youtube.com/channel/UCMf0LSqKfUH8wu5ngQSBSXA',
		'sinchana' => 'http://yieldmore.org/learn/helpers/sinchana/',
		'big-registration' => '/',
		'goodcountry' => 'http://yieldmore.org/movements/good-country/',
			'ted-goodcountry' => 'https://www.ted.com/talks/simon_anholt_which_country_does_the_most_good_for_the_world',
			'goodcountry-ppt' => 'https://docs.google.com/presentation/d/1pQsxWUcb3fJJ_xbNlfmXdjnl2Mh1w-5sQAav8TR1JXE',
			'goodcountry-video' => 'https://www.youtube.com/watch?v=9eV0oOJSRuU',
		//'specialsources' => 'http://specialsources.com',
		'jeevan' => 'http://yieldmore.org/help/ngos/jeevan/million-cells/',
	);

	private static function get_slug()
	{
		$r = $_SERVER['REQUEST_URI'];
		$s = str_replace('index.php', '', $_SERVER['SCRIPT_NAME']);
		$slug = substr($r, strlen($s));
		return $slug;
	}

	static function pre_404($preempt, $wp_query)
	{
		$url = untrailingslashit(substr($_SERVER['REQUEST_URI'], 1));
		if (substr_count($url, '/') < 2) return false;

		$pos = strrpos($url, '/');
		$node = substr($url, $pos + 1);
		$url = substr($url, 0, - (strlen($node) + 1));

		$page = get_page_by_path($url, OBJECT, array('page'));

		if (!$page) {
			$slug = basename( untrailingslashit( $url ));
			$page = get_page_by_path($slug, OBJECT, array('post'));
		}

		if (!$page) return false;

		
		$qry = ['p' => $page->ID];
		$wp_query->init();
		$wp_query->parse_query($qry);
		$wp_query->get_posts();
		cs_var('node', $node);

		return false;
	}

	static function init()
	{
		if (!isset($_GET['r']) && !is_404()) return;
		$r = is_404() ? self::get_slug() : $_GET['r'];

		if ((is_404() && $r == 'r') || (isset($_GET['r']) && ($r == 'all' || $r == '') || $r == '1'))
		{
			self::head('All Redirects - YieldMore.org');
			foreach (self::$redirects as $key=>$value)
			echo is_numeric($key) ? "<br/><b>$value</b><br/>" : sprintf('<a href="http://yieldmore.org/%s" target="_blank">%s</a> &mdash;> <a href="%s" target="_blank">%s</a><br />' . PHP_EOL, $key, $key, $value, $value);
			die (PHP_EOL . '</body></html>');
		}

		if (is_404() && !isset(self::$redirects[$r])) return;

		if (!isset(self::$redirects[$r]))
			die('Unable to find a redirect for: ' . $r);
		header("Location: " . self::$redirects[$r]);
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
	echo '<div id="menu"><a href="/about/#splash">About YieldMore.org</a> / <a href="/?o=0">Sitemap (this)</a> / <a href="http://yieldmore.org/?o=1">Sitemap</a> / <a class="selected" href="http://yieldmore.org/r">Redirects and Social Media Links</a></div>' . PHP_EOL;
	}
}
//http://rachievee.com/the-wordpress-hooks-firing-sequence/
add_action('template_redirect', array('BibliosRedirect', 'init'));
add_filter('pre_handle_404', array('BibliosRedirect', 'pre_404'), 200, 2);
?>
