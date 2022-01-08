<?php

cs_var('sites', [
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
	'store' => 'wp_13_',
	'communities' => 'wp_14_',
	'medico' => 'wp_15_',
	'daivic' => 'wp_16_',
	'freestyle' => 'wp_17_',
	'jeevanvidya' => 'wp_18_',
	'vikasa' => 'wp_19_',
	'joy-mission' => 'wp_20_',
	'heroes' => 'wp_21_',
	'melian' => 'wp_22_',
	'happy-childhood' => 'wp_23_',
	'animals' => 'wp_24_',
	'nvc' => 'wp_25_',
]);

function before_render() {
	if (cs_var('node') == 'go') { include_once 'resources.php'; exit; }

	$all = cs_var('all_page_parameters') ? cs_var('all_page_parameters') : '';
	foreach (cs_var('sites') as $slug => $s) {
		$work = 'posts/' . ($slug == 'root' ? 'root/' : '') . ($all ? $all : cs_var('node'));
		$path = cs_var('path') . '/' . $work;

		//file first
		if (file_exists($path . '.txt')) {
			cs_var('fil', $path . '.txt');
			cs_var('also_fol', $also_fol = is_dir($path));
			cs_var('fol', $also_fol ? $path : dirname($path));
			cs_var('site', $slug);
			break;
		} else if (is_dir($path)) {
			cs_var('fol', $path);
			cs_var('site', $slug);
			break;
		}
	}

	if (cs_var('fol')) {
		cs_var('work-url', cs_var('url') . $work . '/');
		$fol = cs_var('fol');

		$fols = [basename($fol) => $fol . '/'];

		while (($base = basename($fol = dirname($fol))) != 'posts') $fols[$base] = $fol . '/';

		cs_var('fols', $fols);
		//print_r($fols); die();
	} else {
		cs_var('fols', ['root' => cs_var('path') . '/posts/root/']);
	} 
	return cs_var('fol');
}

function did_render_page() {
	$fol = cs_var('fol');
	if ($fol) {
		$replaces = ['[work-url]' => cs_var('work-url')];
		if (cs_var('fil')) render_txt_or_md(cs_var('fil'), $replaces);
		list_fol($fol);
		return true;
	}

	return false;
}

function list_fol($fol) {
	$files = scandir($fol);
	natsort($files);
	$last = false;
	echo '<hr /><hr />';

	$params = cs_var('page_parameters') ? cs_var('page_parameters') : [];
	$param = count($params) > 0 ? $params[count($params) - 1] : '[nothing]';

	foreach ($files as $fil) {
		if ($fil == '.' || $fil == '..' || $fil == 'images' || $fil[0] == '_') continue;
		$fil = str_replace('.txt', '', $fil);
		if ($fil == $last) continue;
		$last = $fil;
		//if ($fil == )
		$sel = $param == $fil ? ' class="emphasize"' : '';
		echo sprintf('<a%s href="%s">%s</a><br />' . PHP_EOL, $sel, $fil . '/', humanize($fil));
	}
}

?>
