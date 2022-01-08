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

if (false) { //false
	$fil = __DIR__ . '/posts/root/works/_config.php';
	$configs = [];
	$r = '<?php
return [' . PHP_EOL;
	foreach ($works as $item) {
		$r .= "	'" . $item['name'] . "' => //id:" . $item['id'] . PHP_EOL;
		$r .= "	\"" . str_replace('"', '\"', $item['config']) . '",' . PHP_EOL . PHP_EOL;
	}
	$r .= '];' . PHP_EOL . '?' . '>' . PHP_EOL;
	file_put_contents($fil, $r);
	echo 'Wrote: ' . $fil . $br;
} else {
	$config = include('posts/root/works/_config.php');
	foreach ($works as $item) {
		if ($item['name'] === 'bhagavad-gita' OR $item['name'] === 'quran' OR $item['name'] === 'vishnu-sahasranamam') continue;
		//if ($item['name'] !== 'the-prophet') continue;
		$cfg = read_config($config[$item['name']]);
		//print_r($cfg); continue;

		echo $br . $br . 'WRITING ' . $item['name'];
		$fol = __DIR__ . '/posts/root/works/' . $item['name'] . '/';
		$slug = $cfg['slug'];
		$slug2 = isset($cfg['slug2']) ? $cfg['slug2'] : false;
		$keyFormat = $cfg['keyFormat'];

		$content = __DIR__ . '/wp-content/data/' . $cfg['fol'] . '/content.php';
		$data = array();
		include $content;

		for ($i = 1; $i < 1000; $i++) {
			if (!$slug2 && !isset($data[sprintf($keyFormat, $i)])) break;
			
			if (!$slug2) {
				$node = sprintf($keyFormat, $i);
				write_node($fol, $data, $node, $slug . $i);
			} else {
				for ($j = 1; $j < 1000; $j++) {
					if (!isset($data[sprintf($keyFormat, $i, $j)])) break;
					$node = sprintf($keyFormat, $i, $j);
					write_node($fol, $data, $node, $slug . $i . '-' . $slug2 . $j);
				}
			}
		}
	}
}

function write_node($fol, $data, $node, $slug) {
	$r = '';
	foreach ($data[$node] as $page=>$paras) {
		$r .= '<div class="page"><h3>'.$page.'</h3>' . PHP_EOL;
		//$single = array_map(function($item) { return implode(' ', explode(PHP_EOL, $item)); }, $paras);
		$r .= implode(PHP_EOL . PHP_EOL, $paras);
		$r .= '</div>' . PHP_EOL . PHP_EOL;
	}
	$fil = $fol . $slug . '.txt';
	file_put_contents($fil, $r);
	echo 'Wrote file: ' . $fil . PHP_EOL;
}

function read_config($c) {
	$lines = explode(PHP_EOL, $c);
	$r = [];
	foreach ($lines as $line) {
		$bits = explode(':', $line, 2);
		if (count($bits) == 1) continue;
		$r[$bits[0]] = $bits[1];
	}
	return $r;
}
?>