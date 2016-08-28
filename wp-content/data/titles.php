<?php
if (true)
{
	include 'auro/hog/content.php'; //poems/leithian/ books/iat
	foreach($titles as $key => $title)
		echo (strlen($key) >= 4 ? 'sub' : '') . 'title:' . $title . PHP_EOL;
}
else
{
	include_once '../plugins/wp-biblios/functions.php';
	$titles = tsv_to_array(file_get_contents('scriptures/quran/titles.tsv'));
	foreach($titles as $title)
		//echo 'title:' . $title[2] . PHP_EOL;
		echo '----' . $title[0] . PHP_EOL . '##' . $title[2] . PHP_EOL . PHP_EOL;
}
?>