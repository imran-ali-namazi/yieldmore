<?php
include_once 'inc/CHtml.php';

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

function _nl($txt, $br = 0)
{
	echo $txt . '
' . ($br ? '<br />' : '');
}

// from microvic
function tsv_to_array($data, &$cols = null)
{
	$r = array();
	$lines = explode('
', $data);
	foreach ($lines as $lin)
	{
    if ($lin == '' || $lin[0] == '#')
    {
      if ($cols != null && $lin != '')
        tsv_set_cols($lin, &$cols);
      continue;
    }
		$r[] = explode("	", $lin);
	}
	return $r;
}

function tsv_set_cols($lin, &$c)
{
	$lin = substr($lin, 1);
	$r = explode("	", $lin);
	$c = new stdClass();
	foreach ($r as $key => $value)
		$c->$value = $key;
}

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
