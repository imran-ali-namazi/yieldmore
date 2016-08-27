<?php
class WorkMenu
{
	public static $previous = false, $next = false, $title = false;

	function render($id, $wk)
	{
		_nl(CHtml::link('Home', WorkNav::post($id)), 1);
		if (get_post_type($id) == 'work')
		{
			_nl(CHtml::link('Quotes', get_permalink($id) . '?quote=1'), 1);
			WorkBookmark::printLinkForWork($id);
			if (WorkNav::node() && get_current_user_id() != 0) _nl('<a id="quotetoggler" href="javascript:toggleQuoting();" title="Toggle Quoting">Add Quote</a>', 1);
			_nl(CHtml::link('Single Page', WorkNav::post($id) . '?all=1'), 1);
			_nl(CHtml::link('Jump to Contents', '#contents', array('class'=>'jump-to-contents')));
			if (WorkNav::node()) _nl(CHtml::link(isset($_GET['notabs']) ? 'Show Page Tabs' : 'No Page Tabs', WorkNav::notabs(), array('rel', 'noindex nofollow')));
			_nl('<br/>', 1);
		}

		if (!$wk['cfgOk'])
		{
			echo $wk['cfgError'];
			return;
		}

		if (get_post_type($id) == 'post')
			self::text($id, $wk);
		else if (!isset($wk['config']['slug2']))
			self::one($id, $wk);
		else
			self::two($id, $wk);

		if (isset($wk['config']['links']))
			self::links($id, $wk['config']);
	}

	function nodeLink($id, $a, $txt)
	{
		$cfg = cs_work_read($id, 'config');
		$node = $cfg['slug'] . $a['node'] . (isset($cfg['slug2']) ? '-' . $cfg['slug2'] . $a['subnode'] : '');
		return CHtml::link($txt, WorkNav::post($id, $node));
	}
	
	private function links($id, $cfg)
	{
		// TODO: make array and remove links: count workaround!
		$dataUrl = WorkConfig::fol($id, '', 1);
		$cnt = intval($cfg['links']);
		_nl('', 1); _nl('<b>Links:</b>', 1);
		for ($i = 1; $i <= $cnt ; $i++)
		{
			$link = explode('|', $cfg['link' . $i]);
			_nl(CHtml::link($link[0], $dataUrl . $link[1]), 1);
		}
	}

	private function text($id, $wk)
	{
		$fol = cs_var('bib-data') . '/' . $wk['fol'];
		if (!is_dir($fol)) { echo 'Folder doesnt exist: ' . $fol; return; }
		$fils = scandir($fol);
		if (count($fils) == 2) { echo 'Folder is empty: ' . $fol; return; }
		sort($fils);
		$exclude = cs_var('exclude'); //exclude the folder alone
		foreach ($fils as $fil)
		{
			if ($fil == '.' || $fil == '..' || $fil == 'images' || $fil == 'docs' || $fil == $exclude) continue;
			$name = str_replace('.txt', '', str_replace('.html', '', $fil));
			//if ($exclude && substr($name, 0, strlen($exclude)) === $exclude) continue;
			_nl(CHtml::link(str_replace('-', ' ', $name), WorkNav::post($id, $name)), 1);
		}
	}

	private function one($id, $wk)
	{
		$cur = isset($_GET['node']) ? $_GET['node'] : '';
		extract($wk['config']);
		$tcnt = count($titles);
		$ct = $customTitles;
		$sl = isset($slug);
		$prev = false;
		for ($i = 1; $i < $tcnt; $i++) {
			$url = $sl ? $slug . $i . self::name($ct, $titles[$i]) : strtolower($titles[$i]);
			$atts = array();
			if (self::$previous && self::$next === false)
			{
				self::$next = CHtml::link($titles[$i], WorkNav::post($id, $url));
			}
			if ($url == $cur)
			{
				self::$previous = $prev;
				self::$title = sprintf($heading, $i, $titles[$i]);
				$atts['class'] = 'selected';
			}
			$prev = CHtml::link($titles[$i], WorkNav::post($id, $url));
			_nl($i . '. ' . CHtml::link($titles[$i], WorkNav::post($id, $url), $atts), 1);
		}
	}
	
