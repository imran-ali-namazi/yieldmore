<?php
DEFINE('WORK_IMPORT', true);
include_once 'wp-import.php';
function get_work_config($prefix)
{
	$sql = str_replace('%prefix%', $prefix, "
	select id, post_name as name, meta_value as config from %prefix%posts p
	left outer join %prefix%postmeta m on m.post_id = p.ID
	where post_type in ('work') AND post_status = 'publish' AND meta_key = 'workConfig'");
	return db_select($sql);
}

$works = get_work_config($sites['root']);


$br = '<br />' . PHP_EOL;

if (false) {
	$fil = __DIR__ . '/posts/root/works/_config.php';
	$configs = [];
	$r = 'return [' . PHP_EOL;
	foreach ($works as $item) {
		$r .= '	[' . PHP_EOL;
		$r .= "		'post_id' => '" . $item['id'] . "'" . PHP_EOL;
		$r .= "		'name:' => '" . $item['name'] . "'" . PHP_EOL;
		$r .= "		'config:' => \"" . $item['config'] . '"' . PHP_EOL;
		$r .= '	],' . PHP_EOL;
	}
	$r .= '];' . PHP_EOL;
	file_put_contents($fil, $r);
	echo 'Wrote: ' . $fil . $br;

}
?>