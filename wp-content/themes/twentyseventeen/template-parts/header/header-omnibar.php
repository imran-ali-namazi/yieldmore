<?php
global $except;
global $siteAbout;
//http://html5doctor.com/understanding-aside/
//https://www.inboundnow.com/html5-semantic-elements-mean-seo/
?>
			<!--googleoff: all-->
			<div class="toolbar">
				<span class="icon-toolbar icon-up" title="toolbar"></span>
				<span class="icon-top" title="top" data-scroll=".site-branding"></span>
				<span class="icon-side" title="sidebar" data-scroll="#secondary"></span>
				<span class="icon-bottom" title="bottom" data-scroll=".site-footer"></span>
				<span class="icon-cse" title="google custom search" data-show="#omnibar" data-focus=".gsc-input"></span>
				<span class="icon-search" title="search" data-focus=".search-form .search-field"></span>
				<span class="icon-omnibar" title="toggle omnibar" data-scroll=".site-branding" data-toggle="#omnibar"></span>
				<span class="icon-help" title="help"></span>
			</div>
			<aside id="omnibar" style="display: none;">
				<div class="wrap">
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
							AND <a href="/meet" class="extra" target="_blank">Join us on Hangouts</a> on Sun Mar 25th at 3:30 PM IST.
							See our <a href="/l" class="extra" target="_blank">Intro PPT</a>
								OR <a href="/exposition" class="extra" target="_blank">Launch Presentation</a>.
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
			<!--googleon: all-->
