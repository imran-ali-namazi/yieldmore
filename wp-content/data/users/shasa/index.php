<?php
$books = [
	'infuse' => [101, 'chaos', 'fly'],
];

$links = [
	'chaos' => 'https://legacy.yieldmore.org/incubate/poetrusic-by-chaos/',
	'fly' => 'http://legacy.yieldmore.org/incubate/fly-up/',
];

$book = 'infuse';
$export = 1;
if ($export) echo '<textarea style="height: 100%; width: 100%">';

$index = 1;
foreach ($books[$book] as $from) {
	if (is_integer($from)) { $index = $from; continue; }
	$base_link = $links[$from];
	$toc = explode("\r\n", file_get_contents("./$from/_toc.txt"));
	foreach ($toc as $line) {
		$bits = explode('|', $line);
		$poem = $bits[0];
		$date = $bits[1];
		$to = $bits[2];
		if ($to) $to = ' - ' . $to;

		$file = strtolower(str_replace(' ', '-', $poem));
		$lines = file_get_contents("./$from/$file.txt");
		$link = $base_link . $file . '/';
		echo "$index - $poem - $date$to\r\n\r\n$link\r\nAbout:\r\n\r\n$lines\r\n\r\n";
		if (!$export) echo '<hr />';
		$index++;
	}
}

if ($export) echo '</textarea>';
?>