<?php
class CSWebParts
{
	static function info($what = 'link')
	{
		if (cs_var('slim')) return;
		if ($what == 'link')
		{
			CSScripts::bpopup();
			echo '<a id="info-link" class="splash-link" href="#"><img src="/wp-content/plugins/wp-biblios/assets/images/yield.gif" height="24" /></a>';
			return;
		}
		echo '<div id="info-body" style="display: none;">';
		//echo '	<img src="/wp-content/plugins/wp-biblios/assets/images/yield-banner.png" /><br />';
		echo '<a class="close" href="javascript:$(\'#info-body\').bPopup().close();">close</a>';
		echo '<small>Click the logo (green / blue) on the header, or the "Splash Popup" menu link under About in the top nav to launch this popup.</i></small><br/>';

		echo file_get_contents(dirname(__FILE__) . '/assets/info.html') . PHP_EOL;
		if (is_home()) echo '<script>var showYMInfo = true;</script>' . PHP_EOL;
		echo '</div>';
	}

	static function shell()
	{
		$links = array(
			'L' => 'learn.yieldmore.org',
			'H' => 'heal.yieldmore.org',
			'S' => 'share.yieldmore.org',
			'E' => 'english.yieldmore.org',
			'U' => 'sites.yieldmore.org',
			'& YM' => 'yieldmore.org',
		);
		$titles = array(
			'S' => 'Share',
			'H' => 'Heal',
			'E' => 'Express',
			'L' => 'Learn',
			'U' => 'User Sites',
			'& YM' => 'Yield More',
		);
		$defltTitle = 'Get more out of life by living like Every Day Is Your Last';
		$op = array();
		foreach ($links as $letter=>$url)
		{
			$title = isset($titles[$letter]) ? $titles[$letter] : $defltTitle;
			$op[] = sprintf('<a href="http://%s" title="%s">%s</a>', $url, $title, $letter);
		}
		echo '<p align="center">' . implode(' ', $op);
		self::info();
		echo '</p>';
	}

	static function notice()
	{
		return;
		$defaultNotice = 'Content written for this website is organized by topic and is generally <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/" target="_blank">copyleft</a>, unless quoted/published from somewhere else. <a href="mailto:shasa@cselian.com?subject=contribution - yieldmore" target="_blank">Contributions / alterations</a> welcome.';
		$notices = array(
			'share.yieldmore.org' => 'YieldMore does not endorse the views of the people and organizations posting here and cannot be held liable.',
			'heal.yieldmore.org' => 'The reader is requested to exercise caution and discretion in using the information provided and is advised not to discontinue any medication he/she may be taking without consulting their doctor. We do not undertake any responsibility for any issues that may arise from following any of the practices mentioned on this website. <a href="mailto:shasa@cselian.com?subject=heal suggestions - yieldmore" target="_blank">Suggestions</a> welcome.',
			'english.yieldmore.org' => 'All music and movies are copyrighted. Content is shared for educational purposes (learning english) only. <a href="mailto:shasa@cselian.com?subject=english suggestions - yieldmore" target="_blank">Suggestions</a> welcome.',
			//'learn.yieldmore.org' => '',
		);

		$dom = str_replace('www.', '', $_SERVER['HTTP_HOST']);
		$notice = isset($notices[$dom]) ? $notices[$dom] : $defaultNotice;
		echo '<p>' . $notice . '</p>';
	}

	static function social()
	{
		echo sprintf('<p><a href="%s" target="_blank">%s</a></p>', 'http://yieldmore.org/r', 'Social Media Links');
		return;

		$social = array(
			'Facebook' => 'https://www.facebook.com/YieldMoreOrg/',
			'Google+' => 'https://plus.google.com/b/112530158906132741775/',
			'LinkedIn' => 'https://www.linkedin.com/company/yieldmore-org',
			'YouTube' => 'https://www.youtube.com/channel/UC_iHhVADe1oSjP3oAi5bnnw/playlists',
		);

		$dom = str_replace('www.', '', $_SERVER['HTTP_HOST']);
		if ($dom == 'learn.yieldmore.org')
			$social['FB Learn YM'] = 'https://www.facebook.com/groups/LearnYM';
		else if ($dom == 'heal.yieldmore.org')
			$social['FB Heal YM'] = 'https://www.facebook.com/groups/HealYM';
		else if ($dom == 'share.yieldmore.org')
			$social['FB Share (Serve) YM'] = 'https://www.facebook.com/groups/ServeYM';

		$op = array();
		foreach ($social as $name=>$url)
			$op[] = sprintf('<a href="%s" target="_blank">%s</a>', $url, $name);
		echo '<p>' . implode(' ', $op) . '</p>';
	}

	static function footer()
	{
		if (cs_var('slim'))
		{
			echo 'This minisite created using the platform of <a href="http://yieldmore.org/about" target="_blank">YieldMore.org</a>.';
			return;
		}
		echo 'Do respect the copyrights of published / reposted content (songs, movies, books).
			See <a href="http://yieldmore.org/about/#splash">Start</a>, <a href="http://yieldmore.org/?o=1" target="_blank">Sitemap</a> or <a href="http://yieldmore.org/r" target="_blank">Redirects</a>.'; return;
		?>
		<div id="yield-footer">
			<div>
				<img src="/wp-content/plugins/wp-biblios/assets/images/yield.png" />
			</div>
			<div class="center">
				<?php self::link('Share'); ?><br><br>
				<?php self::link('Learn'); ?><br><br>
				<?php self::link('Express'); ?>
			</div>
			<div class="center">
				<img src="/wp-content/plugins/wp-biblios/assets/images/heart.png" />
			</div>
			<div class="center">
				<?php self::link('Heal'); ?><br><br>
				<?php self::link('Love'); ?><br><br>
				<?php self::link('Yield More'); ?>
			</div>
			<div>
				<img src="/wp-content/plugins/wp-biblios/assets/images/star.png" />
			</div>
		</div>
	<?php
	}

	private static function link($what)
	{
		$links = array(
			'Share' => 'share.yieldmore.org',
			'Heal' => 'heal.yieldmore.org',
			'Learn' => 'learn.yieldmore.org',
			'Love' => 'yieldmore.org/movements/sharing-love',
			'Express' => 'english.yieldmore.org',
			'Yield More' => 'yieldmore.org',
		);
		echo sprintf('<a href="http://%s">%s</a>', $links[$what], $what);
	}

	static function also()
	{
		return; //TODO: later
		echo '<br><br>See Also:';
		$links = array(
			//'Less (declutter)' => 'less.yieldmore.org',
			//'Organization'
			'Blink (education)' => 'blinkfoundation.org',
			//'Recognize' => 'recognize.yieldmore.org',
			//'Accredit' => 'accredit.yieldmore.org',
			//'Statistics' => 'stats.yieldmore.org',
		);
		foreach ($links as $text=>$url)
			echo sprintf('<br /><a href="http://%s"%s>%s</a>', $url, $text == 'Blink (education)' ? ' target="_blank"' : '', $text);
	}
	
	static function cse($prepend)
	{
		echo $prepend; ?><a href="https://cse.google.com/cse/publicurl?cx=001331742872338784437:4ecyp4weblg" class="extra" target="_blank">open in new tab</a>.<br />
<script>
  (function() {
    var cx = '001331742872338784437:4ecyp4weblg';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search enableAutoComplete="true"></gcse:search>
<?php
	}
}
?>