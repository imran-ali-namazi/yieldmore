<?php
$site = cs_var('site');
$fols = cs_var('fols');

$types = ['Site', 'Section', 'Post', 'Sub-post'];

$type = array_shift($types);
echo sprintf('	<li>%s: <a href="%s">%s</a>' . PHP_EOL, $type, cs_var('url'), 'YM Legacy');
echo '		<select class="menu">' . PHP_EOL;
foreach (cs_var('sites') as $slug => $s) {
	$sel = $site === $slug ? ' selected="selected"' : '';
	echo sprintf('			<option%s value="%s">%s</option>' . PHP_EOL, $sel, cs_var('url') . ($slug == 'root' ? '' : $slug .'/'), $slug);
}
echo '		</select></li>' . PHP_EOL;

if ($site && $fols) {
	$params = cs_var('page_parameters') ? cs_var('page_parameters') : [];
	if (cs_var('node') != 'index') array_splice($params, 0, 0, cs_var('node'));
	if (cs_var('also_fol')) $params[] = '[[something]]';

	foreach (array_reverse($fols) as $name => $fol) {
		$slug = str_replace('\\', '/', substr($fol, strlen(cs_var('path')) + 1));
		$slug = str_replace('root/', '', str_replace('posts/', '', $slug));
		if (endsWith($slug, '/')) $slug = substr($slug, 0, -1);

		$type = array_shift($types);
		echo sprintf('	<li>%s: <a href="%s">%s</a>' . PHP_EOL, $type, cs_var('url') . ($slug == 'root' || $slug == '' ? '' : $slug .'/'), $name == 'root' ? 'home' : $name);
		$last = false;
		$files = scandir($fol);
		natsort($files);

		$param = count($params) > 0 ? array_shift($params) : '[nothing]';

		echo '		<select class="menu">' . PHP_EOL;
		$anySel = false;
		foreach ($files as $fil) {
			if ($fil == '.' || $fil == '..' || $fil == 'images') continue;
			$fil = str_replace('.txt', '', $fil);
			if ($fil == $last) continue;
			$last = $fil;
			
			$sel = ''; if ($param == $fil) { $sel = ' selected="true"'; $anySel = true; }
			echo sprintf('			<option%s value="%s">%s</option>' . PHP_EOL, $sel, cs_var('url') . ($slug ? $slug . '/' : '') . $fil . '/', $fil);
		}
		if (!$anySel) echo '			<option selected="selected"></option>';
		echo '		</select></li>' . PHP_EOL . '';
	}
}
?>
