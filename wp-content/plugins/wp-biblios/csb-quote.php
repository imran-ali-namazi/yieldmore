<?php
class WorkQuote
{
	function render()
	{
		include_once 'csb-content.php';
		$id = get_the_ID();
		$cfg = isset($_GET['qnode']) ? self::readForm() : self::readQuote($id, $_GET['qname']);

		$content = WorkContent::nodeQuote($id, $cfg);
		if (isset($_GET['qnode']))
		{
			self::saveQuote($id, $_GET['qname'], $cfg, $content);
		}
		echo $content;
	}

	function readForm()
	{
		$id = get_the_ID();

		$data = explode(';', $_GET['qdata']);
		$item = array();
		foreach($data as $itm)
		{
			$kv = explode('=', $itm);
			$item[$kv[0]] = $kv[1];
		}

		$node = explode('-', $_GET['qnode']);
		$startPage = intval($_GET['qpage']) - 1;
		$page =  $startPage + intval($item['p']);
		$endPage =  $startPage + intval($item['ep']);

		return array(
			'node' => $node[0], 'subnode' => isset($node[1]) ? $node[1] : false,
			'page' => $page, 'para' => $item['i'],
			'endpage' => $endPage, 'endpara' => $item['ei']);
	}

	function readQuote($id, $name)
	{
		global $wpdb;
		$row = $wpdb->get_row($wpdb->prepare(
			"SELECT quote_config FROM wp_quotes WHERE quote_post_ID = %s AND quote_name = %s", $id, $name));
		$op = array();
		$val = explode(',', $row->quote_config);
		foreach ($val as $itm)
		{
			$kv = explode('=', $itm);
			$op[$kv[0]] = $kv[1];
		}

		return $op;
	}

	function saveQuote($id, $name, $value, $content)
	{
		$bits = array();
		foreach ($value as $k=>$v)
			$bits[] = $k . '=' . $v;
		$value = implode(',', $bits);
		
		$row = array(
			'quote_post_ID' => $id,
			'quote_user_ID' => get_current_user_id(),
			'quote_date' => 'getdate()',
			'quote_name' => $name,
			'quote_config' => $value,
			'quote_content' => $content
		);
		global $wpdb;
		$wpdb->insert( 'wp_quotes', $row);
	}
}

WorkQuote::render();
?>
