<?php
/**
 * The template for displaying Search Results pages.
 *
 * @package formation
 * @since formation 1.0
 */

get_header(); ?>

		<header class="entry-header">
		<h1 class="page-title"><?php printf( __( 'Search Results for: %s', 'formation' ), '<span>' . get_search_query() . '</span>' ); ?></h1><span class="breadcrumbs"><?php if (function_exists('formation_breadcrumbs')) formation_breadcrumbs(); ?></span>
		</header><!-- .entry-header -->

		<div id="primary_wrap">
		<div id="primary_home" class="content-area">
			<div id="content" class="fullwidth" role="main">

			<?php if ( have_posts() ) : ?>

				<?php formation_content_nav( 'nav-above' ); ?>

				<?php /* Start the Loop */ ?>
				<?php while ( have_posts() ) : the_post(); ?>

					<?php get_template_part( 'content', 'search' ); ?>

				<?php endwhile; ?>

				<?php formation_content_nav( 'nav-below' ); ?>

			<?php else : ?>

				<?php get_template_part( 'no-results', 'search' ); ?>

			<?php endif; ?>

			</div><!-- #content .site-content -->
		</div><!-- #primary .content-area -->


</div>
<?php get_footer(); ?>