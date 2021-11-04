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

	foreach (cs_var('sites') as $slug => $s) {
		$work = 'posts/' . ($slug == 'root' ? 'root/' : '') . (cs_var('all_page_parameters') ? cs_var('all_page_parameters') : cs_var('node'));
		$path = cs_var('path') . '/' . $work;

		//file first
		if (file_exists($path . '.txt')) {
			cs_var('fil', $path . '.txt');
			cs_var('fol', dirname($path));
			cs_var('site', $slug);
			break;
		} else if (is_dir($path)) {
			cs_var('fol', $path . '/');
			cs_var('site', $slug);
			break;
		}
	}

	if (cs_var('fol')) {
		cs_var('work-url', cs_var('url') . $work . '/');
		$fol = cs_var('fol');
		$fols = [basename($fol) => $fol];
		while (($base = basename($fol = dirname($fol))) != 'posts') $fols[$base] = $fol;
		cs_var('fols', $fols);
	}
	return cs_var('fol');
}

function did_render_page() {
	$fol = cs_var('fol');
	if ($fol) {
		if (cs_var('fil')) echo wpautop( str_replace('[work-url]', cs_var('work-url'), str_replace('[url]', cs_var('url'), file_get_contents( cs_var('fil') ) ) ) );
		return true;
	}

	return false;
}

?>
