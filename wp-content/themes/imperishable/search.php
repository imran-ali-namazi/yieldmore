<?php
	get_header();// Include header.php
?>

	<div id='wrap-content'>

		<?php if (have_posts()) :  ?>
		
			<h1 class='title-search'>
				<?php printf( __('Search Results for: <span>%s</span>', 'desaindigital'), get_search_query() ); ?>
			</h1>

		<?php while (have_posts()) : the_post(); ?>

			<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

				<?php desaindigital_post_format(); ?>
				
				<div class='post-content'>
					<h2 class='post-title'><a href="<?php the_permalink() ?>#post-<?php the_ID(); ?>" rel="bookmark" title="<?php printf( esc_attr__( 'Permalink to %s', 'desaindigital' ), the_title_attribute( 'echo=0' ) ); ?>"><?php the_title(); ?></a></h2>
				
					<div class='content'>
						<?php
							if (has_post_thumbnail()) { ?>
								<p class='the-post-thumbnail'><a href='<?php the_permalink() ?>' rel='bookmark' title='<?php the_title(); ?>'><?php
									the_post_thumbnail(); ?></a></p>
								<?php } ?>
						<?php
						the_excerpt();?>
					</div><!-- End .content -->
				</div><!-- End .post-content -->

				<?php desaindigital_post_meta() ?>

			</div><!-- End <div id="post-<?php the_ID(); ?>" <?php post_class(); ?>> -->

		<?php endwhile; ?>

			<div class='navigation clear'>
				<div class="alignleft"><?php next_posts_link( __( 'Older posts', 'desaindigital' ) ); ?></div>
				<div class="alignright"><?php previous_posts_link( __( 'Newer posts', 'desaindigital' ) ); ?></div>
			</div><!-- End .navigation .clear -->

		<?php else: ?>

			<h1 class='title-search'>
				<?php printf( __('No results for: <span>%s</span>', 'desaindigital'), get_search_query() ); ?>
			</h1>

			<p><?php _e('Try another search: ', 'desaindigital') ?></p>
			<?php get_search_form(); ?>

		<?php endif; ?>

	</div><!-- End #wrap-content -->
	<?php
		get_sidebar(); //Include sidebar.php
		get_footer(); //Include footer.php
	?>