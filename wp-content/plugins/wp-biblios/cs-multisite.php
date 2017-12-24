<?php
function cs_has_nav_menu($has_nav_menu, $location) {
  //echo 'DEBUGING:' . $location;
  if (true || $location === 'top') //die('poda');
    $has_nav_menu = true;
  return $has_nav_menu;
}

add_filter('has_nav_menu', 'cs_has_nav_menu');

function cs_pre_wp_nav_menu($args) {
  //print_r($args); die();
  if (true || is_multisite() && $args['menu'] === 'top')
  {
    $id = get_current_blog_id();
    $sites = array(
      1 => ['YieldMore.org', ''],
      2 => ['Curate YM', 'curate'],
      3 => ['Learn YM', 'learn'],
      4 => ['Heal YM', 'heal'],
      5 => ['Help YM', 'help'],
    );
    $r = '<div class="menu-topmenu-container"><ul id="top-menu" class="menu">';
    foreach ($sites as $i=>$s) {
      $r .= sprintf('<li id="menu-item-%s" class="menu-item menu-item-type-taxonomy menu-item-object-category %smenu-item-has-children menu-item-%s"><a href="http://yieldmore.org/%s">%s</a></li>',
        $i, $i == $id ? 'current-menu-item ' : '', $i, $s[1], $s[0]);
    }
    $r .= '</ul></div>';
    return $r;
  }
  return $args;
}

add_filter('pre_wp_nav_menu', 'cs_pre_wp_nav_menu');

?>