<?php
class WorkContent
{
	private static $itemFormat = '<p>%s</p>
';
	private static $node;

	public function display($wk, $a = 0)
	{
		$id = get_the_ID();
		$dataFol = WorkConfig::fol($id, '');
		$dataUrl = WorkConfig::fol($id, '', 1);

		$rend = cs_work_get('renderer');
		if ($rend === 'self') {
			$node = WorkNav::node();
			include $wk['contentFile'];
			return;
		}

		$data = array();
		$extraData = array(); //for footnotes
		include $wk['contentFile'];
		if (isset($wk['config']['itemFormat'])) self::$itemFormat = $wk['config']['itemFormat'];

		if (WorkNav::all())
		{
			self::all($wk, $data, $extraData);
			return;
		}

		$nodeKey = $a ? $a['node'] . $a['subnode'] : WorkMenu::getNodeId($wk);
		if ($a && !array_key_exists($nodeKey, $data))
			$nodeKey = sprintf($wk['config']['keyFormat'], $a['node'], $a['subnode']);

		if (!$nodeKey)
		{
			$nodeKey = WorkNav::node();
			$file = cs_var('bib-data') . '/' . $wk['fol'] . '/' . $nodeKey . '.html';

			if (file_exists($file))
				echo file_get_contents($file);
			else
				echo 'Node ' . $nodeKey . ' not found';

			return;
		}

		$node = $data[$nodeKey];
		self::$node = $nodeKey;
		self::nodeTabs($node, $a);
		self::nodeFootnotes($extraData);
	}

	function showData($id, $a)
	{
		$bars = array(
			'slide' => '<a class="prev" href="#">&lt; prev</a> ' .
				'<a class="next" href="#">next &gt;</a>'
		);
		if (isset($a['fol'])) // post_type post not work
		{
			$dataFol = cs_var('bib-data') . '/' . $a['fol'] . '/';
			include $dataFol . 'content.php';
		}
		else
		{
			$dataFol = WorkConfig::fol($id, '');
			include cs_work_read($id, 'contentFile');
		}
		$op = sprintf('<div class="data-%s">', $a['type']);
		//$op .= '<div class="tbar">' . $bars[$a['type']] . '</div>';
		foreach ($data as $itm)
			$op .= sprintf('<div class="item">%s</div>', substr($itm, strlen('<br/>' . PHP_EOL)) ) . PHP_EOL;
		$op .= '</div>';
		return $op;
	}

	function nodeQuote($id, $a)
	{
		// TODO: renderer
		$wk = cs_work_read($id);
		$fmt = cs_work_read($id, 'config', 'keyFormat');
		// [work node=1 subnode=1 page=1 para=1 endpage=7][/work]
		$nodeKey = sprintf($fmt, $a['node'], $a['subnode']);
		echo $nodeKey;
		$a['page'] = intval($a['page']);
		$a['para'] = intval($a['para']);
		if (isset($a['endpage'])) $a['endpage'] = intval($a['endpage']);
		if (isset($a['endpara'])) $a['endpara'] = intval($a['endpara']);
		ob_start();

		echo '<blockquote class="quote">';
		if (!isset($a['nolink']))
				echo 'Quote from: ' . WorkMenu::nodeLink($id, $a, $a['content']) . '<br />';
		self::display($wk, $a);
		echo '</blockquote>';
		$res = ob_get_contents();
		ob_clean();
		return $res;
	}

	//a is true and set when quoting
	private function nodeTabs($node, $a)
	{
		foreach ($node as $i=>$items)
		{
			if ($a && $a['page'] > $i) continue;
			if ($a && isset($a['endpage']) && $a['endpage'] < $i) continue;
			$pg = $_GET['pg']; if ($pg != null) $pg = intval($pg);
			if (!$a)
			{
				self::tabberTab($tabPrefix . $i, $i == $pg, isset($_GET['notabs']) ? ' ' . WorkBookmark::pageLink($i) : '');
				if (!isset($_GET['notabs'])) _nl(WorkBookmark::pageLink($i));
			}
			else echo '<b>Page: ' . $i . ($i == $a['page'] && $a['para'] > 1 ? ' (' . $a['para'] . ')' : '') . '</b>';
			$icnt = count($items);
			//0th is always empty
			for ($j = 1; $j < $icnt; $j++)
			{
				//echo '<br/><b>Para: ' . $j . '</b>';
				if ($a && $a['page'] == $i && $a['para'] > $j) continue;
				if ($a && isset($a['endpara']) && $a['endpage'] == $i && ($a['endpara'] < $j && $a['endpara'] != '')) continue;
				echo self::formatItem($items[$j], false, $i, $i - $tabOffs, $node);
		
				if (!$a && $nextPgLink) echo $nextPgLink;
			}
			if (!$a) self::tabberTab(0);
		}
	}

