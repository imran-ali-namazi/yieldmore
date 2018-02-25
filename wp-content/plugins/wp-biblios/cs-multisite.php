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
    9 => ['Express YM', 'express/', 'an invitation to people to come share their thoughts (articles / videos)', [
        -1 => ['Speak (old)', 'speak/', 'old channel with videos from Hans Wilhelm / Jay Lakhani'],
         2 => ['Curate YM', 'curate/', 'books, songs, movies, cartoons etc'],
        -2 => ['Imran', 'speak/imran/', 'articles from YM founder Imran'],
        -6 => ['Swan (Imran)', 'incubate/essays-to-a-swan/', 'Imran\' older prose and poetry'],
        -3 => ['Publish (IViewer Web)', 'http://media.yieldmore.org/sanskrit/gita/', 'a site for playing (devotional) mp3s with transcripts'],
        -4 => ['Songs', 'curate/songs/', 'curated songs - includes list (school) of 150 songs for children and people of all ages'],
        -5 => ['Movies', 'curate/movies/', 'some of our most loved movies'],
        -7 => ['Movies (Excel)', 'movies-doc', 'a Google Document listing our favourite 150 movies (now has a separate sheet for kids)'],
      ]],
    -5 => ['Ideas YM', 'ideas/', 'a place for ideas in religion, metaphysics and philosophy', [
        -1 => ['Works (Biblios)', 'works/', 'some books and poems published (essays on the gita, savitri etc)'],
        -2 => ['Entheos', 'topics/religion/', 'a platform for religious discussion and harmony'],
        11 => ['Saiva Siddhanthan', 'saiva-siddanthan/', 'a user site for the south Indian variant of Hinduism'],
         6 => ['Metaphysics of Quality', 'moq/', 'a user site for Robers Pirsig\'s MOQ'],
       -21 => ['Overman Foundation', 'http://overmanfoundation.org/', 'a site run from Calcutta to spread Sri Aurobindo\'s Integral Yoga'],
        -3 => ['Samata Books', 'http://samatabooks.in', 'a bookstore selling books on philosophy and religion'],
        -4 => ['Peter Russel', 'http://peterrussell.com', "a septuagenarian teacher of 'effortless meditation'"],
        -5 => ['St Johns Lutheran Church', 'http://www.sjlchurch.org/sermons', ''],
        -6 => ['Raymond Karczewski', 'https://www.youtube.com/user/RaymondKarczewski/videos', 'Videos about this wonderful world from an 80 year old living Christ'],
      ]],
    3 => ['Learn YM', 'learn/', 'the Learn / Education Chapter of YieldMore.org', [
         8 => ['PACT (Education Forum)', 'pact/', 'dubbed People\'s Alliance for Children and Teachers'],
         7 => ['PeaceWorks (Skills Development)', 'peaceworks/', 'a guiding, teaching mentoring program that will someday include the \'YieldMore Advantage\' which will develop from the School of Positive Thinking'],
         ///here we were
        -1 => ['English Tutoring', 'peaceworks/services/english/', 'personalised english Tutoring (part of Peaceworks)'],
        -2 => ['Web and Marketing (Service)', 'peaceworks/services/supershare/', 'making websites and digital marketing (guiding and helping freely / doing as a paid service)'],
        -3 => ['Journal of School Social Work', 'jssw/', ''],
        -4 => ['Build India Group', 'http://buildindiagroup.org', '#Ecothought, Campaigners, Thinkers and Agents of Change for Indians and the Whole World'],
        -5 => ['The Compass Team', 'http://thecompassteam.in', ''],
        -6 => ['IONS', 'http://noetic.org', "furthering research into consciousness - <a href='https://www.youtube.com/watch?v=NOVMb5t3HyQ' target='_blank' class='extra'>'the science of interconnectedness'</a>"],
        -7 => ['SeaMovement.org', 'http://seamovement.org/', ''],
       -13 => ['Enactus', 'http://enactus.org', ''],
       -11 => ['Love for Life (Kindom)', 'http://loveforlife.com.au/', ''],
       -12 => ['Kindom Intro', 'https://www.youtube.com/watch?v=7SspPm9wRgo', 'by Arthur & Fiona Cristian, Kindom is all about practising how to live as free men and women, weaning our thoughts and habits away from "The System". This video includes talk on raw food, gardening, self-sufficiency, etc'],
        //-3 => ['PW/E', 'pages/ventures/'],
      ]],
    4 => ['Heal YM', 'heal/', 'the Heal (body/mind/relationships/warring social factions) Chapter of YieldMore.org', [
       -11 => ['Breath', 'practices/yoga/?node=breath', 'Simple breathing techniques that will revitalize and calm you'],
       -12 => ['Chakras', 'practices/meditation/?node=chakras', 'Energy Centres in the body (see /chakras-app)'],
        -1 => ['Spirit of the Earth', 'heal/orgs/spirit-of-the-earth', 'a line of organic food products by the Trust of Sw. Dayananda Saraswathi\'s'],
        -2 => ['Siva Shantha Mother and Child Hospital', 'http://sivashanthahealthcare.org', 'a hospital in Coimbatore, South India run by the Trust of Sw. Shantanand Saraswathi'],
        -3 => ['Saluto Wellness India', 'http://salutowellness.com', 'A holistic wellness aggregator in India that supports us'],
        -4 => ['Dr VSN Geriatric Foundation', 'http://drvsngeriatricfoundation.com', 'a foundation in Chennai'],
        -5 => ['National Alliance on Health', 'https://nationalalliancehealth.org', 'an American not-for-profit that we support'],
        -6 => ['Tiffany Tee World', 'http://tiffanyteeworld.com/', 'Conscious Awareness Innovator/Speaker, trying to Help Raise Vibrational Frequencies In The World'],
      ]],
    5 => ['Share YM', 'share/', 'the Share Chapter of YieldMore.org helping people and not-for-profits', [
        12 => ['Journals of Social Work', 'jsw/', "a YM (collaborative / reposting / promoting) approach to <a href='https://en.wikipedia.org/wiki/Social_work' target='_blank' class='extra'>Social Work</a> and it's Journals"],
        -1 => ['SHARE India', 'http://shareindia.org', 'An NGO that empowers women and children, esp the ones with Learning Disabilities'],
        -2 => ['Satyam Yoga Trust', 'http://satyamyogatrust.net', 'Offering education and yoga teaching, run by teachers of Bihar School of Yoga, Munger'],
        -3 => ['Spanda Foundation', 'http://spanda.org', 'An NGO in the Hague that catalyses long-term systemmic change'],
        -4 => ['Good Country', 'http://goodcountry.org', 'An idea that the world\'s problems need long term united action'],
        -5 => ['Jobs for Dyslexics', 'http://jobsfordyslexics.org', 'An American NGO that helps adult dyslexics find jobs'],
        -6 => ['Blood Cancer Donor Registry', 'share/ngos/jeevan/', ''],
        -7 => ['Dr John Joseph Foundation', 'http://drjohnjosephfoundation.org', ''],
        -8 => ['AIM For Seva', 'share/ngos/aim-for-seva/', ''],
        -9 => ['Ammai Appar Agam', 'help/ngos/3a/', 'An NGO that plans to run a orphanage cum old-age home in Thiruvannamalai with Saiva Siddhanta as its core teaching'],
       -10 => ['Parikrma Humanity Foundation', 'http://parikrmahumanityfoundation.org', 'parikrma (meaning circle) support children from age 5 until they are an active and contributing member of society'],
      ]],
    -7 => ['About', 'about/', 'The over-crafted about page that describes YieldMore\'s vision and objectives', [
        -1 => ['Ventures and Offerings', 'about/?node=ventures', 'All our ventures and ideas'],
       -11 => ['All Our Menus (Highlights)', 'about/#highlights" class="highlights-link', 'All 40 of our menus expanded with a description of each - new Omnibar feature'],
        -2 => ['Splash Popup', 'about/#splash" class="splash-link', 'a basic intro to our site available on logo click in the header'],
        -3 => ['Sitemap', '?o=1', 'a list of all the links on our site'],
        -4 => ['Short Links', 'r', 'all the short links (like yieldmore.org/swan will take you to Imran\s poetry)'],
        -5 => ['YouTube', 'yt', 'Our Youtube Channel with videos from us / people supporting us'],
       -51 => ['YouTube (Curated)', 'ytc', 'Our Youtube Channel for curated content'],
        -6 => ['Google Group', 'google', 'The Google Group Forum for discussion and newsletters / updates'],
        -7 => ['Twitter', 'twitter', 'Our twitter account, for daily updates and links back to content'],
       -71 => ['Twitter (Learn)', 'twitter-learn', 'Our LearnYMO twitter account run by Rani, a special educator in support of /pact/'],
        -8 => ['Meetings [Hangouts]', 'meet', 'A place for meetings on Hangouts (usually the last Sunday of the Month at 3:30pm IST)'],
        -9 => ['Directory', 'directory/', "a directory of people with a link at the bottom to the <a href='http://yieldmore.org/dir' target='_blank' class='extra'>google folder</a> of people and ideas / flyers"],
      ]],
  ];

  $r = '<div class="menu-topmenu-container"><ul id="top-menu" class="menu">';

  $fmt = '  <li id="menu-item-%s" class="menu-item menu-item-type-taxonomy menu-item-object-category %s%smenu-item-%s"><a href="%s"%s%s>%s%s</a>';
  $down = '<svg class="icon icon-angle-down" aria-hidden="true" role="img"> <use href="#icon-angle-down" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-angle-down"></use></svg>';
  $hl = ' data-highlight="%s"';

  foreach ($sites as $i=>$s) {
    $r .= sprintf($fmt, $i, $i == $id ? 'current-menu-item ' : '', isset($s[3]) ? 'menu-item-has-children ' : '', $i, (strpos($s[1], 'http') === false ? 'http://yieldmore.org/' : '') . $s[1], (strpos($s[1], 'http') !== false || strpos($s[1], '/') === false) && $s[1] !== ''? ' target="_blank"' : '', $s[2] !== '' ? sprintf($hl, $s[2]) : '', $s[0], isset($s[2]) ? $down : '');
    if (isset($s[3])) {
      $r .= PHP_EOL . '  <ul class="sub-menu">';
      foreach ($s[3] as $j=>$t) {
          $r .= sprintf('  ' . $fmt . '</li>', $j, $j == $id ? 'current-menu-item ' : '', '', $j, (strpos($t[1], 'http') === false ? 'http://yieldmore.org/' : '') . $t[1] , (strpos($t[1], 'http') !== false  || strpos($t[1], '/') === false) && $t[1] !== '' ? ' target="_blank"' : '', $t[2] !== '' ? sprintf($hl, $t[2]) : '', $t[0], '');
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