<?php
add_action('login_byline', 'csb_login_head');

function csb_login_head()
{
	if (cs_get('action') === 'register') return;
	echo '<large><b>NB:</b> If this is your first visit, you can <a href="' . wp_registration_url() . '">register</a><large>';
}
?>
