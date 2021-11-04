<?php
ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);

function write_posts($posts, $site_name) {
	$br = '<br />' . PHP_EOL;
	$dir = __DIR__ . '/posts/' . $site_name . '/';
	if (!is_dir($dir)) mkdir($dir);

	echo 'Writing to ' .  $site_name . $br;
	foreach ($posts as $ix => $p) {
		$subdir = $dir . ($p['slug'] ? $p['slug'] . '/' : '');
		if ($subdir != $dir && !is_dir($subdir)) mkdir($subdir);
		$fil = $subdir . $p['post_name'] . '.txt';
		$id = '<!--post_id: ' . $p['id'] . '-->' . PHP_EOL;
		file_put_contents($fil, $id . $p['post_content']);
		echo 'Wrote: ' . $fil . $br;
		if ($ix == 5) break;
	}
}


$sites = ['root' => ''];
foreach ($sites as $site_name => $db_prefix) {
	write_posts(get_pages($db_prefix), $site_name);
	write_posts(get_posts($db_prefix), $site_name);
	write_posts(get_works($db_prefix), $site_name);
}
//print_r($posts);


// #region db functions

function get_pages($prefix)
{
	$sql = str_replace('%prefix%', $prefix, "
select id, post_name, post_content, '' as slug from %prefix%posts p
	where post_type in ('page') AND post_status = 'publish'");
	return db_select($sql);
}

function get_posts($prefix)
{
	$sql = str_replace('%prefix%', $prefix, "
select id, post_name, post_content, t.slug from %prefix%posts p
	left outer join %prefix%term_relationships r on r.object_id = p.ID
	left outer join %prefix%term_taxonomy tt on r.term_taxonomy_id = tt.term_id
	left outer join %prefix%terms t on t.term_id = tt.term_taxonomy_id
	where post_type in ('post') AND post_status = 'publish' AND tt.taxonomy = 'category'");
	return db_select($sql);
}

function get_works($prefix)
{
	$sql = str_replace('%prefix%', $prefix, "
select id, post_name, post_content, 'works' from %prefix%posts p
	where post_type in ('work') AND post_status = 'publish'");
	return db_select($sql);
}

function db_select($query)
{
	$db = [ 'username' => 'root', 'password' => '', 'database' => 'ym_legacy' ];

	$mysqli = new mysqli("localhost", $db['username'], $db['password'], $db['database']) or die(mysqli_error());
	if ($mysqli->connect_errno) { printf("Connect failed: %s\n", $mysqli->connect_error); exit(); }

	$result = $mysqli->query($query);
	$rows = $result->fetch_all(MYSQLI_ASSOC);

	$result->free();
	$mysqli->close();

	return $rows;
}

?>
