<?php
add_action('login_byline', 'csb_login_head');

function csb_login_head()
{
	if (cs_get('action') !== 'register')
		echo '<large><b>NB:</b> If this is your first visit, you can <a href="wp-login.php?action=register">auto-register</a>.<large>';
}
?>
