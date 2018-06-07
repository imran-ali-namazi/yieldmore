<?php if (!isset($_GET['nav']) && !isset($_GET['node'])) {?>
<frameset cols="200,*" border="0">
 <frame name="menu" noresize="noresize" src="./?nav=1">
 <frame name="content" scrolling="auto" src="./?node=home">
<noframes>
 <body>
<!-- content for browser without frame ability -->
 </body>
</noframes>
</frameset>
<?php return; }?>
<?php
$dump = false;
if (!$dump) {
?>
<html>
  <head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <meta name="generator" content="PSPad editor, www.pspad.com">
  <title>Biblios Work Dump</title>
<style type="text/css">
<!--
#nav a { margin-bottom: 4px; color: #333; font-weight: bold; text-decoration: none; }
#nav i { margin-left: 8px; }
h1, h2 { margin: 0 0 10px 0; }
h1 { background-color: #0099FF; }
h2 { border-top: 3px solid teal; }
//-->
</style>
  </head>
  <body>
<?php } ?>
<?php
if (isset($_GET['nav'])) {
  echo '<ol id="nav">' . PHP_EOL;
  foreach ($data as $key=>$pages) {
    $pg = false;
    foreach ($pages as $page=>$paras) {
      $pg = $page;
      break;
    }
    echo sprintf('<li><a href="./?node=%s" target="content">%s</a><i>%s</i></li>' . PHP_EOL, $key, $key, $pg);
  }
  echo '</ol>' . PHP_EOL;
}
else if (isset($_GET['node'])) {
  if ($_GET['node'] == 'home') {
    echo 'TODO: Content';
    return;
  }
  $fmt = $dump ? '%s' : '<li>%s</li>';
  if (!$dump) echo '<h1>' . $_GET['node'] . '</h1>' . PHP_EOL;
  foreach ($data[$_GET['node']] as $page=>$paras) {
    if (!$dump) echo sprintf('<h2>Page: %s</h2>' . PHP_EOL, $page);
    if (!$dump) echo '<ol id="paras">' . PHP_EOL;
    foreach ($paras as $para) {
      if ($para == '') continue;
      echo sprintf($fmt . PHP_EOL, $para);
    }
    if (!$dump) echo '</ol>' . PHP_EOL;
  }
}
?>
