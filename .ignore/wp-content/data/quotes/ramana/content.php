<?php
$txt = file_get_contents($dataFol . 'content.txt');
$txt = str_replace(PHP_EOL, '<br/>' . PHP_EOL, $txt);
$data = explode('----', $txt);
?>