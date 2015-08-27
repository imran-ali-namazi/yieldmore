<?php
/**
 * Customizer - Add Custom Styling
 */
if ( ! function_exists( 'formation_customizer_style' ) ) :

	function formation_customizer_style()
	{
		wp_enqueue_style('formation-customizer', get_template_directory_uri() . '/functions/css/customizer.css');
	}

endif;

add_action('customize_controls_print_styles', 'formation_customizer_style');

/**
 * Customizer - Live Preview
 */
if ( ! function_exists( 'formation_customizer_live_preview' ) ) :

	function formation_customizer_live_preview() {
		wp_enqueue_script( 
			'formation-theme-customizer', 
			get_template_directory_uri() . '/js/theme-customizer.js', 
			array( 'customize-preview' ), 
			rand(),  
			true 
		);
	}

endif;

add_action( 'customize_preview_init', 'formation_customizer_live_preview' );

/**
 * Customizer - include script to display pro message
 */
if ( ! function_exists( 'formation_customizer_scripts' ) ) :

	function formation_customizer_scripts() {

		wp_register_script( 'formation-customizer-pro', get_template_directory_uri() . '/js/customizer-pro.js', '2.0', 'jquery', true);
		
		// Localize the script with new data
		$translation_array = array(
			'pro_message' 	=> __( 'Check out Pro Version', 'formation' ),
		);

		wp_localize_script( 'formation-customizer-pro', 'pro_object', $translation_array );

		wp_enqueue_script( 'formation-customizer-pro' );

	}

endif;

add_action( 'customize_controls_enqueue_scripts', 'formation_customizer_scripts' );


/**
 * Customizer - Panels, Sections, Settings & Controls
 */
