<?php
	// Add support for custom headers.
	add_theme_support( 'custom-header', array(
	// The default header text color.
	'default-text-color'		=> '777777',
	// The default header image.
	'default-image'				=> get_template_directory_uri() . '/images/logo.png',
	// The height and width of our custom header.
	'width'						=> apply_filters( 'desaindigital_header_image_width', 225 ),
	'height'					=> apply_filters( 'desaindigital_header_image_height', 225 ),
	// Callback for styling the header.
	'wp-head-callback'			=> 'desaindigital_header_style',
	// Callback for styling the header preview in the admin.
	'admin-head-callback'		=> 'desaindigital_admin_header_style',
	// Callback used to display the header preview in the admin.
	'admin-preview-callback'	=> 'desaindigital_admin_header_image'
	) );

// Styles the header image and text displayed on the blog
function desaindigital_header_style() {
	// Add Style Custom header
	$header_image = get_header_image();
	if ( $header_image ) : ?>
		<style type="text/css">
		#wrap-header .header{
			padding-top: 0
		}
		</style>		
	<?php endif;
	$text_color = get_header_textcolor();

	// If no custom options for text are set, let's bail.
	if ( $text_color == get_theme_support( 'custom-header', 'default-text-color' ) )
		return;
	// If we get this far, we have custom styles. Let's do this.
	?>
	<style type="text/css">
	<?php
		// Has the text been hidden?
		if ( 'blank' == $text_color ) :
	?>
		#wrap-header .header h2#site-title,
		#wrap-header .header h3#site-description {
			display:none
		}
	<?php
		// If the user has set a custom color for the text use that
		else :
	?>
		#wrap-header .header h2#site-title a,
		#wrap-header .header h3#site-description{
			color: #<?php echo get_header_textcolor(); ?> !important;
		}
	<?php endif; ?>
	</style>
	<?php
}// End desaindigital_header_style()

// Styles the header image displayed on the Appearance > Header admin panel.
function desaindigital_admin_header_style() {
?>
<style type="text/css">
	@import url('<?php echo get_template_directory_uri() ?>/font/font.css');
	.appearance_page_custom-header #headimg{
		background:transparent url('<?php echo get_template_directory_uri() ?>/images/basic-layout.png') repeat-y top center;
		width:470px;
	}

	#headimg #headimg-in{
		background:transparent url('<?php echo get_template_directory_uri() ?>/images/sidebar.png') no-repeat scroll top right;
		background-size:100% 19px;
/* 		min-height:20px; */
	}

	#headimg h1{
		font:normal normal 24px lobster;
		padding:6px 0 0 0;
		width:50%;
		margin:0 auto;
		text-align:center;
	}
	
	#headimg h1 a {
		text-decoration:none;
	}
		
	#desc {
		text-align:center;
		font:normal normal 15px georgia, serif;
		margin:0 auto;
		padding:0 0 12px 0;
		width:50%;
	}

	#headimg img {
		max-width: 225px;
		height: auto;
		margin:0 auto;
		display:block;
	}

	<?php
		// If the user has set a custom color for the text use that
		if ( get_header_textcolor() != get_theme_support( 'custom-header', 'default-text-color' ) ) :
	?>

	#blog-title a,
	#blog-description {
		color: #<?php echo get_header_textcolor(); ?>;
		}
	<?php endif; ?>
	</style>
<?php
}// End desaindigital_admin_header_style()

// Custom header image markup displayed on the Appearance > Header admin panel.
function desaindigital_admin_header_image() { ?>
	<div id="headimg">
		<?php
		$color = get_header_textcolor();
		$image = get_header_image();
		$image_height = get_custom_header()->height;
		$image_width = get_custom_header()->width;
		if ( $color && $color != 'blank' )
			$style = ' style="color:#' . $color . '"';
		else
			$style = ' style="display:none"';
		?>
		<?php
			if ( $image ) :
				echo "<img src=" . esc_url( $image ) . " width=" . $image_width . "px height=" . $image_height . "px />";
			endif;
		 ?>
		<h1><a id="name"<?php echo $style; ?> onclick="return false;" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php bloginfo( 'name' ); ?></a></h1>
		<div id="desc"<?php echo $style; ?>><?php bloginfo( 'description' ); ?></div>
	</div><!-- End #headimg -->
<?php } // End desaindigital_admin_header_image()