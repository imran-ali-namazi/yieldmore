<div id="content">

<ol class="sitemap">
<?php

$sites = cs_var('sites');

$tpl = '<li>%s<a href="%s">%s</a>%s';
foreach ($sites as $s => $noop) {
	$slug = $s == 'root' ? '' : $s . '/';
	echo sprintf($tpl, '<h2>', cs_var('url') . $slug, humanize($s), '</h2>');
	link_recursively(__DIR__ . '/posts/' . $s, $slug, 3, $tpl);
	echo '</li>';
}
echo '</ol>';

function link_recursively($fol, $rel, $level, $tpl) {
	$contents = scandir($fol);
	unset($contents[0]); unset($contents[1]);
	natsort($contents);	

	$last = false;
	$soh =  PHP_EOL . str_pad('	', $level); $eoh = '';
	echo $soh . '	<ol>';
	if ($level < 3) { $soh .= "<h$level>"; $eoh = '</h'.$level.'>'; }

	foreach ($contents as $name) {
		if ($name == 'images') continue;
		$name = str_replace('.txt', '', $name);
		if ($last == $name) continue;

		$thisRel = $rel . $name . '/';
		echo sprintf($tpl, $soh, cs_var('url') . $thisRel, humanize($name), $eoh);
		$path = $fol . '/' . $name;

		if (is_dir($path)) link_recursively($path, $thisRel, $level + 1, $tpl);
		$last = $name;
	}

	echo '</ol>';
	echo '</li>';
}
?>
</div>
