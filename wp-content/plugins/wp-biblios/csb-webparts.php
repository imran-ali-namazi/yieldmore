<?php
class CSWebParts
{
	static function notice()
	{
		$defaultNotice = 'Content written for this website is copyleft (<a href="https://creativecommons.org/licenses/by-nc-sa/3.0/" target="_blank">creative commons nc sa</a>). Do respect the copyrights of quoted / published works like books, articles etc';
		$notices = array(
			//'share.yieldmore.org' => '',
			'heal.yieldmore.org' => 'The reader is requested to exercise caution and discretion in using the information provided and is advised not to discontinue any medication he/she may be taking without consulting their doctor. We do not undertake any responsibility for any issues that may arise from following any of the practices mentioned on this website.',
			'english.yieldmore.org' => 'All music, movies are copyrighted. Content is shared for educational purposes only.',
			//'learn.yieldmore.org' => '',
		);

		$dom = str_replace('www.', '', $_SERVER['HTTP_HOST']);
		$notice = isset($notices[$dom]) ? $notices[$dom] : $defaultNotice;
		echo '<p>' . $notice . '</p>';
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

	static function link($what)
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
	
	static function footer()
	{?>
		<div id="yield-footer">
			<div style="max-width: 250px;">
				<img src="/wp-content/plugins/wp-biblios/assets/images/yield.png" />
			</div>
			<div class="center">
				<?php self::link('Share'); ?><br><br>
				<?php self::link('Learn'); ?><br><br>
				<?php self::link('Express'); ?>
			</div>
			<div style="max-width: 120px;" class="center">
				<img src="/wp-content/plugins/wp-biblios/assets/images/heart.png" />
			</div>
			<div class="center">
				<?php self::link('Heal'); ?><br><br>
				<?php self::link('Love'); ?><br><br>
				<?php self::link('Yield More'); ?>
			</div>
			<div style="max-width: 250px;">
				<img src="/wp-content/plugins/wp-biblios/assets/images/star.png" />
			</div>
		</div>
	<?php
	}
}
?>
