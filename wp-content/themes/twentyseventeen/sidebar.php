<?php
/**
 * The sidebar containing the main widget area
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package WordPress
 * @subpackage Twenty_Seventeen
 * @since 1.0
 * @version 1.0
 */

if (is_single() && cs_work_get('hasnav')) {
  echo '<aside id="secondary" class="widget-area" role="complementary">';
  echo '<section id="biblios-1" class="widget widget_biblios">';
  cs_work_get('header'); 
  cs_work_get('sidebar');
  echo '</section></aside><!-- #secondary -->';
  return;
}

if ( ! is_active_sidebar( 'sidebar-1' ) ) {
	return;
}
?>

<aside id="secondary" class="widget-area" role="complementary" aria-label="<?php esc_attr_e( 'Blog Sidebar', 'twentyseventeen' ); ?>">
	<?php dynamic_sidebar( 'sidebar-1' ); ?>
</aside><!-- #secondary -->