	private function name($customTitles, $title)
	{
		return $customTitles ? '&title=' . str_replace(' ', '-', strtolower($title)) : '';
	}
	
	private function two($id, $wk)
	{
		$cur = isset($_GET['node']) ? $_GET['node'] : '';
		extract($wk['config']);
		$exclude = isset($exclude) ? explode(',', $exclude) : array();
		$tcnt = count($titles);
		$pre = cs_var('bib-data') . '/' . $wk['fol'] . '/';
		for ($i = 1; $i < $tcnt; $i++)
		{
			$d = $titles[$i];
			$slug0 = $slug . $i;
			if (isset($slugKey0) && isset($slugKey0[$i]))
				$slug0 = $slugKey0[$i];
		
			echo sprintf('<span class="sect">%s) %s</span>', $i, $d[0]);
			$preTitles = array('intro' => 'Introduction', 'preface' => 'Preface');
			foreach ($preTitles as $title=>$text) {
				$file = $pre . $slug0 . '-' . $title . '.html';
				$class = WorkNav::node() === $slug0 . '-' . $title ? ' class="selected"' : '';
				if (!file_exists($file)) continue;
					echo sprintf('	<a href="%s-%s"%s>%s</a><br/>' . PHP_EOL, 
						WorkNav::post($id, $slug0), $title, $class, $text);
			}

			echo '<ul type="1">';
			$scnt = count($d);

			for ($j = 1; $j < $scnt; $j++)
			{
				if (isset($customTitles))
				{
					echo sprintf('	<li><a href="%s-%s%s-%s">%s</a>%s</li>' . PHP_EOL,
						$slug0, $slug2, $j, $d[$j][2], $d[$j][1], $pg);
					continue;
				}

				$url = $slug0 . '-' . $slug2 . $j;
				if (array_search($url, $exclude) !== false) continue;
				$atts = array();
				if ($d[$j] == '') continue;
				if (self::$previous && self::$next === false)
				{
					self::$next = CHtml::link(sprintf('%s.%s %s', $i, $j, $d[$j]), 
					WorkNav::post($id, $url));
				}
				if ($url == $cur)
				{
					self::$previous = $prev;
					self::$title = sprintf($heading, $i) . ': ' . $d[0] . ', ' . sprintf($heading2, $j) . ': ' . $d[$j];
					$atts['class'] = 'selected';
				}

				$prev = CHtml::link(sprintf('%s.%s %s', $i, $j, $d[$j]), 
					WorkNav::post($id, $url), $atts);

				_nl('    <li>' . $prev . '</li>');
			}
			echo '</ul><hr/>';
		}
	}

// These are for building
	function getNodeId($wk, $array = 0)
	{
		$nodes = array();
		$node = WorkNav::node();
		extract($wk['config']);
		$tcnt = count($titles);

		if (!isset($slug2))
		{
			for ($i = 1; $i < $tcnt; $i++)
			{
				$n = $slug . $i;
				$item = sprintf($keyFormat, $i);
				if ($node == $n && $array == false) return $item;
				if ($array) $nodes[$item] = $titles[$i];
			}
		}
		else
		{
			for ($i = 1; $i < $tcnt; $i++)
			{
				$d = $titles[$i];
				$slug0 = $slug . $i;
				$scnt = count($d);
				for ($j = 1; $j < $scnt; $j++)
				{
					$n = $slug0 . '-' . $slug2 . $j;
					$item = sprintf($keyFormat, $i, $j);
					if ($node == $n && $array == false) return $item;
					if ($array) $nodes[$item] = $titles[$i][$j];
				}
			}
		}
		return $array ? $nodes : false;
	}
}
?>
