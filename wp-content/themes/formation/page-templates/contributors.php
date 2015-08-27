<?php
/*
Template Name: Display Authors
*/

// Get all users order by amount of posts
if( get_theme_mod('authors_ids') ){
	$args = array(
		'include'		=> esc_attr(get_theme_mod('authors_ids')),
		'orderby' 		=> 'user_nicename',
		'order'			=> 'DESC',
	);
} else {
	$args = array(
		'orderby'		=> 'post_count',
		'order'			=> 'DESC',
	);
}

// print_r($args);
// die;

$allUsers = get_users( $args );

// var_dump($allUsers);
// die;

//$allUsers = get_users('orderby=post_count&#038;order=DESC');

$users = array();

?>

<?php get_header(); ?>

	<header class="entry-header">
		
		<h1 class="page-title"><?php the_title(); ?><span class="breadcrumbs"><?php if (function_exists('formation_breadcrumbs')) formation_breadcrumbs(); ?></span></h1>
	
	</header><!-- .entry-header -->

	<div id="primary_home" class="content-area">

		<div id="content" class="fullwidth" role="main">

		<?php if(! get_theme_mod( 'authors_hide_content' ) && ! get_theme_mod( 'authors_content_below' ) ): ?>

			<?php while ( have_posts() ) : the_post(); ?>

				<?php get_template_part( 'content', 'page' ); ?>

			<?php endwhile; // end of the loop. ?>

		<?php endif; ?>

		<?php
		foreach($allUsers as $user)
		{
			?>
			
			<div class="authorlist">

				<div class="authorAvatar">
					<?php 

						$profileImage = get_user_meta($user->ID, 'alternate_image', true);

						if(! $profileImage){
							$profileImage = get_avatar( $user->user_email, '128' );
						} else {
							$profileImage = '<img alt="'. _e('Profile Picture', 'formation') .'" src="' . $profileImage . '" class="avatar avatar-128 photo" width="128" height="128">';
						}

						echo $profileImage 

					?>
				</div>

				<div class="authorInfo">

					<h2 class="authorName"><?php echo $user->display_name; ?></h2>

					<p class="authorDescrption"><?php echo get_user_meta($user->ID, 'description', true); ?></p>

					<?php 
						$user_post_count = count_user_posts( $user->ID );
						if($user_post_count): ?>
							<p class="authorLinks"><a href="<?php echo get_author_posts_url( $user->ID ); ?>"><?php echo __('Author Posts', 'formation'); ?></a>
						<?php endif; 
					?>

					<div class="socialIcons">
						<ul class="socialIcons">
							<?php
								$website = $user->user_url;
								if($user->user_url != '')
								{
									printf('<li><a href="%s" target="_blank"><i class="fa fa-link"></i></a></li>', $user->user_url, 'Website');
								}

								$twitter = get_user_meta($user->ID, 'twitter_profile', true);
								if($twitter != '')
								{
									printf('<li><a href="%s" target="_blank"><i class="fa fa-twitter"></i></a></li>', $twitter, 'Twitter');
								}

								$facebook = get_user_meta($user->ID, 'facebook_profile', true);
								if($facebook != '')
								{
									printf('<li><a href="%s" target="_blank"><i class="fa fa-facebook-official"></i></a></li>', $facebook, 'facebook');
								}

								$google = get_user_meta($user->ID, 'google_profile', true);
								if($google != '')
								{
									printf('<li><a href="%s" target="_blank"><i class="fa fa-google-plus-square"></i></a></li>', $google, 'Google');
								}

								$linkedin = get_user_meta($user->ID, 'linkedin_profile', true);
								if($linkedin != '')
								{
									printf('<li><a href="%s" target="_blank"><i class="fa fa-linkedin-square"></i></a></li>', $linkedin, 'LinkedIn');
								}
							?>
						</ul>
					</div><?php ?>
				</div>
			</div>
			<?php
		} ?>

		<?php if(! get_theme_mod('authors_hide_content') && get_theme_mod('authors_content_below')): ?>

			<?php while ( have_posts() ) : the_post(); ?>

				<?php get_template_part( 'content', 'page' ); ?>

			<?php endwhile; // end of the loop. ?>

		<?php endif; ?>

	</div>
</div>

<?php get_footer(); ?>