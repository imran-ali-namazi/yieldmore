<?php
if (isset($ft)) {
	$fol = 'wp-content/data';
	$ft["settings"]["DIR"] = $url = sprintf('../../../%s/', $fol);
	$ft["settings"]["explore"] = sprintf('Browse: <a target="_new" href="%s">%s</a>', $url, $fol);
	return;
}
?>
