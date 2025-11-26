<?php
$site = am_var('site');
$fols = am_var('fols');

echo '<ul class="nav-menu">';
$types = ['Site', 'Section', 'Post', 'Sub-post'];

$type = array_shift($types);
echo sprintf('	<li class="drop-down">%s: <a href="%s">%s</a>' . PHP_EOL, $type, am_var('url'), 'YM Legacy');
echo '		<ul>' . PHP_EOL;
foreach (am_var('sites') as $slug => $s) {
	$sel = $site === $slug ? ' class="selected"' : '';
	echo sprintf('			<li%s><a href="%s">%s</a></li>' . PHP_EOL, $sel, am_var('url') . ($slug == 'root' ? '' : $slug .'/'), humanize($slug));
}
echo '		</ul></li>' . PHP_EOL;

if ($site && $fols) {
	$params = am_var('page_parameters') ? am_var('page_parameters') : [];

	if (am_var('node') == 'works' && count($params) > 0) {
		am_var('replace_exact', include SITEPATH . '/posts/root/works/' . $params[0] . '/_titles.php');
	}

	if (am_var('node') != 'index') array_splice($params, 0, 0, am_var('node'));
	if (am_var('also_fol')) $params[] = '[[something]]';

	foreach (array_reverse($fols) as $name => $fol) {
		$slug = str_replace('\\', '/', substr($fol, strlen(am_var('path')) + 1));
		$slug = str_replace('root/', '', str_replace('posts/', '', $slug));
		if (endsWith($slug, '/')) $slug = substr($slug, 0, -1);

		$type = array_shift($types);
		echo sprintf('	<li class="drop-down">%s: <a href="%s">%s</a>' . PHP_EOL, $type, am_var('url') . ($slug == 'root' || $slug == '' ? '' : $slug .'/'), $name == 'root' ? 'home' : $name);
		$last = false;
		$files = scandir($fol);
		natsort($files);

		$param = count($params) > 0 ? array_shift($params) : '[nothing]';

		echo '		<ul>' . PHP_EOL;
		$anySel = false;
		foreach ($files as $fil) {
			if ($fil[0] == '.' || $fil == 'images' || $fil[0] == '_') continue;
			$fil = str_replace('.txt', '', $fil);
			if ($fil == $last) continue;
			$last = $fil;
			
			$sel = ''; if ($param == $fil) { $sel = ' class="selected"'; $anySel = true; }
			echo sprintf('			<li%s><a href="%s">%s</a></li>' . PHP_EOL, $sel, am_var('url') . ($slug ? $slug . '/' : '') . $fil . '/', humanize($fil));
		}
		echo '		</ul></li>' . PHP_EOL . '';
	}
}

function site_humanize($text) {
	if ($match = am_var('replace_exact')) {
		$key = urlize($text);
		if (isset($match[$key])) return $text . ' - ' . $match[$key];
	}
	return $text;
}
echo '<li><a href="' . am_var('url') . 'resources/">Redirects</a></li>';
echo '<li><a href="' . am_var('url') . 'sitemap/">Sitemap</a></li>';
echo '</ul>';
?>
