<?php
if (count($_POST))
{?>
<script src="/wp-includes/js/jquery/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
if (typeof($) == 'undefined') $ = jQuery.noConflict(); // added by Imran@cselian.com to use in wordpress

$(document).ready(function () {
	$('#imgmapdiv a').each(function(){
		$div = $('#imgmapdiv').offset();
		$(this).css('left', ($div.left + $(this).data('left')) + 'px');
		$(this).css('top', ($div.top + $(this).data('top')) + 'px');
	});
});
</script>
<style type="text/css">
<!--
#imgmapdiv { height: 687px; width: 500px; }
#imgmapdiv a { position: absolute; display: inline-block; height: 23px; }
#imgmapdiv a { background-color: #000; opacity: .2; }
//-->
</style>
<?php
	
	echo '<div id="imgmapdiv" style="background: url(' . $_POST['img'] . ')">' . PHP_EOL;
	$fmt = $_POST['linkformat'];
	$links = explode(PHP_EOL, $_POST['imgcoords']);
	$item = '<a href="%s" target="_blank" data-left="%s" data-top="%s" style="width: %spx; height: %spx;"></a><!-- %s -->' . PHP_EOL;
	foreach ($links as $link)
	{
		if ($link == '') continue;
		$bits = explode('	', $link);
		echo sprintf($item, sprintf($fmt, $bits[0]), $bits[1], $bits[2], $bits[3], $bits[4], $bits[0]);
	}
	echo '</div>' . PHP_EOL;
	return;
}
?>
<html>
<head>
<title>Image Map - YieldMore Tools</title>
<script src="/wp-includes/js/jquery/jquery.js" type="text/javascript"></script>
<script src="assets/jquery.imgareaselect.pack.js" type="text/javascript"></script>
<link rel="stylesheet" href="assets/imgareaselect-default.css" type="text/css" />
<style type="text/css">
<!--
.intbox { width: 80px; }
textarea, #linkformat { width: 400px; margin-bottom: 10px; }
//-->
</style>
</head>
<body>

<img id="imgmap" style="float: left;" src="/wp-content/<?php echo $_GET['img']; ?>" />
<div style="float: left; margin-left: 20px">
<form action="./imagemap.php" method="post" target="_imagemap">
	<input type="hidden" name="img" value="/wp-content/<?php echo $_GET['img']; ?>" />
	<textarea id="imgcoords" name="imgcoords" rows="6"></textarea>
	<br />
	<input type="text" id="linkformat" name="linkformat" value="<?php echo isset($_GET['format']) ? $_GET['format'] : '#%s' ?>" />
	<br />
	<button id="areaset">set</button>
	<input type="submit" value="Preview" />
	<br />
</form>
<table>
 <tr>
	<td>Left</td>
	<td>Top</td>
	<td>Width</td>
	<td>Height</td>
 </tr>
	<tr>
	<td><input type="text" class="intbox" id="leftitm" /></td>
	<td><input type="text" class="intbox" id="topitm" /></td>
	<td><input type="text" class="intbox" id="widthitm" /></td>
	<td><input type="text" class="intbox" id="heightitm" /></td>
 </tr>

</table>
</div>

<script type="text/javascript">
function preview(img, selection) {
	if (!selection.width || !selection.height)
			return;
	$('#leftitm').val(selection.x1);
	$('#topitm').val(selection.y1);
	$('#widthitm').val(selection.width);
	$('#heightitm').val(selection.height);		
}

if (typeof($) == 'undefined') $ = jQuery.noConflict(); // added by Imran@cselian.com to use in wordpress
//TODO: http://odyniec.net/projects/imgareaselect/
$(document).ready(function () {
	$.fn.swap = function(other) {
			$(this).replaceWith($(other).after($(this).clone(true)));
	};
	$('img#imgmap').imgAreaSelect({ handles: true,
			fadeSpeed: 200, onSelectChange: preview}); 
	$("#areaset").click(function (e) {
		e.preventDefault();
		$txt = prompt('enter the text');
		if ($txt == null) return;

		$('#imgcoords').val($('#imgcoords').val() + '\n' + $txt +
			'	' + $('#leftitm').val() +
			'	' + $('#topitm').val() +
			'	' + $('#widthitm').val() +
			'	' + $('#heightitm').val()
		);
	});
});
</script>
</body>
</html>