</div><!-- wrap-upper -->
	<div id='wrap-footer' class='clear' style='display: none;'>
		<?php if (!cs_var('slim')) { ?><div id="footer-right">
			<a target="_blank" href="https://bitbucket.org/ianamazi/yield/src/master/wp-content/themes/imperishable/?at=master">Imperishable</a><br />
			by <a target="_blank" href="https://docs.google.com/document/d/1qU01Chgtuqw160D6KIpicyhALkXWU14xWZY8s4XhQV8">Imran</a><br />
			in <a target="_blank" href="http://wordpress.org/" title="WordPress">WordPress</a>
			<?php CSWebparts::also(); ?>
		</div>
		<div id="footer-about" style="text-align: center;">
			<?php CSWebparts::notice(); ?>
			<?php CSWebparts::social(); ?>
		</div><!-- End .themeby .clear --><?php } ?>
		<?php CSWebparts::footer(); ?>
	</div><!-- End #wrap-footer -->
	<?php CSWebparts::info('body'); ?>
		<?php wp_footer(); ?>
	</body>
</html>
