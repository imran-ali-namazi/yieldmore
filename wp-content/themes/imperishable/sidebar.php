
			<div id='wrap-sidebar'>
				<div class='sidebar clear'>

					<?php
						if (is_single() && cs_work_get('hasnav')) {
							cs_work_get('sidebar');
						} else if ( !dynamic_sidebar( 'sidebar' ) ) {

							the_widget('WP_Widget_Pages', 'title= Pages');
							the_widget('WP_Widget_Meta', 'title= Meta');
							the_widget('WP_Widget_Links');
							the_widget('WP_Widget_Archives', 'title= Archives');
							the_widget('WP_Widget_Categories', 'title= Categories');
							the_widget('WP_Widget_Calendar', 'title= Calendar');
							the_widget('WP_Widget_Tag_Cloud', 'title= Tag Cloud');
							//the_widget('WP_Widget_Recent_Comments', 'title= Recent Comments');
							//the_widget('WP_Widget_Search', 'title= Search');
							//the_widget('WP_Widget_Recent_Posts', 'title= Recent Post');

						} ?>
				</div><!-- End .sidebar .clear -->
				<h1 id='logo'><a href="<?php echo esc_url( home_url( '/' ) ); ?>">
						<img src="<?php echo get_header_image(); ?>" width="<?php echo get_custom_header()->width; ?>" height="<?php echo get_custom_header()->height; ?>" alt="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" />
				</a></h1>
			</div><!-- End #wrap-sidebar -->
