<?php
foreach($titles as $key => $title)
	echo (strlen($key) >= 4 ? 'sub' : '') . 'title:' . $title . PHP_EOL;
?>