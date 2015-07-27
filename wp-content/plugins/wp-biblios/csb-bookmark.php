<?php
class WorkBookmark
{
	function printHiddenFields()
	{
		
	}

	function printLinkForWork($id)
	{
		if (!is_user_logged_in()) return;
		$bks = self::getBookmarks($id);
		if (!count($bks)) return;
		$bk = $bks[0];
		_nl(CHtml::link('Bookmark', $bk->bk_url), 1);
	}
	
	function pageLink($pg)
	{
		if (!is_user_logged_in()) return '';
		$url = WorkNav::post(get_the_ID(), WorkNav::node());
		$url .= isset($_GET['notabs']) ? '#pg' . $pg : '&pg=' . $pg;
		return CHtml::link('Set Bookmark', $url, array('class'=>'bookmark'));
	}

	function trySave()
	{
		if (!isset($_GET['bookmark'])) return;

		self::saveQuote($id, $_GET['qname'], $cfg, $content);
		die('done');
	}

	function getBookmarks($id = false)
	{
		global $wpdb;
		$rows = $wpdb->get_results($wpdb->prepare(
			"SELECT bk_name, bk_url FROM wp_bookmarks WHERE bk_user_ID = %s" . ($id ? ' and bk_post_ID = %s' : ''), get_current_user_id(), $id));

		$op = array();
		foreach ($rows as $row)
			$op[] = $row;
		return $op;
	}

	function saveBookmark($id, $name, $url)
	{
		$row = array(
			'bk_post_ID' => $id,
			'bk_user_ID' => get_current_user_id(),
			'bk_name' => $name,
			'bk_url' => $url,
			'bk_date' => date('Y-m-d H:i:s'),
		);
		global $wpdb;
		$wpdb->insert( 'wp_bookmarks', $row);
	}
}
?>
