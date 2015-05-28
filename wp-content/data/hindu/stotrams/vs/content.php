<style type="text/css">
<!--
table { border-collapse: collapse; }
td { vertical-align: top; font-family: verdana; }
hr { border-top: 1px #66CCFF ridge; }
.sno { text-decoration: underline; }
.verse { font-size: 14pt; }
.names { font-size: 8pt; }
.names i { font-weight: bold; }
.names u { /*width: 35px; text-align: right; margin-right: 2px; */ 
  display: inline-block;  
  text-decoration: none; 
  color: #c7c7c7; font-family: "courier new"!important; }
p.intro { padding-left: 10px; margin: 15px; border: 1px solid #999; border-left-width: 3px; }
//-->
</style>

<p class="intro">
	This is the verse of the Vishnu Sahasranamam,
	the thousand names of the <a href="http://en.wikipedia.org/wiki/Vishnu">God Vishnu</a>.
<br>
	On the left is in the verse format as its chanted. On the right are the actual names with the meanings.
<br>
	The blue lines in between separate the names of line 1 from that of line 2 of each couplet.
<br>
	Combined and <a href="http://en.wikipedia.org/wiki/Cascading_Style_Sheets">styled</a> from <a href="http://www.astrojyoti.com/vsfull.htm">verse</a> and 
	<a href="http://en.wikipedia.org/wiki/Vishnu_sahasranama#Complete_List_of_Names_of_Bhagawan_Vishnu">names</a>
	by <a href="http://cselian.com/blog/about/">Imran</a>, on 19 Aug 2011.
</p>

<?php
global $showVerse; global $showNames;
$showVerse = $node == 'mixed' || $node == 'verse' ? '' : ' style="display:none;"';
$showNames = $node == 'mixed' || $node == 'names' ? '' : ' style="display:none;"';
?>

<table border="2" cellpadding="6">
 <tbody><tr>
  <th width="30px">Nr</th>
  <th<?php echo $showVerse; ?>>Verse</th>
  <th <?php echo $showNames; ?>>Names</th>
 </tr>

<?php
$data = tsv_to_array(file_get_contents($dataFol . 'content.tsv'));

if (!function_exists('row_r')) {
function row_r($row)
{
	global $showVerse; global $showNames;
	echo sprintf(' <tr>
  <td class="sno"><a name="verse-%s">%s</a></td>
  <td class="verse"%s>%s
  </td>
  <td class="names"%s>%s
  </td>
 </tr>', $row['nr'], $row['nr'], $showVerse, $row['verse'], $showNames, $row['names']);
} }

foreach ($data as $ix=>$r)
{
	// Nr	Name	Meaning	Line	Verse	MSTime
	if ($ix == 0) continue;
	$new = $r[4] != '';
	$nl = '
    ';
	if ($new)
	{
		if (isset($row)) row_r($row);
		$row = array('nr' => $r[4], 'verse' => $r[3] . '<hr>');
	}
	else if ($r[3] != '')
	{
		$row['verse'] .= $nl . $r[3];
		$row['names'] .= '<hr>';
	}
	
	$row['names'] .= $nl . sprintf('<u>%s:</u> <i>%s</i> - %s<br> ', $r[0], $r[1], $r[2]);
	//if ($ix > 50) break;
}
row_r($row);
?>

</tbody></table>
