<?php
include_once 'csa-base.php';
class CSAdminClean extends CSAdminBase
{
	function __construct()
	{
		CSAScripts::admin();
		$this->slug = CSAdmin::$cleanDBSlug;

		if ($this->isAction('transients')) $this->removeTransients();
	}

	function removeTransients()
	{
		global $wpdb;
		if (!is_multisite()) {
			$wpdb->query( "DELETE FROM `{$wpdb->prefix}options` WHERE `option_name` LIKE ('_transient_%')" );
			return;
		}

		$sites = $wpdb->get_results( "SELECT * FROM $wpdb->blogs" );

		if (!$sites) return;
		foreach ($sites as $site) {
			$wpdb->set_blog_id( $site->blog_id );
			$wpdb->query( "DELETE FROM `{$wpdb->prefix}options` WHERE `option_name` LIKE ('_transient_%')" );
		}
	}

	function showTransients()
	{
		global $wpdb;
		if (!is_multisite()) {
			echo $this->get_size($wpdb);
			return;
		}

		$sites = $wpdb->get_results( "SELECT * FROM $wpdb->blogs" );

		if (!$sites) return;
		foreach ($sites as $site) {
			$wpdb->set_blog_id( $site->blog_id );
			echo $site->domain . ' ' . $this->get_size($wpdb) . '<br/>';
		}
	}

	function get_size($wpdb)
	{
		$size = $wpdb->get_results( "select count(*) as count, Round(Sum(option_value)) as size from `{$wpdb->prefix}options` WHERE `option_name` LIKE ('_transient_%')" );
		$size = $size[0];
		return 'Count: ' . $size->count .', Size: ' . $size->count;
	}
}
?>
<div class="postbox-container">
	<div class="postbox opened">
<?php
$cl = new CSAdminClean();
$cl->head('DB Transients');
$cl->form('transients');
$cl->showTransients();
_nl('', 1); _nl('', 1);
_nl(CHtml::submitButton('Clean DB'));
_nl(CHtml::endForm());
?>
	</div>
</div>
