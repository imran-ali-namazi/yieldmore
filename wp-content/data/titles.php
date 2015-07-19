<?php
include 'books/iat/content.php';
foreach($titles as $key => $title)
	echo (false && strlen($key) >= 4 ? 'sub' : '') . 'title:' . $title . PHP_EOL;
?>