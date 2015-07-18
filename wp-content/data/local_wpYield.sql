update wp_options set option_value = 'http://yield' where option_name in ('siteurl', 'home');
update wp_2_options set option_value = 'http://e-yield' where option_name in ('siteurl', 'home');
update wp_3_options set option_value = 'http://l-yield' where option_name in ('siteurl', 'home');

update wp_blogs set domain = 'yield' where domain = 'yieldmore.org';
update wp_blogs set domain = 'e-yield' where domain = 'english.yieldmore.org';
update wp_blogs set domain = 'l-yield' where domain = 'learn.yieldmore.org';

update wp_users set user_pass = md5('sicilian')
$P$Bqg52eneQLtG9ID1URq/TlQZ.njtGg.