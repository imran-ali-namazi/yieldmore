<?php
_nl('<h2 class="widget-title">' . get_the_title() . '</h2>' , 1);
if (is_page()) return; //this search only for works
if (get_post_type($id) == 'post') { _nl('', 1); return; } // TODO: add search to post
$auth = cs_work_get('author');
if ($auth != null) _nl('by ' . WorkNav::termLink($auth), 1);
_nl('<b>Type</b>: ' . WorkNav::typeLink(cs_work_read($id, 'type')));
$sub = cs_work_get('subtype');
if ($sub) _nl(' -> ' . $sub, 1); else _nl('', 1);
?>
			<div class="find work">
				<form method="get" class="searchform" action="<?php echo WorkNav::post($id, 'search'); ?>">
					<div>
						<label class="screen-reader-text" for="find"><?php _e('Find: ', 'desaindigital') ?></label><br>
						<input value="<?php echo isset($_GET['find']) ? $_GET['find'] : ''; ?>" name="find" class="s" type="text"/><br>
						<input class="searchsubmit" value="<?php esc_attr_e( 'Search', 'desaindigital'); ?>" type="submit"/>
					</div>
				</form>
			</div><!-- End .find -->
