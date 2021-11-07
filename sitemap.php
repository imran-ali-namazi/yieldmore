<ol class="sitemap">
<?php

$sites = cs_var('sites');

$tpl = '<li><a href="%s">%s</a>';
foreach ($sites as $s => $noop) {
	$slug = $s == 'root' ? '' : $s . '/';
	echo sprintf($tpl, cs_var('url') . $slug, humanize($s));
	link_recursively(__DIR__ . '/posts/' . $s, $slug, 1, $tpl);
	echo '</li>';
}
echo '</ol>';

function link_recursively($fol, $rel, $level, $tpl) {
	$contents = scandir($fol);
	unset($contents[0]); unset($contents[1]);
	natsort($contents);	

	echo '<ol>';
	$last = false;
	foreach ($contents as $name) {
		if ($name == 'images') continue;
		$name = str_replace('.txt', '', $name);
		if ($last == $name) continue;
		
		$thisRel = $rel . $name . '/';
		echo sprintf($tpl, cs_var('url') . $thisRel, humanize($name));
		$path = $fol . '/' . $name;

		if (is_dir($path)) link_recursively($path, $thisRel, $level + 1, $tpl);
		$last = $name;
	}

	echo '</ol>';
	echo '</li>';
}
?>
