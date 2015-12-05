<?php
class CSWebParts
{
	static function info($what = 'link')
	{
		if ($what == 'link')
		{
			CSScripts::bpopup();
			echo '<a id="info-link" href="#"><img src="/wp-content/plugins/wp-biblios/assets/images/yield.gif" height="24" /></a>';
			return;
		}
		echo '<div id="info-body" style="display: none;">';
		echo '	<img src="/wp-content/plugins/wp-biblios/assets/images/yield-banner.png" /><br />';
		echo '<i>Clicking the animated image to the right of the header logo will launch this popup. <a href="javascript:$(\'#info-body\').bPopup().close();">click here to close</a></i><br/>';
		//TODO: info for each subdomain...
		echo file_get_contents(dirname(__FILE__) . '/assets/info.html');
		if (is_home()) echo '<script>var showYMInfo = true;</script>';
		echo '</div>';
	}

	static function shell()
	{
		$links = array(
			'S' => 'share.yieldmore.org',
			'H' => 'heal.yieldmore.org',
			'E' => 'english.yieldmore.org',
			'L' => 'learn.yieldmore.org',
			'& YieldMore' => 'yieldmore.org',
		);
		$titles = array(
			'S' => 'Share',
			'H' => 'Heal',
			'E' => 'Express',
			'L' => 'Learn',
		);
		$defltTitle = 'Get more out of life by living like Every Day Is Your Last';
		$op = array();
		foreach ($links as $letter=>$url)
		{
			$title = isset($titles[$letter]) ? $titles[$letter] : $defltTitle;
			$op[] = sprintf('<a href="http://%s" title="%s">%s</a>', $url, $title, $letter);
		}
		echo '<p align="center">' . implode(' ', $op) . '</p>';
	}

	static function notice()
	{
		$defaultNotice = 'Content written for this website is copyleft (<a href="https://creativecommons.org/licenses/by-nc-sa/3.0/" target="_blank">creative commons nc sa</a>). Do respect the copyrights of quoted / published works like books, articles etc. <a href="mailto:shasa@cselian.com?subject=contribution - yieldmore" target="_blank">Contributions / alterations</a> welcome.';
		$notices = array(
			//'share.yieldmore.org' => '',
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
		$social = array(
			'Facebook' => 'https://www.facebook.com/groups/YieldMore/',
			'Google+' => 'https://plus.google.com/b/112530158906132741775/',
			'LinkedIn' => 'https://www.linkedin.com/company/yieldmore-org',
			'YouTube' => 'https://www.youtube.com/channel/UC_iHhVADe1oSjP3oAi5bnnw/playlists',
		);

		$dom = str_replace('www.', '', $_SERVER['HTTP_HOST']);
		if ($dom == 'learn.yieldmore.org')
			$social['FB Learn YM'] = 'https://www.facebook.com/groups/LearnYM';
		else if ($dom == 'heal.yieldmore.org')
			$social['FB Heal YM'] = 'https://www.facebook.com/groups/HealYM';

		$op = array();
		foreach ($social as $name=>$url)
			$op[] = sprintf('<a href="%s" target="_blank">%s</a>', $url, $name);
		echo '<p>' . implode(' ', $op) . '</p>';
	}

	static function footer()
	{?>
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
		echo '<br><br>See Also:';
		$links = array(
			'Recognize' => 'recognize.yieldmore.org',
			'Accredit' => 'accredit.yieldmore.org',
		);
		foreach ($links as $text=>$url)
			echo sprintf('<br /><a href="http://%s">%s</a>', $url, $text);
	}
}
?>
