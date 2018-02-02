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
    // Caption Url Description
    1 => ['YieldMore.org', '', 'a content portal for life philosophy', [
        -1 => ['Movements', 'movements/', 'such as Sharing Love, Spreading Harmony and World Unity, Nation Building, Loving Nature, Environment'],
        -2 => ['Ventures', 'about/?node=ventures', 'such as Peoples Alliance for Children and Teachers, Peaceworks etc'],
        -3 => ['News', 'news/', 'random bits of news from the internet'],
        -4 => ['Forwards', 'forwards/', 'forwards worth keeping. Send in your stuff!'],
        -5 => ['Newsletter', 'newsletter/', 'a soon-to-be-restarted periodical'],
        -6 => ['Quotes', 'quotes/', 'selections by wellwishers, shows randomly'],
        -7 => ['Songs', 'songs/', 'the best 15 songs in the world!'],
      ]],
    9 => ['Express YM', 'express/', '', [
        -1 => ['Speak (old)', 'speak/', ''],
         2 => ['Curate YM', 'curate/', ''],
        -2 => ['Imran', 'speak/imran/', ''],
        -6 => ['Swan (Imran)', 'swan', ''],
        -3 => ['Publish (IViewer Web)', 'http://media.yieldmore.org/sanskrit/gita/', ''],
        -4 => ['Songs', 'curate/songs/', ''],
        -5 => ['Movies', 'curate/movies/', ''],
      ]],
    -5 => ['Ideas YM', 'ideas/', '', [
        -1 => ['Works (Biblios)', 'works/', ''],
        -2 => ['Entheos', 'topics/religion/', ''],
       -21 => ['Overman Foundation', 'http://overmanfoundation.org/', ''],
        11 => ['Saiva Siddhanthan', 'saiva-siddanthan/', ''],
        -3 => ['Samata Books', 'http://samatabooks.in', ''],
        -4 => ['Peter Russel', 'http://peterrussell.com', ''],
         6 => ['Metaphysics of Quality', 'moq/', ''],
        -5 => ['St Johns Lutheran Church', 'http://www.sjlchurch.org/sermons', ''],
        -5 => ['A living Christ [Raymond Karczewski]', 'https://www.youtube.com/user/RaymondKarczewski/videos', ''],
      ]],
    3 => ['Learn YM', 'learn/', '', [
         8 => ['PACT', 'pact/', ''],
       -13 => ['Enactus', 'http://enactus.org', ''],
         7 => ['PeaceWorks', 'peaceworks/', ''],
       -11 => ['Love for Life (Kindom)', 'http://loveforlife.com.au/', ''],
       -12 => ['Kindom Intro', 'https://www.youtube.com/watch?v=7SspPm9wRgo', ''],
        -1 => ['English', 'e', ''],
        -2 => ['Web and Marketing', 's', ''],
        -3 => ['Journal of School Social Work', 'http://sites.yieldmore.org/jssw/', ''],
        -4 => ['Build India Group', 'http://buildindiagroup.org', ''],
        -5 => ['The Compass Team', 'http://thecompassteam.in', ''],
        -6 => ['IONS', 'http://noetic.org', ''],
        -7 => ['SeaMovement.org', 'http://seamovement.org/', ''],
        //-3 => ['PW/E', 'pages/ventures/'],
      ]],
    4 => ['Heal YM', 'heal/', '', [
       -11 => ['Breath', 'breath', ''],
       -12 => ['Chakras (Energy Centres) Info and App', 'chakras', ''],
        -1 => ['Spirit of the Earth', 'heal/orgs/spirit-of-the-earth', ''],
        -2 => ['Siva Shantha Mother and Child Hospital', 'http://sivashanthahealthcare.org', ''],
        -3 => ['Saluto Wellness India', 'http://salutowellness.com', ''],
        -4 => ['Dr VSN Geriatric Foundation', 'http://drvsngeriatricfoundation.com', ''],
        -5 => ['National Alliance on Health', 'https://nationalalliancehealth.org', ''],
      ]],
    5 => ['Share YM', 'share/', '', [
        -1 => ['Ammai Appar Agam', 'help/ngos/3a/', ''],
        -2 => ['Satyam Yoga Trust', 'http://satyamyogatrust.net', ''],
        -3 => ['AIM For Seva', 'share/ngos/aim-for-seva/', ''],
        -4 => ['Spanda Foundation', 'http://spanda.org', ''],
        -5 => ['SHARE India', 'http://shareindia.org', ''],
        -6 => ['Good Country', 'http://goodcountry.org', ''],
        -7 => ['Blood Cancer Donor Registry', 'share/ngos/jeevan/', ''],
        -8 => ['Dr John Joseph Foundation', 'http://drjohnjosephfoundation.org', ''],
        -9 => ['Jobs for Dyslexics', 'http://jobsfordyslexics.org', ''],
      ]],
    -7 => ['About', 'about/', '', [
        -1 => ['Ventures and Offerings', 'about/?node=ventures', ''],
        -2 => ['Splash Popup', 'about/#splash" class="splash-link', ''],
        -3 => ['Sitemap', '?o=1', ''],
        -4 => ['Short Links', 'r', ''],
        -5 => ['YouTube', 'yt', ''],
       -51 => ['YouTube (Curated)', 'ytc', ''],
        -6 => ['Google', 'google', ''],
        -7 => ['Twitter', 'twitter', ''],
       -71 => ['Twitter (Learn)', 'twitter-learn', ''],
        -8 => ['Meetings [Hangouts]', 'meet', ''],
        -9 => ['Directory', 'directory/', ''],
      ]],
  ];

  $r = '<div class="menu-topmenu-container"><ul id="top-menu" class="menu">';

  $fmt = '  <li id="menu-item-%s" class="menu-item menu-item-type-taxonomy menu-item-object-category %s%smenu-item-%s"><a href="%s"%s%s>%s%s</a>';
  $down = '<svg class="icon icon-angle-down" aria-hidden="true" role="img"> <use href="#icon-angle-down" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-angle-down"></use></svg>';
  $hl = ' data-highlight="%s"';

  foreach ($sites as $i=>$s) {
    $r .= sprintf($fmt, $i, $i == $id ? 'current-menu-item ' : '', isset($s[3]) ? 'menu-item-has-children ' : '', $i, (strpos($s[1], 'http') === false ? 'http://yieldmore.org/' : '') . $s[1], strpos($s[1], 'http') !== false ? ' target="_blank"' : '', $s[2] !== '' ? sprintf($hl, $s[2]) : '', $s[0], isset($s[2]) ? $down : '');
    if (isset($s[3])) {
      $r .= PHP_EOL . '  <ul class="sub-menu">';
      foreach ($s[3] as $j=>$t) {
          $r .= sprintf('  ' . $fmt . '</li>', $j, $j == $id ? 'current-menu-item ' : '', '', $j, (strpos($t[1], 'http') === false ? 'http://yieldmore.org/' : '') . $t[1] , strpos($t[1], 'http') !== false ? ' target="_blank"' : '', $t[2] !== '' ? sprintf($hl, $t[2]) : '', $t[0], '');
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