function formation_register_theme_customizer( $wp_customize ) {

	//  List Arrays
	$list_social_channels = array( // 1
		'twitter'			=> __( 'Twitter url', 'formation' ),
		'facebook'			=> __( 'Facebook url', 'formation' ),
		'googleplus'		=> __( 'Google + url', 'formation' ),
		'linkedin'			=> __( 'LinkedIn url', 'formation' ),
		'flickr'			=> __( 'Flickr url', 'formation' ),
		'pinterest'			=> __( 'Pinterest url', 'formation' ),
		'youtube'			=> __( 'YouTube url', 'formation' ),
		'vimeo'				=> __( 'Vimeo url', 'formation' ),
	);

	$list_contact_options = array(
		'telnumber'			=> __( 'Telephone Number', 'formation'),
		'mobile'			=> __( 'Mobile Number', 'formation'),
		'email'				=> __( 'Email Address', 'formation'),
		'address'			=> __( 'Address', 'formation'),
	);

	$list_featured_text_boxes = array(
		array('one', __('One', 'formation'), __('Service Box One', 'formation')),
		array('two', __('Two', 'formation'), __('Service Box Two', 'formation')),
		array('three', __('Three', 'formation'), __('Service Box Three', 'formation')),
	);

	$list_partners_text_boxes = array(
		array('one', __('One', 'formation'), __('Partners logo 1', 'formation')),
		array('two', __('Two', 'formation'), __('Partners logo 2', 'formation')),
		array('three', __('Three', 'formation'), __('Partners logo 3', 'formation')),
		array('four', __('Four', 'formation'), __('Partners logo 4', 'formation')),
	);



	/*
	* //////////////////// Panels ////////////////////////////
	*/

	$priority = 10;

	if(method_exists('WP_Customize_Manager', 'add_panel')){
		
		$wp_customize->add_panel('formation_header_panel', array(
			'title'		=> __('Site Settings', 'formation'),
			'priority'	=> $priority++,
		));

		$wp_customize->add_panel('formation_homepage_panel', array(
			'title'		=> __('Homepage Settings', 'formation'),
			'priority'	=> $priority++,
		));

	}
		

	/*
	* //////////////////// Sections ////////////////////////////
	*/

	$priority = 2;

	$wp_customize->add_section( 'formation_logo_section' , array(
		'title'       		=> __( 'Site Logo', 'formation' ),
		'description' 		=> __( 'Upload a logo to replace the default site name and description in the header', 'formation' ),
		'panel'				=> 'formation_header_panel',
		'priority'			=> $priority++,
	) );

	$wp_customize->add_section( 'formation_favicons' , array(
		'title'     		=> __('Favicon & App Icons', 'formation'),
		'panel'		 		=> 'formation_header_panel',
		'priority'			=> $priority++,
	) );

	$wp_customize->add_section( 'telnumber_section_one', array(
		'title'       		=> __( 'Header Contact Details', 'formation' ),
		'description' 		=> __( 'Add contact details that will appear in the header of your site.', 'formation' ),
		'panel'				=> 'formation_header_panel',
		'priority'			=> $priority++,
    ));

	$wp_customize->add_section( 'formation_social_section', array(
		'title'				=> __('Social Media Accounts', 'formation'),
		'description' 		=> __( 'Setup your social media accounts here.', 'formation' ),
		'panel'				=> 'formation_header_panel',
		'priority'			=> $priority++,
	));

	$wp_customize->add_section( 'footer_settings', array(
	    'title'       		=> __( 'Footer Settings', 'formation' ),
	    'description' 		=> __( "Change/hide content in the footer.", 'formation' ),
	    'panel'				=> 'formation_header_panel',
	    'priority'			=> $priority++,
    ));

	$wp_customize->add_section( 'formation_color_scheme_settings', array(
		'title'       		=> __( 'Color Scheme', 'formation' ),
		'description' 		=> __( 'Click on a color for a preview of a color scheme', 'formation' ),
		'panel'				=> 'formation_header_panel',
		'priority'			=> $priority++,
	) );

	$wp_customize->add_section( 'homepage_slider', array(
	    'title'       		=> __( 'Homepage Slider', 'formation' ),
	    'description' 		=> __( 'Control the homepage slider', 'formation' ),
	    'panel'				=> 'formation_homepage_panel',
	    'priority'			=> $priority++,
    ));

	$wp_customize->add_section( 'service_section_settings', array(
	    'title'       		=> __( 'Service Section Settings', 'formation' ),
	    'description' 		=> __( 'Change the title and control the display.', 'formation' ),
	    'panel'				=> 'formation_homepage_panel',
	    'priority'			=> $priority++,
    ));

	$arraycount = count($list_featured_text_boxes);
	for ($row = 0; $row <  $arraycount; $row++) {
		$wp_customize->add_section( 'featured_section_' . $list_featured_text_boxes[$row][0], array(
			    'title' 			=> $list_featured_text_boxes[$row][2],
			    'description' 		=> __( 'This is a settings section to change the custom homepage services box.', 'formation' ),
			    'panel'				=> 'formation_homepage_panel',
			    'priority' 			=> $priority++,
	        )
	    );	
	}
	
	$wp_customize->add_section( 'featured_section_top', array(
	    'title'       		=> __( 'Featured Promo Bar', 'formation' ),
	    'description' 		=> __( 'Create a eye catching "call to action"', 'formation' ),
	    'panel'				=> 'formation_homepage_panel',
	    'priority'			=> $priority++,
    ));

	$wp_customize->add_section( 'recent_posts_section_settings', array(
	    'title'       		=> __( 'Recent Posts Section Settings', 'formation' ),
	    'description' 		=> __( 'Change the title and control the display.', 'formation' ),
	    'panel'				=> 'formation_homepage_panel',
	    'priority'			=> $priority++,
    ));

    $wp_customize->add_section( 'partners_section_settings', array(
	    'title'       		=> __( 'Partners Section Settings', 'formation' ),
	    'description' 		=> __( 'Change the title and control the display.', 'formation' ),
	    'panel'				=> 'formation_homepage_panel',
	    'priority'			=> $priority++,
    ));

	$arraycount = count($list_partners_text_boxes);
	for ($row = 0; $row <  $arraycount; $row++) {
	 	$wp_customize->add_section( 'logo_section_' . $list_partners_text_boxes[$row][0], array(
		    'title' 			=> $list_partners_text_boxes[$row][2],
		    'description' 		=> __( 'This is a settings section to change the Custom Homepage Partners logo 1.', 'formation' ),
		    'panel'				=> 'formation_homepage_panel',
		    'priority'		 	=> $priority++,
	        )
	    );
	}

	$wp_customize->add_section( 'authors_template_settings', array(
	    'title'       		=> __( 'Authors Template Settings', 'formation' ),
	    'description' 		=> __( "Paste user Id's seperated by commas to display user profiles.", 'formation' ),
	    'priority'			=> $priority++,
    ));




	/*
	* //////////////////// Settings ////////////////////////////
	*/

	$wp_customize->add_setting('formation_global_favicon', array(
		'sanitize_callback'	=> 'formation_sanitize_url',
	));

	$wp_customize->add_setting('formation_global_apple_icon', array(
		'sanitize_callback'	=> 'formation_sanitize_url',
	));

	foreach ($list_contact_options as $key => $value){

		$wp_customize->add_setting( $key . '_textbox_header_one', array(
				'sanitize_callback' => 'formation_sanitize_text',
			)
		);

	}

	foreach ($list_social_channels as $key => $value) {

		$wp_customize->add_setting( $key, array(
			'sanitize_callback' => 'formation_sanitize_url',
		));

	}

	$wp_customize->add_setting( 'formation_logo', array(
			'sanitize_callback' => 'formation_sanitize_url',
		)
	);

	$wp_customize->add_setting('formation_retina_logo', array(
			'sanitize_callback' => 'formation_sanitize_url',
	));

	$wp_customize->add_setting( 'formation_color_scheme', array(
			'default'        	=> 'Default',
			'sanitize_callback' => 'formation_sanitize_text',
		) 
	);

	$wp_customize->add_setting( 'homepage_slider_hide', array(
			'default' 			=> false,
			'sanitize_callback' => 'formation_sanitize_checkbox',
		)
	);
	
	$wp_customize->add_setting( 'homepage_slider_cat', array(
			'default'			=> 'featured',
			'sanitize_callback'	=> 'formation_sanitize_text',
		)
	);

	$wp_customize->add_setting( 'homepage_slider_slide_no', array(
	        'default'     		=> '3',
			'sanitize_callback'	=> 'formation_sanitize_integer',
    	)
	); 

	$wp_customize->add_setting( 'homepage_promotional_bool', array(
			'default' 			=> false,
			'sanitize_callback' => 'formation_sanitize_checkbox',
		)
	);

	$wp_customize->add_setting( 'featured_textbox', array(
			'default' 			=> __( 'Default Featured Text', 'formation' ),
			'transport'			=> 'postMessage',
			'sanitize_callback' => 'formation_sanitize_text',
		)
	);

	$wp_customize->add_setting( 'featured_button_txt', array(
			'sanitize_callback' => 'formation_sanitize_text',
			'transport'			=> 'postMessage',
			'default'			=> 'Find Out More',
		)
	);

	$wp_customize->add_setting( 'featured_button_url', array(
			'sanitize_callback' => 'formation_sanitize_url',
		)
	);

	$wp_customize->add_setting('homepage_service_bool', array(
			'default' 			=> false,
			'sanitize_callback'	=> 'formation_sanitize_checkbox',
	));

	$arraycount = count($list_featured_text_boxes);
	for ($row = 0; $row <  $arraycount; $row++) {

		$wp_customize->add_setting( 'header-' . $list_featured_text_boxes[$row][0] . '-file-upload', array(
				'sanitize_callback' => 'formation_sanitize_url',
			)
		);

		$wp_customize->add_setting( 'featured_textbox_header_' . $list_featured_text_boxes[$row][0], array(
	        	'default' 			=> __( 'Default featured text Header', 'formation' ),
	        	'transport'			=> 'postMessage',
				'sanitize_callback' => 'formation_sanitize_text',
	    	)
		);

		$wp_customize->add_setting( 'header_' . $list_featured_text_boxes[$row][0] . '_url', array(
	        	'default' 			=> __( 'Header Link', 'formation' ),
				'sanitize_callback' => 'formation_sanitize_url',
	    	) 
		);

		$wp_customize->add_setting( 'featured_textbox_text_' . $list_featured_text_boxes[$row][0], array(
				'default' 			=> __( 'Default featured text', 'formation' ),
				'transport'			=> 'postMessage',
				'sanitize_callback' => 'formation_sanitize_text',
			)
		);

	}

	$wp_customize->add_setting('homepage_recent_bool', array(
			'default' 			=> false,
			'sanitize_callback'	=> 'formation_sanitize_checkbox',
	));

	$wp_customize->add_setting( 'homepage_recent_title', array(
			'default'			=> __( 'Recent Posts', 'formation' ),
			'transport'			=> 'postMessage',
			'sanitize_callback' => 'formation_sanitize_text',
		)
	);

	$wp_customize->add_setting('homepage_partners_bool', array(
			'default' 			=> false,
			'sanitize_callback'	=> 'formation_sanitize_checkbox',
	));

	$wp_customize->add_setting( 'homepage_partners_title', array(
			'default'			=> __( 'Partners', 'formation' ),
			'transport'			=> 'postMessage',
			'sanitize_callback' => 'formation_sanitize_text',
		)
	);

	$arraycount = count($list_partners_text_boxes);
	for ($row = 0; $row <  $arraycount; $row++) {

		$wp_customize->add_setting( 'logo-' . $list_partners_text_boxes[$row][0] . '-file-upload', array(
			'sanitize_callback' => 'formation_sanitize_url',
		));

		$wp_customize->add_setting( 'logo_' . $list_partners_text_boxes[$row][0] . '_url', array(
	        'default' 			=> __( 'Link', 'formation' ),
			'sanitize_callback' => 'formation_sanitize_url',
	    ));

	}

	$wp_customize->add_setting( 'copyright_text', array(
			'transport'			=> 'postMessage',
			'sanitize_callback' => 'formation_sanitize_text',
		)
	);

	$wp_customize->add_setting('hide_copyright', array(
			'default' 			=> false,
			'sanitize_callback'	=> 'formation_sanitize_checkbox',
	));

	$wp_customize->add_setting('hide_footer_widgets', array(
			'default' 			=> false,
			'sanitize_callback'	=> 'formation_sanitize_checkbox',
	));

	$wp_customize->add_setting( 'authors_ids', array(
			'sanitize_callback' => 'formation_sanitize_text',
		)
	);

	$wp_customize->add_setting('authors_hide_content', array(
			'default' 			=> false,
			'sanitize_callback'	=> 'formation_sanitize_checkbox',
	));

	$wp_customize->add_setting('authors_content_below', array(
			'default' 			=> false,
			'sanitize_callback'	=> 'formation_sanitize_checkbox',
	));
 
	/* 
	* //////////////////// Controls ////////////////////////////
	*/

	$wp_customize->add_control(
		new WP_Customize_Image_Control(
			$wp_customize,
			'formation_global_favicon',
			array(
				'label'      	=> __('Upload Favicon', 'formation'),
				'section'    	=> 'formation_favicons',
				'settings'   	=> 'formation_global_favicon',
				'priority'	 	=> $priority++,
			)
		)
	);

	$wp_customize->add_control(
		new WP_Customize_Image_Control(
			$wp_customize,
			'formation_global_apple_icon',
			array(
				'label'      	=> __('Upload Apple App Icon', 'formation'),
				'section'    	=> 'formation_favicons',
				'settings'   	=> 'formation_global_apple_icon',
				'priority'	 	=> $priority++,
			)
		)
	);

	foreach ($list_contact_options as $key => $value){

		$wp_customize->add_control( $key . '_textbox_header_one', array(
				'label'			=> $value,
				'section' 		=> 'telnumber_section_one',
			)
		);

	}

	foreach ($list_social_channels as $key => $value) {
		
		$wp_customize->add_control( $key, array(
			'label'   => $value,
			'section' => 'formation_social_section',
			'type'    => 'url',
		) );

	}

	$wp_customize->add_control( new WP_Customize_Image_Control( 
		$wp_customize, 'formation_logo', array(
				'label'    => __( 'Logo', 'formation' ),
				'section'  => 'formation_logo_section',
				'settings' => 'formation_logo',
			) 
		) 
	);

	$wp_customize->add_control( new WP_Customize_Image_Control( 
		$wp_customize, 'formation_retina_logo', array(
				'label'    => __( 'Retina Logo', 'formation' ),
				'section'  => 'formation_logo_section',
				'settings' => 'formation_logo',
			) 
		) 
	);

	$wp_customize->add_control( 'formation_color_scheme', array(
		'label'   		=> __( 'Choose a color scheme', 'formation' ),
		'section' 		=> 'formation_color_scheme_settings',
		'type'       	=> 'radio',
		'choices'    	=> array(
			__( 'Default', 'formation' )	=> 'none',
			__( 'Black', 'formation' ) 		=> 'black',
			__( 'Red', 'formation' ) 		=> 'red',
			__( 'Blue', 'formation' ) 		=> 'blue',
		),
	));

	$wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'homepage_slider_hide_control',
			array(
				'label'      => __('Hide Homepage Slider', 'formation'),
				'section'    => 'homepage_slider',
				'settings'   => 'homepage_slider_hide',
				'type'		 => 'checkbox',
				'priority'	 => $priority++,
			)
		)
	);

	$wp_customize->add_control(
		new WP_Customize_Category_Control(
			$wp_customize,
			'homepage_slider_cat_control',
			array(
				'label'    		=> __('Select Featured Category', 'formation'),
				'section'  		=> 'homepage_slider',
				'settings'		=> 'homepage_slider_cat',
				'priority'	 	=> $priority++,
			)
		)
	);	

	$wp_customize->add_control(
		new Customize_Number_Control(
			$wp_customize,
			'homepage_slider_slide_no_control',
			array(
				'label'      => __('Amount of slides to display', 'formation'),
				'section'    => 'homepage_slider',
				'settings'   => 'homepage_slider_slide_no',
				'type'		 => 'number',
				'priority'	 => $priority++,
			)
		)
	);



	$wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'featured_hide_bar',
			array(
				'label'      	=> __('Hide Promotional Bar', 'formation'),
				'section'    	=> 'featured_section_top',
				'settings'   	=> 'homepage_promotional_bool',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

	$wp_customize->add_control( 'featured_textbox', array(
		    'label'    		=> __( 'Featured Text Header', 'formation' ),
		    'section' 		=> 'featured_section_top',
		    'settings'  	=> 'featured_textbox',
		    'priority'	 	=> $priority++,
	    )
	);

	$wp_customize->add_control( 'featured_button_txt_control', array(
		    'label'    	=> __( 'Change Button Text', 'formation' ),
		    'section' 	=> 'featured_section_top',
		    'settings'	=> 'featured_button_txt',
		    'priority'	 	=> $priority++,
	    )
	);

	$wp_customize->add_control( 'featured_button_url', array(
			'label'    	=> __( 'Featured Button url', 'formation' ),
			'section' 	=> 'featured_section_top',
			'priority'	 	=> $priority++,
		)
	);

	$wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'display_services_section_control',
			array(
				'label'      	=> __('Hide Services Section', 'formation'),
				'section'    	=> 'service_section_settings',
				'settings'   	=> 'homepage_service_bool',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

	$arraycount = count($list_featured_text_boxes);
	for ($row = 0; $row <  $arraycount; $row++) {

		$wp_customize->add_control( 
			new WP_Customize_Upload_Control(
		        $wp_customize,
		        'header-' . $list_featured_text_boxes[$row][0] . '-file-upload',
		        array(
		            'label' 	=> __( 'Header Image File Upload', 'formation' ),
		            'section' 	=> 'featured_section_' . $list_featured_text_boxes[$row][0],
		            'settings' 	=> 'header-' . $list_featured_text_boxes[$row][0] . '-file-upload'
		        )
		    )
		);

		$wp_customize->add_control( 'featured_textbox_header_' . $list_featured_text_boxes[$row][0], array(
				'label' 	=> __( 'Featured Header Text', 'formation' ),
				'section' 	=> 'featured_section_' . $list_featured_text_boxes[$row][0],
				'settings'	=> 'featured_textbox_header_' . $list_featured_text_boxes[$row][0],
			)
		);

		$wp_customize->add_control( 'header_' . $list_featured_text_boxes[$row][0] . '_url', array(
				'label'    	=> __( 'Header url', 'formation' ),
				'section' 	=> 'featured_section_' . $list_featured_text_boxes[$row][0],
				'settings'	=> 'header_' . $list_featured_text_boxes[$row][0] . '_url',
			)
		);
		
		$wp_customize->add_control( 'featured_textbox_text_' . $list_featured_text_boxes[$row][0], array(
				'label' 	=> __( 'Featured text', 'formation' ),
				'section' 	=> 'featured_section_' . $list_featured_text_boxes[$row][0],
				'settings' 	=> 'featured_textbox_text_' . $list_featured_text_boxes[$row][0]
			)
		);

	}

	$wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'display_recent_section_control',
			array(
				'label'      	=> __('Hide Recent Posts Section', 'formation'),
				'section'    	=> 'recent_posts_section_settings',
				'settings'   	=> 'homepage_recent_bool',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

	$wp_customize->add_control( 'recent_section_title_control', array(
        'label'   		=> __('Change Title', 'formation'),
        'section' 		=> 'recent_posts_section_settings',
        'settings'   	=> 'homepage_recent_title',
        'type'   		=> 'text',
        'priority'	 	=> $priority++,
    ) );

    $wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'display_partners_section_control',
			array(
				'label'      	=> __('Hide Partners Section', 'formation'),
				'section'    	=> 'partners_section_settings',
				'settings'   	=> 'homepage_partners_bool',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

	$wp_customize->add_control( 'partners_section_title_control', array(
        'label'   		=> __('Change Title', 'formation'),
        'section' 		=> 'partners_section_settings',
        'settings'   	=> 'homepage_partners_title',
        'type'   		=> 'text',
        'priority'	 	=> $priority++,
    ) );


    $arraycount = count($list_partners_text_boxes);
	for ($row = 0; $row <  $arraycount; $row++) {

		$wp_customize->add_control(
		    new WP_Customize_Upload_Control(
		        $wp_customize,
		        'logo-' . $list_partners_text_boxes[$row][0] . '-file-upload',
		        array(
		            'label' 		=> __( 'Client logo File Upload', 'formation' ),
		            'section' 		=> 'logo_section_' . $list_partners_text_boxes[$row][0],
		            'settings' 		=> 'logo-' . $list_partners_text_boxes[$row][0] . '-file-upload',
		            'priority'	 	=> $priority++,
		        )
		    )
		);
		
		$wp_customize->add_control( 'logo_' . $list_partners_text_boxes[$row][0] . '_url', array(
				'label'    		=> __( 'Client logo url', 'formation' ),
				'section' 		=> 'logo_section_' . $list_partners_text_boxes[$row][0],
				'priority'	 	=> $priority++,
		));

	}

	$wp_customize->add_control( 'copyright_text_control', array(
        'label'   		=> __( "Change Copyright Text", 'formation'),
        'section' 		=> 'footer_settings',
        'settings'   	=> 'copyright_text',
        'type'   		=> 'text',
        'priority'	 	=> $priority++,
    ) );

    $wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'hide_copyright_control',
			array(
				'label'      	=> __('Hide Copyright Bar', 'formation'),
				'section'    	=> 'footer_settings',
				'settings'   	=> 'hide_copyright',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

    $wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'hide_footer_widgets_control',
			array(
				'label'      	=> __('Hide Footer Widgets', 'formation'),
				'section'    	=> 'footer_settings',
				'settings'   	=> 'hide_footer_widgets',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

	$wp_customize->add_control( 'authors_ids_control', array(
        'label'   		=> __( "Add User Id's", 'formation'),
        'section' 		=> 'authors_template_settings',
        'settings'   	=> 'authors_ids',
        'type'   		=> 'text',
        'priority'	 	=> $priority++,
    ) );

    $wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'authors_hide_content_control',
			array(
				'label'      	=> __('Hide Page Content', 'formation'),
				'section'    	=> 'authors_template_settings',
				'settings'   	=> 'authors_hide_content',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

	$wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'authors_content_below_control',
			array(
				'label'      	=> __('Display Content below User Profiles', 'formation'),
				'section'    	=> 'authors_template_settings',
				'settings'   	=> 'authors_content_below',
				'type'		 	=> 'checkbox',
				'priority'	 	=> $priority++,
			)
		)
	);

	/* 
	* //////////////////// Overrides ////////////////////////////
	*/

	$wp_customize->get_section( 'title_tagline' )->panel 			= 'formation_header_panel';
	$wp_customize->get_section( 'title_tagline' )->priority 		= 1;
	$wp_customize->get_section( 'header_image' )->panel 			= 'formation_header_panel';
	$wp_customize->get_section( 'header_image' )->priority 			= 4;
	$wp_customize->get_section( 'colors' )->panel 					= 'formation_header_panel';
	$wp_customize->get_section( 'colors' )->priority 				= 99;

	// Show instant changes for site title and description in the Theme Customizer.
	$wp_customize->get_setting( 'blogname' )->transport        		= 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport 		= 'postMessage';

	// Remove Default settings
	$wp_customize->remove_section('background_image');

}
add_action( 'customize_register', 'formation_register_theme_customizer' );


/**
 *  ////////////// SANITIZATION //////////////////////
 */

// Sanitize Text
function formation_sanitize_text( $input ) {
    return wp_kses_post( force_balance_tags( $input ) );
}
// Sanitize Textarea
function formation_sanitize_textarea($input) {
	global $allowedposttags;
	$output = wp_kses( $input, $allowedposttags);
	return $output;
}
// Sanitize Checkbox
function formation_sanitize_checkbox( $input ) {
	if( $input ):
		$output = '1';
	else:
		$output = false;
	endif;
	return $output;
}
// Sanitize Numbers
function formation_sanitize_integer( $input ) {
	$value = (int) $input; // Force the value into integer type.
    return ( 0 < $input ) ? $input : null;
}
function formation_sanitize_float( $input ) {
	return floatval( $input );
}

// Sanitize Uploads
function formation_sanitize_url($input){
	return esc_url_raw($input);	
}

// Sanitize Colors
function formation_sanitize_color($input){
	return maybe_hash_hex_color($input);
}