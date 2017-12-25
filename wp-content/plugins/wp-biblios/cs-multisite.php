<?php
function cs_has_nav_menu($has_nav_menu, $location) {
  //echo 'DEBUGING:' . $location;
  if (true || $location === 'top') //die('poda');
    $has_nav_menu = true;
  return $has_nav_menu;
}

add_filter('has_nav_menu', 'cs_has_nav_menu');

function cs_pre_wp_nav_menu($args) {
  $id = get_current_blog_id();
  //if ($id == 6) return $args;
  $sites = [
    1 => ['YieldMore.org', '', [
        -2 => ['Movements', 'movements/'],
        -3 => ['Ventures', 'pages/ventures/'],
        -4 => ['Entheos', 'topics/religion/'],
        -5 => ['Songs', 'songs/'],
      ]],
    -4 => ['Express YM', 'speak/', [
        //-1 => ['Ideas', '/ideas'],
        2 => ['Curate YM', 'curate/'],
        -1 => ['Publish (IViewer Web)', 'http://media.yieldmore.org/sanskrit/gita/'],
        -3 => ['Songs', 'curate/songs/'],
        -4 => ['Movies', 'curate/movies/'],
        -5 => ['Samata Books', 'http://samatabooks.in/'],
      ]],
    3 => ['Learn YM', 'learn/', [
        8 => ['PACT', 'pact/'],
        7 => ['PeaceWorks', 'peaceworks/'],
        6 => ['MOQ', 'moq/'],
        //-3 => ['PW/E', 'pages/ventures/'],
        //-4 => ['Electronics', 'electronics'],
        //-5 => ['Programming', 'programming'],
      ]],
    4 => ['Heal YM', 'heal/'],
    5 => ['Help YM', 'help/', [
        10 => ['Share', 'share/'],
        -1 => ['Ammai Appar Agam', 'help/ngos/3a/'],
    ]],
  ];

  $r = '<div class="menu-topmenu-container"><ul id="top-menu" class="menu">';
  $fmt = '  <li id="menu-item-%s" class="menu-item menu-item-type-taxonomy menu-item-object-category %s%smenu-item-%s"><a href="%s">%s%s</a>';
  $down = '<svg class="icon icon-angle-down" aria-hidden="true" role="img"> <use href="#icon-angle-down" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-angle-down"></use></svg>';
  foreach ($sites as $i=>$s) {
    $r .= sprintf($fmt, $i, $i == $id ? 'current-menu-item ' : '', isset($s[2]) ? 'menu-item-has-children ' : '', $i, (strpos($s[1], 'http') === false ? 'http://yieldmore.org/' : '') . $s[1], $s[0], isset($s[2]) ? $down : '');
    if (isset($s[2])) {
      $r .= PHP_EOL . '  <ul class="sub-menu">';
      foreach ($s[2] as $j=>$t) {
          $r .= sprintf('  ' . $fmt . '</li>', $j, $j == $id ? 'current-menu-item ' : '', '', $j, (strpos($t[1], 'http') === false ? 'http://yieldmore.org/' : '') . $t[1] , $t[0], '');
      }
      $r .= '  </ul>' . PHP_EOL . '  </li>';
    } else {
      $r .= '</li>' . PHP_EOL;
    }
  }
  $r .= '</ul></div>';
  return $r;
}

add_filter('pre_wp_nav_menu', 'cs_pre_wp_nav_menu');

?>