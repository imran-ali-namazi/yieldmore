<?php
//include_once 'inc/CHtml.php';

if (!function_exists('cs_var')) {
function cs_var($name, $val = null)
{
	global $cscore;
	if (!isset($cscore)) $cscore = array();
	if ($val != null)
		$cscore[$name] = $val;
	else
		return isset($cscore[$name]) ? $cscore[$name] : false;
} }

cs_var('adm-base', content_url('plugins/' . plugin_basename(dirname(__FILE__))));
cs_var('adm-fol', WP_CONTENT_DIR . '/plugins/' . plugin_basename(dirname(__FILE__)));

function tsvml_to_array($data, $cols)
{
	$cells = str_getcsv ( $data, '	', '"', '\\');
	//$cells = array_slice($cells, $cols);
	return array_chunk( $cells, $cols);
}

// from webbq/inc/string.php
function endsWith($haystack, $needle)
{
	$length = strlen($needle);
	if ($length == 0) return true;
	return (substr($haystack, -$length) === $needle);
}

?>
