<?php
class WorkQuote
{
	static function render()
	{
		$id = get_the_ID();

		if (!isset($_GET['qname']))
		{
			_nl('<h3>Quotes</h3>', 1);
			_nl('To add a quote, please visit one of the chapters on the left and click Add Quote.', 1);
			if (get_current_user_id() == 0) _nl('You must be signed in to do this.', 1);
			$names = self::getQuotes($id);
			$url = WorkNav::post($id) . '?quote=1&qname=';
			foreach ($names as $name)
				_nl(CHtml::link($name, $url . $name), 1);
			return;
		}

		include_once 'csb-content.php';
		$cfg = isset($_GET['qnode']) ? self::readForm() : self::readQuote($id, $_GET['qname']);

		$content = WorkContent::nodeQuote($id, $cfg);
		if (isset($_GET['qnode']))
		{
			self::saveQuote($id, $_GET['qname'], $cfg, $content);
		}
		echo $content;
	}

	static function readForm()
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

	static function readQuote($id, $name)
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

	static function getQuotes($id)
	{
		global $wpdb;
		$rows = $wpdb->get_results($wpdb->prepare(
			"SELECT quote_name FROM wp_quotes WHERE quote_post_ID = %s", $id));

		$op = array();
		foreach ($rows as $row)
		{
			$op[] = $row->quote_name;
		}
		return $op;
	}

	static function saveQuote($id, $name, $value, $content)
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
