$(document).ready(function(){
	$('select.menu').change(function(){
		location.href = $('option:selected', $(this))[0].value;
	});
});