	private function all($wk, $data, $extraData)
	{
		$nodes = WorkMenu::getNodeId($wk, 1);
		$errors = '';
		$menu = '';
		$content = '';
		foreach ($nodes as $key => $title)
		{
			self::$node = $key;
			$menu .= sprintf('<a href="#%s">%s</a><br/>' . PHP_EOL, $key, $title);
			$content .= sprintf('<a name="%s"></a><h2>%s</h2><br/>' . PHP_EOL, $key, $title);

			if (!isset($data[$key]))
			{
				$errors .= $key . count($data['s3c1']) . ', ';
				continue;
			}

			$pages = $data[$key];
			foreach ($pages as $page => $items)
			{
				$content .= sprintf('<a name="page%s"></a><h3 class="page"><a href="#page%s">Page %s</a> <a class="top" href="#top">top</a></h3><br/>' . PHP_EOL, $page, $page, $page);
				foreach ($items as $item)
				{
					$content .= self::formatItem($item, false);
				}
				$content .= PHP_EOL;
			}
			$content .= PHP_EOL;
			self::nodeFootnotes($extraData);
		}
		echo $errors . $menu . PHP_EOL . $content;
	}

	private function tabberTab($heading, $selected = 0, $links = '')
	{
		if (!$heading)
		{
			echo '</div>';
			return;
		}

		$act = $selected ? " tabbertabdefault" : "";
		echo sprintf('%s<div class="tabbertab%s">
	<h2>%s%s</h2>
	', '<a name="pg' . $heading . '"></a>', $act, $heading, $links);
	}

	function formatItem($txt, $search, $i = null, $tab = null, $node = null)
	{
		$txt = str_replace('class="footnote" id="', 'class="footnote" id="' . self::$node . '-', $txt);
		return $search ? $txt : sprintf(self::$itemFormat, $txt);
	}

	function nodeFootnotes($extraData)
	{
		if (!isset($extraData[self::$node])) return;
		CSScripts::post_thumbnails(); //to have bPopup
		echo '<div class="footnotes">' . PHP_EOL;
		foreach ($extraData[self::$node] as $id=>$txt)
			echo '<span class="footnote-text" id="note-' . self::$node . '-f' . $id . '">' . $id . ': ' . $txt . '</span><br/>' . PHP_EOL;
		echo '</div>' . PHP_EOL;
	}

	function getInfo($what)
	{
		$id = get_the_ID();
		$wk = cs_work_read($id);
		if ($what == 'node')
			return WorkMenu::getNodeId($wk);

		if ($what == 'page')
		{
			$data = array();
			include $wk['contentFile'];
			$node = $data[WorkMenu::getNodeId($wk)];
			foreach ($node as $i=>$page)
				return $i;
		}
	}
}

if (WorkNav::search() || WorkNav::quote() || isset($contentInc)) return;
?>

<div id="quotebar" style="display: none;">
	<form id="frmQuote" action="" target="_blank" method="get" onsubmit="QuoteSubmit();">
		<span id="qtext" title="Click the links below to begin / end quoting">Pg: 1, Itm: 2 End Pg:1</span><span>Name:</span>
		<input type="hidden" name="quote" value="1" />
		<input type="text" name="qname" id="qname" />
		<input type="hidden" name="qnode" value="<?php echo WorkContent::getInfo('node'); ?>" />
		<input type="hidden" name="qpage" value="<?php echo WorkContent::getInfo('page'); ?>" />
		<input type="hidden" name="qdata" id="qdata" value="" />
		<input type="submit" id="qsubmit" value="Q Save" />
		<input type="button" onclick="QuoteClear();" value="Clear" />
		<?php WorkBookmark::printHiddenFields(); ?>
	</form>
</div>

<blockquote><a href="javascript:$('.terms').parent().hide();" class="terms" style="float: right; margin: 0 0 10px 10px">X</a><b>Terms of Use</b>: My purpose in using this site is to read or use as a reference, books that I have already read or own. Also I'd like to preview unread books. I do declare that my intention is not to read books for free, denying due royalty owed to the Author and Publishers.</blockquote>

<a name="contents"></a>
<?php if (WorkMenu::$title) echo '<h3>' . WorkMenu::$title . '</h3>'; ?>
<div class="<?php echo isset($_GET['notabs']) ? '' : 'tabber'; ?>">
<?php WorkContent::display($wk); ?>
</div>
