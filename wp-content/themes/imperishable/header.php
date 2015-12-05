<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--  "http://www.w3.org/TR/html4/loose.dtd" -->
<html <?php language_attributes('xhtml'); ?>>
<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title><?php	
		// Print the <title> tag based on what is being viewed.
		global $page, $paged;	wp_title( '&raquo;', true, 'right' );	
		// Add the blog name.	
		bloginfo( 'name' );	
		// Add the blog description for the home/front page.	
		$site_description = str_replace(' - ',' ', get_bloginfo( 'description'));
		if ( $site_description && ( is_home() || is_front_page() ) )
			echo " &raquo; $site_description"; ?></title>
	<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
	<link rel="stylesheet" href="<?php echo get_stylesheet_uri(); ?>" type="text/css" />
	<link rel="stylesheet" href="/wp-content/themes/imperishable/css/yield.css" type="text/css" />
	<?php
		CSScripts::sidebar();
		wp_head();
	?>
</head>
<body <?php body_class(); ?>>

<div id="wrap-upper">
<?php if (!(is_single() && cs_work_get('hasnav'))) CSScripts::accordion(); ?>
<div id="wrap-left">
	<div id='wrap-header'>
		<div class='header'>
			<?php
			if (is_single() && cs_work_get('hasnav')) {?>
				<h2 id="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a> <?php echo WorkConfig::dirLink('./'); ?></h2>
				<?php
				if (!is_user_logged_in()) { echo '<p align="center"><a href="' . wp_login_url() . '">Login / Register</a></p>'; }
				cs_work_get('header'); 
			} else {
			?>

			<h2 id="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h2>
			<h3 id="site-description"><?php echo str_replace(' - ','<br />', get_bloginfo( 'description' )); ?></h3>

			<?php
				if (!is_user_logged_in()) { echo '<p align="center"><a href="' . wp_login_url() . '">Login / Register</a></p>'; }
				CSWebparts::shell();
				get_search_form();
			} ?>

		</div><!-- End .header -->
	</div><!-- End #wrap-header -->
	<?php
		get_sidebar(); //Include sidebar.php
	?>
</div><!--wrap-left-->
