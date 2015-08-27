( function( $ ) {

	// Add Formation Pro message
	upgrade = $('<a class="formation-customize-plus"></a>')
		.attr('href', 'http://www.templateexpress.com/formation-pro-theme')
		.attr('target', '_blank')
		.text(pro_object.pro_message);
	;
	$('.preview-notice').append(upgrade);
	// Remove accordion click event
	$('.formation-customize-plus').on('click', function(e) {
		e.stopPropagation();
	});

} )( jQuery );