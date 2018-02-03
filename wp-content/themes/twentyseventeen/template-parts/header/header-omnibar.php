<?php
global $except;
global $siteAbout;
?>
			<div id="omnibar">
				<div class="wrap">
					<div class="toolbar">
						<span title="goto top" data-scroll=".site-branding">T</span>
						<span title="goto sidebar" data-scroll="#secondary">S</span>
						<span title="goto footer" data-scroll=".site-footer">B</span>
						<span title="goto find" data-focus=".search-form .search-field">F</span>
					</div>
					<?php if (!$except) { ?><div class="highlights">
						<span title="previous highlight" data-action="prev">&lt;</span>
						<span title="pause/resume highlight ticker" data-action="pause" class="pause">||</span>
						<span title="next highlight" data-action="next">&gt;</span>
						<span title="all highlights" data-action="all" class="all">&pi;</span>
						<span id="menu-highlights">[menu highlights]</span>
					</div><?php }
					if (isset($siteAbout[get_current_blog_id()])) { echo '<div class="about">' . $siteAbout[get_current_blog_id()] . '</div>'; } ?>
				</div><!-- .wrap -->
			</div><!-- .navigation-top -->
