<?php

am_var('sites', [
	'root' => 'wp_',
	'curate' => 'wp_2_',
	'learn' => 'wp_3_',
	'heal' => 'wp_4_',
	'share' => 'wp_5_',
	'moq' => 'wp_6_',
	'peaceworks' => 'wp_7_',
	'pact' => 'wp_8_',
	'express' => 'wp_9_',
	'ideas' => 'wp_10_',
	'saiva-siddantham' => 'wp_11_',
	'social-work' => 'wp_12_',
	//'store' => 'wp_13_', TODO resurrect
	'communities' => 'wp_14_',
	'medico' => 'wp_15_',
	'daivic' => 'wp_16_',
	'freestyle' => 'wp_17_',
	'joy-mission' => 'wp_20_',
	'heroes' => 'wp_21_',
	'melian' => 'wp_22_',
	'happy-childhood' => 'wp_23_',
	'nvc' => 'wp_25_',
]);

function before_file() {
	echo '<hr class="above-header-content" />' . am_var('nl');
	echo '<div id="content" class="content container node-' . am_var('node') . ' site-' . am_var('safeName') . '">';
	if (function_exists('site_before_file')) site_before_file();
}

function after_file() {
	if (function_exists('site_after_file')) site_after_file();
	echo '</div>';
}

function before_render() {
	if (am_var('node') == 'go') { include_once 'resources.php'; exit; }

	$all = am_var('all_page_parameters') ? am_var('all_page_parameters') : '';
	foreach (am_var('sites') as $slug => $s) {
		$work = 'posts/' . ($slug == 'root' ? 'root/' : '') . ($all ? $all : am_var('node'));
		$path = am_var('path') . '/' . $work;

		//file first
		if (file_exists($path . '.txt')) {
			am_var('fil', $path . '.txt');
			am_var('also_fol', $also_fol = is_dir($path));
			am_var('fol', $also_fol ? $path : dirname($path));
			am_var('site', $slug);
			break;
		} else if (is_dir($path)) {
			am_var('fol', $path);
			am_var('site', $slug);
			break;
		}
	}

	if (am_var('fol')) {
		am_var('work-url', am_var('url') . $work . '/');
		$fol = am_var('fol');

		$fols = [basename($fol) => $fol . '/'];

		while (($base = basename($fol = dirname($fol))) != 'posts') $fols[$base] = $fol . '/';

		am_var('fols', $fols);
		//print_r($fols); die();
	} else {
		am_var('fols', ['root' => am_var('path') . '/posts/root/']);
	} 
	return am_var('fol');
}

function did_render_page() {
	$fol = am_var('fol');
	if ($fol) {
		$replaces = ['[work-url]' => am_var('work-url')];
		if (am_var('fil')) renderAny(am_var('fil'), $replaces);
		list_fol($fol);
		return true;
	}

	return false;
}

function list_fol($fol) {
	$files = scandir($fol);
	natsort($files);
	$last = false;

	echo '<hr />';

	$params = am_var('page_parameters') ? am_var('page_parameters') : [];
	$param = count($params) > 0 ? $params[count($params) - 1] : false;
	$base = am_var('url') . ($param ? am_var('node') . '/' . $params[0] . '/' : (basename($fol) == 'root' ? '' : am_var('node') . '/'));

	foreach ($files as $fil) {
		if ($fil[0] == '.' || $fil == 'images' || $fil[0] == '_') continue;
		$fil = str_replace('.txt', '', $fil);
		if ($fil == $last) continue;
		$last = $fil;
		//if ($fil == )
		$sel = $param == $fil ? ' class="emphasize"' : '';
		echo sprintf('<a%s href="%s">%s</a><br />' . PHP_EOL, $sel, $base . $fil . '/', humanize($fil));
	}
}

?>
