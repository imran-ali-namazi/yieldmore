<?php
	if ( post_password_required() ) { ?>
		<p class="nocomments clear"><?php _e('This post is password protected. Enter the password to view comments.', 'desaindigital') ?></p>
	<?php
		return;
	}
?>
<?php if ( have_comments() ) : ?>
	<h3 id="comments">
		<?php comments_number( __('No Responses to ', 'desaindigital'), __('One Response to ', 'desaindigital'), __('% Responses to ', 'desaindigital') );?>&#8220;<?php the_title(); ?>&#8221;
	</h3>

	<div class="navigation">
		<div class="alignleft"><?php previous_comments_link(__('Older Comments', 'desaindigital') ) ?></div>
		<div class="alignright"><?php next_comments_link( __('Newer Comments', 'desaindigital') ) ?></div>
	</div>

	<ol class="commentlist">
		<?php wp_list_comments( array ('avatar_size' => 80)); ?>
	</ol>

	<div class="navigation">
		<div class="alignleft"><?php previous_comments_link( __('Older Comments', 'desaindigital') ) ?></div>
		<div class="alignright"><?php next_comments_link( __('Newer Comments', 'desaindigital') ) ?></div>
	</div>
<?php elseif ( ! comments_open() && ! is_page() ) : ?>
	<p class="nocomments clear"><?php _e('Comments are closed.', 'desaindigital') ?></p>
<?php endif; ?>

<?php comment_form(); ?>