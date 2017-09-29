<?php
if (isset($ft)) {
	$fol = 'wp-content/data' . (get_current_blog_id() == 1  ? '' : get_current_blog_id());  //cs_var('bib-data-name');
	$ft["settings"]["DIR"] = $url = sprintf('../../../%s/', $fol);
	$ft["settings"]["explore"] = sprintf('Browse: <a target="_new" href="%s">%s</a>', $url, $fol);
	return;
}
?>
