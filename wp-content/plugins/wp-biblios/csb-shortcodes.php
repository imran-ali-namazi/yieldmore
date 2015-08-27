<?php
class WorksShortcodes
{
	function init()
	{
		$cls = get_class();
		add_shortcode('tab', array($cls, 'do_tab'));
		add_shortcode('works', array($cls, 'do_works'));
		add_shortcode('work', array($cls, 'do_work')); //TODO: missing keyword config causes untraceable error 500
		add_shortcode('data', array($cls, 'do_data'));
		add_shortcode('info', array($cls, 'do_info'));
		add_shortcode('bookmarks', array($cls, 'do_bookmarks'));
	}

	function do_tab($a, $content = null)
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

	function do_works($a, $content = null)
	{
		WorkCache::getWorks($types, $works);

		$links = self::types_r($types, count($works));
		self::works_r($works, $links);
	}

	function do_work($a, $content = null)
	{
		if (array_search('config', $a) !== false)
		{
			global $postConfig;
			$postConfig = WorkConfig::read(get_the_ID(), $a);
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

	function do_data($a, $content = null)
	{
		return WorkConfig::fol(get_the_ID(), '', true);
	}

	private function types_r($types, $all)
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

	private function works_r($works, $links)
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

	function do_info($a, $content = null)
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
				}
				$op[] = '<b>' . $bits[0] . ':</b> ' . $bits[1];
			} else {
				$op[] = $line;
			}
		}
		if (!count($op)) return; //if only pdf and not logged in
		return PHP_EOL . '<blockquote class="info">' . implode('<br/>' . PHP_EOL, $op) . '</blockquote>';
	}

	function do_bookmarks($a, $content = null)
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

	function disable_userlist($a, $c = null)
	{
	}
}
WorksShortcodes::init();
?>
