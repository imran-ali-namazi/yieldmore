<?php
	get_header();// Include header.php
?>

	<div id='wrap-content'>

		<div class='not-found'>
			<h2 class='center'><?php _e('Not Found', 'desaindigital') ?></h2>
			<p class='center'><a href="<?php echo site_url(); ?>"><?php _e('Click here to return to the home page', 'desaindigital'); ?></a> <?php _e('or try a search: ', 'desaindigital'); ?></p>
			<?php get_search_form(); ?>
		</div><!-- End .not-found -->

	</div><!-- End #wrap-content -->
	<?php
		get_sidebar(); //Include sidebar.php
		get_footer(); //Include footer.php
	?>