<?php
class WorksShortcodes
{
	static function init()
	{
		$cls = get_class();
		add_shortcode('tab', array($cls, 'do_tab'));
		add_shortcode('works', array($cls, 'do_works'));
		add_shortcode('work', array($cls, 'do_work')); //TODO: missing keyword config causes untraceable error 500
		add_shortcode('data', array($cls, 'do_data'));
		add_shortcode('info', array($cls, 'do_info'));
		add_shortcode('bookmarks', array($cls, 'do_bookmarks'));
		add_shortcode('faqs', array($cls, 'do_faqs'));
		add_shortcode('quotes', array($cls, 'do_quotes'));
		add_shortcode('dir', array($cls, 'do_dir'));
		add_shortcode('versions', array($cls, 'do_versions'));
		add_shortcode('album', array($cls, 'do_album'));
		add_shortcode('social', array($cls, 'do_social'));
		add_shortcode('badge', array($cls, 'do_badge'));
		add_shortcode('ads', array($cls, 'do_ads'));
	}

	static function do_tab($a, $content = null)
	{
		if ($a[0] == 'start') {
			CSScripts::tabber();
			_nl('<div class="tabber">');
		} else if ($a[0] == 'end') {
			_nl('</div>');
		} else {
			$file = WorkConfig::fol(get_the_ID(), $a['name'] . '.html');
			_nl(sprintf('<div class="tabbertab"><h2>%s</h2>', $content));
			$file = file_get_contents($file);
			$file = str_replace('src="', 'src="' . WorkConfig::fol(get_the_ID(), '', 1), $file);
			echo $file;
			_nl('</div>');
		}
	}

	static function do_works($a, $content = null)
	{
		WorkCache::getWorks($types, $works);

		$links = self::types_r($types, count($works));
		self::works_r($works, $links);
	}

	static function do_work($a, $content = null)
	{
		if (array_search('slim', $a) !== false && is_single()) cs_var('slim', true);
		if (isset($a['exclude']) && is_single()) cs_var('exclude', $a['exclude']);
		if (array_search('config', $a) !== false || array_search('toc', $a) !== false)
		{
			global $postConfig;
			$postConfig = WorkConfig::read(get_the_ID(), $a);
			if (isset($a['logo']))
				cs_var('logo', cs_var('bib-data-url') . '/' . $a['fol'] . '/images/' . $a['logo']);

			if (array_search('toc', $a) !== false) {
				$fil = sprintf('%s/%s/%s', cs_var('bib-data'), $a['fol'], '_toc.txt');
				$toc = explode(PHP_EOL, file_get_contents($fil));
				$fmt = '<li><a target="_blank" href="./%s/">%s</a>%s - %s</li>' . PHP_EOL;
				$ol = '<ol>';
				foreach ($toc as $line) {
					$bits = explode('|', $line);
					$ol .= sprintf($fmt, strtolower(str_replace(' ', '-', $bits[0])), $bits[0], $bits[2], $bits[1]);
				}
				$ol .= '</ol>';
				return $ol;
			}
				
			return '';
		}
		$id = isset($a['id']) ? $a['id'] : get_the_ID();

		if (!isset($a['page']) && !isset($a['type'])) {
			return WorkMenu::nodeLink($id, $a, $content);
		} else {
			$contentInc = 1;
			include_once 'csb-content.php';
			$a['content'] = $content;
			if (isset($a['type']))
				return WorkContent::showData($id, $a);
			else
				return WorkContent::nodeQuote($id, $a);
		}
	}

	static function do_data($a, $content = null)
	{
		return WorkConfig::fol(get_the_ID(), '', true);
	}

	private static function types_r($types, $all)
	{
		$links = array();
		$url = get_permalink(get_the_id());
		$op = array();
		foreach ($types as $t=>$cnt) {
			$lnk = WorkNav::typeLink($t, $url);
			$links[$t] = $lnk;
			
			$lnk = str_replace('</a>', ' (' . $cnt . ')</a>', $lnk);
			if ($t === WorkNav::type()) {
				$lnk = str_replace('">', '"><b>', $lnk);
				$lnk = str_replace('</a>', '</b></a>', $lnk);
			}
			$op[] = $lnk;
		}
		echo str_replace('</a>', ' (' . $all . ')</a>', WorkConfig::dirLink('All Works'));
		echo ' : ' . implode('&nbsp; / &nbsp;', $op) . '<br /><br />';
		return $links;
	}

