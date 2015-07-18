<?php
	CSScripts::post_thumbnails();
	get_header();// Include header.php
?>

	<div id="post-preview" class="hentry" style="display: none;">
		<a id="post-preview-close" class="nav">Close</a>
		<a id="post-preview-next" class="nav">Next</a>
		<a id="post-preview-prev" class="nav">Prev</a>
		<b id="post-preview-index" style="float: right;padding: 8px;">1 of 4</b>
		<div id="post-preview-content"></div>
	</div>
	<div id='wrap-content' class='post-thumbnails'>

		<?php if (have_posts()) : the_post(); ?>

			<h1 class='title-archive'>
				<?php if ( is_day() ) : ?>
				<?php printf(  __('Daily Archives: <span>%s</span>', 'desaindigital'), get_the_date() ); ?>
				<?php elseif ( is_month() ) : ?>
				<?php printf( __('Monthly Archives: <span>%s</span>', 'desaindigital'), get_the_date('F Y') ); ?>
				<?php elseif ( is_year() ) : ?>
				<?php printf(  __('Yearly Archives: <span>%s</span>', 'desaindigital'), get_the_date('Y') ); ?>
				<?php elseif ( is_author() ) : ?>
				<?php printf( __('Author Archive: <span>%s</span>', 'desaindigital'), get_the_author() ); ?>
				<?php elseif ( is_category() ) : ?>
				<?php printf( __('Category Archive: <span>%s</span> ' . category_description(), 'desaindigital'), single_cat_title("", false)); ?>
				<?php elseif ( is_tag() ) : ?>
				<?php printf( __('Tag Archive: <span>%s</span>', 'desaindigital'), single_tag_title("", false)); ?>
				<?php else : ?>
				<?php _e('Blog Archives', 'desaindigital') ?>
				<?php endif; ?>
			</h1>
			<?php
					rewind_posts();

			while (have_posts()) : the_post(); ?>

			<div id="post-<?php the_ID(); ?>" <?php post_class('post-thumb'); ?>>

				<?php desaindigital_post_format(); ?>
				
				<div class='post-content'>
					<h2 class='post-title'><a href="<?php the_permalink() ?>#post-<?php the_ID(); ?>" rel="bookmark" title="<?php printf( esc_attr__( 'Permalink to %s', 'desaindigital' ), the_title_attribute( 'echo=0' ) ); ?>"><?php the_title(); ?></a></h2>

					<div class='content'>
						<?php
							if (has_post_thumbnail()) { ?>
								<p class='the-post-thumbnail'><a href='<?php the_permalink() ?>' rel='bookmark' title='<?php printf( esc_attr__( 'Permalink to %s', 'desaindigital' ), the_title_attribute( 'echo=0' ) ); ?>'><?php
									the_post_thumbnail(); ?></a></p>
								<?php } ?>	
						<?php the_content( __( 'Read more ...', 'desaindigital' ) ); ?>
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