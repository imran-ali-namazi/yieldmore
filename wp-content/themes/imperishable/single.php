<?php
	get_header();// Include header.php
?>

	<div id='wrap-content'>

		<?php if (have_posts()) : the_post(); ?>

			<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

				<?php desaindigital_post_format(); ?>
				
				<div class='post-content'>
					<h2 class='post-title'><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php printf( esc_attr__( 'Permalink to %s', 'desaindigital' ), the_title_attribute( 'echo=0' ) ); ?>"><?php the_title(); ?></a></h2>

					<div class='content'>
								<?php if (cs_work_get('hascontent')) cs_work_get('content'); else the_content(); ?>
							<?php wp_link_pages( array( 'before' => '<span class="page-link clear"><span>' . __( 'Pages:', 'desaindigital' ) . '</span>', 'after' => '</span>' ) ); ?>
					</div><!-- End .content -->
				</div><!-- End .post-content -->

				<?php desaindigital_post_meta() ?>

			</div><!-- End <div id="post-<?php the_ID(); ?>" <?php post_class(); ?>> -->

			<div class='navigation clear'>
				<?php previous_post_link('<span class=\'alignleft\'> %link </span><!-- End .previous-post -->') ?>
				<?php next_post_link('<span class=\'alignright\'> %link </span><!-- End .next-post -->') ?>	
			</div><!-- End .navigation .clear -->
			
			<?php if (!cs_work_get('hasnav')) { ?><div id='comment-wrap' class='clear'>

					<?php comments_template(); ?>

			</div><!-- End #comment-wrap .clear --><?php } ?>

		<?php else: ?>

			<div class='not-found'>
				<h2 class='center'><?php _e('Not Found', 'desaindigital') ?></h2>
				<p class='center'><a href="<?php echo site_url(); ?>"><?php _e('Click here to return to the home page', 'desaindigital'); ?></a> <?php _e('or try a search: ', 'desaindigital'); ?></p>
				<?php get_search_form(); ?>
			</div><!-- End .not-found -->

		<?php endif; ?>

	</div><!-- End #wrap-content -->
	<?php
		get_sidebar(); //Include sidebar.php
		get_footer(); //Include footer.php
	?>