	private static function works_r($works, $links)
	{
		$admin = current_user_can('manage_options');
		$op = '<table><tr><th>';
		$op .= str_replace('	', '</th><th>', WorkCache::$cols);
		$op .= '</th></tr>' . PHP_EOL;
		$t = WorkNav::type();
		$cnt = 0;
		foreach ($works as $wk) {
			if ($t && $wk->type != $t) continue;
			$cnt += 1;
			$wk->data[WorkCache::$colType] = $links[$wk->type];
			$wk->data[WorkCache::$colName] = $wk->link . ($admin ? $wk->edit : '');
			$op .= '<tr><td>' . str_replace('	', '</td><td>',
				implode('	', $wk->data) ) . '</td></tr>' . PHP_EOL;
		}
		$op .= '</table>';
		echo sprintf('<b style="float: right;">%s %s</b>', $cnt, $t ? WorkConfig::formatType($t) : 'Works');
		echo $op;
	}

	static function do_info($a, $content = null)
	{
		$op = array();
		$lines = explode('<br />', $content);
		$in = is_user_logged_in() || isset($_GET['in']);
		foreach ($lines as $line)
		{
			$line = trim($line);
			if ($line == '') continue;
			if (strpos($line, ':') !== false) {
				$bits = explode(':', $line, 2);
				$bits[1] = trim($bits[1]);
				$lnk = '<a href="%s" target="_blank">%s</a>';
				if (strcasecmp($bits[0], 'Wiki') == 0) {
					$text = explode('|', $bits[1]);
					if (count($text) == 2)
						$bits[1] = sprintf($lnk, 'https://en.wikipedia.org/wiki/' . str_replace(' ', '_', $text[0]), $text[1]);
					else
						$bits[1] = sprintf($lnk, 'https://en.wikipedia.org/wiki/' . str_replace(' ', '_', $bits[1]), $bits[1]);
				} else if (strcasecmp($bits[0], 'quote') == 0) {
					$bits[1] = sprintf($lnk, 'https://en.wikiquote.org/wiki/' . str_replace(' ', '_', $bits[1]), $bits[1]);
				} else if (strcasecmp($bits[0], 'youtube') == 0) {
					$url = explode('|', $bits[1]);
					$bits[1] = sprintf($lnk, 'https://www.youtube.com/watch?v=' . $url[0], count($url) == 1 ? $url[0] : $url[1]);
				} else if (strcasecmp($bits[0], 'Source') == 0) {
					$bits[1] = sprintf($lnk, $bits[1], get_domain($bits[1])); 
				} else if (strcasecmp($bits[0], 'pdf') == 0 || strcasecmp($bits[0], 'freepdf') == 0) {
					if (strcasecmp($bits[0], 'pdf') == 0 && !$in) continue;
					$bits[1] = sprintf($lnk, $bits[1], get_domain($bits[1])); 
				} else if (strcasecmp($bits[0], 'link') == 0) {
					$url = explode('|', $bits[1]);
					$bits[1] = sprintf($lnk, $url[0], count($url) == 1 ? $url[0] : $url[1] );
				} else if (strcasecmp($bits[0], 'mp3') == 0) {
					$url = explode('|', $bits[1]);
					$bits[1] = self::do_mp3($url[0], count($url) == 1 ? $url[0] : $url[1]);
				}
				$op[] = '<b>' . $bits[0] . ':</b> ' . $bits[1];
			} else {
				$op[] = $line;
			}
		}
		if (!count($op)) return; //if only pdf and not logged in
		return PHP_EOL . '<blockquote class="info">' . implode('<br/>' . PHP_EOL, $op) . '</blockquote>';
	}

