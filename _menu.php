<?php

if ($site = cs_var('site')) {
	$fols =cs_var('fols');
	//print_r($fols); die();
	foreach ($fols as $name => $fol) {
		$slug = str_replace('\\', '/', substr($fol, strlen(cs_var('path')) + 1));
		$slug = str_replace('/root', '', str_replace('posts/', '', $slug));
		if (endsWith($slug, '/')) $slug = substr($slug, 0, -1);

		echo sprintf('	<h1><a href="%s">%s</a></h1>' . PHP_EOL, cs_var('url') . ($slug == 'root' ? '' : $slug .'/'), $name == 'root' ? 'home' : $name);
		echo '<ol>' . PHP_EOL;
		$last = false;
		$files = scandir($fol);
		natsort($files);
		foreach ($files as $fil) {
			if ($fil == '.' || $fil == '..' || $fil == 'images') continue;
			$fil = str_replace('.txt', '', $fil);
			if ($fil == $last) continue;
			$last = $fil;
			echo sprintf('	<li><a href="%s">%s</a></li>' . PHP_EOL, cs_var('url') . $slug . '/' . $fil . '/', $fil);
		}
		echo '</ol>' . PHP_EOL . '<hr />';
	}
}

echo sprintf('	<h1><a href="%s">%s</a></h1>' . PHP_EOL, cs_var('url'), 'YM Legacy');
echo '<ol>' . PHP_EOL;
foreach (cs_var('sites') as $slug => $site) {
	$sel = cs_var('site') == $slug ? ' class="selected"' : '';
	echo sprintf('	<li%s><a href="%s">%s</a></li>' . PHP_EOL, $sel, cs_var('url') . ($slug == 'root' ? '' : $slug .'/'), $slug);
}
echo '</ol>' . PHP_EOL;
?>
