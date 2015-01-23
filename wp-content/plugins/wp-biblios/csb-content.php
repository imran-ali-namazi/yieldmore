<?php
class WorkContent
{
	private static $itemFormat = '<p>%s</p>
';
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
		include $wk['contentFile'];
		if (isset($wk['config']['itemFormat'])) self::$itemFormat = $wk['config']['itemFormat'];
		$nodeKey = $a ? $a['node'] : WorkMenu::getNodeId($wk);
		$node = $data[$nodeKey];
		self::nodeTabs($node, $a);
	}
	
	function showData($id, $a)
	{
		$bars = array(
			'slide' => '<a class="prev" href="#">&lt; prev</a> ' .
				'<a class="next" href="#">next &gt;</a>'
		);
		$dataFol = WorkConfig::fol($id, '');
		include cs_work_read($id, 'contentFile');
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
		//print_r($a);
		echo '<blockquote class="quote">';
		if (!isset($a['nolink']))
				echo 'Quote from: ' . WorkMenu::nodeLink($id, $a, $a['content']) . '<br />';
		self::display($wk, $a);
		echo '</blockquote>';
		$res = ob_get_contents();
		ob_clean();
		return $res;
	}
	
	private function nodeTabs($node, $a)
	{
		foreach ($node as $i=>$items)
		{
			if ($a && $a['page'] > $i) continue;
			if ($a && isset($a['endpage']) && $a['endpage'] < $i) continue;
			$pg = $_GET['page']; if ($pg != null) $pg = intval($pg);
			if (!$a) self::tabberTab($tabPrefix . $i, $i == $pg);
			else echo '<b>Page: ' . $i . ($i == $a['page'] && $a['para'] > 1 ? ' (' . $a['para'] . ')' : '') . '</b>';
			$icnt = count($items);
			//0th is always empty
			for ($j = 1; $j < $icnt; $j++)
			{
				//echo '<br/><b>Para: ' . $j . '</b>';
				if ($a && $a['page'] == $i && $a['para'] > $j) continue;
				if ($a && isset($a['endpara']) && $a['endpage'] == $i && $a['endpara'] < $j) continue;
				echo self::formatItem($items[$j], false, $i, $i - $tabOffs, $node);
		
				if (!$a && $nextPgLink) echo $nextPgLink;
			}
			if (!$a) self::tabberTab(0);
		}
	}
	
	private function tabberTab($heading, $selected = 0)
	{
		if (!$heading)
		{
			echo '</div>';
			return;
		}
		
		$act = $selected ? " tabbertabdefault" : "";
		echo sprintf('<div class="tabbertab%s">
	<h2>%s</h2>
	', $act, $heading);
	}

	function formatItem($txt, $search, $i = null, $tab = null, $node = null)
	{
		return $search ? $txt : sprintf(self::$itemFormat, $txt);
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

<a id="quotetoggler" href="javascript:toggleQuoting();" title="Toggle Quoting">Add Quote</a>
<div id="quotebar" style="display: none;">
	<form id="frmQuote" action="" target="_blank" method="get" onsubmit="QuoteSubmit();">
		<span id="qtext" title="Click the links below to begin / end quoting">Pg: 1, Itm: 2 End Pg:1</span><span>Name:</span>
		<input type="hidden" name="quote" value="1">
		<input type="text" name="qname" id="qname">
		<input type="hidden" name="qnode" value="<?php echo WorkContent::getInfo('node'); ?>">
		<input type="hidden" name="qpage" value="<?php echo WorkContent::getInfo('page'); ?>">
		<input type="hidden" name="qdata" id="qdata" value="">
		<input type="submit" id="qsubmit" value="Q Save">
		<input type="button" onclick="QuoteClear();" value="Clear">
	</form>
</div>
<div class="tabber">
<?php WorkContent::display($wk); ?>
</div>