	static function do_mp3($url, $text)
	{
		return '<br/><audio controls class="csmp3" style="min-width: 250px; width: 80%;"><source src="'.$url.'" type="audio/mpeg">Your browser does not support the audio element.</audio>'
			. '<br/><a href="'.$url.'" target="_blank">'.$text.'</a><hr/>';
	}

	static function do_bookmarks($a, $content = null)
	{
		if (!isset($_GET['bookmarks']))
		{
			$url = get_permalink(get_the_ID()) . '?bookmarks=1';
			_nl(CHtml::link('All Bookmarks', $url), 1);
		}
		else
		{
			//too late to call remove_shortcode so lets replace it with empty
			add_shortcode('userlist', array(get_class(), 'disable_userlist'));
			if ($_GET['bookmarks'] == 'save') { WorkBookmark::saveBookmark(); return; }
			$bks = WorkBookmark::getBookmarks();
			_nl('Bookmarks:', 1);
			if (count($bks))
			{
				foreach ($bks as $bk)
					_nl(CHtml::link($bk->bk_name, $bk->bk_url) . ' ' . $bk->bk_date, 1);
			}
			else
			{
				_nl('None. Read a <a href="/works">work</a> and then click on the bookmark page link.', 1);
			}
		}
	}

	static function disable_userlist($a, $c = null)
	{
	}

	static function do_faqs($a, $c = null)
	{
		$file = cs_var('bib-data') . '/' . $a['source'];
		$rows = tsv_to_array(file_get_contents($file));
		$lastSection = '';
		echo PHP_EOL;
		foreach ($rows as $row)
		{
			if ($lastSection != $row[1])
				echo '<h2>' . $row[1] . '</h2>';

			$lastSection = $row[1];

			echo sprintf('<div class="question" id="faq-%s">%s</div>%s<div class="answer">%s</div>%s',
				$row[0], $row[2], PHP_EOL, $row[3], PHP_EOL . PHP_EOL);
		}
	}

	public static $callingWork = false; //HACK: needed since quotes goes along with work and do_shortcode is called in functions.php

	//[quotes fol=quotes/submitted count=5 animate][/quotes]
	static function do_quotes($a, $c = null)
	{
		if (self::$callingWork) return;

		$fol = cs_var('bib-data') . '/' . $a['fol'];
		$files = scandir($fol);
		$index = rand(2, count($files) - 1);

		$rndFile = isset($a['file']) ? $a['file'] . '.txt' : $files[$index];
		$file = $fol . '/' . $rndFile;

		$quotes = explode(PHP_EOL . PHP_EOL, file_get_contents($file));
		$count = isset($a['count']) ? intval($a['count']) : 5;
		$op = array();

		$numbers = range(0, count($quotes) - 1); shuffle($numbers); //https://stackoverflow.com/a/5612704
		$rand = array_slice($numbers, 0, $count);
		foreach ($rand as $i)
			$op[] = '<li>' . $quotes[$i] . '</li>';

		$link = str_replace('.txt', '', $rndFile);
		echo sprintf('#%s <a href="%s">%s</a>: ', $index - 1, get_permalink() . '?node=' . $link, $link); 
		echo '<ol class="quotes">' . implode(PHP_EOL, $op) . '</ol>';
	}

	static function do_dir($a, $c = null)
	{
		$cat = isset($_GET['type']) ? $_GET['type'] : (isset($a['type']) ? $a['type'] : false);
		$fil = cs_var('bib-data') . '/../data/dir.tsv';
		$cols = true;
		$data = tsv_to_array(file_get_contents($fil), $cols);

		$base = get_permalink();
		echo '<table><th>Name</th><th>Focus</th><th>Founder</th><th>Founded</th><th>Sites</th></tr><tr><th colspan="5">Writeup</th></tr>' . PHP_EOL;
		$row = '<tr><td class="name"><a href="http://%s" target="_blank">%s</a></td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr><tr><td colspan="5" class="writeup">%s</td></tr>' . PHP_EOL;
		foreach($data as $d)
		{
			if ($cat && $d[$cols->Sites] != '*' && strpos($d[$cols->Sites], $cat) === false) continue;

			$sites = explode(',', $d[$cols->Sites]); $siteLinks = array();
			//TODO: Point to diff sites once all pages are in place
			foreach ($sites as $s) $siteLinks[] = sprintf('<a href="%s%s">%s</a>', $base, $s == '*' ? '' : '?type=' . $s, $s);

			echo sprintf($row, $d[$cols->Name], $d[$cols->Name], 	$d[$cols->Focus], $d[$cols->Founder], $d[$cols->Founded], implode(' ', $siteLinks), $d[$cols->Writeup]);
		}
		echo '</table>' . PHP_EOL;
	}

