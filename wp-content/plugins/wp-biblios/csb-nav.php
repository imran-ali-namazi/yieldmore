<?php
// Tells from the url what state its in / what is 
class WorkNav
{
	static function action_head()
	{
		wp_register_style('bibworks-css', cs_var('bib-base') . '/assets/works.css');
		wp_enqueue_style('bibworks-css');
		
		wp_register_script('bibworks-js', cs_var('bib-base') . '/assets/works.js', array('jquery'));
		wp_enqueue_script('bibworks-js');
		
		wp_register_script('bibquotes-js', cs_var('bib-base') . '/assets/quoter.js', array('jquery'));
		wp_enqueue_script('bibquotes-js');
		
		//if (!cs_work_get('hascontent')) return; 
		CSScripts::tabber();
	}

	static function admin($id = '', $what = 'config')
	{
		if ($what == 'work')
			return admin_url('post.php?post='.$id.'&action=edit');

		if ($what == 'config') $page = '&page=' . cs_var('bib-config-slug');

		if ($id != '') $id = '&id=' . $id;
		return admin_url('edit.php?post_type=work' . $page . $id);
	}

	static function post($id, $node = '', $page = '')
	{
		if ($node == 'search') return get_permalink($id);
		$qs = array();
		if ($node != '') $qs[] = 'node=' . $node;
		if ($page != '') $qs[] = 'pg=' . $page;
		if (isset($_GET['notabs'])) $qs[] = 'notabs=1';
		if (isset($_GET['in'])) $qs[] = 'in=1';
		$qs = count($qs) == 0 ? '' : '?' . implode('&', $qs);
		return get_permalink($id) . $qs;
	}

	static function termLink($t)
	{
		return sprintf('<a href="%s" title="%s">%s</a>',
				 get_term_link($t), $t->description, $t->name);
	}

	static function typeLink($t, $url = 0)
	{
		if (!$url) $url = WorkConfig::dirLink('url');
		return sprintf('<a href="%s?type=%s">%s</a> ',
				$url, WorkConfig::formatType($t, 'slug'), WorkConfig::formatType($t));
	}

	static function type()
	{
		if (!isset($_GET['type'])) return 0;
		$t = $_GET['type'];
		$types = WorkConfig::types('orig', 'slug'); // orig from slug
		return $types[$t];
	}

// These are getters from url
	static function nodeOrSearchOrQuoteOrAll()
	{
		return self::node() || self::search() || self::quote() || self::all();
	}

	static function node()
	{
		if (!isset($_GET['node'])) return 0;
		return $_GET['node'];
	}

	static function search()
	{
		if (!isset($_GET['find'])) return 0;
		return $_GET['find'];
	}

	static function quote()
	{
		if (!isset($_GET['quote'])) return 0;
		return $_GET['quote'];
	}

	static function all()
	{
		if (!isset($_GET['all'])) return 0;
		return $_GET['all'];
	}

	static function notabs()
	{
		$qs = $_SERVER['QUERY_STRING'];
		return './?' . (stripos($qs, 'notabs') === false ? $qs . '&notabs=1' : str_replace('&notabs=1', '', $qs));
	}
}

add_action('wp', array('WorkNav', 'action_head')); // if done in init, is_single returns false!
?>
