<?php 
class WorkSearch
{
	function find($wk, $id)
	{
		$s = WorkNav::search();
		$nodes = self::nodeList($wk);
		$totalItems = 0;
		$found = 0;
		$end = $single ? 0 : 1;

		$data = array();
		include $wk['contentFile'];
		$slug = $wk['config']['slug'];
		$titles = $wk['config']['titles'];
		include_once 'csb-content.php';

		$r = '<span class="match">' . $s . '</span>';
		foreach ($nodes as $node)
		{
			if (!isset($data[$node['node']])) continue; // for bg which is incomplete
			foreach ($data[$node['node']] as $pg=>$items) {
				//foreach ($items as $itm) {
				$cnt = count($items);
				for ($i = 1; $i < $cnt; $i++) {
					$totalItems++;
					$itm = $items[$i]; //so we can mention the para number
					if (stripos($itm, $s) !== false) {
						$title = isset($node['ix2']) ? $titles[$node['ix']][$node['ix2']] : $titles[$node['ix']];
						$url =  isset($node['ix2']) ? $slug . $node['ix'] . '-' . $wk['config']['slug2'] . $node['ix2'] : $slug . $node['ix'];
						$link = CHtml::link($title, WorkNav::post($id, $url, $pg));
						$itm = str_ireplace($s, $r, $itm);
						echo sprintf('<div><b>%s pg %s, %s %s:</b>
	%s</div>', $link, $pg, $itemName, $i, WorkContent::formatItem($itm, true));
	
						$found++;
		  		}
		  	}
		  	//die("done"); //search only chapter 1 for now
			}
		}
		if ($found) echo "<hr>";
		echo sprintf("Found %s matches in %s items.", $found, $totalItems);
	}
	
	private function nodeList($wk)
	{
		$titles = $wk['config']['titles'];
		$tcnt = count($titles);
		
		$nodes = array();
		if (!isset($wk['config']['slug2']))
		{
			for ($n = 1; $n < $tcnt; $n++)
				$nodes[] = array('ix' => $n, 'node' => sprintf($wk['config']['keyFormat'], $n));
		}
		else
		{
			for ($n = 1; $n < $tcnt; $n++)
			{
				$ocnt = count($titles[$n]);
				for ($o = 1; $o < $ocnt; $o++)
				$nodes[] = array('ix' => $n, 'ix2' => $o, 'node' => sprintf($wk['config']['keyFormat'], $n, $o));
			}
		}
		return $nodes;
	}
}
WorkSearch::find($wk, $id);
?>
