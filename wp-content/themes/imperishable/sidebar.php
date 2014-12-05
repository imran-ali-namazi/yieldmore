
			<div id='wrap-sidebar'>
				<div class='sidebar clear'>

					<?php
						if (cs_work_get('hasnav')) {
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
			</div><!-- End #wrap-sidebar -->
