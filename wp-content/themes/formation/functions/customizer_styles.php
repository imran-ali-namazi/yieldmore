<?php
//////////////////////////////////////////////////////////////////
// Customizer - Add CSS
//////////////////////////////////////////////////////////////////
function formation_customizer_css() {
$styleOption = get_theme_mod( 'formation_color_scheme');

if( $styleOption != 'Default'):
?>

	<link rel="stylesheet" href="<?php echo get_template_directory_uri();?>/css/<?php echo esc_attr(strtolower( get_theme_mod( 'formation_color_scheme', 'blue' ) ) ); ?>.css" type="text/css" media="screen">

<?php
endif;
}
add_action( 'wp_head', 'formation_customizer_css' ); 