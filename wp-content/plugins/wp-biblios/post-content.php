<?php
class PostContent{
	public function display($wk)
	{
		$node = WorkNav::node();
		$fol = cs_var('bib-data') . '/' . $wk['fol'];
		$fil = $fol . '/' . $node . '.txt';
		$content = file_get_contents($fil);
		$content = apply_filters('the_content', $content);
		echo $content;
	}
}

if (WorkNav::search() || WorkNav::quote() || isset($contentInc)) return;
?>
<a name="contents"></a>
<?php echo '<h3>' . ucwords(str_replace('-', ' ', WorkNav::node())) . '</h3>'; ?>
<?php PostContent::display($wk); ?>