	static function do_versions($a, $c = null)
	{
		$r = '<div class="versions">';
		foreach($a as $slug => $txt)
			$r .= sprintf(' <label class="toggle-version %s"><input type="checkbox" checked data-version="%s" /> %s</label>' . PHP_EOL,
				$slug, $slug, str_replace('_', ' ', $txt));
		$r .= '</div>';
		return $r;
	}

	static function do_album($a, $c = null)
	{
		CSScripts::prettyPhoto();
		$fol = cs_var('bib-data') . '/' . $a['fol'];
		$imgs = scandir($fol);
		$url = cs_var('bib-data-url') . '/' . $a['fol'];

		echo '<div class="photos">' . PHP_EOL;
		$ix = 1;
		foreach ($imgs as $img)
		{
			if ($img == '.' || $img == '..' || $img == 'tn') continue;
			self::ensure_thumbnail_exists($fol, $img);
			$title = $ix . ' / ' . ucwords(str_replace('-', ' ', str_replace('.jpg', '', $img)));
			echo sprintf('  <a href="%s/%s" title="%s" rel="prettyPhoto[pic]"><img src="%s/tn/%s" alt="%s" /></a>' . PHP_EOL,
				$url, $img, $title, $url, $img, $title);
			$ix++;
		}
		echo '</div>' . PHP_EOL;
	}

	static function ensure_thumbnail_exists($fol, $img)
	{
		$tn = $fol . '/tn/';

		if (!is_dir($tn)) mkdir($tn);
		if (file_exists($tn . $img)) return;

		$image = wp_get_image_editor($fol . '/' . $img);
		if ( ! is_wp_error( $image ) ) {
			$image->resize( 150, 150, true );
			$image->save($tn . $img);
		}
	}

	static function do_social($a, $c = null)
	{
		if (isset($a['tel'])) echo sprintf('<a class="tel" href="tel:%s">%s</a>', $a['tel'], $a['tel']);
		if (isset($a['fb'])) {
			if (!cs_var('fb_init')) {
				echo "<div id='fb-root'></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v3.0&appId=1613378742233452&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>";
				cs_var('fb_init', true);
			}

			$url = 'https://www.facebook.com/' . $a['fb'];
			$types = explode(',', $a['type']);

			if (in_array('button', $types)) {
				return sprintf('<div class="fb-like" data-href="%s" data-send="true" data-layout="button_count" data-width="450" data-show-faces="true"></div>', $url);
			}
			if (in_array('review', $types)) {
				return '<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2F' . $a['fb'] . '%2Fposts%2F' . $a['id'] . '%3A0&width=500" width="500" height="373" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>';
			}
			if (in_array('posts', $types)) {
				return sprintf('<div class="fb-page" data-href="%s" data-tabs="timeline" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="%s" class="fb-xfbml-parse-ignore"><a href="%s">%s</a></blockquote></div>', $url, $url, $url, $a['fb']);
			}
		}
		if (isset($a['tw'])) {
			if (!cs_var('tw_init')) {
				echo '<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>';
				cs_var('tw_init', true);
			}

			$types = explode(',', $a['type']);
			$r = '';

			if (in_array('mention', $types)) {
				$r .= '<a href="https://twitter.com/intent/tweet?screen_name=' . $a['tw'] . '&ref_src=twsrc%5Etfw" class="twitter-mention-button" data-show-count="false">Tweet to @' . $a['tw'] . '</a>';
			}
			if (in_array('timeline', $types)) {
				$r .= '<a class="twitter-timeline" href="https://twitter.com/@' . $a['tw'] . '">Tweets by ' . $a['tw'] . '</a>';
			}
			return $r;
		}
	}

