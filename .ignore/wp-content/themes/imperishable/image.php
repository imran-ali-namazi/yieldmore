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
					<?php
						$attachments = array_values( get_children( array( 'post_parent' => $post->post_parent, 'post_status' => 'inherit', 'post_type' => 'attachment', 'post_mime_type' => 'image', 'order' => 'ASC', 'orderby' => 'menu_order ID' ) ) );
						foreach ( $attachments as $k => $attachment ) {
							if ( $attachment->ID == $post->ID )
							break;
						}

						$k++;
						// If there is more than 1 attachment in a gallery
					if ( count( $attachments ) > 1 ) {
						if ( isset( $attachments[ $k ] ) )
							// get the URL of the next image attachment
							$next_attachment_url = get_attachment_link( $attachments[ $k ]->ID );
						else
							// or get the URL of the first image attachment
							$next_attachment_url = get_attachment_link( $attachments[ 0 ]->ID );
					} else {
						// or, if there's only 1 image, get the URL of the image
						$next_attachment_url = wp_get_attachment_url();
					}
					?>

					<a href="<?php echo esc_url( $next_attachment_url ); ?>" title="<?php the_title_attribute(); ?>">
					<?php
						$attachment_size = apply_filters( 'sc_attachment_size', 848 );
						echo wp_get_attachment_image( $post->ID, array( $attachment_size, 1024 ) ); // filterable image width with 1024px limit for image height.
					?></a>

					<?php /* if ( ! empty( $post->post_excerpt ) ) : ?>
						<?php the_excerpt(); ?>
					<?php endif; */ ?>

					<?php
					the_content(); ?>
					<?php wp_link_pages(array('before' => '<div class="page-link clear"><span>Pages:</span> ', 'after' => '</div>', 'next_or_number' => 'number')); ?>

					<div class='navigation clear'>
						<div class='alignleft'><?php previous_image_link( false, __( 'Previous' , 'desaindigital' ) ); ?></div>
						<div class='alignright'><?php next_image_link( false, __( 'Next' , 'desaindigital' ) ); ?></div>
					</div><!-- End .navigation .clear -->

					</div><!-- End .content -->
				</div><!-- End .post-content -->

				<div class='post-meta'>
					<span class='post-meta-in clear'>
						<?php printf('<span class=\'post-date clear\'><span class=\'post-meta-title\'>Date: </span><span class=\'post-meta-content\'>%1$s</span></span><!-- End .entry-date -->',
							esc_attr( get_the_date('d/m/Y') )); ?>

						<span class='the-author clear'>
							<span class='post-meta-title'><?php _e('Author: ', 'desaindigital') ?></span>
							<span class='post-meta-content'><?php
								//the_author_link();
								the_author_posts_link();
								//the_author();
								?>
							</span>
						</span><!-- End .the-author -->

						<span class='comments-popup clear'>
							<span class='post-meta-title'><?php _e('Comment: ', 'desaindigital') ?></span>
							<span class='post-meta-content'>
							<?php comments_popup_link( __('No Comments', 'desaindigital'), __('1 Comment', 'desaindigital'), __('% Comments', 'desaindigital'), '', __('Comments Closed','desaindigital') ); ?>
							</span>
						</span><!-- End .comments-popup -->
						
						<?php
							$metadata = wp_get_attachment_metadata();
							printf('
								<span class="clear full-size"><span class="post-meta-title">View:</span><span class="post-meta-content"><a href="%1$s">Full Size</a></span></span>
								<span class="clear img-width"><span class="post-meta-title">Image width:</span><span class="post-meta-content"> %2$s </span></span>
								<span class="clear img-height"><span class="post-meta-title">Image height:</span><span class="post-meta-content"> %3$s </span></span>
								<span class="clear post-parent"><span class="post-meta-title">Parent Post:</span><span class="post-meta-content"> <a href="%4$s" title="%5$s">%6$s</a></span></span>',
								esc_url( wp_get_attachment_url() ),
								$metadata['width'],
								$metadata['height'],
								esc_url( get_permalink( $post->post_parent ) ),
								esc_attr( strip_tags( get_the_title( $post->post_parent ) ) ),
								get_the_title( $post->post_parent ));
						?>

						<span class='bookmark clear'>
							<span class='post-meta-title'><?php _e('Bookmark: ', 'desaindigital') ?></span>
							<span class='post-meta-content'>
							<a href="<?php the_permalink() ?>" rel="bookmark" title="<?php printf( esc_attr__( 'Permalink to %s', 'desaindigital' ), the_title_attribute( 'echo=0' ) ); ?>"><?php _e('permalink', 'desaindigital') ?></a>
							</span>
						</span><!-- End .bookmark -->
						
						<span class='post-meta-title clear'><?php edit_post_link(); ?></span>

					</span><!-- End .post-meta-in clear -->
				</div><!-- End .post-meta -->

			</div><!-- End <div id="post-<?php the_ID(); ?>" <?php post_class(); ?>> -->
			
			<div id='comment-wrap' class='clear'>

					<?php comments_template(); ?>

			</div><!-- End #comment-wrap .clear -->

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