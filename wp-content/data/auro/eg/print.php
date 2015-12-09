<?php
$chapters = explode(PHP_EOL, file_get_contents('titles.txt'));
$data = array();
include_once 'content.php';
echo 'Sri Aurobindo\'s Gita';
foreach ($chapters as $ix=>$title)
{
	if ($ix == 0) continue;
	echo PHP_EOL . 'Chapter ' . $ix . ': ' . $title . PHP_EOL;
	$verses = $data['s3c' . $ix][594 + $ix];
	foreach ($verses as $verse)
	{
		if ($verse !== ' ') continue;
		echo $ix . '.' . $verse . PHP_EOL;
	}
}
?>