	static function do_badge($a, $content = null)
	{
		CSScripts::qrcode();
		$op = array(sprintf('<a name="%s"></a>', $a['name']));
		$lines = explode('<br />', $content);
		$lnk = '<a href="%s" target="_blank">%s</a>';
		$pic = '<div style="float: right"><img src="%s" width="180" /></div>';

		if (is_single()) {
			$url = get_permalink() . '#' . $a['name'];
			$qrcode = sprintf('<div id="badge-%s" style="float: left; margin-right: 15px;"></div><script>$(document).ready(function() { new QRCode("badge-%s", { text: "%s", width: 80, height: 80, }); });</script>', $a['name'], $a['name'], $url);
			$op[] = $qrcode . '<b>Badge:</b> ' . sprintf($lnk, $url, $url);
		}

		foreach ($lines as $line)
		{
			$line = trim($line);
			if ($line == '') continue;
			if (strpos($line, ':') !== false) {
				$bits = explode(':', $line, 2);
				$bits[1] = trim($bits[1]);

				if (strcasecmp($bits[0], 'pic') == 0) {
					$op[] = sprintf($pic, $bits[1]);
					continue;
				} else if (strcasecmp($bits[0], 'link') == 0) {
					$url = explode('|', $bits[1]);
					$bits[1] = sprintf($lnk, $url[0], count($url) == 1 ? $url[0] : $url[1] );
				}
				$op[] = '<b>' . $bits[0] . ':</b> ' . $bits[1];
			} else {
				$op[] = $line;
			}
		}
		return PHP_EOL . '<blockquote class="badge" style="page-break-before: always;">' . implode('<br/>' . PHP_EOL, $op) . '</blockquote><hr/>';
	}

	static function do_ads($a, $content = null)
	{
		$syndUrl = 'http://yieldmore.org/';
		$imgFol = $syndUrl . 'wp-content/data/print/';
		$twitterHT = 'https://twitter.com/hashtag/';

		$ads = [
			'hst' => '<img src="' . $imgFol . 'logo-edlusion.png" width="200" />Our long term supporter, <a href="http://headstreamtech.com" target="_blank">Headstream Technologies</a>, is Launching it\'s <a href="https://groups.google.com/forum/#!topic/yieldmore/-R-SfqXsKwQ" target="_blank">Edlusion (Educator Effectiveness Platform)</a> in India at the <a href="http://edtechreview.in/news/2959-inspired-teaching-a-growing-need" target="_blank">edtechreview.in</a> conference on the 31st of August 2018.',
			'big' => '<img src="' . $imgFol . 'logo-buildindiagroup.png" width="120" />The <a href="http://buildindiagroup.org" target="_blank">Build India Group</a>, begins its 11th year this August as it tries to <a href="' . $syndUrl . 'movements/loving-nature/" target="_blank">awaken people</a> everywhere to the cry <a href="' . $twitterHT . 'LoveOurNature" target="_blank">#LoveOurNature</a>.',
			'spanda' => '<img src="' . $imgFol . 'logo-spanda.png" width="80" />The <a href="http://spanda.org" target="_blank">Spanda Foundation</a> is looking forward to the next 15 years of trying to achieve the <a href="www.un.org/millenniumgoals/" target="_blank">Millennium Development Goals</a> in this, its 14th year as it launches a fresh version of its website.',
			'hnc' => '<img src="' . $imgFol . 'logo-hnc.png" width="80" />The <a href="http://humannetworkconnection.com" target="_blank">Human Network Connection</a>, based in California, tries to network businesses with media outlets and is working on promoting YM online.',
		];

		$ad = isset($_GET['ad']) ? $_GET['ad'] : (isset($a['id']) ? $a['id'] : array_rand($ads));

		$op = [];
		$op[] = '<!--googleoff: all-->';
		$op[] = '<aside id="ads"><div class="wrap">';
		$op[]   = $ads[$ad];
		$op[] = '</div></aside>';
		$op[] = '<!--googleon: all-->';
		return implode(PHP_EOL, $op);
	}
}
WorksShortcodes::init();
?>
