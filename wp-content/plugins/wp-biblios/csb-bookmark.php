<?php
class WorkBookmark
{
	function printLinkForWork($id)
	{
		if (!is_user_logged_in()) return;
		$bks = self::getBookmarks($id);
		if (!count($bks)) return;
		$bk = $bks[0];
		_nl(CHtml::link('Goto Bookmark', $bk->bk_url), 1);
	}
	
	function pageLink($pg)
	{
		if (!is_user_logged_in()) return '';
		$url = WorkNav::post(get_the_ID(), WorkNav::node());
		$url .= isset($_GET['notabs']) ? '#pg' . $pg : '&pg=' . $pg;
		return CHtml::link('Set Bookmark', $url, array('class'=>'bookmark'));
	}

	function name()
	{
		global $post;
		echo $post->post_title;
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

	function saveBookmark()
	{
		$id = $_POST['bkid'];
		$name = $_POST['bkname'];
		$url = $_POST['bkurl'];
		$row = array(
			'bk_post_ID' => $id,
			'bk_user_ID' => get_current_user_id(),
			'bk_name' => $name,
			'bk_url' => $url,
			'bk_date' => date('Y-m-d H:i:s'),
		);
		$where = array(
			'bk_post_ID' => $id,
			'bk_user_ID' => get_current_user_id(),
		);
		global $wpdb;
		if (!$wpdb->update('wp_bookmarks', $row, $where))
			$wpdb->insert('wp_bookmarks', $row);
		die(sprintf('Bookmark Saved for %s with url %s', $name, $url));
	}
}
?>
