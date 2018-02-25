<?php
global $except;
global $siteAbout;
//http://html5doctor.com/understanding-aside/
//https://www.inboundnow.com/html5-semantic-elements-mean-seo/
?>
			<aside id="omnibar">
				<div class="wrap">
					<div class="toolbar">
						<span title="goto top" data-scroll=".site-branding">T</span>
						<span title="goto sidebar" data-scroll="#secondary">S</span>
						<span title="goto footer" data-scroll=".site-footer">B</span>
						<span title="goto find" data-focus=".search-form .search-field">F</span>
					</div>
					<p class="summary">
						We believe in a nobler and better life for all. Browse our content (see menu above or its highlights below).
						We have 3 programs:
							<b>Learn</b> (see <a href="/pact/" class="extra">People's Alliance for Children and Teachers</a>),
							<b>Heal</b> (see <a href="/heal/positive-thinking/" class="extra">School for Positive Thinking</a>) and
							<b>Share</b> (helping others - see <a href="/peaceworks/" class="extra">Peaceworks <i>for skills development</i></a>
								and <a href="/s" class="extra">SuperShare <i>for NGOs</i></a>).
					</p>
					<p class="summary">
							SEE <a href="/b" class="extra" target="_blank">BROCHURE</a>
							AND <a href="/wa-meet" class="extra" target="_blank">RSVP</a>
							FOR <a href="/i" class="extra" target="_blank">OUR LAUNCH - Sat, 10th Mar '18 at 10:30AM</a>
								IN <a href="/egmore" class="extra" target="_blank">Egmore, Chennai</a>.
					</p>
					<p class="customsearch">
						<?php CSWebParts::cse('Use GCSE search bar below to search all 10+sites (wordpress multisite) like learn, pact, moq etc, or '); ?>
					</p>
					<?php if (!$except) { ?><div class="highlights">
						Menu Highlight:
						<span title="previous highlight" data-action="prev">&lt;</span>
						<span title="pause/resume highlight ticker" data-action="pause" class="pause">||</span>
						<span title="next highlight" data-action="next">&gt;</span>
						<span title="all highlights" data-action="all" class="all">all menus</span><br />
						<span id="menu-highlights">[menu highlights]</span>
					</div><?php }
					if (isset($siteAbout[get_current_blog_id()])) { echo '<div class="about">' . $siteAbout[get_current_blog_id()] . '</div>'; } ?>
				</div><!-- .wrap -->
			</aside>
