<?php

/*
 * Template Name: Full Width
 * Description: A Page Template with no sidebar.
 *
 * @package formation
 * @since formation 1.0
 */



get_header(); ?>

		<header class="entry-header">
		<h1 class="page-title"><?php the_title(); ?><span class="breadcrumbs"><?php if (function_exists('formation_breadcrumbs')) formation_breadcrumbs(); ?></span></h1>
		</header><!-- .entry-header -->

		<div id="primary_home" class="content-area">

			<div id="content" class="fullwidth" role="main">



				<?php while ( have_posts() ) : the_post(); ?>



					<?php get_template_part( 'content', 'page' ); ?>



					<?php comments_template( '', true ); ?>



				<?php endwhile; // end of the loop. ?>



			</div><!-- #content .site-content -->

		</div><!-- #primary .content-area -->



<?php get_footer(); ?>