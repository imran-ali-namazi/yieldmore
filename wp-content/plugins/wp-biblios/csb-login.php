<?php
add_action('login_byline', 'csb_login_head');

function csb_login_head()
{
	if (cs_get('action') === 'register') return;
	$sub = $_SERVER['HTTP_HOST'] == 'yieldmore.org' ? '' : ' You then need to contact <a href="mailto:Imran@cselian.com?subject=YieldMore Subsite Registration">Imran</a> to get permissions on this sub site.';
	echo '<large><b>NB:</b> If this is your first visit, you can <a href="http://yieldmore.org/wp-login.php?action=register">auto-register</a>.'.$sub.'.<large>';
}
?>
