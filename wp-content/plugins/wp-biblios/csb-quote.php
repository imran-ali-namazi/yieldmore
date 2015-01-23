<?php
class WorkQuote
{
	function render()
	{
		include_once 'csb-content.php';
		$a = $_GET;
		print_r($a);
		WorkContent::nodeQuote(3, $a);
	}
}

WorkQuote::render();
?>
