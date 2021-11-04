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
		$path = cs_var('path') . '/posts/' . cs_var('all_page_parameters');
		//echo $path . PHP_EOL;
		if (is_dir($path)) {
			cs_var('fol', $path . '/');
			break;
		} else if (file_exists($path . '.txt')) {
			cs_var('fil', $path . '.txt');
			cs_var('fol', dirname($path));
			break;
		}
	}

	return cs_var('fol');
}

function did_render_page() {
	$fol = cs_var('fol');
	if ($fol) {
		if (cs_var('fil')) echo wpautop( file_get_contents( cs_var('fil') ) );
		return true;
	}

	return false;
}

?>
