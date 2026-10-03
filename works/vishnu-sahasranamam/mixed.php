<p class="intro content-box container m-auto mb-4">
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
$node = getPageParameterAt(1);
variables([
	'showVerse' => $showVerse = $node == 'mixed' || $node == 'verse' ? '' : ' style="display:none;"',
	'showNames' => $showNames = $node == 'mixed' || $node == 'names' ? '' : ' style="display:none;"',
]);
?>

<table border="2" cellpadding="6" class="content-box container">
 <tbody><tr>
  <th width="30px">Nr</th>
  <th<?php echo $showVerse; ?>>Verse</th>
  <th <?php echo $showNames; ?>>Names</th>
 </tr>

<?php
$sheet = getSheet(__DIR__ . '/data/content.tsv', false);

function renderLine($sno, $verse, $names) {
	$format = '<tr>
		<td class="sno"><a name="verse-%sno%">%sno%</a></td>
		<td class="verse"%showVerse%>%verse%</td>
		<td class="names"%showNames%>%names%</td>
	</tr>' . NEWLINE;

	echo replaceItems($format, [
		'sno' => $sno,
		'showVerse' => variable('showVerse'),
		'verse' => $verse,
		'showNames' => variable('showNames'),
		'names' => $names,
	], WRAPREPLACE);
}

$names = '';

foreach ($sheet->rows as $ix => $item)
{
	//showDebugging(66, $sheet->asObject($item), PleaseDie);
	//SNo	Name	Meaning	Line	Verse	MSTime
	//if ($ix == 0) continue;
	$newVerse = $sheet->getValue($item, 'Verse');
	$line = $sheet->getValue($item, 'Line');
	$newSno = $sheet->getValue($item, 'SNo');
	$name = $sheet->getValue($item, 'Name');
	$meaning = $sheet->getValue($item, 'Meaning');

	if ($newVerse)
	{
		if ($ix != 0) {
			renderLine(isset($sno) ? $sno : $newSno, $verse, $names);
		}
		$verse = $newVerse;
		$sno = $newSno;
		$names = '';
	}
	if ($line != '')
	{
		$verse .= NEWLINE . HRTAG . $line;
		$names .= HRTAG;
	}
	
	$names .= NEWLINE . sprintf('<u>%s:</u> <i>%s</i> - %s<br> ', $newSno, $name, $meaning);
}
renderLine($sno, $verse, $names);
?>

</tbody></table>

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
