<?php
function desaindigital_excerpt_read_more() {
	return '<span class=\'clear\'><a class=\'more-link\' href=\''. get_permalink() . '\'>' . __( 'read more...', 'desaindigital') . '</a></span>';
}
add_filter('excerpt_more', 'desaindigital_excerpt_read_more');

function desaindigital_read_more_length($length) {
	return 76;
}
add_filter('excerpt_length', 'desaindigital_read_more_length');

function desaindigital_setup() {
	if ( ! isset( $content_width ) )
		$content_width = 600;
	// Load textdomain
	load_theme_textdomain('desaindigital', get_template_directory().'/languages'); // See : http://codex.wordpress.org/Function_Reference/load_theme_textdomain
	add_editor_style();
	add_theme_support( 'automatic-feed-links' );
	add_theme_support( 'post-formats', array( 'aside', 'chat', 'gallery', 'image', 'link', 'quote', 'status', 'video' ) );
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 250, 200, false );
	// Load custom header
	require( get_template_directory() . '/inc/custom-header.php' );// Load custom header
}
add_action( 'after_setup_theme', 'desaindigital_setup' );

function desaindigital_widgets_init() {
	register_sidebar( array(
		'name' => 'Sidebar',
		'id' => 'sidebar ',
		'description' => __('Sidebar widget', 'desaindigital'),
		'before_widget' => '<div class="widget %2$s">',
		'after_widget' => '</div><!-- End .widget -->'/* ,
		'before_title' => '<h2 class="widgettitle">',
		'after_title' => '</h2>' */
		)
	);
}//End desaindigital_widgets_init()
add_action( 'widgets_init', 'desaindigital_widgets_init');

function desaindigital_post_format(){
	$fmt = '<span class="post-format %s"><span>%s</span></span>';
	
	$wk = get_post_type() == 'page' ? 'page' : cs_work_get('workType');
	if ($wk)
	{
		_e(sprintf($fmt, $wk, $wk), 'desaindigital');
		return;
	}
	
	$formats = array('page', 'aside', 'chat', 'gallery', 'image', 'link', 'quote', 'status', 'video');
	foreach ($formats as $itm)
	{
		if (($itm == 'page' && is_page()) || has_post_format( $itm ))
		{
			_e(sprintf($fmt, $itm, $itm), 'desaindigital');
			return;
		}
	}

	$cat = get_the_category(get_the_ID());
	if (count($cat))
	{
		$singular = array('People' => 'Person', 'Documentaries' => 'Documentary', 'Incubate' => 'Incubate');
		$name = isset($singular[$cat[0]->name]) ? $singular[$cat[0]->name] : substr($cat[0]->name, 0, -1);
		_e(sprintf($fmt, $name, $name), 'desaindigital');
		return;
	}

	_e('<span class="post-format"><span>Article</span></span>', 'desaindigital');		
} // End desaindigital_post_format()

function desaindigital_post_meta(){ return; ?>
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
					<?php if(is_single() || is_home() || is_archive()){ ?>
					<?php the_tags('<span class=\'the-tag clear\'><span class=\'post-meta-title\'>Tags: </span><span class=\'post-meta-content\'>', ', ' , '</span></span><!-- End .the-tag -->'); ?>
						<span class='the-category clear'>
							<span class='post-meta-title'><?php _e('Category: ', 'desaindigital') ?></span>
							<span class='post-meta-content'>
							<?php the_category(', '); ?>
							</span>
						</span><!-- End .the-category -->
					<?php } ?>
					
						<span class='bookmark clear'>
							<span class='post-meta-title'><?php _e('Bookmark: ', 'desaindigital') ?></span>
							<span class='post-meta-content'>
								<a href="<?php the_permalink() ?>" rel="bookmark" title="<?php printf( esc_attr__( 'Permalink to %s', 'desaindigital' ), the_title_attribute( 'echo=0' ) ); ?>"><?php _e('Permalink ', 'desaindigital') ?></a>
							</span>
						</span><!-- End .bookmark -->

					<?php if(is_single()){ ?>

						<span class='comments-popup clear'>
							<span class='post-meta-title'><?php _e('Comment: ', 'desaindigital') ?></span>
							<span class='post-meta-content'>
							<?php comments_popup_link( __('No Comments', 'desaindigital'), __('1 Comment', 'desaindigital'), __('% Comments', 'desaindigital'), '', __('Comments Closed','desaindigital') ); ?>
							</span>
						</span><!-- End .comments-popup -->
					
						<span class='post-meta-title clear'><?php edit_post_link(); ?></span>
					<?php } ?>

					</span><!-- End .post-meta-in clear -->
				</div><!-- End .post-meta -->
<?php } // End desaindigital_post_meta

function desaindigital_msie_style(){ ?>
	<!--[if lte IE 8]>
		<link rel='stylesheet' href='<?php echo get_template_directory_uri(); ?>/css/msie/ie.css' type='text/css' media='screen' />
	<![endif]-->
	<!--[if lte IE 7]>
		<link rel='stylesheet' href='<?php echo get_template_directory_uri(); ?>/css/msie/ie7.css' type='text/css' media='screen' />
	<![endif]-->
	<?php } // End desaindigital_msie_style
add_action('wp_head', 'desaindigital_msie_style');

// Comment reply.
add_action( 'wp_enqueue_scripts', 'desaindigital_enqueue_comment_reply' );
function desaindigital_enqueue_comment_reply() {
	if ( is_singular() && comments_open() && get_option('thread_comments')) { 
		wp_enqueue_script('comment-reply'); 
		}
	}

// Untitle
add_filter('the_title', 'desaindigital_untitle');
function desaindigital_untitle($title) {
	if ($title == '') {
		return __('Untitled', 'desaindigital');
	} else {
		return $title;
		}
	}

// Removes default styles set by WordPress recent comments widget.
add_action( 'widgets_init', 'desaindigital_remove_recent_comments_style' );
function desaindigital_remove_recent_comments_style() {
	global $wp_widget_factory;
	remove_action( 'wp_head', array( $wp_widget_factory->widgets['WP_Widget_Recent_Comments'], 'recent_comments_style' ) );
}
