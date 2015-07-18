<?php
class PostContent{
	public function display($wk)
	{
		$node = WorkNav::node();
		$fol = cs_var('bib-data') . '/' . $wk['fol'];
		$fil = $fol . '/' . $node . '.txt';
		echo file_get_contents($fil);
	}
}

if (WorkNav::search() || WorkNav::quote() || isset($contentInc)) return;
?>
<a name="contents"></a>
<?php if (WorkMenu::$title) echo '<h1>' . WorkMenu::$title . '</h1>'; ?>
<div class="<?php echo isset($_GET['notabs']) ? '' : 'tabber'; ?>">
<?php PostContent::display($wk); ?>
</div>
