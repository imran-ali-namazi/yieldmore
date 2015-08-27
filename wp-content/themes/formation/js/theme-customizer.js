/**

 * Theme Customizer enhancements for a better user experience.

 *

 * Contains handlers to make Theme Customizer preview reload changes asynchronously.

 */



( function( $ ) {

	wp.customize( 'blogname', function( value ) {

		value.bind( function( to ) {

			$( '.site-title a' ).html( to );

		} );

	} );

	wp.customize( 'blogdescription', function( value ) {

		value.bind( function( to ) {

			$( '.site-description' ).html( to );

		} );

	} );


	wp.customize( 'blogdescription', function( value ) {

		value.bind( function( to ) {

			$( '.site-description' ).html( to );

		} );

	} );


	wp.customize( 'copyright_text', function( value ) {

		value.bind( function( to ) {

			$( '.site-info p' ).html( to );

		} );

	} );

	wp.customize( 'featured_textbox', function( value ) {

		value.bind( function( to ) {

			$( '.featuretext_top h3' ).html( to );

		} );

	} );

	wp.customize( 'featured_button_txt', function( value ) {

		value.bind( function( to ) {

			$( '.featuretext_button a' ).html( to );

		} );

	} );

	wp.customize( 'featured_textbox_header_one', function( value ) {

		value.bind( function( to ) {

			$( '.box-1 .featuretext h3 a' ).html( to );

		} );

	} );

	wp.customize( 'featured_textbox_header_two', function( value ) {

		value.bind( function( to ) {

			$( '.box-2 .featuretext h3 a' ).html( to );

		} );

	} );

	wp.customize( 'featured_textbox_header_three', function( value ) {

		value.bind( function( to ) {

			$( '.box-3 .featuretext h3 a' ).html( to );

		} );

	} );

	wp.customize( 'featured_textbox_text_one', function( value ) {

		value.bind( function( to ) {

			$( '.box-1 .featuretext p' ).html( to );

		} );

	} );

	wp.customize( 'featured_textbox_text_two', function( value ) {

		value.bind( function( to ) {

			$( '.box-2 .featuretext p' ).html( to );

		} );

	} );

	wp.customize( 'featured_textbox_text_three', function( value ) {

		value.bind( function( to ) {

			$( '.box-3 .featuretext p' ).html( to );

		} );

	} );


	wp.customize( 'testimonials_title', function( value ) {

		value.bind( function( to ) {

			$( '.testimonial_home h3' ).html( to );

		} );

	} );

	wp.customize( 'homepage_recent_title', function( value ) {

		value.bind( function( to ) {

			$( '.section_thumbnails h3' ).html( to );

		} );

	} );

	wp.customize( 'homepage_partners_title', function( value ) {

		value.bind( function( to ) {

			$( '.client h3' ).html( to );

		} );

	} );

	wp.customize( 'formation_custom_main_color', function( value ) {

		value.bind( function( to ) {

			$( 
				'.flex-caption-title,.thumbs-more-link a,.more-link,.grid-more-link,#smoothup:hover,.reply,.featuretext_button a,.tagcloud a:hover' 
			).css( 'background-color', to );

			$( 
				'.main-navigation li:hover > a,.main-navigation li.current_page_item a,.main-navigation li.current-menu-item a,.main-navigation li.current_page_ancestor a,.main-navigation > li > a,.main-small-navigation li:hover > a,.main-small-navigation li.current_page_item a,.main-small-navigation li.current-menu-item a,.main-small-navigation ul ul a:hover,.entry-meta a,.socialIcons a,.social-media a:hover,.socialIcons a:visited,.authorLinks a,.entry-content a,.entry-content a:visited,.entry-summary a,.entry-summary a:visited' 
			).css( 'color', to );

			$( 
				'.main-navigation li:hover > a,.main-navigation li.current_page_item a,.main-navigation li.current-menu-item a,.main-navigation > li > a,.main-navigation li.current_page_ancestor > a,.main-navigation ul ul,.widget-title,.featuretext_middle,.tagcloud a' 
			).css( 'border-color', to);

			$(
				'.entry-content a.more-link, .entry-content a.more-link:visited'
			).css( 'color', '#fff' );
			
		} );

	} );



} )( jQuery );