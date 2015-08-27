<?php
/**
 * The template used for displaying page content in page.php
 *
 * @package formation
 * @since formation 1.0
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

	<div class="entry-content">
		<?php the_content(); ?>
		<?php wp_link_pages( array( 'before' => '<div class="page-links">' . __( 'Pages:', 'formation' ), 'after' => '</div>' ) ); ?>
        <footer class="entry-meta">
		<?php edit_post_link( __( 'Edit', 'formation' ), '<span class="edit-link">', '</span>' ); ?>
        </footer><!-- .entry-meta -->
	</div><!-- .entry-content -->
</article><!-- #post-<?php the_ID(); ?> -->
