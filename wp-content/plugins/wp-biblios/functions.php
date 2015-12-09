<?php
function _nl($txt, $br = 0)
{
	echo $txt . PHP_EOL . ($br ? '<br />' : '');
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
        tsv_set_cols($lin, $cols);
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

if (!defined('WP_USE_THEMES')) return;

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

function cs_get($key, $default = false)
{
	return isset($_GET[$key]) ? $_GET[$key] : $default;
}

function get_domain($url)
{
	$url = str_replace('www.', '', str_replace('://', '', str_replace('http', '', str_replace('https', '', $url))));
	return substr($url, 0, strpos($url, '/'));
}

function cs_work($id, $data = null)
{
	if ($data != null)
	{
		if (is_array($data))
			$data = WorkConfig::merge(cs_work($id), $data);
		else
			$data = WorkConfig::sanitize($data);
		WorkCache::clear();
		update_post_meta($id, 'workConfig', $data);
	}
	else
	{
		if (get_post_type($id) == 'post')
		{
			global $post;
			$content = $post->post_content;
			if (!has_shortcode($content, 'work')) return array();
			do_shortcode($content);
			global $postConfig;
			return $postConfig;
		}
		$cfg = get_post_meta($id, 'workConfig', true);
		if ($cfg == '') // OR bib-redo-import
			$cfg = WorkConfig::import($id);
		return $cfg;
	}
}

function cs_work_read($id, $retKey = null, $subKey = null)
{
	$key = 'work-' . $id;
	$wk = cs_var($key);
	if (!$wk)
	{
		$wk = cs_work($id);
		if (!isset($wk['fol']) || $wk['fol'] != '')
			$wk = WorkConfig::read($id, $wk);
		cs_var($key, $wk); // cache in memory
	}
	if ($retKey == null) return $wk;
	if ($subKey != null) return isset($wk[$subKey][$subKey]) ? $wk[$subKey][$subKey] : false;
	return isset($wk[$retKey]) ? $wk[$retKey] : false;
}

function cs_work_get($what)
{
	$id = get_the_ID();
	if ($what == 'bool') {
		return 1;
	} else if ($what == 'author') {
		$terms = wp_get_post_terms($id, 'work_author', 0);
		return $terms[0];
	}
	$wk = cs_work_read($id);
	if ($what == 'workType') {
		$type = cs_var('workTypes');
		return $type[$wk['type']];
	} else if ($what == 'hasnav') {
		return $wk['fol'] != '' && (!isset($wk['config']['copyrighted']) || is_user_logged_in() || isset($_GET['in']));
	} else if ($what == 'hascontent') {
		return WorkNav::nodeOrSearchOrQuoteOrAll();
	} else if ($what == 'content') {
		if (get_post_type($id) == 'post')
			include 'post-content.php';
		else
			include 'csb-' . (WorkNav::quote() ? 'quote' : (WorkNav::search() ? 'search' : 'content')) . '.php';
	} else if ($what == 'sidebar') {
		_nl('<div class="widget bib-nav">');
		WorkMenu::render($id, $wk);
		_nl('</div>');
	} else if ($what == 'header') {
		include 'csb-header.php';
	} else if (array_search($what, WorkConfig::$optional) !== false) {
		return isset($wk['config'][$what]) ? $wk['config'][$what] : false;
	} else {
		throw new Exception($what . ' not supported by cs_work_get');
	}
}

cs_var('bib-base', content_url('plugins/' . plugin_basename(dirname(__FILE__))));
cs_var('bib-data-name', 'data' . (is_multisite && get_current_blog_id() != 1 ? get_current_blog_id() : ''));
cs_var('bib-data', WP_CONTENT_DIR . '/' . cs_var('bib-data-name'));
cs_var('bib-data-url', content_url(cs_var('bib-data-name')));
cs_var('charset', 'iso-8859-1'); // utf8 not supported
cs_var('workTypes', WorkConfig::types());
?>
