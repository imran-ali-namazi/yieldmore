<?php
include_once 'csa-base.php';
class CSAdminMultisite extends CSAdminBase
{
	public $sites = array();
	public $env;

	private $all;
	private $unused = array();
	private $allThemes;
	private $unusedThemes = array();
	
	function __construct()
	{
		CSScripts::admin();

		$keys = array_keys($this->all = get_plugins());
		foreach ($keys as $key)
			$this->unused[$key] = $key;

		$keys = array_keys($this->allThemes = get_themes());
		foreach ($keys as $key)
			$this->unusedThemes[$key] = $key;
		
		$this->readEnv();
		$this->readConfig();
	}
	
	function readEnv()
	{
		$site = $_SERVER['HTTP_HOST'];
		$envsFol = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'envs';
		$envs = scandir($envsFol);
		foreach ($envs as $e)
		{
			if ($e == '.' || $e == '..') continue;
			$env = include $envsFol . DIRECTORY_SEPARATOR . $e;
			if (!isset($env['sites'][$site])) continue;
			$this->env = $env;
		}
	}
	
	function readConfig()
	{
		global $wpdb;
		$env = $this->env;
		foreach ($env['sites'] as $url => $dbname)
		{
			if (is_array($dbname)) { $pfx = $dbname[1]; $dbname = $dbname[0]; } else $pfx = 'wp';
			$sql = sprintf("select option_value from `%s%s`.%s_options where option_name = '%s'", 
				$env['prefix'], $dbname, $pfx, '%s');
			
			$plugins = $wpdb->get_results(sprintf($sql, 'active_plugins'));
			$plugins = unserialize($plugins[0]->option_value);
			$this->remove_used($plugins);
			
			$theme = $wpdb->get_results(sprintf($sql, 'current_theme'));
			$theme = $theme[0]->option_value;
			if (isset($unusedThemes[$theme])) unset($unusedThemes[$theme]);

			$this->sites[] = array('url' => $url, 'db' => $dbname, 
				'plugins' => $this->show($plugins), 'theme' => $theme);
		}
	}
	
	private function remove_used($ofSite)
	{
		foreach ($ofSite as $ix=>$key)
			if (isset($this->unused[$key])) unset($this->unused[$key]);
	}
	
	function show($list)
	{
		$all = $this->all;
		if ($list == 'unused') $list = $this->unused;
		else if ($list == 'unusedThemes') { $list = $this->unusedThemes; $all = $this->allThemes; }
		$r = '';
		foreach ($list as $value)
		{
			if (!isset($all[$value])) $r .= $value;
			else $r .= sprintf('	<a href="/#%s">%s</a>', $value, $all[$value]['Name']);
			$r .= '<br/>' . PHP_EOL;
		}
		return $r;
	}
}
$ms = new CSAdminMultisite();
if ($ms->error != null) return;
?>
<div class="postbox-container">
	<div class="postbox opened">
<?php
_nl('<div class="pb-side" style="text-align: left;">');
$ms->head('Unused');
_nl('<b>Plugins</b>', 1);
echo $ms->show('unused');
_nl('<br/><b>Themes</b>', 1);
echo $ms->show('unusedThemes');
_nl('</div>');

_nl('<h2>Sites: ' . $ms->env['name'] . '</h2>');
echo '<table border="1">';
$fmt = '<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>
';
$th = str_replace('<td', '<th', str_replace('</td>', '</th>', $fmt));
echo sprintf($th, 'Site', 'DB', 'Plugins', 'Theme');
foreach ($ms->sites as $site)
	echo sprintf($fmt, $site['url'], $site['db'], $site['plugins'], $site['theme']);
echo '</table>';
?>
	</div>
</div>
