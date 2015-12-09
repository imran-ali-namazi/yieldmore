<?php
class PostContent{
	public function display($wk)
	{
		$node = WorkNav::node();
		$fol = cs_var('bib-data') . '/' . $wk['fol'];
		$fil = $fol . '/' . $node . '.html';
		if (!file_exists($fil)) $fil = $fol . '/' . $node . '.txt';
		$content = file_get_contents($fil);
		$folUrl = cs_var('bib-data-url') . '/' . $wk['fol'] . '/';
		$content = str_replace('src="images', 'src="' . $folUrl . 'images', $content);
		$content = apply_filters('the_content', $content);
		echo $content;
	}
}

if (WorkNav::search() || WorkNav::quote() || isset($contentInc)) return;
?>
<a name="contents"></a>
<?php echo '<h3>' . ucwords(str_replace('-', ' ', WorkNav::node())) . '</h3>'; ?>
<?php PostContent::display($wk); ?>
