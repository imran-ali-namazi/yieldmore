<?php

function formation_customize_register($wp_customize) {

	if (class_exists('WP_Customize_Control')) {

		class Customize_Number_Control extends WP_Customize_Control {

			public $type = 'number';
		 
			public function render_content() {
				?>
				<label>
				<span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
				<input type="number" min="1" name="quantity" <?php $this->link(); ?> value="<?php echo esc_textarea( $this->value() ); ?>" style="width:70px;">
				</label>
				<?php
			}
			
		}


	    class WP_Customize_Category_Control extends WP_Customize_Control {

	        public function render_content() {
	            $dropdown = wp_dropdown_categories(
	                array(
	                    'name'              => '_customize-dropdown-categories-' . $this->id,
	                    'echo'              => 0,
	                    'show_option_none'  => __( '&mdash; Select &mdash;', 'formation' ),
	                    'option_none_value' => '0',
	                    'selected'          => $this->value(),
	                )
	            );
	 
	            // Hackily add in the data link parameter.
	            $dropdown = str_replace( '<select', '<select ' . $this->get_link(), $dropdown );
	 
	            printf(
	                '<label class="customize-control-select"><span class="customize-control-title">%s</span> %s</label>',
	                $this->label,
	                $dropdown
	            );
	        }

	    }
	}
}
add_action( 'customize_register', 'formation_customize_register' );