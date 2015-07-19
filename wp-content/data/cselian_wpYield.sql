-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2015 at 12:37 AM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cselian_wpYield`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_2_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_2_commentmeta`
--

INSERT INTO `wp_2_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_wp_trash_meta_status', '1'),
(2, 1, '_wp_trash_meta_time', '1436598033');

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_comments`
--

CREATE TABLE IF NOT EXISTS `wp_2_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_2_comments`
--

INSERT INTO `wp_2_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'http://yieldmore.org/', '', '2015-07-11 01:21:21', '2015-07-11 00:21:21', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, 'trash', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_links`
--

CREATE TABLE IF NOT EXISTS `wp_2_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_options`
--

CREATE TABLE IF NOT EXISTS `wp_2_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `wp_2_options`
--

INSERT INTO `wp_2_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://english.yieldmore.org', 'yes'),
(2, 'home', 'http://english.yieldmore.org', 'yes'),
(3, 'blogname', 'English YM', 'yes'),
(4, 'blogdescription', 'Learning English from Good Content', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'imran@cselian.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'jS F Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'jS F Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:27:"cs-filethingie/register.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '5.5', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'imperishable', 'yes'),
(42, 'stylesheet', 'imperishable', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31535', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:43:"register-plus-redux/register-plus-redux.php";a:2:{i:0;s:19:"Register_Plus_Redux";i:1;s:13:"rpr_uninstall";}}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'wp_2_user_roles', 'a:6:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:14:"rpr_unverified";a:2:{s:4:"name";s:10:"Unverified";s:12:"capabilities";a:0:{}}}', 'yes'),
(89, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(90, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:4:{i:0;s:8:"search-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:6:"meta-2";}s:8:"sidebar ";a:3:{i:0;s:7:"pages-3";i:1;s:14:"recent-posts-2";i:2;s:12:"categories-2";}s:13:"array_version";i:3;}', 'yes'),
(128, 'rewrite_rules', 'a:94:{s:45:"(songs)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:28:"(songs)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:10:"(songs)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"(uncategorised)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:36:"(uncategorised)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:18:"(uncategorised)/?$";s:35:"index.php?category_name=$matches[1]";s:14:"category/(.*)$";s:39:"index.php?category_redirect=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:"authors/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?work_author=$matches[1]&feed=$matches[2]";s:43:"authors/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?work_author=$matches[1]&feed=$matches[2]";s:36:"authors/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?work_author=$matches[1]&paged=$matches[2]";s:18:"authors/([^/]+)/?$";s:33:"index.php?work_author=$matches[1]";s:33:"works/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"works/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"works/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"works/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"works/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"works/([^/]+)/trackback/?$";s:31:"index.php?work=$matches[1]&tb=1";s:34:"works/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&paged=$matches[2]";s:41:"works/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&cpage=$matches[2]";s:26:"works/([^/]+)(/[0-9]+)?/?$";s:43:"index.php?work=$matches[1]&page=$matches[2]";s:22:"works/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"works/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:52:"works/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"works/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"works/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:31:".+?/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:".+?/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"(.+?)/([^/]+)/trackback/?$";s:57:"index.php?category_name=$matches[1]&name=$matches[2]&tb=1";s:46:"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:41:"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:34:"(.+?)/([^/]+)/page/?([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]";s:41:"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]";s:26:"(.+?)/([^/]+)(/[0-9]+)?/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]";s:20:".+?/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:30:".+?/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:50:".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:26:"(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:33:"(.+?)/comment-page-([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&cpage=$matches[2]";s:8:"(.+?)/?$";s:35:"index.php?category_name=$matches[1]";}', 'yes'),
(96, 'WPLANG', 'en_GB', 'yes'),
(97, 'wordfence_version', '6.0.11', 'yes'),
(98, 'cron', 'a:2:{i:1437265643;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(99, 'oa_social_login_activation_message', '1', 'yes'),
(111, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1436574458;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(112, 'current_theme', 'Imperishable', 'yes'),
(113, 'theme_mods_imperishable', 'a:1:{i:0;b:0;}', 'yes'),
(114, 'theme_switched', '', 'yes'),
(115, 'new_admin_email', 'imran@cselian.com', 'yes'),
(118, 'cimy_swift_smtp_options', 'a:8:{s:6:"server";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:3:"ssl";s:0:"";s:11:"sender_name";s:0:"";s:11:"sender_mail";s:0:"";s:16:"overwrite_sender";s:15:"overwrite_never";s:4:"port";i:25;}', 'yes'),
(121, 'recently_activated', 'a:0:{}', 'yes'),
(131, 'widget_csb_works_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(130, 'widget_csb_workauthors_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(129, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(125, 'category_children', 'a:0:{}', 'yes'),
(132, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(133, 'widget_pages', 'a:3:{i:1;a:0:{}s:12:"_multiwidget";i:1;i:3;a:3:{s:5:"title";s:5:"Pages";s:6:"sortby";s:2:"ID";s:7:"exclude";s:0:"";}}', 'yes'),
(134, 'widget_oa_social_login', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(135, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(154, 'register_plus_redux_last_activated', '3.9.6', 'yes'),
(155, 'rg_rpr_plugin_do_activation_redirect', '1', 'yes'),
(156, 'register_plus_redux_version', '4.2.3', 'yes'),
(152, 'readygraph_connect_notice', 'true', 'yes'),
(153, 'register_plus_redux_options', 'a:65:{s:17:"verify_user_email";s:1:"1";s:25:"message_verify_user_email";s:314:"<h2>%user_login% is your new username</h2>\n<p>But, before you can start using your new username, <strong>you must activate it</strong></p>\n<p>Check your inbox at <strong>%user_email%</strong> and click the link given.</p>\n<p>If you do not activate your username within two days, you will have to sign up again.</p>";s:17:"verify_user_admin";s:1:"0";s:25:"message_verify_user_admin";s:96:"Your account will be reviewed by an administrator and you will be notified when it is activated.";s:29:"delete_unverified_users_after";i:0;s:14:"autologin_user";s:1:"0";s:17:"username_is_email";s:1:"0";s:18:"double_check_email";s:1:"0";s:17:"user_set_password";s:1:"0";s:19:"min_password_length";i:6;s:29:"disable_password_confirmation";s:1:"0";s:19:"show_password_meter";s:1:"0";s:22:"message_empty_password";s:18:"Strength Indicator";s:22:"message_short_password";s:9:"Too Short";s:20:"message_bad_password";s:12:"Bad Password";s:21:"message_good_password";s:13:"Good Password";s:23:"message_strong_password";s:15:"Strong Password";s:25:"message_mismatch_password";s:17:"Password Mismatch";s:22:"enable_invitation_code";s:1:"0";s:23:"require_invitation_code";s:1:"0";s:30:"invitation_code_case_sensitive";s:1:"0";s:22:"invitation_code_unique";s:1:"0";s:33:"enable_invitation_tracking_widget";s:1:"0";s:15:"show_disclaimer";s:1:"0";s:24:"message_disclaimer_title";s:10:"Disclaimer";s:24:"require_disclaimer_agree";s:1:"1";s:24:"message_disclaimer_agree";s:21:"Accept the Disclaimer";s:12:"show_license";s:1:"0";s:21:"message_license_title";s:17:"License Agreement";s:21:"require_license_agree";s:1:"1";s:21:"message_license_agree";s:28:"Accept the License Agreement";s:19:"show_privacy_policy";s:1:"0";s:28:"message_privacy_policy_title";s:14:"Privacy Policy";s:28:"require_privacy_policy_agree";s:1:"1";s:28:"message_privacy_policy_agree";s:25:"Accept the Privacy Policy";s:11:"default_css";s:1:"1";s:21:"required_fields_style";s:51:"border:solid 1px #E6DB55; background-color:#FFFFE0;";s:24:"required_fields_asterisk";s:1:"0";s:17:"starting_tabindex";i:0;s:31:"disable_user_message_registered";s:1:"0";s:28:"disable_user_message_created";s:1:"0";s:19:"custom_user_message";s:1:"0";s:23:"user_message_from_email";s:17:"imran@cselian.com";s:22:"user_message_from_name";s:10:"English YM";s:20:"user_message_subject";s:35:"[English YM] Your Login Information";s:17:"user_message_body";s:61:"Username: %user_login%\nPassword: %user_password%\n\n%site_url%\n";s:25:"send_user_message_in_html";s:1:"0";s:26:"user_message_newline_as_br";s:1:"0";s:27:"custom_verification_message";s:1:"0";s:31:"verification_message_from_email";s:17:"imran@cselian.com";s:30:"verification_message_from_name";s:10:"English YM";s:28:"verification_message_subject";s:32:"[English YM] Verify Your Account";s:25:"verification_message_body";s:118:"Verification URL: %verification_url%\nPlease use the above link to verify your email address and activate your account\n";s:33:"send_verification_message_in_html";s:1:"0";s:34:"verification_message_newline_as_br";s:1:"0";s:32:"disable_admin_message_registered";s:1:"0";s:29:"disable_admin_message_created";s:1:"0";s:27:"admin_message_when_verified";s:1:"0";s:20:"custom_admin_message";s:1:"0";s:24:"admin_message_from_email";s:17:"imran@cselian.com";s:23:"admin_message_from_name";s:10:"English YM";s:21:"admin_message_subject";s:32:"[English YM] New User Registered";s:18:"admin_message_body";s:89:"New user registered on your site %blogname%\n\nUsername: %user_login%\nE-mail: %user_email%\n";s:26:"send_admin_message_in_html";s:1:"0";s:27:"admin_message_newline_as_br";s:1:"0";}', 'yes'),
(151, 'wf_plugin_act_error', '', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_2_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `wp_2_postmeta`
--

INSERT INTO `wp_2_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1436597691:1'),
(3, 1, '_edit_last', '1'),
(4, 2, '_edit_lock', '1436597901:1'),
(5, 2, '_edit_last', '1'),
(8, 2, '_wp_old_slug', 'hello-world');

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_posts`
--

CREATE TABLE IF NOT EXISTS `wp_2_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_2_posts`
--

INSERT INTO `wp_2_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2, 1, '2015-07-11 01:21:21', '2015-07-11 00:21:21', 'Until we have our songs classified and uploaded with youtube / lyrics links, you can check out these artists\r\nThe Beatles\r\nCliff Richard\r\nAir Supply\r\nPink Floyd\r\nDire Straits\r\nBryan Adams\r\n\r\n', 'Songs Level 1', '', 'publish', 'open', 'open', '', 'songs-l1', '', '', '2015-07-11 12:30:36', '2015-07-11 07:00:36', '', 0, 'http://english.yieldmore.org/?p=1', 0, 'post', '', 0),
(1, 1, '2015-07-11 01:21:21', '2015-07-11 00:21:21', 'Welcome to english.yieldmore.org a website for improving your English and for the English enthusiast. Our purpose is to bring you the best content that will interest you in learning the nuances of the language.\r\n\r\nWe believe English is best learnt through Music, Movies, Books, Poems and Short Stories. We classify these into levels.\r\n\r\nIn time, we plan to have lessons and a proper course structure with exercises you can take and also to target in schools.\r\n\r\nIf you are interested in contributing content, becoming a teacher, feel free to register with us by sending a mail to <a href="mailto:shasa@cselian.com?subject=YieldMore English Contact" target="_blank">shasa@cselian.com</a> with a slight mention of your background.\r\n\r\nIn time we wish to provide the tools for teachers to conduct classes online and also collect money from the students.', 'About', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-07-11 12:27:06', '2015-07-11 06:57:06', '', 0, 'http://english.yieldmore.org/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-07-18 13:11:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-18 13:11:25', '0000-00-00 00:00:00', '', 0, 'http://english.yieldmore.org/?p=3', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_terms`
--

CREATE TABLE IF NOT EXISTS `wp_2_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_2_terms`
--

INSERT INTO `wp_2_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorised', 'uncategorised', 0),
(2, 'Songs', 'songs', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_2_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_2_term_relationships`
--

INSERT INTO `wp_2_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_2_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_2_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_2_term_taxonomy`
--

INSERT INTO `wp_2_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_3_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_3_commentmeta`
--

INSERT INTO `wp_3_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_wp_trash_meta_status', '1'),
(2, 1, '_wp_trash_meta_time', '1436596795');

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_comments`
--

CREATE TABLE IF NOT EXISTS `wp_3_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_3_comments`
--

INSERT INTO `wp_3_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'http://yieldmore.org/', '', '2015-07-11 01:22:11', '2015-07-11 00:22:11', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, 'trash', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_links`
--

CREATE TABLE IF NOT EXISTS `wp_3_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_options`
--

CREATE TABLE IF NOT EXISTS `wp_3_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `wp_3_options`
--

INSERT INTO `wp_3_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://learn.yieldmore.org', 'yes'),
(2, 'home', 'http://learn.yieldmore.org', 'yes'),
(3, 'blogname', 'Learn YM', 'yes'),
(4, 'blogdescription', 'Learning/Teaching subjects made easy', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'imran@cselian.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'jS F Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'jS F Y g:i a', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '5.5', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'imperishable', 'yes'),
(42, 'stylesheet', 'imperishable', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '1', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31535', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:1;s:12:"hierarchical";i:1;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:43:"register-plus-redux/register-plus-redux.php";a:2:{i:0;s:19:"Register_Plus_Redux";i:1;s:13:"rpr_uninstall";}}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'wp_3_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(89, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(90, 'widget_recent-posts', 'a:2:{i:2;a:3:{s:5:"title";s:6:"Recent";s:6:"number";i:10;s:9:"show_date";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:4:{i:0;s:8:"search-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:6:"meta-2";}s:8:"sidebar ";a:3:{i:0;s:7:"pages-3";i:1;s:14:"recent-posts-2";i:2;s:12:"categories-2";}s:13:"array_version";i:3;}', 'yes'),
(134, 'rewrite_rules', 'a:94:{s:45:"(maths)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:28:"(maths)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:10:"(maths)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"(uncategorised)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:36:"(uncategorised)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:18:"(uncategorised)/?$";s:35:"index.php?category_name=$matches[1]";s:14:"category/(.*)$";s:39:"index.php?category_redirect=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:"authors/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?work_author=$matches[1]&feed=$matches[2]";s:43:"authors/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?work_author=$matches[1]&feed=$matches[2]";s:36:"authors/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?work_author=$matches[1]&paged=$matches[2]";s:18:"authors/([^/]+)/?$";s:33:"index.php?work_author=$matches[1]";s:33:"works/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"works/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"works/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"works/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"works/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"works/([^/]+)/trackback/?$";s:31:"index.php?work=$matches[1]&tb=1";s:34:"works/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&paged=$matches[2]";s:41:"works/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&cpage=$matches[2]";s:26:"works/([^/]+)(/[0-9]+)?/?$";s:43:"index.php?work=$matches[1]&page=$matches[2]";s:22:"works/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"works/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:52:"works/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"works/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"works/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:31:".+?/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:".+?/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"(.+?)/([^/]+)/trackback/?$";s:57:"index.php?category_name=$matches[1]&name=$matches[2]&tb=1";s:46:"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:41:"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:34:"(.+?)/([^/]+)/page/?([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]";s:41:"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]";s:26:"(.+?)/([^/]+)(/[0-9]+)?/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]";s:20:".+?/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:30:".+?/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:50:".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:26:"(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:33:"(.+?)/comment-page-([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&cpage=$matches[2]";s:8:"(.+?)/?$";s:35:"index.php?category_name=$matches[1]";}', 'yes'),
(96, 'WPLANG', 'en_GB', 'yes'),
(97, 'wordfence_version', '6.0.11', 'yes'),
(98, 'cron', 'a:2:{i:1437265702;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(99, 'oa_social_login_activation_message', '1', 'yes'),
(111, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1436574529;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(112, 'current_theme', 'Imperishable', 'yes'),
(113, 'theme_mods_imperishable', 'a:1:{i:0;b:0;}', 'yes'),
(114, 'theme_switched', '', 'yes'),
(115, 'new_admin_email', 'imran@cselian.com', 'yes'),
(120, 'cimy_swift_smtp_options', 'a:8:{s:6:"server";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:3:"ssl";s:0:"";s:11:"sender_name";s:0:"";s:11:"sender_mail";s:0:"";s:16:"overwrite_sender";s:15:"overwrite_never";s:4:"port";i:25;}', 'yes'),
(121, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(122, 'widget_csb_workauthors_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(123, 'widget_csb_works_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(124, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(125, 'widget_pages', 'a:3:{i:1;a:0:{}s:12:"_multiwidget";i:1;i:3;a:3:{s:5:"title";s:5:"Pages";s:6:"sortby";s:2:"ID";s:7:"exclude";s:0:"";}}', 'yes'),
(126, 'widget_oa_social_login', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(127, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(130, 'category_children', 'a:0:{}', 'yes'),
(143, 'readygraph_connect_notice', 'true', 'yes'),
(144, 'register_plus_redux_options', 'a:65:{s:17:"verify_user_email";s:1:"1";s:25:"message_verify_user_email";s:314:"<h2>%user_login% is your new username</h2>\n<p>But, before you can start using your new username, <strong>you must activate it</strong></p>\n<p>Check your inbox at <strong>%user_email%</strong> and click the link given.</p>\n<p>If you do not activate your username within two days, you will have to sign up again.</p>";s:17:"verify_user_admin";s:1:"0";s:25:"message_verify_user_admin";s:96:"Your account will be reviewed by an administrator and you will be notified when it is activated.";s:29:"delete_unverified_users_after";i:0;s:14:"autologin_user";s:1:"0";s:17:"username_is_email";s:1:"0";s:18:"double_check_email";s:1:"0";s:17:"user_set_password";s:1:"0";s:19:"min_password_length";i:6;s:29:"disable_password_confirmation";s:1:"0";s:19:"show_password_meter";s:1:"0";s:22:"message_empty_password";s:18:"Strength Indicator";s:22:"message_short_password";s:9:"Too Short";s:20:"message_bad_password";s:12:"Bad Password";s:21:"message_good_password";s:13:"Good Password";s:23:"message_strong_password";s:15:"Strong Password";s:25:"message_mismatch_password";s:17:"Password Mismatch";s:22:"enable_invitation_code";s:1:"0";s:23:"require_invitation_code";s:1:"0";s:30:"invitation_code_case_sensitive";s:1:"0";s:22:"invitation_code_unique";s:1:"0";s:33:"enable_invitation_tracking_widget";s:1:"0";s:15:"show_disclaimer";s:1:"0";s:24:"message_disclaimer_title";s:10:"Disclaimer";s:24:"require_disclaimer_agree";s:1:"1";s:24:"message_disclaimer_agree";s:21:"Accept the Disclaimer";s:12:"show_license";s:1:"0";s:21:"message_license_title";s:17:"License Agreement";s:21:"require_license_agree";s:1:"1";s:21:"message_license_agree";s:28:"Accept the License Agreement";s:19:"show_privacy_policy";s:1:"0";s:28:"message_privacy_policy_title";s:14:"Privacy Policy";s:28:"require_privacy_policy_agree";s:1:"1";s:28:"message_privacy_policy_agree";s:25:"Accept the Privacy Policy";s:11:"default_css";s:1:"1";s:21:"required_fields_style";s:51:"border:solid 1px #E6DB55; background-color:#FFFFE0;";s:24:"required_fields_asterisk";s:1:"0";s:17:"starting_tabindex";i:0;s:31:"disable_user_message_registered";s:1:"0";s:28:"disable_user_message_created";s:1:"0";s:19:"custom_user_message";s:1:"0";s:23:"user_message_from_email";s:17:"imran@cselian.com";s:22:"user_message_from_name";s:8:"Learn YM";s:20:"user_message_subject";s:33:"[Learn YM] Your Login Information";s:17:"user_message_body";s:61:"Username: %user_login%\nPassword: %user_password%\n\n%site_url%\n";s:25:"send_user_message_in_html";s:1:"0";s:26:"user_message_newline_as_br";s:1:"0";s:27:"custom_verification_message";s:1:"0";s:31:"verification_message_from_email";s:17:"imran@cselian.com";s:30:"verification_message_from_name";s:8:"Learn YM";s:28:"verification_message_subject";s:30:"[Learn YM] Verify Your Account";s:25:"verification_message_body";s:118:"Verification URL: %verification_url%\nPlease use the above link to verify your email address and activate your account\n";s:33:"send_verification_message_in_html";s:1:"0";s:34:"verification_message_newline_as_br";s:1:"0";s:32:"disable_admin_message_registered";s:1:"0";s:29:"disable_admin_message_created";s:1:"0";s:27:"admin_message_when_verified";s:1:"0";s:20:"custom_admin_message";s:1:"0";s:24:"admin_message_from_email";s:17:"imran@cselian.com";s:23:"admin_message_from_name";s:8:"Learn YM";s:21:"admin_message_subject";s:30:"[Learn YM] New User Registered";s:18:"admin_message_body";s:89:"New user registered on your site %blogname%\n\nUsername: %user_login%\nE-mail: %user_email%\n";s:26:"send_admin_message_in_html";s:1:"0";s:27:"admin_message_newline_as_br";s:1:"0";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_3_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `wp_3_postmeta`
--

INSERT INTO `wp_3_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1436598122:1'),
(3, 1, '_edit_last', '1'),
(4, 2, '_edit_lock', '1436596667:1'),
(5, 2, '_edit_last', '1'),
(8, 2, '_wp_old_slug', 'hello-world');

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_posts`
--

CREATE TABLE IF NOT EXISTS `wp_3_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_3_posts`
--

INSERT INTO `wp_3_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2, 1, '2015-07-11 01:22:11', '2015-07-11 00:22:11', 'Section to be expanded.', 'Math Basics', '', 'publish', 'open', 'open', '', 'math', '', '', '2015-07-11 12:10:00', '2015-07-11 06:40:00', '', 0, 'http://learn.yieldmore.org/?p=1', 0, 'post', '', 0),
(1, 1, '2015-07-11 01:22:11', '2015-07-11 00:22:11', 'Welcome to learn.yieldmore.org for learning subjects like math, science, history etc. Our purpose is to bring teachers and students together and provide a platform for our teachers to spread their learning. We are still in the process of building our own content, but link to other online content when possible.\r\n\r\nOur teachers section is for content targetting teachers (by teacher trainers).\r\n\r\nFeel free to register with us by sending a mail to <a href="mailto:shasa@cselian.com?subject=YieldMore Learn Contact" target="_blank">shasa@cselian.com</a> with a mention of which subjects your interested in teaching.\r\n\r\nIn time we wish to provide the tools for teachers to conduct classes online and also collect money from the students.', 'About', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-07-11 12:07:52', '2015-07-11 06:37:52', '', 0, 'http://learn.yieldmore.org/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-07-11 12:21:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-11 12:21:25', '0000-00-00 00:00:00', '', 0, 'http://learn.yieldmore.org/?p=3', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_terms`
--

CREATE TABLE IF NOT EXISTS `wp_3_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_3_terms`
--

INSERT INTO `wp_3_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorised', 'uncategorised', 0),
(2, 'Maths', 'maths', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_3_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_3_term_relationships`
--

INSERT INTO `wp_3_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_3_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_3_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_3_term_taxonomy`
--

INSERT INTO `wp_3_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_blogs`
--

CREATE TABLE IF NOT EXISTS `wp_blogs` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public` tinyint(2) NOT NULL DEFAULT '1',
  `archived` tinyint(2) NOT NULL DEFAULT '0',
  `mature` tinyint(2) NOT NULL DEFAULT '0',
  `spam` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blog_id`),
  KEY `domain` (`domain`(50),`path`(5)),
  KEY `lang_id` (`lang_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_blogs`
--

INSERT INTO `wp_blogs` (`blog_id`, `site_id`, `domain`, `path`, `registered`, `last_updated`, `public`, `archived`, `mature`, `spam`, `deleted`, `lang_id`) VALUES
(1, 1, 'yieldmore.org', '/', '2015-07-11 00:17:50', '2015-07-19 04:30:48', 1, 0, 0, 0, 0, 0),
(2, 1, 'english.yieldmore.org', '/', '2015-07-11 00:21:13', '2015-07-11 07:00:36', 1, 0, 0, 0, 0, 0),
(3, 1, 'learn.yieldmore.org', '/', '2015-07-11 00:22:09', '2015-07-11 06:40:00', 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_blog_versions`
--

CREATE TABLE IF NOT EXISTS `wp_blog_versions` (
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `db_version` varchar(20) NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`blog_id`),
  KEY `db_version` (`db_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 25, 'admin', 'imran@cselian.com', '', '182.65.10.244', '2015-07-03 06:13:37', '2015-07-03 06:13:37', 'Imran''s Article on I AM IONS:\r\nTitle: Programmer turning Inwards\r\n\r\nAll of my life I''ve had a sense that creation was special. I am lucky to have 2 wonderful uncles who have been a treasure trove of inspiration and information.\r\n\r\nI''m only 32, but have had some experience with the mysteries of life. These all were known by the Egyptians, Mayans and Atlanteans. We somehow lost touch with ourselves during the dark ages, but since 1600AD, have come into a new age of reasoning and of discovery.\r\n\r\nConsciousness is at the heart of everything, its what makes man the crown of creation (on Earth). Thats what drew me to IONS.\r\n\r\nWe are all gifted and it''s up to us to explore/use it. My gift has been programming and believe me, it''s an Art (like any other) when done properly. It develops the mind splendidly.\r\n\r\nBut technology is turning us into a bunch of mindless automatons. There is so much learning to be had (and shared). Thats why I created yieldmore.org to collectively share what we''ve found to be real.\r\n\r\nThere is a beautiful line in the movie The day the earth stood still (http://www.imdb.com/title/tt0970416/quotes). It goes as follows: You say we''re on the brink of destruction and you''re right. But it''s only on the brink that people find the will to change. Only at the precipice do we evolve. This is our moment.\r\n\r\nI think somewhere it''s in resonance with the vision of IONS.\r\n\r\nOr, to put it in my own words (http://cselian.com/blog/reflections/ethos/dear-brother-of-both-kindreds/)\r\nAt the zenith of its flow, the exodus was turned. A hundred different movements began that systemmatically and lovingly changed the status quo. The animal instincts were humanized and the human instincts were hallowed and heightened.\r\n\r\nThis is my sincere prayer, to change the status quo.\r\n- Amen', 0, '1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16795 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://yieldmore.org/', 'yes'),
(2, 'blogname', 'YieldMore.org', 'yes'),
(3, 'blogdescription', 'A wiki for progressive thinking and learning', 'yes'),
(4, 'users_can_register', '1', 'yes'),
(5, 'admin_email', 'imran@cselian.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '8', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'F j, Y', 'yes'),
(23, 'time_format', 'g:i a', 'yes'),
(24, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(28, 'comment_moderation', '', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:1:{i:0;s:27:"cs-filethingie/register.php";}', 'yes'),
(36, 'home', 'http://yieldmore.org/', 'yes'),
(37, 'category_base', '/', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '0', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', 'a:5:{i:0;s:109:"/home/cselian/public_html/subds/ym/wp-content/plugins/cartpauj-register-captcha/cartpauj-register-captcha.php";i:1;s:99:"/home/cselian/public_html/subds/ym/wp-content/plugins/tw-disable-revisions/tw-disable-revisions.php";i:2;s:84:"/home/cselian/public_html/subds/ym/wp-content/plugins/remove-category-url/readme.txt";i:3;s:97:"/home/cselian/public_html/subds/ym/wp-content/plugins/remove-category-url/remove-category-url.php";i:4;s:87:"/home/cselian/public_html/subds/ym/wp-content/plugins/remove-category-url/uninstall.php";}', 'no'),
(44, 'template', 'imperishable', 'yes'),
(45, 'stylesheet', 'imperishable', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '1', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '31535', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '0', 'yes'),
(57, 'show_on_front', 'posts', 'yes'),
(58, 'tag_base', '/', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'desc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:4:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;i:4;a:4:{s:5:"title";s:8:"Articles";s:5:"count";i:1;s:12:"hierarchical";i:1;s:8:"dropdown";i:0;}i:6;a:4:{s:5:"title";s:5:"Speak";s:5:"count";i:1;s:12:"hierarchical";i:1;s:8:"dropdown";i:0;}}', 'yes'),
(83, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(84, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(85, 'uninstall_plugins', 'a:1:{s:43:"register-plus-redux/register-plus-redux.php";a:2:{i:0;s:19:"Register_Plus_Redux";i:1;s:13:"rpr_uninstall";}}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '0', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22441', 'yes'),
(92, 'wp_user_roles', 'a:6:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:14:"rpr_unverified";a:2:{s:4:"name";s:10:"Unverified";s:12:"capabilities";a:0:{}}}', 'yes'),
(93, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(264, 'wp_editarea_display', 'onload', 'yes'),
(95, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:4:{i:0;s:12:"categories-2";i:1;s:18:"csb_works_widget-2";i:2;s:24:"csb_workauthors_widget-2";i:3;s:11:"tag_cloud-2";}s:8:"sidebar ";a:4:{i:0;s:7:"pages-2";i:1;s:12:"categories-4";i:2;s:12:"categories-6";i:3;s:24:"csb_workauthors_widget-4";}s:13:"array_version";i:3;}', 'yes'),
(257, 'widget_tag_cloud', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:8:"taxonomy";s:8:"post_tag";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'cron', 'a:15:{i:1437282269;a:1:{s:21:"wordfence_hourly_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1437292107;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1437292320;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1437293069;a:1:{s:20:"wordfence_daily_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1437308375;a:1:{s:21:"update_network_counts";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1437319493;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1437362709;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1437376991;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1437465021;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1437550449;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1437636304;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1437724463;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1437810744;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1438012800;a:1:{s:31:"wordfence_email_activity_report";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}s:7:"version";i:2;}', 'yes'),
(104, 'auth_key', '5_Hmc6+oQ <^S[:+f0===ang{I;vnVb+9W[atJC-JFB;?Uti<z!Hk(BX>*I3NYBp', 'yes'),
(105, 'auth_salt', '~7c@(8!e0uc*lVR#cM3g*+^DD2L0F[=[)8`C3(Z&{6Io&}jB}rR5?_isAbs8Q{O%', 'yes'),
(106, 'logged_in_key', 'K6b=7zD2.mOb(bdrNAQ?QV)j9C0VKm@whE z%m_3J Prd!zy)p=){%*APHgU:{6{', 'yes'),
(107, 'logged_in_salt', '].u!C2<$(.lV[#:ddPi746bsLTOA2T(OxgyO7?z5mTnQ+&J7K` 35sEA<aw5x(2t', 'yes'),
(113, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:20:"http://b.cselian.com";s:4:"link";s:96:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://b.cselian.com/";s:3:"url";s:130:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/bib2/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(114, 'nonce_key', '_ZG@SJi1r|~Jr`^2GI?P3jS_YzdzZ43z{+iL$qOz[~T0Q?B7F/*qTa4`@~Fv^Koh', 'yes'),
(115, 'nonce_salt', 'TDeH&8xBe)AX{H#ZiqX|6ssx@i W>TFt_YHZFg+z(!7F^.wqVF1T.F!#eLqQ4L+_', 'yes'),
(470, 'db_upgraded', '', 'yes'),
(12026, 'can_compress_scripts', '1', 'yes'),
(3849, 'oa_social_login_activation_message', '1', 'yes'),
(3850, 'oa_social_login_api_settings_verified', '1', 'yes'),
(3851, 'oa_social_login_settings', 'a:29:{s:22:"api_connection_handler";s:4:"curl";s:24:"api_connection_use_https";i:1;s:13:"api_subdomain";s:9:"yieldmore";s:23:"asynchronous_javascript";i:1;s:7:"api_key";s:36:"95439e3d-a01f-49f6-bc04-a897a14695c0";s:10:"api_secret";s:36:"eaebc6eb-87c8-4c8e-b900-2e08443701ea";s:9:"providers";a:3:{s:8:"facebook";i:1;s:6:"google";i:1;s:8:"linkedin";i:1;}s:27:"plugin_add_column_user_list";i:1;s:20:"plugin_require_email";i:0;s:25:"plugin_require_email_text";s:152:"<strong>We unfortunately could not retrieve your email address from %s.</strong> Please enter your email address in the form below in order to continue.";s:14:"plugin_caption";s:13:"Connect with:";s:29:"plugin_link_verified_accounts";i:1;s:31:"plugin_show_avatars_in_comments";s:1:"2";s:24:"plugin_use_small_buttons";i:0;s:28:"plugin_display_in_login_form";i:1;s:26:"plugin_login_form_redirect";s:7:"current";s:37:"plugin_login_form_redirect_custom_url";s:0:"";s:35:"plugin_display_in_registration_form";i:1;s:33:"plugin_registration_form_redirect";s:9:"dashboard";s:44:"plugin_registration_form_redirect_custom_url";s:0:"";s:35:"plugin_comment_show_if_members_only";i:1;s:27:"plugin_comment_auto_approve";i:0;s:19:"plugin_comment_show";i:1;s:19:"plugin_profile_show";i:1;s:31:"plugin_shortcode_login_redirect";s:7:"current";s:35:"plugin_shortcode_login_redirect_url";s:0:"";s:34:"plugin_shortcode_register_redirect";s:7:"current";s:38:"plugin_shortcode_register_redirect_url";s:0:"";s:19:"plugin_notify_admin";i:1;}', 'yes'),
(3832, 'wordfence_version', '6.0.11', 'yes'),
(319, 'widget_csb_works_widget', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(122, 'recently_activated', 'a:0:{}', 'yes'),
(15742, 'cimy_swift_smtp_options', 'a:8:{s:6:"server";s:16:"jet36.hasweb.com";s:8:"username";s:21:"noreply@yieldmore.org";s:8:"password";s:8:"Nor3ply!";s:3:"ssl";s:3:"ssl";s:11:"sender_name";s:13:"Yieldmore.org";s:11:"sender_mail";s:21:"noreply@yieldmore.org";s:16:"overwrite_sender";s:16:"overwrite_always";s:4:"port";s:3:"465";}', 'yes'),
(248, 'theme_mods_twentytwelve', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1366451333;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:5:{i:0;s:14:"recent-posts-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:12:"categories-2";i:4;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(157, 'current_theme', 'Imperishable', 'yes'),
(158, 'theme_mods_biblios', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1366448938;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(159, 'theme_switched', '', 'yes'),
(164, 'theme_mods_esplanade', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1366109245;s:4:"data";a:8:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;s:9:"sidebar-4";N;s:9:"sidebar-5";N;s:9:"sidebar-6";N;s:9:"sidebar-7";N;}}}', 'yes'),
(162, 'theme_mods_desaindigital', 'a:3:{i:0;b:0;s:16:"header_textcolor";s:6:"f7641b";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1366450947;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:8:"sidebar ";a:5:{i:0;s:14:"recent-posts-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:12:"categories-2";i:4;s:6:"meta-2";}}}}', 'yes'),
(243, 'theme_mods_zbench', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1366449153;s:4:"data";a:5:{s:19:"wp_inactive_widgets";a:0:{}s:19:"primary-widget-area";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:20:"singular-widget-area";N;s:24:"not-singular-widget-area";N;s:18:"footer-widget-area";N;}}}', 'yes'),
(244, 'zBench_options', 'a:16:{s:8:"logo_url";s:0:"";s:10:"hide_title";s:0:"";s:16:"header_image_url";s:0:"";s:7:"rss_url";s:0:"";s:11:"twitter_url";s:0:"";s:12:"facebook_url";s:0:"";s:14:"googleplus_url";s:0:"";s:21:"social_network_1_name";s:0:"";s:20:"social_network_1_img";s:0:"";s:20:"social_network_1_url";s:0:"";s:21:"social_network_2_name";s:0:"";s:20:"social_network_2_img";s:0:"";s:20:"social_network_2_url";s:0:"";s:13:"excerpt_check";s:0:"";s:13:"comment_notes";s:0:"";s:7:"smilies";s:0:"";}', 'yes'),
(265, 'wp_editarea_enable', 'yes', 'yes'),
(249, 'theme_mods_imperishable', 'a:2:{i:0;b:0;s:16:"header_textcolor";s:6:"777777";}', 'yes'),
(260, 'wp_editarea_start_highlight', 'true', 'yes'),
(261, 'wp_editarea_allow_toggle', 'true', 'yes'),
(262, 'wp_editarea_word_wrap', 'true', 'yes'),
(263, 'wp_editarea_language', 'en', 'yes'),
(310, 'widget_csc_related_links_widget', 'a:2:{i:3;N;s:12:"_multiwidget";i:1;}', 'yes'),
(320, 'widget_csb_workauthors_widget', 'a:3:{i:2;a:0:{}s:12:"_multiwidget";i:1;i:4;a:0:{}}', 'yes'),
(3183, 'auto_core_update_notified', 'a:4:{s:4:"type";s:6:"manual";s:5:"email";s:17:"imran@cselian.com";s:7:"version";s:5:"4.2.2";s:9:"timestamp";i:1431489067;}', 'yes'),
(16648, 'readygraph_enable_sidebar', 'false', 'yes'),
(16649, 'readygraph_auto_select_all', 'true', 'yes'),
(16650, 'readygraph_enable_branding', 'false', 'yes'),
(16785, 'category_children', 'a:1:{i:27;a:1:{i:0;i:28;}}', 'yes'),
(13742, 'widget_pages', 'a:2:{i:2;a:3:{s:5:"title";s:5:"Pages";s:6:"sortby";s:10:"menu_order";s:7:"exclude";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(13743, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(13744, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(13745, 'widget_oa_social_login', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(16645, 'register_plus_redux_last_activated', '3.9.6', 'yes'),
(16646, 'rg_rpr_plugin_do_activation_redirect', '1', 'yes'),
(16647, 'register_plus_redux_version', '4.2.3', 'yes'),
(16643, 'readygraph_connect_notice', 'true', 'yes'),
(16644, 'register_plus_redux_options', 'a:73:{s:17:"verify_user_email";s:1:"1";s:25:"message_verify_user_email";s:317:"<h2>%user_login% is your new username</h2>\r\n<p>But, before you can start using your new username, <strong>you must activate it</strong></p>\r\n<p>Check your inbox at <strong>%user_email%</strong> and click the link given.</p>\r\n<p>If you do not activate your username within two days, you will have to sign up again.</p>";s:17:"verify_user_admin";s:1:"0";s:25:"message_verify_user_admin";s:96:"Your account will be reviewed by an administrator and you will be notified when it is activated.";s:29:"delete_unverified_users_after";i:0;s:25:"registration_redirect_url";s:0:"";s:25:"verification_redirect_url";s:0:"";s:14:"autologin_user";s:1:"1";s:17:"username_is_email";s:1:"0";s:18:"double_check_email";s:1:"0";s:11:"show_fields";a:1:{i:0;s:5:"about";}s:17:"user_set_password";s:1:"1";s:19:"min_password_length";i:6;s:29:"disable_password_confirmation";s:1:"1";s:19:"show_password_meter";s:1:"0";s:22:"message_empty_password";s:18:"Strength Indicator";s:22:"message_short_password";s:9:"Too Short";s:20:"message_bad_password";s:12:"Bad Password";s:21:"message_good_password";s:13:"Good Password";s:23:"message_strong_password";s:15:"Strong Password";s:25:"message_mismatch_password";s:17:"Password Mismatch";s:22:"enable_invitation_code";s:1:"0";s:23:"require_invitation_code";s:1:"0";s:30:"invitation_code_case_sensitive";s:1:"0";s:22:"invitation_code_unique";s:1:"0";s:33:"enable_invitation_tracking_widget";s:1:"0";s:15:"show_disclaimer";s:1:"1";s:24:"message_disclaimer_title";s:9:"Agreement";s:18:"message_disclaimer";s:487:"You agree not to upload any copyrighted material, to agree to our usage terms for copyrighted material, to respect the opinions of others and not to deliberately mess up the websites content. Also, to give due attribution to websites and people when quoting content. We reserve the right to edit / decline contributions made by you and all articles and release all content under a <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/" target="_blank">creative commons license</a>.";s:24:"require_disclaimer_agree";s:1:"1";s:24:"message_disclaimer_agree";s:22:"Accept our usage terms";s:12:"show_license";s:1:"0";s:21:"message_license_title";s:17:"License Agreement";s:15:"message_license";s:0:"";s:21:"require_license_agree";s:1:"1";s:21:"message_license_agree";s:28:"Accept the License Agreement";s:19:"show_privacy_policy";s:1:"0";s:28:"message_privacy_policy_title";s:14:"Privacy Policy";s:22:"message_privacy_policy";s:0:"";s:28:"require_privacy_policy_agree";s:1:"1";s:28:"message_privacy_policy_agree";s:25:"Accept the Privacy Policy";s:11:"default_css";s:1:"1";s:21:"required_fields_style";s:50:"border:solid 1px #E6DB55;background-color:#FFFFE0;";s:24:"required_fields_asterisk";s:1:"1";s:17:"starting_tabindex";i:0;s:31:"disable_user_message_registered";s:1:"0";s:28:"disable_user_message_created";s:1:"0";s:19:"custom_user_message";s:1:"0";s:23:"user_message_from_email";s:0:"";s:22:"user_message_from_name";s:0:"";s:20:"user_message_subject";s:0:"";s:17:"user_message_body";s:0:"";s:25:"send_user_message_in_html";s:1:"0";s:26:"user_message_newline_as_br";s:1:"0";s:27:"custom_verification_message";s:1:"0";s:31:"verification_message_from_email";s:0:"";s:30:"verification_message_from_name";s:0:"";s:28:"verification_message_subject";s:0:"";s:25:"verification_message_body";s:0:"";s:33:"send_verification_message_in_html";s:1:"0";s:34:"verification_message_newline_as_br";s:1:"0";s:32:"disable_admin_message_registered";s:1:"0";s:29:"disable_admin_message_created";s:1:"0";s:27:"admin_message_when_verified";s:1:"0";s:20:"custom_admin_message";s:1:"0";s:24:"admin_message_from_email";s:0:"";s:23:"admin_message_from_name";s:0:"";s:21:"admin_message_subject";s:0:"";s:18:"admin_message_body";s:0:"";s:26:"send_admin_message_in_html";s:1:"0";s:27:"admin_message_newline_as_br";s:1:"0";s:28:"custom_registration_page_css";s:0:"";s:21:"custom_login_page_css";s:0:"";}', 'yes'),
(16786, 'rewrite_rules', 'a:132:{s:56:"(speak/7-utopians)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:39:"(speak/7-utopians)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:21:"(speak/7-utopians)/?$";s:35:"index.php?category_name=$matches[1]";s:48:"(articles)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:31:"(articles)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:13:"(articles)/?$";s:35:"index.php?category_name=$matches[1]";s:45:"(books)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:28:"(books)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:10:"(books)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"(documentaries)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:36:"(documentaries)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:18:"(documentaries)/?$";s:35:"index.php?category_name=$matches[1]";s:48:"(incubate)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:31:"(incubate)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:13:"(incubate)/?$";s:35:"index.php?category_name=$matches[1]";s:60:"(letters-and-speeches)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:43:"(letters-and-speeches)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:25:"(letters-and-speeches)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"(organizations)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:36:"(organizations)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:18:"(organizations)/?$";s:35:"index.php?category_name=$matches[1]";s:46:"(people)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:29:"(people)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:11:"(people)/?$";s:35:"index.php?category_name=$matches[1]";s:49:"(practices)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:32:"(practices)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:14:"(practices)/?$";s:35:"index.php?category_name=$matches[1]";s:48:"(programs)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:31:"(programs)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:13:"(programs)/?$";s:35:"index.php?category_name=$matches[1]";s:45:"(songs)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:28:"(songs)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:10:"(songs)/?$";s:35:"index.php?category_name=$matches[1]";s:45:"(speak)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:28:"(speak)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:10:"(speak)/?$";s:35:"index.php?category_name=$matches[1]";s:46:"(topics)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:29:"(topics)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:11:"(topics)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"(uncategorized)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:36:"(uncategorized)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:18:"(uncategorized)/?$";s:35:"index.php?category_name=$matches[1]";s:14:"category/(.*)$";s:39:"index.php?category_redirect=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:"authors/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?work_author=$matches[1]&feed=$matches[2]";s:43:"authors/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?work_author=$matches[1]&feed=$matches[2]";s:36:"authors/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?work_author=$matches[1]&paged=$matches[2]";s:18:"authors/([^/]+)/?$";s:33:"index.php?work_author=$matches[1]";s:33:"works/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"works/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"works/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"works/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"works/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"works/([^/]+)/trackback/?$";s:31:"index.php?work=$matches[1]&tb=1";s:34:"works/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&paged=$matches[2]";s:41:"works/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&cpage=$matches[2]";s:26:"works/([^/]+)(/[0-9]+)?/?$";s:43:"index.php?work=$matches[1]&page=$matches[2]";s:22:"works/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"works/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:52:"works/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"works/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"works/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:16:".*wp-signup.php$";s:21:"index.php?signup=true";s:18:".*wp-activate.php$";s:23:"index.php?activate=true";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:31:".+?/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:".+?/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"(.+?)/([^/]+)/trackback/?$";s:57:"index.php?category_name=$matches[1]&name=$matches[2]&tb=1";s:46:"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:41:"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:34:"(.+?)/([^/]+)/page/?([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]";s:41:"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]";s:26:"(.+?)/([^/]+)(/[0-9]+)?/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]";s:20:".+?/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:30:".+?/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:50:".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:26:"(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:33:"(.+?)/comment-page-([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&cpage=$matches[2]";s:8:"(.+?)/?$";s:35:"index.php?category_name=$matches[1]";}', 'yes'),
(16651, 'readygraph_send_blog_updates', 'true', 'yes'),
(16652, 'readygraph_send_real_time_post_updates', 'false', 'yes'),
(16653, 'readygraph_popup_template', 'default-template', 'yes'),
(16654, 'readygraph_upgrade_notice', 'true', 'yes'),
(16655, 'readygraph_tutorial', 'true', 'yes'),
(16656, 'readygraph_site_url', 'http://yieldmore.org', 'yes'),
(16657, 'readygraph_connect_anonymous', 'true', 'yes'),
(16658, 'readygraph_application_id', '5d264ec6-b5dc-4e57-81b1-ef116db27212', 'yes'),
(16659, 'readygraph_connect_anonymous_app_secret', '4H1NRRKQZH', 'yes'),
(16660, 'rpr_wordpress_sync_users', 'true', 'yes'),
(3179, 'WPLANG', 'en_GB', 'yes'),
(15790, 'post_count', '17', 'yes'),
(3839, 'wordfenceActivated', '1', 'yes'),
(3840, 'wf_plugin_act_error', '', 'yes'),
(3841, 'plugin_cbnet_rscc_options', 'a:15:{s:5:"chars";s:32:"ABCDEFGHJKLMNPQRSTUVWXYZ23456789";s:11:"char_length";s:1:"4";s:10:"img_size_x";s:2:"72";s:10:"img_size_y";s:2:"24";s:4:"fg_r";s:1:"0";s:4:"fg_g";s:1:"0";s:4:"fg_b";s:1:"0";s:4:"bg_r";s:3:"255";s:4:"bg_g";s:3:"255";s:4:"bg_b";s:3:"255";s:9:"font_size";s:2:"16";s:15:"font_char_width";s:2:"15";s:8:"img_type";s:3:"png";s:4:"base";a:2:{i:0;s:1:"6";i:1;s:2:"18";}s:18:"comment_form_label";s:9:"Anti-Spam";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=216 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1437195130:1'),
(3, 1, '_edit_last', '1'),
(19, 5, '_edit_lock', '1436158856:1'),
(6, 13, '_edit_last', '1'),
(7, 13, '_edit_lock', '1436571905:1'),
(10, 17, '_edit_last', '1'),
(11, 17, '_edit_lock', '1437279955:1'),
(12, 13, '_edit_last', '1'),
(13, 13, '_edit_lock', '1436571905:1'),
(18, 5, '_edit_last', '1'),
(20, 2, '_edit_lock', '1437204302:1'),
(21, 15, '_edit_last', '1'),
(22, 15, '_edit_lock', '1436086692:1'),
(23, 15, 'workConfig', '#Basic\r\ntype:short story\nfol:stories/niggle\n#Config\r\nheading:\r\nslug:content\r\nkeyFormat:p%s\r\nitemName:Para\r\ntitle:Content'),
(24, 5, 'workConfig', '#Basic\r\ntype:poem\nfol:auro/sav\n#Settings\r\nuseWords:1\r\nitemIsLine:1\r\n#Config\r\nheading:Book %s: %s\r\nheading2:Canto %s: %s\r\nslug:book\r\nslug2:canto\r\ndata:Array\r\ntabPrefix:\r\nnodeFormat:Book %s Canto %s\r\nkeyFormat:b%sc%s\r\nitemName:line\r\nitemFormat:%s<br/>\r\n#Titles\r\nexclude: book8-canto1,book8-canto2\r\ntitle:The Book Of Beginnings\r\nsubtitle:The Symbol Dawn\r\nsubtitle:The Issue\r\nsubtitle:The Yoga of the King: The Yoga of the Soul''s Release\r\nsubtitle:The Secret Knowledge\r\nsubtitle:The Yoga of the King: The Yoga of the Spirit''s Freedom and Greatness\r\ntitle:The Book of the Traveller of the Worlds\r\nsubtitle:The World-Stair\r\nsubtitle:The Kingdom of Subtle Matter\r\nsubtitle:The Glory and the Fall of Life\r\nsubtitle:The Kingdoms of the Little Life\r\nsubtitle:The Godheads of the Little Life\r\nsubtitle:The Kingdoms and Godheads of the Greater Life\r\nsubtitle:The Descent into Night\r\nsubtitle:The World of Falsehood, the Mother of Evil\r\nsubtitle:The Paradise of the Life-Gods\r\nsubtitle:The Kingdoms and Godheads of the Little Mind\r\nsubtitle:The Kingdoms and Godheads of the Greater Mind\r\nsubtitle:The Heavens of the Ideal\r\nsubtitle:In the Self of Mind\r\nsubtitle:The World-Soul\r\nsubtitle:The Kingdoms of the Greater Knowledge\r\ntitle:The Book of the Divine Mother\r\nsubtitle:The Pursuit of the Unknowable\r\nsubtitle:The Adoration of the Divine Mother\r\nsubtitle:The House of the Spirit and the New Creation\r\nsubtitle:The Vision and the Boon\r\ntitle:The Book of Birth and Quest\r\nsubtitle:The Birth and Childhood of the Flame\r\nsubtitle:The Growth of the Flame\r\nsubtitle:The Call to the Quest\r\nsubtitle:The Quest\r\ntitle:The Book of Love\r\nsubtitle:The Destined Meeting-Place\r\nsubtitle:Satyavan\r\nsubtitle:Satyavan and Savitri\r\ntitle:The Book of Fate\r\nsubtitle:The Word of Fate\r\nsubtitle:The Way of Fate and the Problem of Pain\r\ntitle:The Book of Yoga\r\nsubtitle:The Joy of Union; the Ordeal of the Foreknowledge of Death and the Heart''s Grief and Pain\r\nsubtitle:The Parable of the Search for the Soul\r\nsubtitle:The Entry into the Inner Countries\r\nsubtitle:The Triple Soul-Forces\r\nsubtitle:The Finding of the Soul\r\nsubtitle:Nirvana and the Discovery of the All-Negating Absolute\r\nsubtitle:The Discovery of the Cosmic Spirit and the Cosmic Consciousness\r\ntitle:The Book of Death\r\nsubtitle:\r\nsubtitle:\r\nsubtitle:Death in the Forest*\r\ntitle:The Book of Eternal Night\r\nsubtitle:Towards the Black Void\r\nsubtitle:The Journey in Eternal Night and the Voice of the Darkness\r\ntitle:The Book of the Double Twilight\r\nsubtitle:The Dream Twilight of the Ideal\r\nsubtitle:The Gospel of Death and Vanity of the Ideal\r\nsubtitle:The Debate of Love and Death\r\nsubtitle:The Dream Twilight of the Earthly Real\r\ntitle:The Book of Everlasting Day\r\nsubtitle:The Eternal Day: The Soul''s Choice and the Supreme Consummation\r\ntitle:Epilogue\r\nsubtitle:The Return to Earth'),
(26, 13, 'workConfig', '#Basic\r\ntype:book\nfol:books/jls\ncopyrighted:yes\r\n#Config\r\nheading:\r\nslug:part\r\nnodeFormat:Part %s\r\nkeyFormat:p%s\r\nitemName:Para\r\n#Titles\r\ntitle:Part One\r\ntitle:Part Two\r\ntitle:Part Three'),
(27, 12, '_edit_last', '1'),
(28, 12, '_edit_lock', '1436021938:1'),
(29, 12, 'workConfig', '#Basic\r\ntype:book\nfol:hindu/gita\n#Config\r\nhome:home.php\r\nhomeTitle:Intro to BG\r\ntabPrefix:\r\nheading:Chapter %s: %s\r\nslug:chapter\r\nhome:Intro to BG\r\n#Search\r\nnodeFormat:Chapter %s\r\nkeyFormat:c%s\r\nitemName:Para\r\ncustomTitles:true\r\n#Titles\r\ntitle:The Dejection of Arjuna\r\ntitle:Sankhyayoga\r\ntitle:Karmayoga\r\ntitle:Towards The Yoga of Knowledge\r\ntitle:The Yoga of Renunciation\r\ntitle:The Yoga of The Supreme Spirit\r\ntitle:The Yoga of Knowledge\r\ntitle:The Immutable Brahman\r\ntitle:The King-Knowledge or The King-Secret\r\ntitle:God in Power of Becoming\r\ntitle:The Vision of The World-Spirit\r\ntitle:Bhaktiyoga\r\ntitle:The Field and Its Knower\r\ntitle:The Three Gunas\r\ntitle:The Supreme Divine\r\ntitle:Deva and Asura\r\ntitle:Faith and The Three Gunas\r\ntitle:Renunciation and Moksha'),
(30, 3, '_edit_last', '1'),
(31, 3, '_edit_lock', '1435910151:1'),
(32, 14, '_edit_last', '1'),
(33, 14, '_edit_lock', '1436021695:1'),
(34, 14, 'workConfig', 'type:poem\nfol:hindu/stotrams/vs\nsubtype:Stotram\r\nrenderer:self\r\ncustomTitles:true\r\n#Titles\r\ntitle:mixed\r\ntitle:names\r\ntitle:verse\r\n#Links\r\nlinks:2\r\nlink1:lyrics|Vishnu Sahasranamam.lrc\r\nlink2:booklet|names of vishnu booklet.doc'),
(35, 11, '_edit_last', '1'),
(36, 11, '_edit_lock', '1436083446:1'),
(37, 11, 'workConfig', 'type:book\nfol:auro/eg\n#Config\r\nheading:Series %s\r\nheading2:Chapter %s: %s\r\nslug:series\r\nslug2:chapter\r\nkeyFormat:s%sc%s\r\nnodeFormat:Series %s, Chapter %s\r\nitemName:Para\r\n#Titles\r\ntitle:Series 1\r\nsubtitle:Our Demand and Need from the Gita\r\nsubtitle:The Divine Teacher\r\nsubtitle:The Human Disciple\r\nsubtitle:The Core of the Teaching\r\nsubtitle:Kurukshetra\r\nsubtitle:Man and the Battle of Life\r\nsubtitle:The Creed of the Aryan Fighter\r\nsubtitle:Sankhya and Yoga\r\nsubtitle:Sankhya, Yoga and Vedanta\r\nsubtitle:The Yoga of the Intelligent Will\r\nsubtitle:Works and Sacrifice\r\nsubtitle:The Significance of Sacrifice\r\nsubtitle:The Lord of the Sacrifice\r\nsubtitle:The Principle of Divine Works\r\nsubtitle:The Possibility and Purpose of Avatarhood\r\nsubtitle:The Process of Avatarhood\r\nsubtitle:The Divine Birth and Divine Works\r\nsubtitle:The Divine Worker\r\nsubtitle:Equality\r\nsubtitle:Equality and Knowledge\r\nsubtitle:The Determinism of Nature\r\nsubtitle:Beyond the Modes of Nature\r\nsubtitle:Nirvana and Works in the World\r\nsubtitle:The Gist of the Karmayoga\r\ntitle:Series 2\r\nsubtitle:The Two Natures\r\nsubtitle:The Synthesis of Devotion and Knowledge\r\nsubtitle:The Supreme Divine\r\nsubtitle:The Secret of Secrets\r\nsubtitle:The Divine Truth and Way\r\nsubtitle:Works, Devotion and Knowledge\r\nsubtitle:The Supreme Word of the Gita\r\nsubtitle:God in Power of Becoming\r\nsubtitle:The Theory of the Vibhuti\r\nsubtitle:The Vision of the World-Spirit - Time the Destroyer\r\nsubtitle:The Vision of the World-Spirit - The Double Aspect\r\nsubtitle:The Way and the Bhakta\r\nsubtitle:The Field and its Knower\r\nsubtitle:Above the Gunas\r\nsubtitle:The Three Purushas\r\nsubtitle:The Fullness of Spiritual Action\r\nsubtitle:Deva and Asura\r\nsubtitle:The Gunas, Faith and Works\r\nsubtitle:The Gunas, Mind and Works\r\nsubtitle:Swabhava and Swadharma\r\nsubtitle:Towards the Supreme Secret\r\nsubtitle:The Supreme Secret\r\nsubtitle:The Core of the Gita&#39;s Meaning\r\nsubtitle:The Message of the Gita\r\ntitle:Gita Translation\r\nsubtitle:The Dejection of Arjuna\r\nsubtitle:Sankhyayoga\r\nsubtitle:Karmayoga\r\nsubtitle:Towards The Yoga of Knowledge\r\nsubtitle:The Yoga of Renunciation\r\nsubtitle:The Yoga of The Supreme Spirit\r\nsubtitle:The Yoga of Knowledge\r\nsubtitle:The Immutable Brahman\r\nsubtitle:The King-Knowledge or The King-Secret\r\nsubtitle:God in Power of Becoming\r\nsubtitle:The Vision of The World-Spirit\r\nsubtitle:Bhaktiyoga\r\nsubtitle:The Field and Its Knower\r\nsubtitle:The Three Gunas\r\nsubtitle:The Supreme Divine\r\nsubtitle:Deva and Asura\r\nsubtitle:Faith and The Three Gunas\r\nsubtitle:Renunciation and Moksha'),
(38, 16, '_edit_last', '1'),
(39, 16, '_edit_lock', '1434688933:1'),
(41, 9, '_edit_last', '1'),
(42, 9, '_edit_lock', '1436571937:1'),
(43, 9, 'workConfig', 'type:book\r\nfol:books/prophet\r\ncopyrighted:yes\r\n#Config\r\nslug:chapter\r\nheading:Chapter %s: %s\r\nnodeFormat:Chapter %s\r\nkeyFormat:c%s\r\nitemName:Para\r\n#Titles\r\ntitle:The Coming of the Ship\r\ntitle:Love\r\ntitle:Marriage\r\ntitle:Children\r\ntitle:Giving\r\ntitle:Eating and Drinking\r\ntitle:Work\r\ntitle:Joy and Sorrow\r\ntitle:Houses\r\ntitle:Clothes\r\ntitle:Buying and Selling\r\ntitle:Crime and Punishment\r\ntitle:Laws\r\ntitle:Freedom\r\ntitle:Reason and Passion\r\ntitle:Pain\r\ntitle:Self-Knowledge\r\ntitle:Teaching\r\ntitle:Friendship\r\ntitle:Talking\r\ntitle:Time\r\ntitle:Good and Evil\r\ntitle:Prayer\r\ntitle:Pleasure\r\ntitle:Beauty\r\ntitle:Religion\r\ntitle:Death\r\ntitle:The Farewell'),
(44, 8, '_edit_last', '1'),
(45, 8, 'workConfig', 'type:poem\nfol:poems/prometheus\n#Config\r\nslug:act\r\nslug2:scene\r\nheading:Act %s\r\nheading2:Scene %s\r\nnodeFormat:Act %s Scene %s\r\nkeyFormat:a%ss%s\r\nitemName:Line\r\n#Titles\r\ntitle:Act I\r\nsubtitle:Scene 1\r\ntitle:Act II\r\nsubtitle:Scene 1\r\nsubtitle:Scene 2\r\nsubtitle:Scene 3\r\nsubtitle:Scene 4\r\nsubtitle:Scene 5\r\ntitle:Act III\r\nsubtitle:Scene 1\r\nsubtitle:Scene 2\r\nsubtitle:Scene 3\r\nsubtitle:Scene 4\r\ntitle:Act IV\r\nsubtitle:Scene 1'),
(46, 8, '_edit_lock', '1436024942:1'),
(47, 4, '_edit_last', '1'),
(48, 4, '_edit_lock', '1437278579:1'),
(49, 18, '_edit_last', '1'),
(50, 18, '_edit_lock', '1436618054:1'),
(51, 18, 'workConfig', 'type:book\nfol:auro/por\n#Config\r\nslug:section\r\nslug2:chapter\r\nheading:Section %s\r\nheading2:Chapter %s\r\nnodeFormat:Section %s Chapter %s\r\nkeyFormat:s%sc%s\r\nitemName:Line\r\n#Titles\r\n\r\ntitle:Rebirth and Karma\r\nsubtitle:Rebirth\r\nsubtitle:The Reincarnating Soul\r\nsubtitle:Rebirth, Evolution, Heredity\r\nsubtitle:Rebirth and Soul Evolution\r\nsubtitle:The Significance of Rebirth\r\nsubtitle:The Ascending Unity\r\nsubtitle:Involution and Evolution\r\nsubtitle:Karma\r\nsubtitle:Karma and Freedom\r\nsubtitle:Karma, Will and Consequence\r\nsubtitle:Karma and Justice\r\ntitle:The Lines of Karma\r\nsubtitle:The Foundation\r\nsubtitle:The Terrestrial Law\r\nsubtitle:Mind Nature and Law of Karma\r\nsubtitle:The Higher Lines of Karma\r\nsubtitle:APPENDIX I: The Tangle of Karma\r\nsubtitle:APPENDIX II: A Clarification'),
(52, 6, '_edit_last', '1'),
(53, 6, '_edit_lock', '1434687050:1'),
(54, 6, 'workConfig', '#Basic\r\ntype:book\nfol:books/ay\n#Config\r\nheading:Chapter %s\r\nnodeFormat:Chapter %s: %s\r\nslug:chapter\r\nkeyFormat:c%s\r\n#Titles\r\ntitle:My Parents and Early Life\r\ntitle:My Mother''s Death and the Mystic Amulet\r\ntitle:The Saint With Two Bodies\r\ntitle:My Interrupted Flight Toward the Himalayas\r\ntitle:A "Perfume Saint" Displays His Wonders\r\ntitle:The Tiger Swami\r\ntitle:The Levitating Saint\r\ntitle:India''s Great Scientist, J.C. Bose\r\ntitle:The Blissful Devotee and His Cosmic Romance\r\ntitle:I Meet My Master, Sri Yukteswar\r\ntitle:Two Penniless Boys in Brindaban\r\ntitle:Years in My Master''s Hermitage\r\ntitle:The Sleepless Saint\r\ntitle:An Experience in Cosmic Consciousness\r\ntitle:The Cauliflower Robbery\r\ntitle:Outwitting the Stars\r\ntitle:Sasi and the Three Sapphires\r\ntitle:A Mohammedan Wonder-Worker\r\ntitle:My Master, in Calcutta, Appears in Serampore\r\ntitle:We Do Not Visit Kashmir\r\ntitle:We Visit Kashmir\r\ntitle:The Heart of a Stone Image\r\ntitle:I Receive My University Degree\r\ntitle:I Become a Monk of the Swami Order\r\ntitle:Brother Ananta and Sister Nalini\r\ntitle:The Science of Kriya Yoga\r\ntitle:Founding a Yoga School in Ranchi\r\ntitle:Kashi, Reborn and Rediscovered\r\ntitle:Rabindranath Tagore and I Compare Schools\r\ntitle:The Law of Miracles\r\ntitle:An Interview with the Sacred Mother\r\ntitle:Rama is Raised From the Dead\r\ntitle:Babaji, the Yogi-Christ of Modern India\r\ntitle:Materializing a Palace in the Himalaya\r\ntitle:The Christlike Life of Lahiri Mahasaya\r\ntitle:Babaji''s Interest in the West\r\ntitle:I Go to America\r\ntitle:Luther Burbank -- A Saint Amidst the Roses\r\ntitle:Therese Neumann, the Catholic Stigmatist\r\ntitle:I Return to India\r\ntitle:An Idyll in South India\r\ntitle:Last Days With My Guru\r\ntitle:The Resurrection of Sri Yukteswar\r\ntitle:With Mahatma Gandhi in Wardha\r\ntitle:The Bengali "Joy-Permeated" Mother\r\ntitle:The Woman Yogi Who Never Eats\r\ntitle:I Return to the West\r\ntitle:At Encinitas in California\r\ntitle:The Years - 1940 - 1951'),
(55, 7, '_edit_last', '1'),
(56, 7, '_edit_lock', '1436086559:1'),
(57, 7, 'workConfig', '#Basic\r\ntype:book\nfol:buddhism/bb\n#Config\r\nheading:Sutra %s\r\nheading2:Chapter %s\r\nnodeFormat:Sutra %s, Chapter %s: %s\r\nslug:sutra\r\nslug2:chapter\r\nkeyFormat:s%sc%s\r\n#Titles\r\ntitle:The Lankavatara Sutra\r\nsubtitle:Discrimination\r\nsubtitle:False-Imagination and Knowledge of Appearances\r\nsubtitle:Right Knowledge or Knowledge of Relations\r\nsubtitle:Perfect Knowledge, or Knowledge of Reality\r\nsubtitle:The Mind System\r\nsubtitle:Transcendental Intelligence\r\nsubtitle:Self-Realisation\r\nsubtitle:The Attainment of Self- Realisation\r\nsubtitle:The Fruit of Self- Realisation\r\nsubtitle:Discipleship: Lineage of the Arhats\r\nsubtitle:Bodhisattvahood and Its Stages\r\nsubtitle:Tathagatahood Which Is Noble Wisdom\r\nsubtitle:Nirvana\r\ntitle:The Diamond Sutra\r\nsubtitle:The Diamond Scripture\r\ntitle:Sutra of Transcendental Wisdom\r\nsubtitle:Sutra of Transcendental Wisdom\r\ntitle:Sutra of the Sixth Patriarch\r\nsubtitle:Autobiography of Hui-Neng\r\nsubtitle:Discourse on Prajna\r\nsubtitle:Discourse on Dhyana and Samadhi\r\nsubtitle:Discourse on Repentance\r\nsubtitle:Discourse on the Three-Bodies of Buddha\r\nsubtitle:Dialogues Suggested by Various Temperaments and Circumstances \r\nsubtitle:Sudden Enlightenment and Gradual Attainment\r\nsubtitle:Royal Patronage\r\nsubtitle:Final Words and Death of the Patriarch'),
(58, 10, '_edit_last', '1'),
(59, 10, '_edit_lock', '1436086938:1'),
(60, 10, 'workConfig', '#Basic\r\ntype:book\nfol:hindu/mb\n#Config\r\ntabPrefix:\r\nheading:Chapter %s: %s\r\nslug:chapter\r\n#Search\r\nnodeFormat:Chapter %s\r\nkeyFormat:c%s\r\nitemName:Para\r\ncustomTitles:true\r\n#Titles\r\ntitle:Ganapati\r\ntitle:Devavrata\r\ntitle:Bhishma''s Vow\r\ntitle:Amba And Bhishma\r\ntitle:Devayani And Kacha\r\ntitle:The Marriage Of Devayani\r\ntitle:Yayati\r\ntitle:Vidura\r\ntitle:Kunti Devi\r\ntitle:Death Of Pandu\r\ntitle:Bhima\r\ntitle:Karna\r\ntitle:Drona\r\ntitle:The Wax Palace\r\ntitle:The Escape Of The Pandavas\r\ntitle:The Slaying Of Bakasura\r\ntitle:Draupadi''s Swayamvaram\r\ntitle:Indraprastha\r\ntitle:The Saranga Birds\r\ntitle:Jarasandha\r\ntitle:The Slaying Of Jarasandha\r\ntitle:The First Honor\r\ntitle:Sakuni Comes In\r\ntitle:The Invitation\r\ntitle:The Wager\r\ntitle:Draupadi''s Grief\r\ntitle:Dhritarashtra''s Anxiety\r\ntitle:Krishna''s Vow\r\ntitle:Pasupata\r\ntitle:Affliction Is Nothing New\r\ntitle:Agastya\r\ntitle:Rishyasringa\r\ntitle:Fruitless Penance\r\ntitle:Yavakrida''s End\r\ntitle:Mere Learning Is Not Enough\r\ntitle:Ashtavakra\r\ntitle:Bhima And Hanuman\r\ntitle:I am No Crane\r\ntitle:Wicked Are Never Satisfied\r\ntitle:Duryodhana Disgraced\r\ntitle:Sri Krishna''s Hunger\r\ntitle:The Enchanted Pool\r\ntitle:Domestic Service\r\ntitle:Virtue Vindicated\r\ntitle:Matsya Defended\r\ntitle:Prince Uttara\r\ntitle:Promise Fulfilled\r\ntitle:Virata''s Delusion\r\ntitle:Taking Counsel\r\ntitle:Arjuna''s Charioteer\r\ntitle:Salya Against His Nephews\r\ntitle:Vritra\r\ntitle:Nahusha\r\ntitle:Sanjaya''s Mission\r\ntitle:Not a Needle-Point Of Territory\r\ntitle:Krishna''s Mission\r\ntitle:Attachment and Duty\r\ntitle:The Pandava Generalissimo\r\ntitle:Balarama\r\ntitle:Rukmini\r\ntitle:Non-Cooperation\r\ntitle:Krishna Teaches\r\ntitle:Yudhishthira Seeks Benediction\r\ntitle:The First Day''s Battle\r\ntitle:The Second Day\r\ntitle:The Third Day''s Battle\r\ntitle:The Fourth Day\r\ntitle:The Fifth Day\r\ntitle:The Sixth Day\r\ntitle:The Seventh Day\r\ntitle:The Eighth Day\r\ntitle:The Ninth Day\r\ntitle:The Passing Of Bhishma\r\ntitle:Karna and the Grandsire\r\ntitle:Drona in Command\r\ntitle:To Seize Yudhishthira Alive\r\ntitle:The Twelfth Day\r\ntitle:Brave Bhagadatta\r\ntitle:Abhimanyu\r\ntitle:The Death Of Abhimanyu\r\ntitle:A Father''s Grief\r\ntitle:The Sindhu King\r\ntitle:Borrowed Armor\r\ntitle:Yudhishthira''s Misgivings\r\ntitle:Yudhishthira''s Fond Hope\r\ntitle:Karna And Bhima\r\ntitle:Pledge Respected\r\ntitle:Somadatta''s End\r\ntitle:Jayadratha Slain\r\ntitle:Drona Passes Away\r\ntitle:The Death Of Karna\r\ntitle:Duryodhana\r\ntitle:The Pandavas Reproached\r\ntitle:Aswatthama\r\ntitle:Avenged\r\ntitle:Who Can Give Solace?\r\ntitle:Yudhishthira''s Anguish\r\ntitle:Yudhishthira Comforted\r\ntitle:Envy\r\ntitle:Utanga\r\ntitle:A Pound Of Flour\r\ntitle:Yudhishthira Rules\r\ntitle:Dhritarashtra\r\ntitle:The Passing Away Of The Three\r\ntitle:Krishna Passes Away\r\ntitle:Yudhishthira''s Final Trial'),
(61, 12, '_wp_old_slug', 'bhagawat-gita'),
(62, 2, '_edit_last', '1'),
(63, 20, '_edit_last', '1'),
(64, 20, '_edit_lock', '1436571502:1'),
(65, 20, 'workConfig', 'type:book\r\nfol:'),
(66, 5, '_wp_old_slug', 'savithri'),
(67, 22, '_edit_lock', '1436607637:1'),
(68, 22, '_edit_last', '1'),
(72, 23, '_edit_last', '1'),
(71, 23, '_edit_lock', '1435860781:1'),
(75, 24, '_edit_lock', '1435897207:1'),
(76, 24, '_edit_last', '1'),
(88, 21, '_edit_last', '1'),
(87, 21, '_edit_lock', '1435983991:1'),
(89, 25, '_edit_lock', '1435902468:1'),
(90, 25, '_edit_last', '1'),
(101, 19, '_edit_lock', '1436840265:1'),
(107, 27, '_edit_last', '1'),
(106, 27, '_edit_lock', '1437280204:1'),
(102, 19, '_edit_last', '1'),
(103, 26, '_edit_lock', '1437280022:1'),
(104, 26, '_edit_last', '1'),
(109, 28, '_edit_lock', '1436114998:1'),
(110, 28, '_edit_last', '1'),
(121, 29, '_edit_lock', '1436589270:1'),
(122, 29, '_edit_last', '1'),
(152, 33, '_edit_lock', '1436729277:1'),
(138, 30, '_edit_lock', '1436608734:1'),
(139, 30, '_edit_last', '1'),
(143, 31, '_edit_last', '1'),
(142, 31, '_edit_lock', '1436626801:1'),
(147, 32, '_edit_last', '1'),
(146, 32, '_edit_lock', '1436775518:1'),
(153, 33, '_edit_last', '1'),
(156, 34, '_edit_lock', '1436730047:1'),
(157, 34, '_edit_last', '1'),
(165, 35, '_edit_last', '1'),
(168, 35, '_oembed_65d76bbad693c233371ceadd1d15359b', '{{unknown}}'),
(164, 35, '_edit_lock', '1437278756:1'),
(169, 35, '_oembed_17838c8c7cccde35b7370a99b125ede9', '{{unknown}}'),
(170, 35, '_oembed_0031eb4eb4297c750bacc5b5b9455e6f', '{{unknown}}'),
(171, 35, '_oembed_2edd41fcc5aaf12b40f58765f6f15355', '{{unknown}}'),
(174, 36, '_edit_lock', '1436868703:1'),
(175, 36, '_edit_last', '1'),
(180, 37, '_edit_lock', '1436867691:1'),
(181, 37, '_edit_last', '1'),
(189, 38, '_edit_last', '1'),
(188, 38, '_edit_lock', '1437018389:1'),
(204, 43, '_edit_lock', '1437205117:1'),
(196, 39, '_edit_lock', '1437204341:1'),
(197, 39, '_edit_last', '1'),
(205, 43, '_edit_last', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(5, 1, '2013-04-21 17:34:49', '2013-04-21 17:34:49', '[info]\r\nConversion: 4 Sep 2011\r\nTime: 8h\r\nWiki: Savitri: A Legend and a Symbol\r\nSource: http://www.sriaurobindoashram.org/ashram/sriauro/writings.php\r\n[/info]\r\n\r\nIt''s style inspired by Shelly''s Prometheus Unbound, the central theme revolves around the transcendence of man as the consummation of terrestrial evolution, and the emergence of an immortal supramental gnostic race upon earth.\r\n\r\nThe tale of Satyavan and Savitri is recited in the Mahabharata as a story of conjugal love conquering death. But this legend is, as shown by many features of the human tale, one of the many symbolic myths of the Vedic cycle. Satyavan is the soul carrying the divine truth of being within itself but descended into the grip of death and ignorance; Savitri is the Divine Word, daughter of the Sun, goddess of the supreme Truth who comes down and is born to save; Aswapati, the Lord of the Horse, her human father, is the Lord of Tapasya, the concentrated energy of spiritual endeavour that helps us to rise from the mortal to the immortal planes; Dyumatsena, Lord of the Shining Hosts, father of Satyavan, is the Divine Mind here fallen blind, losing its celestial kingdom of vision, and through that loss its kingdom of glory. Still this is not a mere allegory, the characters are not personified qualities, but incarnations or emanations of living and conscious Forces with whom we can enter into concrete touch and they take human bodies in order to help man and show him the way from his mortal state to a divine consciousness and immortal life.', 'Savitri', '', 'publish', 'closed', 'closed', '', 'savitri', '', '', '2015-07-06 04:49:55', '2015-07-06 04:49:55', '', 0, 'http://localhost/blog/?post_type=work&#038;p=51', 0, 'work', '', 0),
(1, 1, '2013-04-16 03:24:47', '2013-04-16 03:24:47', 'YieldMore.org is a community collaborated website (Wiki) aimed at sharing information and insights to improve the quality of life. We believe that every individual / collective problem can be solved by reinforcement / right understanding of an idea. The ideas we share on this website!\r\n\r\nWe don''t just want you to share a good book, we want you to tell us why, quote it''s more thought provoking content, try and spread its message and then participate in discussions / write articles about it.\r\n\r\n<a href="http://cselian.com/blog/yield" target="_blank">YIELD</a> is an anagram for Every Day Is Your Last. Living that way makes you more mindful of the important things. Yield also refers to the output (in agriculture), so what we''re trying to do is share stuff that helps us yieldmore out of life.\r\n\r\nContent is organized as per our <a href="http://cselian.com/blog/yield/yield-mandate/" target="_blank">original mandate</a> into:\r\n<strong>Works</strong> - Books, Poems, Letters etc. These are published with content using the platform Biblios but please note and respect the copyright notice that is in place until we get the proper permissions to publish.\r\n<strong>Space</strong> - Books, Movies and Songs that are positive and inspiring.\r\n<strong>Follow</strong> - For illumined People and Organizations.\r\n<strong>Speak</strong> - Articles by our contributors.\r\nTo best convey the ideas contained in these pages, we have quotes and summaries.\r\n\r\n<h1>Why</h1>\r\nWe believe in spreading the <a href="http://www.google.com/search?q=one+world+philosophy" target="_new">universal message</a> of love, living with our fellow man in harmony and promoting any thought or idea that enhances those beliefs. The best place to find these are in books, poems, discourses, speeches, letters and quotes by visionaries and adepts.\r\n\r\n<h1>Beliefs</h1>\r\nAt its core is a belief in the universality that exists in all religions. As they passed through the dark ages, these all became encrusted with untruths and have been diluted by unscrupulous people with ulterior motives. As we become one world and continue living in a new age of illumination, it falls upon us to remove the crud and learn to live in peace and harmony. Or, to put it in the <a href="http://yieldmore.org/works/essays-on-the-gita/" target="_blank">words of Aurobindo</a>:\r\n\r\n<blockquote>THE WORLD abounds with scriptures sacred and profane, with revelations and half-revelations, with religions and philosophies, sects and schools and systems. To these the many minds of a half-ripe knowledge or no knowledge at all attach themselves with exclusiveness and passion and will have it that this or the other book is alone the eternal Word of God and all others are either impostures or at best imperfectly inspired, that this or that philosophy is the last word of the reasoning intellect and other systems are either errors or saved only by such partial truth in them as links them to the one true philosophical cult.</blockquote>\r\n\r\nHarmony in all aspects of our lives - Me, Family (and Friends), Community, Country, Work, Work Ecosystems and finally the Whole World. Problems arise because of conflicts within members of these circles, or at the individual level, between myriad thoughts and beliefs.\r\n\r\n<h1>Who</h1>\r\nAnyone with an open mind, peaceful nature and a quest for progress is welcome to our site. We invite people to participate from these fields of endeavour: 1) Gaia / Mothers, 2) Healers, 3) Heroes, 4) Builders, 5) Artists, 6) Explorers, 7) Utopians / Humanitarians, 8) Scientists, 9) Visionaries, 10) Forerunners 11) Educators, 12) Beacons / Fathers.\r\n\r\n<h1>Inspiration</h1>\r\n<a href="https://en.wikipedia.org/wiki/Jagdish_Chandra_Bose" target="_blank">Bose</a>, <a href="https://en.wikipedia.org/wiki/Nikola_Tesla" target="_blank">Tesla</a>, <a href="https://wikimediafoundation.org" target="_blank">Wikipedia</a>, <a href="https://en.wikipedia.org/wiki/Wordpress" target="_blank">Wordpress</a> to name a few.\r\n', 'About', '', 'publish', 'closed', 'closed', '', 'about', '', '', '2015-07-11 03:26:52', '2015-07-11 03:26:52', '', 0, 'http://localhost/bib2/?page_id=2', 1, 'page', '', 0),
(13, 1, '2013-04-20 12:00:51', '2013-04-20 12:00:51', '[info]\r\nConversion: 2 Feb 2012\r\nTime: 2h\r\nWiki: Jonathan Livingston Seagull\r\npdf: http://kulichki.com/moshkow/RBACH/seagullengl.txt\r\n[/info]\r\n\r\n    <p>\r\n      The book tells the story of Jonathan Livingston Seagull, a seagull who is\r\n      bored with the daily squabbles over food. Seized by a passion for flight,\r\n      he pushes himself, learning everything he can about flying, until finally\r\n      his unwillingness to conform results in his expulsion from his flock. An\r\n      outcast, he continues to learn, becoming increasingly pleased with his\r\n      abilities as he leads an idyllic life.\r\n    </p>\r\n\r\n    <p>\r\n      One day, Jonathan is met by two gulls who take him to a "higher plane of\r\n      existence" in that there is no heaven but a better world found through\r\n      perfection of knowledge, where he meets other gulls who love to fly. He\r\n      discovers that his sheer tenacity and desire to learn make him "pretty\r\n      well a one-in-a-million bird." Jonathan befriends the wisest gull in this\r\n      new place, named Chiang, who takes him beyond his previous learning,\r\n      teaching him how to move instantaneously to anywhere else in the\r\n      Universe. The secret, Chiang says, is to "begin by knowing that you have\r\n      already arrived." Not satisfied with his new life, Jonathan returns to\r\n      Earth to find others like him, to bring them his learning and to spread\r\n      his love for flight. His mission is successful, gathering around him\r\n      others who have been outlawed for not conforming. Ultimately, the very\r\n      first of his students, Fletcher Lynd Seagull, becomes a teacher in his\r\n      own right and Jonathan leaves to teach other flocks.\r\n    </p>', 'Jonathan Livingston Seagull', '', 'publish', 'closed', 'closed', '', 'jonathan-livinsgston-seagull', '', '', '2015-07-10 23:47:21', '2015-07-10 23:47:21', '', 0, 'http://localhost/blog/?post_type=work&#038;p=17', 0, 'work', '', 0),
(17, 1, '2013-04-20 16:18:33', '2013-04-20 16:18:33', 'He will have to learn, I know, that all men are not just, all men are not true.\r\nBut teach him also that for every scoundrel there is a hero;\r\nthat for every selfish Politician, there is a dedicated leader…\r\nTeach him for every enemy there is a friend,\r\n\r\nSteer him away from envy,\r\n\r\nif you can, teach him the secret of quiet laughter.\r\n\r\nLet him learn early that the bullies are the easiest to lick…\r\nTeach him, if you can, the wonder of books…\r\nBut also give him quiet time to ponder the eternal mystery of birds in the sky,\r\nbees in the sun, and the flowers on a green hillside.\r\n\r\nIn the school teach him it is far honourable to fail than to cheat…\r\nTeach him to have faith in his own ideas, even if everyone tells him they are wrong…\r\nTeach him to be gentle with gentle people, and tough with the tough.\r\n\r\nTry to give my son the strength not to follow the crowd when everyone is getting on the band wagon…\r\nTeach him to listen to all men…\r\nbut teach him also to filter all he hears on a screen of truth,\r\nand take only the good that comes through.\r\n\r\nTeach him if you can, how to laugh when he is sad…\r\nTeach him there is no shame in tears,\r\n\r\nTeach him to scoff at cynics and to beware of too much sweetness…\r\nTeach him to sell his brawn and brain to the highest bidders\r\n\r\nbut never to put a price-tag on his heart and soul.\r\n\r\nTeach him to close his ears to a howling mob and to stand and fight if he thinks he’s right.\r\nTreat him gently, but do not cuddle him, because only the test of fire makes fine steel.\r\n\r\nLet him have the courage to be impatient…\r\nlet him have the patience to be brave.\r\nTeach him always to have sublime faith in himself,\r\nbecause then he will have sublime faith in mankind.\r\n\r\nThis is a big order,\r\nbut see what you can do…\r\nHe is such a fine little fellow,\r\nmy son!', 'letter from a parent to a teacher', '', 'publish', 'closed', 'closed', '', 'letter-from-a-parent-to-a-teacher', '', '', '2015-07-19 04:26:35', '2015-07-19 04:26:35', '', 0, 'http://localhost/blog/?p=18', 0, 'post', '', 0),
(2, 1, '2013-04-21 12:13:19', '2013-04-21 12:13:19', 'To contact us, please write an email to <a href="mailto:shasa@cselian.com?subject=YieldMore Contact" target="_blank">shasa@cselian.com</a>, or call Imran at +91 9566166880. Please note that Shasa isn''t an actual person, but is one of the Personas that contribute on our site. Another is Sophia. You can see all of them <a href="/author/">here</a>.\r\n\r\nYou can also find us on <a href="https://www.facebook.com/groups/YieldMore/" target="_blank">Facebook</a>, <a href="https://plus.google.com/b/112530158906132741775/" target="_blank">Google+</a> and <a href="https://www.linkedin.com/company/yieldmore-org" target="_blank">LinkedIn</a>.\r\n\r\nIf you want to suggest content, please send us an email and do cite your source. For the time being weve decided to restrict content creation but are willing to give contributor access to anyone who fits in with the spirit of the site.', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2015-07-11 06:20:25', '2015-07-11 06:20:25', '', 0, 'http://localhost/blog/?page_id=21', 3, 'page', '', 0),
(20, 1, '2015-07-01 08:51:51', '2015-07-01 08:51:51', '<blockquote>Imagine the universe beautiful and just and perfect,\r\n the handbook said to me once.\r\nThen be sure of one thing: the Is has imagined it quite a bit better than you have.</blockquote>\r\n\r\n<h1>Quotes</h1>\r\n<h2>Chapter 9</h2>\r\nThe days blurred one into another. We flew as always, but I had stopped counting summer by the names of towns or the money we earned from passengers. I began counting the summer by the things I learned, the talks we had when flying was done, and by the miracles that happened now and then along the way to the time I knew at last that they aren’t miracles at all.\r\n\r\n<h2>Intro</h2>\r\n13. “Each creature in its own manner clung tighty to the twigs and rocks of the river bottom, for clinging was their way of life, and resisting the current what each had learned from birth.\r\n14. “But one creature said at last, ‘I am tired of clinging. Though I cannot see it with my eyes, I trust that the current knows where it is going. I shall let go, and let it take me where it will. Clinging, I shall die of boredom.’\r\n15. “The other creatures laughed and said, ‘Fool! Let go, and that current you worship will throw you tumbled and smashed across the rocks, and you will die quicker than boredom!’\r\n16. “But the one heeded them not, and taking a breath did let go, and at once was tumbled and smashed by the current across the rocks.\r\n17. “Yet in time, as the creature refused to cling again, the current lifted him free from the bottom, and he was bruised and hurt no more.\r\n18. “And the creatures downstream, to whom he was a stranger, cried, ‘See a miracle! A creature like ourselves, yet he flies! See the Messiah, come to save us all!’\r\n19. “And the one carried in the current said, ‘I am no more Messiah than you. The river delights to lift us free, if only we dare let go. Our true work is this voyage, this adventure.’\r\n20. “But they cried the more, ‘Saviour!’ all the while clinging to the rocks, and when they looked again he was gone, and they were left alone making legends of a Saviour.”\r\n...\r\n30. “And what would you do,” the Master said unto the multitude, “if God spoke directly to your face and said, ‘I COMMAND THAT YOU BE HAPPY IN THE WORLD, AS LONG AS YOU LIVE.’ What would you do then?”\r\n32. And the Master said unto the silence, “In the path of our happiness shall we find the learning for which we have chosen this lifetime. So it is that I have learned this day, and choose to leave you now to walk your own path, as you please.”\r\n\r\n[info]pdf: http://www3.cs.stonybrook.edu/~ppenumarthi/illusions.pdf[/info]', 'Illusions', '', 'publish', 'closed', 'closed', '', 'illusions', '', '', '2015-07-10 23:33:57', '2015-07-10 23:33:57', '', 0, 'http://yieldmore.org/?post_type=work&#038;p=32', 0, 'work', '', 0),
(15, 1, '2013-07-05 02:44:58', '2013-07-05 02:44:58', '[info]\r\nConversion: 8 Jan 2013\r\nTime: 3h\r\nWiki: Leaf by Niggle\r\nSource: http://www.scribd.com/doc/10232245/JRR-Tolkien-Leaf-by-Niggle\r\n[/info]\r\n\r\n    <div class="right" style="float:right; padding: 0px 0px 20px 20px;">\r\n      <img src="/wp-content/data/stories/niggle/niggle.jpg" alt="niggle.jpg, 18kB" title="niggle.jpg" height="312" width="200" /><br />\r\n      <a href="http://en.wikipedia.org/wiki/File:Leaf_by_niggle.gif">Italian edition</a>\r\n    </div>\r\n    <p>\r\n      Niggle''s yearnings after truth and beauty (God''s creations) are echoed in his great painting; after death, Niggle is rewarded with the realization (the making-real) of his yearning. Or, if you prefer, Niggle''s Tree always existed - he simply echoed it in his art\r\n    </p>\r\n    <p>\r\n      A religious reading of Leaf by Niggle could lead to the conclusion that the allegory of "Leaf by Niggle" is life, death, purgatory and paradise\r\n    </p>\r\n    <p>\r\n      "Leaf by Niggle" is often seen as an allegory of Tolkien''s own creative process, and, to an extent, of his own life.\r\n    </p>\r\n    <h3>\r\n      Plot <a href="http://en.wikipedia.org/wiki/Leaf_by_Niggle"><sup>1</sup></a>\r\n    </h3>\r\n    <p>\r\n      In this story, an artist, named Niggle, lives in a society that does not much value art. Working only to please himself, he paints a canvas of a great Tree with a forest in the distance. He invests each and every leaf of his tree with obsessive attention to detail, making every leaf uniquely beautiful. Niggle ends up discarding all his other artworks, or tacks them onto the main canvas, which becomes a single vast embodiment of his vision.\r\n    </p>\r\n    <p>\r\n      However, there are many mundane chores and duties that prevent Niggle from giving his work the attention it deserves, so it remains incomplete and is not fully realized.\r\n    </p>\r\n    <p>\r\n      At the back of his head, Niggle knows that he has a great trip looming, and he must pack and prepare his bags. Also, Niggle''s next door neighbour, a gardener named Parish, is the sort of neighbour who always drops by whining about the help he needs with this and that. Moreover, Parish is lame and has a sick wife, and honestly needs help — Niggle, having a good heart, takes time out to help.\r\n    </p>\r\n    <p>\r\n      And Niggle has other pressing work duties that require his attention. Then Niggle himself catches a chill doing errands for Parish in the rain.\r\n    </p>\r\n    <p>\r\n      Eventually, Niggle is forced to take his trip, and cannot get out of it. He has not prepared, and as a result ends up in a kind of institution, in which he must perform menial labour each day.\r\n    </p>\r\n    <p>\r\n      In time he is paroled from the institution, and he is sent to a place ''for a little gentle treatment''. But he discovers that the new country he is sent to is in fact the country of the Tree and Forest of his great painting, now long abandoned and all but destroyed (except for the one perfect leaf of the title which is placed in the local museum) in the home to which he cannot return — but the Tree here and now in this place is the true realization of his vision, not the flawed and incomplete form of his painting.\r\n    </p>\r\n    <p>\r\n      Niggle is reunited with his old neighbour, Parish, who now proves his worth as a gardener, and together they make the Tree and Forest even more beautiful. Finally, Niggle journeys farther and deeper into the Forest, and beyond into the great mountains that he only faintly glimpsed in his painting.\r\n    </p>\r\n    <p>\r\n      Long after both Niggle and Parish have taken their journeys, the lovely field that they built together becomes a place for many travelers to visit before their final voyage into the Mountains, and it earns the name "Niggle''s Parish."\r\n    </p>', 'Leaf By Niggle', '', 'publish', 'closed', 'closed', '', 'leaf-by-niggle', '', '', '2015-07-05 08:58:33', '2015-07-05 08:58:33', '', 0, 'http://localhost/blog/?post_type=work&#038;p=8', 0, 'work', '', 0),
(12, 1, '2013-08-12 10:25:41', '2013-08-12 10:25:41', '<blockquote class="info">\r\n<b>Conversion</b>: 8 June 2012\r\n<b>Time</b>: 8h, <span title="Aug 12 2013">3h</span>\r\n<b>Wiki</b>: <a href="http://en.wikipedia.org/wiki/Bhagavad_Gita" target="_blank">Bhagavad Gita</a>\r\n<b>Source</b>: <a href="http://www.hinduonline.co/AudioLibrary/Discources/CommentaryonBhagavadGitaParamarthananda.html" target="_blank">hinduonline.co (audio)</a>, <a href="mailto:ramu.vedanta@gmail.com">ramu</a>\r\n</blockquote>\r\n\r\n[tab start][/tab]\r\n[tab name=hm-1]About[/tab]\r\n[tab name=hm-2]Gita Dhyanam[/tab]\r\n[tab name=hm-3]Mahabharata Namaskar[/tab]\r\n[tab name=hm-4]Vyasacharya Namaskara[/tab]\r\n[tab name=hm-5.1]Krishna 1[/tab]\r\n[tab name=hm-5.2]Kr 2[/tab]\r\n[tab name=hm-5.3]Kr 3[/tab]\r\n[tab name=hm-5.4]Kr 4[/tab]\r\n[tab name=hm-5.5]Kr 5[/tab]\r\n[tab name=hm-6]Introduction[/tab]\r\n[tab end][/tab]', 'Bhagavad Gita', '', 'publish', 'closed', 'closed', '', 'bhagavad-gita', '', '', '2015-06-19 04:32:57', '2015-06-19 04:32:57', '', 0, 'http://localhost/blog/?post_type=work&#038;p=11', 0, 'work', '', 0),
(3, 1, '2013-08-13 06:49:03', '2013-08-13 06:49:03', '[works]', 'Works', '', 'publish', 'closed', 'closed', '', 'works', '', '', '2015-07-03 07:58:09', '2015-07-03 07:58:09', '', 0, 'http://b.cselian.com/?page_id=13', 1, 'page', '', 0),
(14, 1, '2013-08-13 19:04:43', '2013-08-13 19:04:43', '[info]\r\nConversion: 19 Aug 2011\r\nTime: 4h\r\nWiki: Vishnu sahasranama\r\nSource: http://www.astrojyoti.com/vsfull.htm\r\n[/info]\r\n\r\nA Stotram in praise of Lord Vishnu, it enumerates a thousand qualities (or names) of Him.\r\n\r\n<h3>Merits</h3>\r\n<div>Believers in the recitation of the <strong>Sahasranama</strong> claim that it brings unwavering calm of mind, complete freedom from stress and brings eternal knowledge. A translation of the concluding verses (Phalasruti) of Vishnu sahasranama, state the following: “Nothing evil or inauspicious will befall a man here or hereafter who daily hears or repeats these names.. Whichever devoted man, getting up early in the morning and purifying himself, repeats this hymn devoted to <a title="Vasudeva" href="http://en.wikipedia.org/wiki/Vasudeva">Vasudeva</a>, with a mind that is concentrated on Him, that man attains to great fame, leadership among his peers, wealth that is secure and the supreme good unsurpassed by anything. He will be free from all fears and be endowed with great courage and energy and he will be free from diseases. Beauty of form, strength of body and mind, and virtuous character will be natural to him…. One who reads this hymn every day with devotion and attention attains to peace of mind, patience, prosperity, mental stability, memory and reputation…. <em>Whoever desires advancement and happiness should repeat this devotional hymn on Vishnu composed by<a title="Vyasa" href="http://en.wikipedia.org/wiki/Vyasa">Vyasa</a></em>….Never will defeat attend on a man who adores the Lotus-Eyed One (Kamala Nayana), who is the Master of all the worlds, who is birthless, and out of whom the worlds have originated and into whom they dissolve. - Source: <a href="http://en.wikipedia.org/wiki/Vishnu_sahasranama#Merits_of_Recitation">wikipedia</a>\r\n</div>\r\n\r\n<h3>Background</h3>\r\n<div>Soon after the death of Duryodhana, Yudhisthira was coroneted as the king. Though the war was over, Bheeshma was still lying on the bed of arrows as he vowed to leave this world only when the kingdom of Hastinapur is safe. Knowing this, immediately after the coronation, Yudhisthira, accompanied by Lord Krishna and his brothers, went to Bheeshma. Before leaving his mortal body, Bheeshma gives a long discourse to Yudhisthira on various aspects of life and Dharma. After listening to everything, Yudhisthira wants to know if there is any one thing through which one can achieve all; and Bheeshma prescribes the Vishnusahasranama stotra. The first 13 stanzas are the dialog between Yudhisthira and Bheeshma. The next three stanzas are the customary Dhyana verses. - Source: <a href="http://www.astrojyoti.com/vsfull.htm">astrojyoti.com</a></div>\r\n', 'Vishnu Sahasranamam', '', 'publish', 'closed', 'closed', '', 'vishnu-sahasranamam', '', '', '2015-07-04 14:54:30', '2015-07-04 14:54:30', '', 0, 'http://b.cselian.com/?post_type=work&#038;p=14', 0, 'work', '', 0),
(27, 1, '2015-07-04 20:51:16', '2015-07-04 20:51:16', '[info]\r\nWiki: Smith of Wootton Major\r\nAuthor: JRR Tolkien\r\nPdf: http://www.tolkien.ro/text/JRR%20Tolkien%20-%20Smith%20of%20Wootton%20Major.pdf\r\n[/info]\r\n\r\nThe village of Wootton Major was well-known around the countryside for its annual festivals, which were particularly famous for their culinary delights. The biggest festival of all was the Feast of Good Children. This festival was celebrated only once every twenty-four years: twenty-four children of the village were invited to a party, and the highlight of the party was the Great Cake, a career milestone by which Master Cooks were judged. In the year the story begins, the Master Cook was Nokes, who had landed the position more or less by default; he delegated much of the creative work to his apprentice Alf. Nokes crowned his Great Cake with a little doll jokingly representing the Queen of Faery. Various trinkets were hidden in the cake for the children to find; one of these was a star the Cook discovered in the old spice box.\r\n\r\nThe star was not found at the Feast, but was swallowed by a blacksmith’s son. The boy did not feel its magical properties at once, but on the morning of his tenth birthday the star fixed itself on his forehead, and became his passport to Faery. The boy grew up to be a blacksmith like his father, but in his free time he roamed the Land of Faery. The star on his forehead protected him from many of the dangers threatening mortals in that land, and the Folk of Faery called him "Starbrow". The book describes his many travels in Faery, until at last he meets the true Queen of Faery. The identity of the King is also revealed.\r\n\r\nThe time came for another Feast of Good Children. Smith had possessed his gift for most of his life, and the time had come to pass it on to some other child. So he regretfully surrendered the star to Alf, and with it his adventures into Faery. Alf, who had become Master Cook long before, baked it into the festive cake once again for another child to find. After the feast, Alf retired and left the village; and Smith returned to his forge to teach his craft to his now-grown son.', 'Smith of Wootton Major', '', 'publish', 'closed', 'closed', '', 'smith-of-wootton-major', '', '', '2015-07-19 04:30:48', '2015-07-19 04:30:48', '', 0, 'http://yieldmore.org/?p=27', 0, 'post', '', 0),
(11, 1, '2013-08-14 07:47:09', '2013-08-14 07:47:09', '<blockquote class="info">\r\n<b>Conversion</b>: 28 Apr 2012\r\n<b>Time</b>: 42h\r\n<b>Google Books</b>: <a href="https://books.google.co.in/books/about/Essays_on_the_Gita.html?id=2IMUuYi-pW0C&hl=en" target="_blank">Essays on the Gita</a>\r\n<b>Source</b>: <a href="http://www.sriaurobindoashram.org/ashram/sriauro/writings.php" target="_blank">sriaurobindoashram.org</a>, <a href="http://intyoga.online.fr/the_gita.htm" target="_blank">intyoga.fr</a>\r\n</blockquote>\r\n\r\n[work node=1 subnode=1]Our Demand and Need from the Gita[/work]\r\n\r\n[work node=1 subnode=1 page=1 para=1 endpage=7][/work]', 'Essays on the Gita', '', 'publish', 'closed', 'closed', '', 'essays-on-the-gita', '', '', '2015-07-05 08:00:20', '2015-07-05 08:00:20', '', 0, 'http://b.cselian.com/?post_type=work&#038;p=15', 0, 'work', '', 0),
(16, 1, '2013-08-14 12:17:27', '2013-08-14 12:17:27', '[work type=slide][/work]', '40 Verses on Reality', '', 'publish', 'closed', 'closed', '', '40-verses-on-reality', '', '', '2013-08-14 12:17:27', '2013-08-14 12:17:27', '', 0, 'http://b.cselian.com/?p=16', 0, 'post', '', 0),
(9, 1, '2013-08-14 15:13:40', '2013-08-14 15:13:40', '[info]\r\nConversion: 13 Nov 2011\r\nTime: 2h\r\nWiki: The Prophet (book)\r\nSource: http://leb.net/mira/works/prophet/prophet.html\r\n[/info]\r\n\r\nThe Prophet is a book of 26 poetic essays written in English by the Lebanese artist, philosopher and writer Kahlil Gibran. It was originally published in 1923 by Alfred A. Knopf. It is Gibran''s best known work. The Prophet has been translated into over forty different languages\r\n\r\n<h3>Synopsis</h3>\r\n\r\nThe prophet, Al-Mustafa who has lived in the foreign city of Orphalese for 12 years is about to board a ship which will carry him home. He is stopped by a group of people, with whom he discusses many of life and the human condition. The book is divided into chapters dealing with love, marriage, children, giving, eating and drinking, work, joy and sorrow, houses, clothes, buying and selling, crime and punishment, laws, freedom, reason and passion, pain, self-knowledge, teaching, friendship, talking, time, good and evil, prayer, pleasure, beauty, religion, and death.\r\n\r\n<h3>About Kahlil Gibran</h3>\r\n<div class="right" style="float:right; width: 220px; padding: 0px 0px 20px 20px;">\r\n      <img src="[data]gibran.jpg" alt="gibran" title="gibran" height="263" width="220" /><br/>Khalil\r\n      Gibran, Photograph by Fred Holland Day, c. 1898\r\n    </div>\r\nKahlil Gibran was a Lebanese American artist, poet, and writer, born in the town of Bsharri in modern-day Lebanon.\r\n\r\nHe is chiefly known in the English speaking world for his 1923 book The Prophet, an early example of inspirational fiction including a series of philosophical essays written in poetic English prose. Gibran is the third best-selling poet of all time, behind Shakespeare and Lao-Tzu.\r\n\r\nGibran was by no means a politician. He used to say : "I am not a politician, nor do I wish to become one" and "Spare me the political events and power strugges, as the whole earth is my homeland and all men are my fellow countrymen" <a href="http://en.wikipedia.org/wiki/Kahlil_Gibran#Political_thought">1</a>\r\n\r\n<h4>Garden of The Prophet</h4>\r\n\r\nGibran followed The Prophet with The Garden of The Prophet, which was published posthumously in 1933.\r\nThe Garden of the Prophet narrates Almustafa''s discussions with nine disciples following Almustafa''s return after an intervening absence. 2', 'The Prophet', '', 'publish', 'closed', 'closed', '', 'the-prophet', '', '', '2015-07-06 05:07:52', '2015-07-06 05:07:52', '', 0, 'http://b.cselian.com/?post_type=work&#038;p=17', 0, 'work', '', 0),
(8, 1, '2013-08-14 16:18:38', '2013-08-14 16:18:38', '[info]\r\nConversion: 5 Nov 2011\r\nTime: 4h\r\nWiki: Prometheus Unbound (Shelley)\r\nSource: http://www.bartleby.com/139/index.html\r\n[/info]\r\n\r\nPrometheus is a Titan, who in Greek mythology is credited with the creation of man from clay and the theft of fire for human use, an act that enabled progress and civilization. He is known for his intelligence, and as a champion of mankind.\r\n\r\nPrometheus was punished for this theft by Zeus, king of the Olympian gods, who sentenced the Titan to eternal torment for his transgression.\r\n\r\nIn some stories, Prometheus is freed at last by the hero Heracles (Hercules).\r\n\r\nThe Romantics drew comparisons between Prometheus and the spirit of the French Revolution, Christ, the Satan of John Milton''s Paradise Lost, and the divinely inspired poet or artist.\r\n\r\nPrometheus Unbound best combines the various elements of Shelley''s genius in their most complete expression, and unites harmoniously his lyrically creative power of imagination and his ''passion for reforming the world.'' It is the fruit of an outburst of poetic energy under the double stimulus of his enthusiastic Greek studies, begun under Peacock''s influence, and of his delight in the beauty of Italy, whither he had removed for health and rest. It marks his full mastery of his powers. It is, not less than Queen Mab and The Revolt of Islam, a poem of the moral perfection of man; and, not less than Alastor and Epipsychidion, a poem of spiritual ideality. He was himself in love with it: ''a poem of a higher character than anything I have yet attempted and perhaps less an imitation of anything that has gone before it,'' he writes to Ollier; and again, ''a poem in my best style, whatever that may amount to,... the most perfect of my productions,'' and ''the best thing I ever wrote;'' and finally he says, ''Prometheus Unbound, I must tell you, is my favorite poem; I charge you, therefore, especially to pet him and feed him with fine ink and good paper.... I think, if I can judge by its merits, the Prometheus cannot sell beyond twenty copies.'' Nor did he lose his affection for it. Trelawny records him as saying, ''If that is not durable poetry, tried by the severest test, I do not know what is. It is a lofty subject, not inadequately treated, and should not perish with me.''... ''My friends say my Prometheus is too wild, ideal, and perplexed with imagery. It may be so. It has no resemblance to the Greek drama. It is original; and cost me severe mental labor. Authors, like mothers, prefer the children who have given them most trouble.''\r\n\r\nThe drama was begun in the summer-house of his garden at Este about September, 1818, and the first Act had been finished as early as October 8; it was apparently laid aside, and again taken up at Rome in the spring of 1819, where, under the circumstances described in the preface, the second and third Acts were added, and the work, in its first form, was thus completed by April 6. The fourth Act was an afterthought, and was composed at Florence toward the end of the year. The whole was published, with other poems, in the summer of 1820.\r\n\r\nThe following extracts from Mrs. Shelley''s long and admirable note show the progress of the poem during its composition, the atmosphere of its creation, and its general scheme:\r\n\r\n''The first aspect of Italy enchanted Shelley; it seemed a garden of delight placed beneath a clearer and brighter heaven than any he had lived under before. He wrote long descriptive letters during the first year of his residence in Italy, which, as compositions, are the most beautiful in the world, and show how truly he appreciated and studied the wonders of nature and art in that divine land.\r\n\r\n''The poetical spirit within him speedily revived with all the power and with more than all the beauty of his first attempts. He meditated three subjects as the groundwork for lyrical Dramas. One was the story of Tasso: of this a slight fragment of a song of Tasso remains. The other was one founded on the book of Job, which he never abandoned in idea, but of which no trace remains among his papers. The third was the Prometheus Unbound. The Greek tragedians were now his most familiar companions in his wanderings, and the sublime majesty of Æschylus filled him with wonder and delight. The father of Greek tragedy does not possess the pathos of Sophocles, nor the variety and tenderness of Euripides; the interest on which he founds his dramas is often elevated above human vicissitudes into the mighty passions and throes of gods and demigods--such fascinated the abstract imagination of Shelley.\r\n\r\n''We spent a month at Milan, visiting the Lake of Como during that interval. Thence we passed in succession to Pisa, Leghorn, the Baths of Lucca, Venice, Este, Rome, Naples, and back again to Rome, whither we returned early in March, 1819. During all this time Shelley meditated the subject of his drama, and wrote portions of it. Other poems were composed during this interval, and while at the Bogni di Lucca he translated Plato''s Symposium. But though he diversified his studies, his thoughts centred in the Prometheus. At last, when at Rome, during a bright and beautiful spring, he gave up his whole time to the composition. The spot selected for his study was, as he mentions in his preface, the mountainous ruins of the Baths of Caracalla. These are little known to the ordinary visitor at Rome. He describes them in a letter, with that poetry, and delicacy, and truth of description, which rendered his narrated impressions of scenery of unequalled beauty and interest.\r\n\r\n''At first he completed the drama in three acts. It was not till several months after, when at Florence, that he conceived that a fourth act, a sort of hymn of rejoicing in the fulfilment of the prophecies with regard to Prometheus, ought to be added to complete the composition.\r\n\r\n''The prominent feature of Shelley''s theory of the destiny of the human species was, that evil is not inherent in the system of the creation, but an accident that might be expelled. This also forms a portion of Christianity; God made earth and man perfect, till he, by his fall,\r\n\r\n''"Brought death into the world and all our woe."\r\n\r\nShelley believed that mankind had only to will that there should be no evil, and there would be none. It is not my part in these notes to notice the arguments that have been urged against this opinion, but to mention the fact that he entertained it, and was indeed attached to it with fervent enthusiasm. That man could be so perfectionized as to be able to expel evil from his own nature, and from the greater part of the creation, was the cardinal point of his system. And the subject he loved best to dwell on, was the image of One warring with the Evil Principle, oppressed not only by it, but by all, even the good, who were deluded into considering evil a necessary portion of humanity; a victim full of fortitude and hope, and the spirit of triumph emanating from a reliance in the ultimate omnipotence of good. Such he had depicted in his last poem, when he made Laon the enemy and the victim of tyrants. He now took a more idealized image of the same subject. He followed certain classical authorities in figuring Saturn as the good principle, Jupiter the usurping evil one, and Prometheus as the regenerator, who, unable to bring mankind back to primitive innocence, used knowledge as a weapon to defeat evil, by leading mankind beyond the state wherein they are sinless through ignorance, to that in which they are virtuous through wisdom. Jupiter punished the temerity of the Titan by chaining him to a rock of Caucasus, and causing a vulture to devour his still-renewed heart. There was a prophecy afloat in heaven portending the fall of Jove, the secret of averting which was known only to Prometheus; and the god offered freedom from torture on condition of its being communicated to him. According to the mythological story, this referred to the offspring of Thetis, who was destined to be greater than his father. Prometheus at last bought pardon for his crime of enriching mankind with his gifts, by revealing the prophecy. Hercules killed the vulture and set him free, and Thetis was married to Peleus the father of Achilles.\r\n\r\n''Shelley adapted the catastrophe of this story to his peculiar views. The son, greater than his father, born of the nuptials of Jupiter and Thetis, was to dethrone Evil and bring back a happier reign than that of Saturn. Prometheus defies the power of his enemy, and endures centuries of torture, till the hour arrives when Jove, blind to the real event, but darkly guessing that some great good to himself will flow, espouses Thetis. At the moment, the Primal Power of the world drives him from his usurped throne, and Strength, in the person of Hercules, liberates Humanity, typified in Prometheus, from the tortures generated by evil done or suffered. Asia, one of the Oceanides, is the wife of Prometheus--she was, according to other mythological interpretations, the same as Venus and Nature. When the Benefactor of Mankind is liberated, Nature resumes the beauty of her prime, and is united to her husband, the emblem of the human race, in perfect and happy union. In the fourth Act, the poet gives further scope to his imagination, and idealizes the forms of creation, such as we know them, instead of such as they appeared to the Greeks. Maternal Earth, the mighty Parent, is superseded by the Spirit of the Earth--the guide of our planet through the realms of sky--while his fair and weaker companion and attendant, the Spirit of the Moon, receives bliss from the annihilation of Evil in the superior sphere.\r\n\r\n''Shelley develops, more particularly in the lyrics of this drama, his abstruse and imaginative theories with regard to the Creation. It requires a mind as subtle and penetrating as his own to understand the mystic meanings scattered throughout the poem. They elude the ordinary reader by their abstraction and delicacy of distinction, but they are far from vague. It was his design to write prose metaphysical essays on the nature of Man, which would have served to explain much of what is obscure in his poetry; a few scattered fragments of observations and remarks alone remain. He considered these philosophical views of mind and nature to be instinct with the intensest spirit of poetry.\r\n\r\n''More popular poets clothe the ideal with familiar and sensible imagery. Shelley loved to idealize the real--to gift the mechanism of the material universe with a soul and a voice, and to bestow such also on the most delicate and abstract emotions and thoughts of the mind....\r\n\r\n''Through the whole Poem there reigns a sort of calm and holy spirit of love; it soothes the tortured, and is hope to the expectant, till the prophecy is fulfilled, and Love, untainted by any evil, becomes the law of the world....\r\n\r\n''The charm of the Roman climate helped to clothe his thoughts in greater beauty than they had ever worn before; and as he wandered among the ruins, made one with nature in their decay, or gazed on the Praxitelean shapes that throng the Vatican, the Capitol, and the palaces of Rome, his soul imbibed forms of loveliness which became a portion of itself. There are many passages in the Prometheus which show the intense delight he received from such studies, and give back the impression with a beauty of poetical description peculiarly his own.''', 'Prometheus Unbound', '', 'publish', 'closed', 'closed', '', 'prometheus-unbound', '', '', '2015-07-04 15:51:14', '2015-07-04 15:51:14', '', 0, 'http://b.cselian.com/?post_type=work&#038;p=18', 0, 'work', '', 0),
(6, 1, '2015-06-19 02:34:21', '2015-06-19 02:34:21', 'This book, which introduced many westerners to meditation and yoga, describes Paramhansa Yogananda''s search for a guru, and his encounters with leading spiritual figures, blended with priceless superphysical information needed to balance the Western material efficiency with Eastern spiritual efficiency.\r\n\r\n<blockquote class="info">\r\n<b>Conversion</b>: 17 Oct 2011\r\n<b>Time</b>: 22h, <span title="19 Jun 2015">1h</span>\r\n<b>Wiki</b>: <a href="http://en.wikipedia.org/wiki/Autobiography_of_a_Yogi" target="_blank">Autobiography of a Yogi</a>\r\n<b>Source</b>: <a href="http://crystalclarity.com/yogananda/" target="_blank">crystalclarity.com</a>\r\n</blockquote>\r\n\r\n    <img src="[data]aychapter.jpg" align="left" vspace="2" hspace="8" alt="Image" />\r\n		<strong>Autobiography of a Yogi<br />\r\n    by Paramhansa Yogananda<br /><br />\r\n    Original First Edition, Copyright 1946,<br />\r\n    First Online Edition</strong><br />\r\n    <span class="ordernowcopy"><a href="http://www.crystalclarity.com/product.php?code=BAYPB">Purchase a copy of Autobiography\r\n    of a Yogi</a></span><br /><br />\r\n  \r\n    <span class="copy"><a href="http://www.ananda.org">Ananda</a> and <a href="http://crystalclarity.com">Crystal Clarity\r\n    Publishers</a> are pleased to announce the online publication of the complete first edition of\r\n    Paramhansa Yogananda''s <cite class="book">Autobiography of a Yogi.</cite><br />\r\n    <br />\r\n    Through this online version, we hope to make Yogananda''s spiritual classic freely available to\r\n    seekers throughout the world. The print version of the 1946 <cite class=\r\n    "book">Autobiography</cite> is available direct from Crystal Clarity Publishers through secure\r\n    online ordering. We hope you enjoy this free gift of the first online edition.<br />\r\n    <br /></span>\r\n    <table border="0" cellpadding="0" cellspacing="0">\r\n      <tr>\r\n        <td>\r\n          <span class="copy">Ananda was founded by Swami Kriyananda, a direct disciple of\r\n          Yogananda. Kriyananda was inspired by his guru to start ''World Brotherhood Colonies''.\r\n          Ananda, and its sister colonies throughout the world, are the fulfillment of Yogananda''s\r\n          dream. See Chapter 48, in this 1946 edition, to read Yogananda''s own words on World\r\n          Brotherhood Colonies.</span>\r\n        </td>\r\n        <td>\r\n          <img src="[data]newhome.jpg" width="292" height="188" alt="" border="0" />\r\n        </td>\r\n      </tr>\r\n    </table><span class="copy"><br />\r\n    <br />\r\n    <cite class="book">Autobiography of a Yogi</cite> is not an ordinary book. It is a spiritual\r\n    treasure. To read its message of hope to all truthseekers is to begin a great adventure.<br />\r\n    <br />\r\n    This is a verbatim reproduction of the original 1946 edition, complete with the original\r\n    photos, many of them not seen since earlier editions. Although subsequent printings, reflecting\r\n    revisions made after the Yogananda''s death in 1952, have sold over a million copies and have\r\n    been translated into more than 19 languages, the few thousand of the original have long since\r\n    disappeared into the hands of collectors.<br />\r\n    <br />\r\n    Now, with this online version, the 1946 edition is widely available, with all its inherent\r\n    power, just as Yogananda first presented it.<br />\r\n    <br />\r\n    <strong>Notes on Using the Online <cite class="book">Autobiography of a Yogi,</cite> by\r\n    Yogananda</strong><br />\r\n    <br />\r\n    You can begin by going straight to Chapter 1, or finding your favorite chapter in the Table of\r\n    Contents. All the photos are linked from the List of Illustrations, or you can link to the\r\n    photos from each chapter, where they appeared in the 1946 edition.<br />\r\n    <br />\r\n    All the original footnotes appear in this first online edition. Just click on the linked number\r\n    of the footnote as it appears in the text.<br />\r\n    <br />\r\n    Publishers Notes, from Crystal Clarity Publishers, gives information about this edition of the\r\n    Autobiography of a Yogi, along with frequently asked questions about this great book.<br />\r\n    <br />\r\n    How is Ananda able to publish the Online <cite class="book">Autobiography of a Yogi</cite>? See\r\n    article on <a href="http://www.ananda.org/news/self-realization_fellowship.html">Self-Realization Fellowship</a>*\r\n    lawsuits against Ananda.<br />\r\n    <blockquote>\r\n    	*<a href="../">CBPP</a> Note: This should mean the ability to Publish, though I have yet to ask either body if I may.\r\n    	The Court ruled that Self-Realization Fellowship did not own the copyrights for certain books Yogananda\r\n			published before his passing. Based on this decision, Ananda was able to publish the first edition of\r\n			Yogananda''s Autobiography of a Yogi.\r\n    </blockquote>\r\n    <br />\r\n    Ananda was founded in 1968 by <a href="http://crystalclarity.com/content.php?author=Swami%20Kriyananda">Swami Kriyananda\r\n    (J. Donald Walters)</a>, a direct disciple of Yogananda, and is dedicated to sharing the\r\n    teachings of Yogananda worldwide.</span>\r\n', 'Autobiography of a Yogi', '', 'publish', 'closed', 'closed', '', 'autobiography-of-a-yogi', '', '', '2015-06-19 03:45:02', '2015-06-19 03:45:02', '', 0, 'http://yieldmore.org/?post_type=work&#038;p=26', 0, 'work', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(4, 1, '2014-12-05 18:35:43', '2014-12-05 18:35:43', 'The Cselian Book and Publishing Project (Biblios) preserves notable works in a modern, easy to read, online manner.\r\n\r\nBiblios will let you save bookmarks online, make and share quotes, take notes etc, and solves some difficulties viz:\r\n<ul>\r\n	<li>Books online are difficult to read (bad site design, too many ads / images), and lack some features.</li>\r\n	<li>PDFs dont show <a href="http://biblios.cselian.com/jls/search.php?q=fly" target="_blank">search results</a> with context and are not suitable for reading across multiple devices.</li>\r\n	<li>Often when reading a hard-copy, we want to store <a href="http://biblios.cselian.com/prophet/quote.php?all=1" target="_blank">memorable bits</a> for future reading / sharing with friends.</li>\r\n	<li>Other languages are not always <a href="http://biblios.cselian.com/eg/transliterations.php" target="_blank">given</a> <a href="http://biblios.cselian.com/eg/search.php?q=transliterations" target="_blank">special</a> <a href="http://biblios.cselian.com/eg/series1-chapter18-the-divine-worker" target="_blank">attention</a> nor are the <a href="http://biblios.cselian.com/vs/" target="_blank">transliterations</a>.</li>\r\n</ul>\r\n\r\n<h1>Copyright</h1>\r\nNone of these books have copyright permissions yet.\r\n\r\nYou must first agree to our <b>usage terms</b> before reading them:\r\n<blockquote>My purpose in using this site is to read or use as a reference, books that I have already read or own. Also I''d like to preview unread books. I do declare that my intention is not to read books for free, denying due royalty owed to the Author and Publishers.</blockquote>\r\n\r\nIn the long run, we hope to contact copyright holders and have them allow:\r\n<ul>\r\n	<li>readers agree to something like our Fair Usage Terms and can be tracked by them.</li>\r\n	<li>Books only being available if you pay for them.</li>\r\n	<li>quotes / search results being available, and perhaps additionally a previewable amount of the book.</li>\r\n	<li>People sponsor other readers.</li>\r\n	<li>We do fundraisers to buy copyrights.</li>\r\n</ul>\r\n\r\n<h1>Whose Works:</h1>\r\nThe works of any and all are welcome, if it meets our <a title="Will be expanded">criteria</a> - progressive in nature, truly inspirational, and does not refute the validity of other faiths / works.\r\nHaving only just begun, the focus is on <a href="http://cselian.com/blog/my/share/aurobindos-independance-day-message/" target="_blank">Indian Spiritualism</a>, but would like to expand to <a href="http://www.williambloom.com/writings/penguin-new-age-intro-63.htm" target="_blank">any mature works</a> and other faiths.\r\nWe are also trying rethink <a href="http://www.google.com/search?q=paperless%20philosophy" target="_blank">online publication</a> and help smaller organizations and individuals do so at no cost.\r\n\r\n<h1>Copyright and Revenue:</h1>\r\nThere are several kinds of content we want on our site viz:\r\n<ul>\r\n	<li>Works that are <a href="http://en.wikipedia.org/wiki/Public_domain" target="_blank">already free</a>.</li>\r\n	<li>Works that can be had free or at a nominal price.</li>\r\n	<li>Donors <a href="http://en.wikipedia.org/wiki/Pay_it_forward" target="_blank">pay it forward</a> to X number of friends and other interested readers.</li>\r\n	<li>We do collection runs to buy out copyright holders and set the works free.</li>\r\n</ul>\r\n', 'Biblios', '', 'publish', 'closed', 'closed', '', 'biblios', '', '', '2015-07-19 04:05:04', '2015-07-19 04:05:04', '', 0, 'http://yieldmore.org/?page_id=20', 3, 'page', '', 0),
(25, 1, '2015-07-03 05:19:42', '2015-07-03 05:19:42', '[info]source: http://noetic.org/\r\nlink:http://noetic.org/about/vision|vision\r\nlink:http://noetic.org/join|join\r\nlink:http://noetic.org/iamions/no-facebook|tell your story[/info]\r\n\r\nThe Institute of Noetic Sciences serves an emerging movement of globally conscious citizens dedicated to manifesting our highest capacities. We believe that consciousness is essential to a paradigm shift that will lead to a more sustainable world. We encourage open-minded explorations of consciousness through the meeting of science and spirit. We take inspiration from the great discoveries of human history that have been sourced from insight and intuition and that have harnessed reason and logic for their outer expression. It is our conviction that systematic inquiries into consciousness will catalyze positive concrete transformations in the world. In this process, our vision is to help birth a new worldview that recognizes our basic interconnectedness and interdependence and promotes the flourishing of life in all its magnificent forms.', 'Institute of Noetic Sciences', '', 'publish', 'open', 'open', '', 'institute-of-noetic-sciences', '', '', '2015-07-03 05:19:42', '2015-07-03 05:19:42', '', 0, 'http://yieldmore.org/?p=40', 0, 'post', '', 1),
(18, 1, '2015-06-14 19:36:34', '2015-06-14 19:36:34', 'In these essays Sri Aurobindo looks at the significance of rebirth in the light of its role in the spiritual evolution of humanity and as a way to help answer man s questions about the purpose and aim of his existence. He also explains the deeper levels of truth behind the theory of karma (the consequences of one s past moral conduct) and discusses the concepts of freedom, justice, and will and consequence as part of a wider understanding of karma.', 'Problem of Rebirth', '', 'publish', 'closed', 'closed', '', 'problem-of-rebirth', '', '', '2015-07-04 21:30:55', '2015-07-04 21:30:55', '', 0, 'http://yieldmore.org/?post_type=work&#038;p=25', 0, 'work', '', 0),
(7, 1, '2015-06-19 03:20:13', '2015-06-19 03:20:13', 'A Buddhist Bible has had a huge influence on the growth of Buddhism in the English-speaking world in the 20th century.\r\n\r\n[info]\r\nConversion: 26 Oct 2011\r\nTime: 3h, <span title="19 Jun 2015">1h</span>\r\nWiki Source: <a href="http://en.wikipedia.org/wiki/Buddhism_in_the_United_States#Early_20th_century" target="_blank">Buddhism in the United_States</a>\r\nSource: http://www.sacred-texts.com/bud/bb/\r\n[/info]\r\n\r\n[tab start][/tab]\r\n[tab name=bb1]Introduction[/tab]\r\n[tab name=bb2]Title Page[/tab]\r\n[tab name=bb3]Books[/tab]\r\n[tab name=bb4]Preface[/tab]\r\n[tab name=bb5]History of Ch''an Buddhism[/tab]\r\n[tab end][/tab]', 'A Buddhist Bible', '', 'publish', 'closed', 'closed', '', 'a-buddhist-bible', '', '', '2015-07-05 08:58:14', '2015-07-05 08:58:14', '', 0, 'http://yieldmore.org/?post_type=work&#038;p=28', 0, 'work', '', 0),
(10, 1, '2015-06-19 03:57:41', '2015-06-19 03:57:41', '[info]\r\nConversion: 27 Apr 2012\r\nTime: 2h, <span title="19 Jun 2015">1h</span>\r\nWiki: Mahabharata\r\nSource: http://www.mahabharataonline.com/rajaji/mahabharata_summary_1.php\r\n[/info]\r\n\r\n<!-- http://www.mahabharataonline.com/rajaji/mahabharata_summary_108.php -->\r\n<p>\r\n  The Mahabharata, is the greatest, longest and one of the two major\r\n  Sanskrit epics of ancient India, the other being the Ramayana. With more\r\n  than 74,000 verses, plus long prose passages, or some 1.8 million words\r\n  in total, it is one of the longest epic poems in the world.\r\n</p>\r\n<p>\r\n  It contains eighteen Parvas or sections viz., Adi Parva, Sabha Parva,\r\n  Vana Parva, Virata Parva, Udyoga Parva, Bhishma Parva, Drona Parva, Karna\r\n  Parva, Shalya Parva, Sauptika Parva, Stree Parva, Shanti Parva,\r\n  Anushasana Parva, Asvamedha Parva, Ashramavasika Parva, Mausala Parva,\r\n  Mahaprasthanika Parva and Swargarohanika Parva. Each Parva contains many\r\n  sub-Parvas or subsections.\r\n</p>\r\n<p>\r\n  This wonderful book was composed by Sri Vyasa (Krishna Dvaipayana) who\r\n  was the grandfather of the heroes of the epic. He taught this epic to his\r\n  son Suka and his disciples Vaisampayana and others. King Janamejaya, son\r\n  of Parikshit, the grandson of the heroes of the epic, performed a great\r\n  sacrifice. The epic was recited by Vaisampayana to Janamejaya at the\r\n  command of Vyasa. Later on, Suta recited the Mahabharata as was done by\r\n  Vaisampayana to Janamejaya, to Saunaka and others, during a sacrifice\r\n  performed by Saunaka in Naimisaranya, which is near Sitapur in Uttar\r\n  Pradesh.\r\n</p>\r\n<p>\r\n  It is very interesting to remember the opening and closing lines of this\r\n  great epic. It begins with: "Vyasa sang of the ineffable greatness and\r\n  splendour of Lord Vasudeva, who is the source and support for everything,\r\n  who is eternal, unchanging, self-luminous, who is the Indweller in all\r\n  beings, and the truthfulness and righteousness of the Pandavas." It ends\r\n  with: "With raised hands, I shout at the top of my voice; but alas, no\r\n  one hears my words which can give them Supreme Peace, Joy and Eternal\r\n  Bliss. One can attain wealth and all objects of desire through Dharma\r\n  (righteousness). Why do not people practise Dharma? One should not\r\n  abandon Dharma at any cost, even at the risk of his life. One should not\r\n  relinquish Dharma out of passion or fear or covetousness or for the sake\r\n  of preserving one''s life. This is the Bharata Gayatri. Meditate on this\r\n  daily, O man! when you retire to sleep and when you rise from your bed\r\n  every morning. You will attain everything. You will attain fame,\r\n  prosperity, long life, eternal bliss, everlasting peace and immortality."\r\n</p>\r\n<h2>\r\n  C Rajagopalachari''s Version\r\n</h2>This is the text which is made available on this site.<br>\r\nPREFACE TO FIRST EDITION\r\n<p>\r\n  IT is not an exaggeration to say that the persons and incidents portrayed\r\n  in the great literature of a people influence national character no less\r\n  potently than the actual heroes and events enshrined in its history. It\r\n  may be claimed that the former play an even more important part in the\r\n  formation of ideals, which give to character its impulse of growth.\r\n</p>\r\n<p>\r\n  Don Quixote, Gulliver, Pickwick, Sam Weller, Sir Roger de Coverley,\r\n  Falstaff, Shylock, King Arthur, Sir Lancelot, Alice and her wanderings in\r\n  Wonderland, all these and many such other creations of genius are not\r\n  less real in the minds of the British people than the men and women who\r\n  lived and died and lie buried in British soil.\r\n</p>\r\n<p>\r\n  Since literature is so vitally related to fife and character, it follows\r\n  that so long as the human family remains divided into nations, the\r\n  personae and events of one national literature have not an equal appeal\r\n  to all, because they do not awaken the same associations. A word or\r\n  phrase about Falstaff or Uncle Toby carries to English men a world of\r\n  significance, which it does not to others.\r\n</p>\r\n<p>\r\n  Similarly, a word or phrase about Hanuman, Bhima, Arjuna, Bharata or Sita\r\n  conveys to us in India, learned and illiterate alike, a significance all\r\n  its own, of which an English rendering cannot convey even a fraction to\r\n  outsiders, however interested in Indian mythology and folklore.\r\n</p>\r\n', 'Mahabharata', '', 'publish', 'closed', 'closed', '', 'mahabharata', '', '', '2015-07-05 09:03:21', '2015-07-05 09:03:21', '', 0, 'http://yieldmore.org/?post_type=work&#038;p=29', 0, 'work', '', 0),
(22, 1, '2015-07-02 09:32:41', '2015-07-02 09:32:41', '[info]source: http://www.brainsync.com/\r\nyoutube: 6tF14GnCJqk|The Secret Universal Mind Meditation\r\nyoutube: zZnecUPyMqY|Slim Naturally (not official so use at your own discretion)[/info]\r\n\r\nBRAINSYNC meditation CDs and guided imagery techniques are proven to significantly improve mental performance. In two decades, nearly 3 million Brain Sync users have experienced the powerful benefits of deep meditation to accelerate healing, learning, recovery and personal growth. Brain Sync brainwave technology blends advanced meditation techniques with harmonically layered binaural beat frequencies.\r\n', 'Brainsync - Kelly Howell', '', 'publish', 'open', 'open', '', 'brainsync', '', '', '2015-07-11 09:42:52', '2015-07-11 09:42:52', '', 0, 'http://yieldmore.org/?p=33', 0, 'post', '', 0),
(23, 1, '2015-07-02 09:35:45', '2015-07-02 09:35:45', '[info]source: http://acd.icelp.info/what-we-teach/instrumental-enrichment.aspx[/info]\r\n\r\nInstrumental Enrichment (IE) is a cognitive intervention program that can be used both individually and in within the classroom. The IE program has been successfully used worldwide as a tool for the enhancement of learning potential and cognitive functioning of children and adults. For individuals with special needs, IE is used as a remidiation program; for higher functioning learners, IE is an enrichment tool. To date, the IE program has been successfully used in the following frameworks;\r\n\r\nEnrichment programs for underachieving, regular and gifted children\r\n\r\nLearning enahncement programs for immigrant and cultural minority students\r\n\r\nRemedial programs for special needs children\r\n\r\nCognitive rehabilitation of brain injured individuals and psychiatric patients\r\n\r\nProfessional training and retraining programs in the industrial, military and business sectors\r\n\r\nIE as a classroom curriculum is aimed at enhancing students'' cognitive functions necessary for academic learning and achievement. The fundamental assumption of the program is that intelligence is dynamic and modifiable, not static or fixed. The IE program seeks to correct the deficiencies in fundamental thinking skills, provides students with the concepts, skills, strategies, operations and techniques necessary to function as independent learners, increase their motivation, develop metacognition - in short, to "learn how to learn."\r\n\r\nIE materials are organized into 14 different instruments that comprise of paper and pencil tasks aimed at such specific cognitive domains as analytic perception, orientation in space and time, comparison, classification and more. Deliberately free of specific subject matter, the IE tasks are intended to be more readily transferable to all educational and everyday life situations. The IE materials and teacher manuals have received worldwide recognition and have been translated into 17 languages including all major European and some Asian languages. In addition, there is a Braille version of the IE tools for blind learners.', 'Instrumental Enrichment', '', 'publish', 'open', 'open', '', 'instrumental-enrichment', '', '', '2015-07-02 18:15:10', '2015-07-02 18:15:10', '', 0, 'http://yieldmore.org/?p=34', 0, 'post', '', 0),
(24, 1, '2015-07-02 17:52:10', '2015-07-02 17:52:10', 'Just select the text, right click and search for the song. azlyrics is good too.\r\n<ul>\r\n	<li>A great day for freedom - Pink Floyd\r\n<ul>\r\n	<li>Now frontiers shift like desert sands\r\nWhile nations wash their bloodied hands\r\nOf loyalty, of history, in shades of grey</li>\r\n</ul>\r\n</li>\r\n	<li>Closer to believing - Emerson Lake and Palmer\r\n<ul>\r\n	<li>Take me closer to believing\r\nTake me forward lead me on\r\nThrough collision and confusion\r\nWhile there''s life beneath the sun</li>\r\n</ul>\r\n</li>\r\n	<li>Don''t let it show - Alan Parsons Project\r\n<ul>\r\n	<li>Even if you feel you''ve got nothing to hide,\r\nKeep it inside of you.\r\nDon''t give in,\r\nDon''t tell them anything.\r\nDon''t let it-\r\nDon''t let it show.</li>\r\n</ul>\r\n</li>\r\n	<li>I love a rainy night - Dan Seals\r\n<ul>\r\n	<li>I love to hear the thunder\r\nWatch the lightning\r\nWhen it lights up the sky\r\nYou know it makes me feel good</li>\r\n</ul>\r\n</li>\r\n	<li>Imagine - John Lennon\r\n<ul>\r\n	<li>Imagine there''s no countries\r\nIt isn''t hard to do\r\nNothing to kill or die for\r\nAnd no religion too</li>\r\n</ul>\r\n</li>\r\n	<li>It''s all right here - Jim Messina\r\n<ul>\r\n	<li>I''ve read of men who travel far within themselves\r\nThey seek <span id="IL_AD2" class="IL_AD">the light</span> for their direction\r\nThey spend their whole lives searching for that inner space\r\nTo bring them closer to perfection.</li>\r\n</ul>\r\n</li>\r\n	<li>My life - Billy Joel\r\n<ul>\r\n	<li>I don''t care what you say anymore, this is my life\r\nGo ahead with your own life and leave me alone</li>\r\n</ul>\r\n</li>\r\n	<li>Short and sweet - David Gilmour\r\n<ul>\r\n	<li>Be true and you will likely find\r\nA few building a vision new and justice to our time</li>\r\n</ul>\r\n</li>\r\n	<li>Teach your children - Crosby Stills Nash and Young\r\n<ul>\r\n	<li>And you, of the tender years can''t know the fears that your elders grew by,\r\nAnd so please help them with your youth, they seek the truth before they can die.</li>\r\n</ul>\r\n</li>\r\n	<li>Wasted on the way - Crosby Stills Nash and Young\r\n<ul>\r\n	<li>So much love to make up everywhere you turn\r\nLove we have wasted on the way</li>\r\n</ul>\r\n</li>\r\n</ul>', 'Rock Music', '', 'publish', 'open', 'open', '', 'rock-music', '', '', '2015-07-03 04:21:00', '2015-07-03 04:21:00', '', 0, 'http://yieldmore.org/?p=36', 0, 'post', '', 0),
(21, 1, '2015-07-03 04:30:55', '2015-07-03 04:30:55', '[userlist]', 'Users', '', 'publish', 'open', 'open', '', 'author', '', '', '2015-07-04 04:28:48', '2015-07-04 04:28:48', '', 0, 'http://yieldmore.org/?page_id=39', 5, 'page', '', 0),
(19, 1, '2015-07-03 07:52:39', '2015-07-03 07:52:39', 'August 15th 2015: Launch website with limited content.\r\n\r\n<a href="http://learn.yieldmore.org" target="_blank">learn (3 Sep 2015)</a>\r\nFor teachers to share videos by subject, to charge students etc. Targetted for subjects taught in school.\r\n\r\nngos.yieldmore.org (15 Oct 2015)\r\nA wordpress multisite install for NGOs to have their website. and a directory service for those that do. Please note that this is a premium service (500 for directory, 3000 for website)\r\n\r\n<a href="http://english.yieldmore.org" target="_blank">english (5 Nov 2015)</a>\r\nA place to go for good content (songs/poems/childrens stories etc) that will help you learn English. Content will be classified by levels and there will also be lessons and exercises available.\r\n\r\ndir.yieldmore.org\r\nA directory of companies offering them options to create ads to be shown on all our sites.\r\n\r\np.yieldmore.org\r\na place for people to have a portfolio site', 'Roadmap', '', 'publish', 'closed', 'closed', '', 'roadmap', '', '', '2015-07-14 02:19:18', '2015-07-14 02:19:18', '', 0, 'http://yieldmore.org/?page_id=43', 5, 'page', '', 0),
(26, 1, '2015-07-03 18:40:16', '2015-07-03 18:40:16', '[info]\r\nwiki: The Snow Goose: A Story of Dunkirk\r\nauthor: Paul Gallico\r\npdf: http://arvindguptatoys.com/arvindgupta/snowgoose.pdf\r\nyoutube: jiD1PF20cSc|The Snow Goose (1971)\r\n[/info]\r\n\r\nThe Snow Goose is a simple, short written parable on the regenerative power of friendship and love, set against a backdrop of the horror of war. It documents the growth of a friendship between Philip Rhayader, an artist living a solitary life in an abandoned lighthouse in the marshlands of Essex because of his disabilities, and a young local girl, Fritha. The Snow Goose, symbolic of both Rhayader (Gallico) and the world itself, wounded by gunshot and many miles from home, is found by Fritha and, as the human friendship blossoms, the bird is nursed back to flight, and revisits the lighthouse in its migration for several years. As Fritha grows up, Rhayader and his small sailboat eventually are lost in the British retreat from Dunkirk, having saved several hundred men. The bird, which was with Rhayader, returns briefly to the grown Fritha on the marshes. She interprets this as Rhayader''s soul taking farewell of her (and realizes she had come to love him). Afterwards, a German pilot destroys Rhayader''s lighthouse and all of his work, except for one portrait Fritha saves after his death: a painting of her as Rhayader first saw her—a child, with the wounded snow goose in her arms.', 'The Snowgoose', '', 'publish', 'closed', 'closed', '', 'the-snowgoose', '', '', '2015-07-19 04:28:54', '2015-07-19 04:28:54', '', 0, 'http://yieldmore.org/?p=44', 0, 'post', '', 0),
(28, 1, '2015-07-05 16:43:33', '2015-07-05 16:43:33', '[info]\r\nsource: https://en.wikiquote.org/wiki/Sri_Aurobindo\r\nwiki: Sri Aurobindo\r\nlink: http://sriaurobindoashram.org\r\nlink: http://yieldmore.org/authors/sri-aurobindo/|Published Works (YM)\r\n[/info]\r\n\r\nIndian religion has always felt that since the minds, the temperaments and the intellectual affinities of men are unlimited in their variety, a perfect liberty of thought and of worship must be allowed to the individual in his approach to the Infinite.\r\n\r\nHinduism, which is the most skeptical and the most believing of all, the most skeptical because it has questioned and experimented the most, the most believing because it has the deepest experience and the most varied and positive spiritual knowledge, that wider Hinduism which is not a dogma or combination of dogmas but a law of life, which is not a social framework but the spirit of a past and [future]] social evolution, which rejects nothing but insists on testing and experiencing everything and when tested and experienced, turning in to the soul''s uses, in this Hinduism, we find the basis of future world religion. This Sanatana Dharma has many scriptures: The Veda, the Vedanta, the Gita, the Upanishads, the Darshanas, the Puranas, the Tantras, nor could it reject the Bible or the Koran, but its real, the most authoritative scripture is in the heart in which the Eternal has his dwelling.\r\n\r\nEvolution is not finished; reason is not the last word nor the reasoning animal the supreme figure of Nature. As man emerged out of the animal, so out of man the superman emerges.\r\n', 'Sri Aurobindo', '', 'publish', 'open', 'open', '', 'sri-aurobindo', '', '', '2015-07-05 16:51:54', '2015-07-05 16:51:54', '', 0, 'http://yieldmore.org/?p=34', 0, 'post', '', 0),
(29, 1, '2015-07-10 21:43:17', '2015-07-10 21:43:17', '[info]\r\nsource: http://www.artofliving.org/in-en/yoga/health-and-wellness/mudras-yoga-at-fingertips\r\n[/info]\r\n\r\nA lesser known, more subtle and independent branch of yoga is Yoga Tatva Mudra Vigyan - yoga mudras.\r\n\r\nEntirely distinct and based on the principle of Ayurveda, yoga mudras are understood as a healing modality. The Sanskrit word mudra is translated as gesture or attitude. A mudra may involve the whole body or could be a simple hand position. Mudras used in combination with yogic breathing exercises enliven the flow of prana in the body by stimulating different parts of the body involved with breathing. Relating directly to the nerves, mudras create a subtle connection with the instinctual patterns in the brain and influence the unconscious reflexes in these areas. The internal energy is in turn balanced and redirected, affecting change in the sensory organs, glands veins and tendons. This adds a completely new dimension to the yoga experience.\r\n\r\n[info]\r\nwiki: Mudra\r\n[/info]\r\n\r\nIn the 20th and 21st centuries, the yoga teacher Satyananda Saraswati, founder of the Bihar School of Yoga, continued to emphasize the importance of mudras in his instructional text Asana, Pranayama, Mudrā, Bandha..\r\n\r\n<div class="right"><img src="/wp-content/data/yoga/mudras/jnana-mudra.gif" height="120" /></div>\r\n<h2>Jñāna Mudrā</h2>\r\nThe Jñāna mudrā ("mudra of wisdom") is done by touching the tips of the thumb and the index together, forming a circle, and the hand is held with the palm inward toward the heart.\r\n\r\n<div class="right"><img src="/wp-content/data/yoga/mudras/prana-mudra.jpg" height="120" /></div>\r\n<h2>Prana Mudra</h2>\r\nPrana mudra can be performed in both hands place the tips of thumb, ring finger and little finger together. Other fingers remain stretched.', 'Mudras', '', 'publish', 'open', 'open', '', 'mudras', '', '', '2015-07-11 04:35:35', '2015-07-11 04:35:35', '', 0, 'http://yieldmore.org/?p=30', 0, 'post', '', 0),
(30, 1, '2015-07-11 09:58:50', '2015-07-11 09:58:50', '[info]\r\nwiki: Reiki\r\nlink: http://www.aetw.org/d_usui_treatment_guide.htm|Treatment Guide\r\n[/info]\r\n\r\nReiki is a form of alternative medicine developed in 1922 by Japanese Buddhist Mikao Usui. Since its beginning in Japan, Reiki has been adapted across varying cultural traditions. It uses a technique commonly called palm healing or hands-on-healing. Through the use of this technique, practitioners believe that they are transferring "universal energy" through the palms of the practitioner, which they believe encourages healing.\r\n\r\n<blockquote>Reiki postulates the existence of a universal energy unknown to science and thus far undetectable surrounding the human body, which practitioners can learn to manipulate using their hands.</blockquote>\r\n\r\n<span title="11 July 2015">Imran</a>: Well, science hasn''t yet gotten around to explaining consciousness any many other fundamental miracles of nature. Even if its only a placebo, man has shown time and again the power to heal is largely in the mind. See <a href="/programs/brainsync/">brainsync</a> for example.', 'Reiki', '', 'publish', 'open', 'open', '', 'reiki', '', '', '2015-07-11 09:58:50', '2015-07-11 09:58:50', '', 0, 'http://yieldmore.org/?p=36', 0, 'post', '', 0),
(31, 1, '2015-07-11 14:58:20', '2015-07-11 14:58:20', '[info]\r\nyoutube: JD4opuIJFhE|Vedic Cosmology - Mysteries of the Sacred Universe\r\nsource: http://www.vedskaakademija.yolasite.com/resources/PDF/nauka/Mysteries%20of%20the%20Sacred%20Universe%20-%20An%20Overview.pdf\r\n[/info]\r\n\r\nMysteries of the Sacred Universe\r\nRichard L Thompson\r\n\r\nIn Conclusion (from the pdf)\r\nFor centuries the cosmology of the Bhagavatam has seemed incomprehensible to most\r\nobservers, encouraging many people either to summarily reject it or to accept it literally with\r\nunquestioning faith. If we take it literally, the cosmology of the Bhagavatam not only differs from\r\nmodern astronomy, but, more important, it also suffers from internal contradictions and violations of\r\ncommon sense. These very contradictions, however, point the way to a different understanding\r\nof Bhagavatacosmology in which it emerges as a deep and scientifically sophisticated system of\r\nthought. The contradictions show that they are caused by overlapping self-consistent interpretations\r\nthat use the same textual elements to expound different ideas.\r\n\r\nEach of the four interpretations I’ve presented deserves to be taken seriously because each is\r\nsupported by many points in the text that are consistent with one another while agreeing with modern\r\nastronomy. I’ve applied the context-sensitive or multiple-aspect approach, in which the same subject\r\nhas different meanings in different contexts. This approach allows for the greatest amount of\r\ninformation to be stored in a picture or text, reducing the work required by the artist or writer. At the\r\nsame time, it means that the work cannot be taken literally as a one-to-one model of reality, and it\r\nrequires the viewer or reader to understand the different relevant contexts. This can be difficult when\r\nknowledge of context is lost over long periods of time.', 'Vedic Cosmology', '', 'publish', 'open', 'open', '', 'vedic-cosmology', '', '', '2015-07-11 14:58:20', '2015-07-11 14:58:20', '', 0, 'http://yieldmore.org/?p=37', 0, 'post', '', 0),
(32, 1, '2015-07-12 07:53:01', '2015-07-12 07:53:01', '[info]\r\nlink:http://suefitzmaurice.com/how-to-meditate-free-course|How to Meditate - Sue FitzMaurice\r\nlink:http://www.onlinemeditation.org/|online meditation\r\nlink:http://www.satyamyogatrust.net/yogasadhana.php|Satyam Yoga Trust, Chennai\r\nlink:http://www.artofliving.org/in-en/meditation|artofliving.org\r\nlink:http://www.wikihow.com/Meditate|wikihow\r\nlink:http://www.how-to-meditate.org|Buddhist Meditations\r\nlink:https://www.dhamma.org|Vipassana Meditation (10 day silence courses)\r\n[/info]\r\n\r\nEveryone has atleast heard the word. We leave the links above to explain what it is and hope that in time, our own contributors will expand this page.', 'Meditation', '', 'publish', 'open', 'open', '', 'meditation', '', '', '2015-07-13 08:20:52', '2015-07-13 08:20:52', '', 0, 'http://yieldmore.org/?p=38', 0, 'post', '', 0),
(33, 1, '2015-07-12 19:28:56', '2015-07-12 19:28:56', '[info]\r\nyoutube: vHk_Emakefg\r\nlink: http://www.azlyrics.com/lyrics/kansas/thewall.html\r\nPlease note as the azlyrics link says, "The Wall" lyrics provided for educational purposes and personal use only.\r\n[/info]\r\n\r\nI''m woven in a fantasy,\r\nI can''t believe the things I see\r\nThe path that I have chosen now has led me to a wall\r\nAnd with each passing day I feel a little more like something dear was lost\r\n\r\nIt rises now before me,\r\nA dark and silent barrier between,\r\nAll I am, and all that I would ever want to be\r\nIt''s just a travesty,\r\nTowering, marking off the boundaries my spirit would erase\r\n\r\nTo pass beyond is what I seek,\r\nI fear that I may be too weak\r\nAnd those are few who''ve seen it through to glimpse the other side,\r\nThe promised land is waiting like a maiden that is soon to be a bride\r\n\r\nThe moment is a masterpiece,\r\nThe weight of indecision''s in the air\r\nStanding there,\r\nThe symbol and the sum of all that''s me\r\nIt''s just a travesty,\r\nTowering, blocking out the light and blinding me\r\nI want to see\r\n\r\nGold and diamonds cast a spell,\r\nIt''s not for me, I know it well\r\nThe riches that I seek are waiting on the other side\r\nThere''s more than I can measure in the treasures of the love that I can find\r\n\r\nAnd though it''s always been with me,\r\nI must tear down the wall and let it be\r\nAll I am, and all that I was ever meant to be,\r\nIn harmony\r\nShining true and smiling back at all who wait to cross\r\nThere is no loss', 'The Wall - Kansas', '', 'publish', 'open', 'open', '', 'the-wall-kansas', '', '', '2015-07-12 19:28:56', '2015-07-12 19:28:56', '', 0, 'http://yieldmore.org/?p=33', 0, 'post', '', 0),
(34, 1, '2015-07-12 19:32:05', '2015-07-12 19:32:05', '[info]\r\nyoutube: hHDZ5rYiMz0\r\nlink: http://www.azlyrics.com/lyrics/uriahheep/ladyinblack.html\r\nLyrics is provided for inspirational/educational use only.\r\n[/info]\r\n\r\nShe came to me one morning\r\nOne lonely Sunday morning\r\nHer long hair flowing in the midwinter wind\r\nI know not how she found me\r\nFor in darkness I was walking\r\nAnd destruction lay around me\r\nFrom a fight I could not win\r\n\r\nAhh Ahh Ahh, Ahh Ahh Ahh Ahh\r\n\r\nShe asked me name my foe then\r\nI said the need within some men\r\nTo fight and kill their brothers\r\nWithout thought of love or God\r\nAnd I begged her give me horses\r\nTo trample down my enemies\r\nSo eager was my passion\r\nTo devour this waste of life\r\n\r\nAhh Ahh Ahh, Ahh Ahh Ahh Ahh\r\n\r\nBut she wouldn''t think of battle that\r\nReduces men to animals\r\nSo easy to begin\r\nAnd yet impossible to end\r\nFor she''s the mother of all men\r\nWho counselled me so wisely then\r\nI feared to walk alone again\r\nAnd asked if she would stay\r\n\r\nOh lady lend your hand outright\r\nAnd let me rest here at your side\r\nHave faith and trust in peace she said\r\nAnd filled my heart with life\r\n\r\nThere''s no strength in numbers\r\nHave no such misconception\r\nBut when you need me\r\nBe assured I won''t be far away\r\n\r\nAhh Ahh Ahh, Ahh Ahh Ahh Ahh\r\n\r\nThus having spoke she turned away\r\nAnd though I found no words to say\r\nI stood and watched until I saw\r\nHer black cloak disappear\r\nMy labour is no easier\r\nBut now I know I''m not alone\r\nI''ll find new heart\r\nEach time I think upon that windy day\r\n\r\nAnd if one day she comes to you\r\nDrink deeply from her words so wise\r\nTake courage from her as your prize\r\nAnd say hello from me\r\n\r\nAhh Ahh Ahh, Ahh Ahh Ahh Ahh', 'Lady In Black - Uriah Heep', '', 'publish', 'open', 'open', '', 'lady-in-black-uriah-heep', '', '', '2015-07-12 19:39:55', '2015-07-12 19:39:55', '', 0, 'http://yieldmore.org/?p=34', 0, 'post', '', 0),
(35, 1, '2015-07-12 20:24:39', '2015-07-12 20:24:39', 'posted at: http://richardbach.com/contact/ on 13 July 2015\r\n\r\nHi Richard,\r\n\r\nI''ve been a big fan for the last 15 years. Am only 32 so thats most of my life!\r\n\r\nLately I''ve been inspired to create a kind of collaborative website for inspiration and progressive thinking and books are a critical for this to be the most impactful.\r\n\r\nMy idea is to make the actual content of books available and I''m trying to do this legally. The idea on my website is to have the book content, like:\r\nhttp://yieldmore.org/works/prometheus-unbound/\r\navailable and then for users to share quotes and cite it in discussions and articles.\r\n\r\nIt would be sad if all I could do was link the books at\r\nhttp://yieldmore.org/authors/richard-bach/\r\nback to amazon / other retail stores. It would be better if we could have copyright as detailed here:\r\nhttp://yieldmore.org/biblios/\r\n\r\nI actually wrote this to you and other copyright holders in 2013 when I was in America briefly and for the first time\r\nhttp://cselian.com/blog/yield/free-our-treasures/\r\n\r\nI would like permission to publish your more inspirational books on my website.\r\n\r\nI love the way you say in Curious Lives that you would walk out and rebuild the universe. Its with a passion like that that I''m trying to make this baby work. So please, help me. And may the force be with you.\r\n\r\nAlways,\r\nYours Lovingly,\r\nImran Ali Namazi', 'Copyfight', '', 'publish', 'open', 'open', '', 'copyfight', '', '', '2015-07-12 20:24:39', '2015-07-12 20:24:39', '', 0, 'http://yieldmore.org/?p=35', 0, 'post', '', 0),
(36, 1, '2015-07-14 02:15:44', '2015-07-14 02:15:44', '[info]\r\nwiki: Golden Age\r\nyoutube:GVtJ-yzqT24|The yugas of Sri Yukteswar\r\nlink:http://www.google.com/?q=the+holy+science|The Holy Science\r\nyoutube:LAgd5KS-ULc|Tide of Time\r\n[/info]\r\n\r\nIn Greek history, we have the Ages (see wiki link). In the Vedic culture, we have the Yugas. The Kali yuga (Iron Age), Dwapara yuga (Bronze Age), Treta yuga (Silver Age) and Satya yuga (Golden Age) correspond to the four Greek ages.\r\n\r\nIt is commonly (and erroneously) believed that the current is the Iron age / Kali yuga / age of decline.\r\n\r\nThe The yugas of Sri Yukteswar (see link) as described in his book The Holy Science (see link) states that the Dwapara Yuga (Silver Age) began in 1700AD.\r\n\r\nThis idea is reinforced by <a href="http://isha.sadhguru.org" target="_blank">Jaggi Vasudev''s Tide of Time (see link)</a>\r\n\r\n[user]Imran[/user]: Belief in an Age is important - do you accept a more enlightened and glorious past? Do you think this is an age of decline? If you accept this as D315 (year 315 of the Dwapara Yuga), then your outlook on life and where the world is heading has to be optimistic!', 'Ages', '', 'publish', 'open', 'open', '', 'ages', '', '', '2015-07-14 10:14:02', '2015-07-14 10:14:02', '', 0, 'http://yieldmore.org/?p=36', 0, 'post', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(37, 1, '2015-07-14 09:53:26', '2015-07-14 09:53:26', '[info]\r\nfreepdf: http://www.paulmason.info/gurudev/sources/pdf/Sayings%20of%20Swami%20Shantanand%20Saraswati.pdf\r\nwiki: Shantananda Saraswati\r\nlink: http://satsangwithswamiji.com\r\n[/info]\r\n\r\n<h2>Meditation</h2>\r\nThe whole of our mind has for so long been associated with the outer world that it has quite forgotten the existence, let alone the language of the inner world. The moving mind looks for happiness in getting and experiencing things. These do not suffice for when the mind has one thing it immediately rushes after another. The still mind finds happiness in everything. The kingdom within or the heaven within is the reservoir of peace and bliss. Dive in with devotion and swim around gently in that blissful heaven that is within you.\r\nWhen we go into meditation we reach a spiritual world where quietness prevails like that of a deep, undisturbed ocean. There is no movement – no waves, no currents – everything is absolutely stationary.\r\nThis is the meditational world. When we look out from such a spiritual world our own being or Self is seen in everything and nothing else remains.\r\nThe ultimate end of meditation is to reach total immobility, or the profound stillness, which is very deep.\r\nNo meter can measure it -- it is without end. It is not necessary to remain in this state for a long period.\r\nMost of the time spent during meditation is in preparation to lead one to this state. The stillness itself is the real experience of meditation.\r\nIn a diamond mine, thousands of tons of stone are cut 300 feet below the ground. It is brought up, broken into pieces, processed, washed and then spread out to try. Thousands of people are engaged in picking over these small stones and looking at them. All this process goes on and ultimately they may find about 100 grams of diamonds. This also happens in meditation – so you will have to give half an hour simply to get just a few moments of contact with the Self, and it is worthwhile because you do get a diamond – the real force, the most valuable precious material of anybody’s life.\r\nThe whole universe is divided into two – I and the rest! This is the world of division and we live in this world of duality. The method of meditation is to lead us from duality to unity. This method is not the end. It is like a rope through which we can go into the well or come out. Once the necessary is accomplished, the rope is left behind. The mantra is not unity, it only leads to unity where the world of division disappears. This unity is the Absolute, Known as Truth, Consciousness and Bliss. Once we reach there, a miraculous alchemy takes place, and the being is charged with energy just as one gets a car battery charged for further use. If, in meditation, after sounding the mantra, we start looking for anything, maybe a sound or substance, we undo the meditation. Even talking of “appreciation” is duality. In deep meditation we don’t even appreciate the peace, truth, bliss or consciousness; we in fact become peaceful, truthful, blissful and conscious of the Self. One must give up all ideas of appreciating anything about the mantra. The mantra will naturally settle down into that unity where there is no activity and no division.\r\nWhen one sits for meditation in a still position, there may be distractions outside and these distractions will attract the mind. Pay them no mind. Apart from the outer distractions, there are internal riots!\r\nThese keep going on in the mind; it keeps returning to certain things that it wants to do – it is simply presenting different “files” for your consideration! When you are almost still, you can give more energy to these files, so your mind tries to get you to look at them. In fact this is not the time for them, so make a resolution – tell the mind that this is not the time for those files – “When I have finished my meeting with the Self, then I will surely attend to them!” Then attend to those files later, resolving those questions which seem to be bothering the mind. This is the way – order him – he will follow your commands provided you do command. Make a resolution, let him stay at the gate, and ask him not to allow any files to be presented to you because this is not the time. You will see them later on. And then attend to them later on.\r\nIn meditation one is just One. One becomes the Self. The method of meditation is only a process by which this is made possible.\r\nThe causal or spiritual level of rest, which is profound stillness or total immobility, is in the realm of the Absolute. Since the causal realm cannot be described, one learns about it from its effects. One can see it in the activities and dispositions of those who provide themselves with spiritual rest. There are three prominent features.\r\nFirst, they show love and affection towards everything they encounter. All activities are initiated with love, and then held and nourished with love till they come to their fulfillment. All relationships with individuals or activities, direct or indirect, are illuminated and guided only by love and affection.\r\nSecond, their ideas, intentions or motives are pure and simple. Purity and simplicity widen the horizon, and they think and work for the whole of humanity and only through the laws of the Absolute. The divisions of groups, races or nations disappear and only natural laws are employed. Their thoughts naturally encompass the whole of the human family, and its intrinsic goodness.\r\nThird, the physical movements of such people are tuned to the natural rhythm, and the result is simplicity and economy of movement. They never rush into any situation, are never agitated, and perform all actions in an efficient, sublime and refined way. Whatever they do will emerge from stillness, be held in stillness, and again submerge in the same stillness which they experience in this great total immobility. This is an ideal or a standard for the common man to aspire to, if he somehow awakes to the need to improve his state.\r\nIn the spiritual world there are books to give you knowledge, but more knowledge doesn’t make you a Realized Man. You need experience. Unless you go on the path, knowledge of the path is useless. What books can’t give you, a teacher can. But above all, although you can get almost anything from others, Realization you must experience yourself.\r\n\r\n<h2>Atman and Param-Atman</h2>\r\nAtman is universal, constant, all pervasive, light and conscious. All that is not Atman is limited, unstable or transitory, partial, heavy, dark and not conscious. With Viveka (discrimination between what is real and unreal, between the permanent and the impermanent) one sees Atman everywhere in everything at all times. A wise man, one with Viveka, treats everyone as himself and sees the Self in everyone. He is always awake, just, full of love and happiness all the time.\r\nWe do not see or understand that the changes take place in our nature and not in Atman. Atman is not subject to change. One who understands this becomes very light and walks in freedom without carrying the load of the world. He is one who enjoys the drama in its true sense and never associates himself with the characters of the drama. Our job is simply to watch and enjoy.\r\n\r\nThe Absolute is the embodiment of love, knowledge and devotion. It is limitless in every sense and its door is always open. The universe is one and full of love and everything is motivated by love. Let love flow without hindrance from any direction.\r\nTo be able to acquire universal grace constantly all one needs to do is to keep one’s inner door open, open in the direction of the Absolute. The universal grace of the Absolute permeates the universe so it is available all the time. If the memory of the universal grace is kept alive, then it forms a connection and\r\nallows one to be receptive to grace all the time.\r\n\r\n<h2>Good Qualities</h2>\r\nThe collection of good qualities is essential. The good qualities are these: (1) One should always love to speak the truth so that there is no disparity between what one thinks, what one says and what one does. There should be complete correspondence between ideas with activities. (2) Cultivate the love of people, encouraging them in turn to express their love through certain types of activity. (3) Be magnanimous in dealing with those around you.\r\nThere is a Sanskrit verse which says that, if one learns to understand that one is part of the universe and one has equal status with everyone else, then give to others what you would like given to you. What pleases you should be made available for the pleasure of others – or do as you would be done by!\r\nWe should cultivate the habit of never thinking of the defects of others, nor our own. Our attitude should be to overlook and ignore them. Let good thoughts prevail.\r\nIt is quite possible to get for a few pence a copy of the Bhagavad Gita, which holds the philosophy of liberation, but the essence and truth and knowledge of the Bhagavad Gita cannot be bought even for a million rupees. That truth or knowledge is only available if one practices three-fold work. The first is trust, faith. With faith one should prepare oneself and take to the work, in service of the Absolute. The second is the sincerity with which one attends to the work or knowledge which is being given, and one tries to understand and put the whole thing into practice again and again. The third is discipline to gain\r\ncontrol over the senses and the mind. Control over the senses and the mind is essential, otherwise the disciplines are lost in due course.\r\nThrough your beneficial and holy efforts, let your own fullness see the fullness of the Param-Atman, and let the practice, the practitioner and the object of practice merge together to form a single identity.\r\nThen the world as such disappears and the Param-Atman appears in its place.\r\n\r\n<h2>True Freedom</h2>\r\nA man who owns a small estate, on acquiring a bigger one, feels freer because he can manipulate more resources than he was used to. But this is not real freedom. Real freedom is achieved by realizing that you are one with Truth, Consciousness and Bliss and so not attached or identified with anything at all. That is true freedom.\r\nThe mind is never satisfied with what it has, and always desires something quite different. While a poor man envies the comforts of the rich and wants to be rich too, a rich man is weary of his anxieties and envies the carefree sleep of one who has nothing. A sick man worries about getting well, only making his sickness worse, while a man in good health worries that he may get ill. The mind also has a tendency to live more in the past and the future than the present. This combination of dissatisfaction with the present and the perpetual desire for something different in the future causes perpetual unhappiness.\r\nThe remedy is to see, with the eye of true knowledge, the same thing in everything, and that same thing is Param-Atman. Then the outlook becomes balanced and unified, unrest giving place to tranquility.\r\n\r\n<h2>True Renunciation</h2>\r\nThe creation is such that everything has a purpose and must fulfill its function; so it must keep circulating, it must be used. Use everything, and give up the idea that you are renouncing. Don’t hold on to anything in this creation; that can only be done by this final renunciation of giving up the idea that you have anything. In fact, you have nothing. Everything is of the Absolute, everything is permeated by the Absolute; you use whatever you need, and the rest simply belongs to Him. This is true renunciation.\r\nTrue knowledge is made available to everyone, to show that all this beauty is really the creation of your own Self. It is free to be enjoyed and to give the bliss which is what you really want. Don’t attach yourself to anything because, the moment you do, the bliss will disappear. The creation is totally free; there is no bondage whatsoever. You can appreciate everything in this creation and be happy. You need not be attached and miserable, trying to be free. You are free and you are made free, and a free man knows that everyone is free.\r\nWhat we have to give up is the desire to benefit from our actions – and not the actions themselves. If we give up actions but continue to indulge in desires, then we would be simply pretending to give up.\r\nBefore undertaking an action, an ordinary worldly man always tries to assess what benefit would accrue to him as a result. But a Realized Man undertakes it as a matter of duty, with no desire for its consequential benefits.\r\nWe should bear in mind that, whatever the Creator has given to the world, He has “given it up” to the world. He no longer asserts any ownership over it. We also should cultivate the habit of using and enjoying it as His gift and not our own property. This attitude will correct our evil tendencies, and then the practice of devotion or meditation will begin to bear fruit.\r\nAttachment means to consider as ours what really belongs to God. Our body, our house, our wealth, our sons, etc. Give up this feeling and you rid yourself of all your troubles. Do not think that the world around you is insubstantial. Rather it is your feeling of attachment to it that is insubstantial. Whatever is\r\nhappening around you is right. What is wrong about it is the view you are taking of it. If you could correct your viewpoint, you would be happy.\r\nWe must carry the idea that we own nothing. Everything has now become God’s; we are using everything with His permission, and not as owners. This helps with the elimination of the individual ego – then the pure realization of the Self develops.\r\nGiving up can be done mentally and intellectually at all times and in all conditions. In this, there is no question of today or tomorrow, or of one or two days a week. Practice giving up all the time. You must consider the body, the mind and the intellect as belonging to the Param-Atman, and as offering all these to Param-Atman. This is what giving up means.\r\n\r\n<h2>Death</h2>\r\nThe following teachings from the Bhagavad Gita tell us how to deal with death: (1) Forget the past. Do not fear the future either. Devote the present to Param-Atman. A devotee of Param-Atman never perishes;\r\n2) for two half-hour periods of meditation a day, give up all duties and obligations; surrender yourself completely to the single care and protection of Param-Atman. He will save you from all evil consequences, and therein would lie the end of all your worries.\r\n3) One who sees Param-Atman in everybody and everything in Param-Atman – to him Param-Atman never becomes obscure and he never becomes obscure to Param-Atman.\r\nWe fear death because, under the influence of Maya, we have forgotten our Selves. And it is this forgetting of the divine Self which makes for us all the troubles we get. It is not God who is the maker of our troubles.\r\nAfter constant meditation and work on oneself, the adept starts to realize that a man is not just flesh and bones: he has a soul, he has consciousness, and he is bliss. When he has realized this fully, everything becomes simple for him. Whatever he does, the way he moves, the way he talks, reflects the dignity of Atman, which is pure consciousness and bliss.\r\nIn one of the scriptures it says, “This body is only flesh and bones; cease to be attached to it.” Transfer your attachment to the Atman. Because Atman is part of the Param-Atman, there is no difference between the two. Both are able to cut worldly bondages.\r\nBeing part of the Absolute, the individual is fundamentally all knowledge, fundamentally all joy. Surrendering oneself to God removes illusion. Then True knowledge dawns and we realize there is no death for us, that no knowledge is hidden from us and that the fullest joy is always with us. The Present\r\nThere is a Sanskrit verse in which it is said, “The Absolute is here in the present. See, enjoy and communicate with Him, and do not bother your head with the past or the future.” You cannot bring the past to life, you cannot tailor the future as you want. Both things are beyond the control of the individual, so we should not bother our head least about the past and the future. With the memory of the Absolute we should try to make use of the present with all the glorious things that the Absolute offers in the present moment. The present is always lit, because it is the presence of the Absolute, and the light of the Absolute falls on the present. There is nothing to worry about or fear in the present. Past and future are very dark, and that is where the fears are, and it is only fears of some sort that drag individuals to the past or future. Whenever you find that we are travelling towards the darkness of the past or future, come into the light of the day – the light of the present. It has been observed in the scriptures that the wise man behaves like a child, not that his actions are childish, but because of his wisdom he is alive to the present. The child is neither bothered by the past nor does it hanker for the future. The wise man who behaves like a child is always filled with bliss. He is not influenced by the deeds of the past or by expectations of the future. He is always in bliss and free.\r\n\r\n<h2>Darkness and Light</h2>\r\nThere can be no darkness without light. Do not be afraid of the darkness, there is light beyond it. If there is total darkness, then even a small light will shine out. But when the place is completely illuminated, the small light appears very insignificant, almost negligible. When you feel you are lost in darkness, this creates fear, but do not be afraid, because there is light shining beyond it. Have full faith in it – that there is light and that will remove your fear completely.\r\nIf we give some time to reading holy books, some time to thinking of Param-Atman, then our wisdom matures; darkness no longer frightens us, and we attain supreme happiness. Not only this, but we begin to radiate happiness, which affects our surroundings as well as those around us.\r\n\r\n<h2>Resolve</h2>\r\nIn the end it is up to the individual to decide once and for all that he is going to love only the truth and leave the rest. And he must stand by it. Only then is transformation possible', 'Swami Shantanand Saraswati', '', 'publish', 'open', 'open', '', 'swami-shantanand-saraswati', '', '', '2015-07-14 09:53:26', '2015-07-14 09:53:26', '', 0, 'http://yieldmore.org/?p=38', 0, 'post', '', 0),
(38, 1, '2015-07-16 03:11:16', '2015-07-16 03:11:16', '[info]\r\nlink:http://www.azlyrics.com/lyrics/davidgilmour/shortandsweet.html\r\n[/info]\r\n\r\nYou ask what is the quality of life?\r\nSeeking to justify the part you play\r\nAnd hide, fearing it incomplete\r\nTo try to make it any more or less than short and sweet\r\n\r\nBut short, short is from you to me\r\nAs close as we are wont to try to make it be\r\nWe''re caught watching the dark in the sky\r\nWho knows, helpless as time itself to hold the time of day\r\n\r\nAnd you, you are a fantasy\r\nA view from where you''d like to think the world should see\r\nBe true and you will likely find\r\nA few building a vision new and justice to our time\r\n\r\nAnd we, we, the immoral men\r\nWe dare, naked and fearless in the elements\r\nAnd free, carefree of tempting fate\r\nAware and holding off the moral nightmare at the gates\r\n\r\nAnd sweet, sweet as a mountain stream\r\nWe''ll look toward a new day breaking in the east\r\nWe''ll meet as every future dream unfolds\r\nAnd surely quality that is the very least', 'Short And Sweet', '', 'publish', 'open', 'open', '', 'short-and-sweet', '', '', '2015-07-16 03:46:27', '2015-07-16 03:46:27', '', 0, 'http://yieldmore.org/?p=40', 0, 'post', '', 0),
(43, 1, '2015-07-18 07:30:48', '2015-07-18 07:30:48', 'This is a book by a Karmayogi simply named Sky. It''s also in the writing stage and will take 6 months to complete.', 'Boundless as the Sky', '', 'publish', 'open', 'open', '', 'boundless-as-the-sky', '', '', '2015-07-18 07:30:48', '2015-07-18 07:30:48', '', 0, 'http://yieldmore.org/?p=43', 0, 'post', '', 0),
(39, 1, '2015-07-18 05:18:37', '2015-07-18 05:18:37', 'Sophia is a fictitious being that lives on this website. Her name means Wisdom. She is the voice of our key contributors. This book is being collaboratively written by 4 people and will take a year to complete.\r\n\r\nIf you are interested in contributing, please contact <a href="mailto:shasa@cselian.com?subject=YieldMore Sophia Project" target="_blank">shasa@cselian.com</a>.\r\n\r\n[work config fol=books/sophia]', 'The Book of Sophia', '', 'publish', 'open', 'open', '', 'the-book-of-sophia', '', '', '2015-07-18 07:27:08', '2015-07-18 07:27:08', '', 0, 'http://yieldmore.org/?p=41', 0, 'post', '', 0),
(44, 1, '2015-07-18 07:43:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-18 07:43:25', '0000-00-00 00:00:00', '', 0, 'http://yieldmore.org/?p=44', 0, 'post', '', 0),
(45, 7, '2015-07-18 07:52:48', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-18 07:52:48', '0000-00-00 00:00:00', '', 0, 'http://yieldmore.org/?p=45', 0, 'post', '', 0),
(46, 1, '2015-07-19 04:03:51', '2015-07-19 04:03:51', 'The Cselian Book and Publishing Project (Biblios) preserves notable works in a modern, easy to read, online manner.\n\nBiblios will let you save bookmarks online, make and share quotes, take notes etc, and solves some difficulties viz:\n<ul>\n	<li>Books online are difficult to read (bad site design, too many ads / images), and lack some features.</li>\n	<li>PDFs dont show <a href="http://biblios.cselian.com/jls/search.php?q=fly" target="_new">search results</a> with context and are not suitable for reading across multiple devices.</li>\n	<li>Often when reading a hard-copy, we want to store <a href="http://biblios.cselian.com/prophet/quote.php?all=1" target="_new">memorable bits</a> for future reading / sharing with friends.</li>\n	<li>Other languages are not always <a href="http://biblios.cselian.com/eg/transliterations.php" target="_new">given</a> <a href="http://biblios.cselian.com/eg/search.php?q=transliterations" target="_new">special</a> <a href="http://biblios.cselian.com/eg/series1-chapter18-the-divine-worker" target="_new">attention</a> nor are the <a href="http://biblios.cselian.com/vs/" target="_new">transliterations</a>.</li>\n</ul>\n\n<h1>Copyright</h1>\nNone of these books have copyright permissions yet.\n\nYou must first agree to our <b>usage terms</b> before reading them:\n<blockquote>My purpose in using this site is to read or use as a reference, books that I have already read or own. Also I''d like to preview unread books. I do declare that my intention is not to read books for free, denying due royalty owed to the Author and Publishers.</blockquote>\n\nIn the long run, we hope to contact copyright holders and have them allow:\n<ul>\n	<li>readers agree to something like our Fair Usage Terms and can be tracked by them.</li>\n	<li>Books only being available if you pay for them.</li>\n	<li>quotes / search results being available, and perhaps additionally a previewable amount of the book.</li>\n	<li>People sponsor other readers.</li>\n	<li>We do fundraisers to buy copyrights.</li>\n</ul>\n\n<h1>Whose Works:</h1>\nThe works of any and all are welcome, if it meets our <a title="Will be expanded">criteria</a> - progressive in nature, truly inspirational, and does not refute the validity of other faiths / works.\nHaving only just begun, the focus is on <a href="http://cselian.com/blog/my/share/aurobindos-independance-day-message/" target="_blank">Indian Spiritualism</a>, but would like to expand to <a href="http://www.williambloom.com/writings/penguin-new-age-intro-63.htm" target="_blank">any mature works</a> and other faiths.\nWe are also trying rethink <a href="http://www.google.com/search?q=paperless%20philosophy" target="_blank">online publication</a> and help smaller organizations and individuals do so at no cost.\n\n<h1>Copyright and Revenue:</h1>\nThere are several kinds of content we want on our site viz:\n<ul>\n	<li>Works that are <a href="http://en.wikipedia.org/wiki/Public_domain" target="_blank">already free</a>.</li>\n	<li>Works that can be had free or at a nominal price.</li>\n	<li>Donors <a href="http://en.wikipedia.org/wiki/Pay_it_forward" target="_new">pay it forward</a> to X number of friends and other interested readers.</li>\n	<li>We do collection runs to buy out copyright holders and set the works free.</li>\n</ul>\n\n<h1>Feature Roadmap:</h1>\n<ul>\n	<li><span style="text-decoration: underline;">Personal</span>: Registered account, Notes, Quotes, Download and read offline.</li>\n	<li><span style="text-decoration: underline;">Social:</span> <a title="A companion site like Shelfari, but for anything">Track and review</a> works, <a title="Telling us which books you would like to contribute to will help us choose which ones to free">mention your budget</a>, explore a <a title="A directory of Yogis, Ashrams and Trusts">directory</a> and use our forum.</li>\n	<li><span style="text-decoration: underline;">Compiler</span>: Translations, Interpretations, Theses.</li>\n	<li><span style="text-decoration: underline;">Authoring</span>: Publish works, collect royalties, Authoring Tools.</li>\n</ul>\n', 'Biblios', '', 'inherit', 'open', 'open', '', '4-autosave-v1', '', '', '2015-07-19 04:03:51', '2015-07-19 04:03:51', '', 4, 'http://yieldmore.org/articles/4-autosave-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_quotes`
--

CREATE TABLE IF NOT EXISTS `wp_quotes` (
  `quote_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `quote_post_ID` bigint(20) NOT NULL,
  `quote_user_ID` bigint(20) NOT NULL,
  `quote_date` datetime NOT NULL,
  `quote_name` varchar(128) NOT NULL,
  `quote_config` varchar(256) NOT NULL,
  `quote_content` varchar(32768) NOT NULL,
  PRIMARY KEY (`quote_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `wp_quotes`
--

INSERT INTO `wp_quotes` (`quote_ID`, `quote_post_ID`, `quote_user_ID`, `quote_date`, `quote_name`, `quote_config`, `quote_content`) VALUES
(1, 3, 1, '0000-00-00 00:00:00', 'sample', 'node=p2,subnode=,page=11,para=1,endpage=11,endpara=2', '<blockquote class="quote">Quote from: <a href="http://yield/works/jonathan-livinsgston-seagull/?node=partp2"></a><br /></blockquote>'),
(2, 3, 1, '0000-00-00 00:00:00', 'sample', 'node=p2,subnode=,page=11,para=3,endpage=11,endpara=3', '<blockquote class="quote">Quote from: <a href="http://yield/works/jonathan-livinsgston-seagull/?node=partp2"></a><br /><b>Page: 11 (3)</b><p>It felt like a seagull body, but alreadv it flew far better than  his old one had ever flown. Why, with half the effort, he  thought,  I&#39;ll  get twice the speed, twice the performance of my best days on Earth!</p>\r\n</blockquote>'),
(3, 3, 1, '0000-00-00 00:00:00', 'sample2', 'node=p2,subnode=,page=14,para=9,endpage=15,endpara=1', '<blockquote class="quote">Quote from: <a href="http://yield/works/jonathan-livinsgston-seagull/?node=partp2"></a><br /><b>Page: 14 (9)</b><p>Without warning, Chiang vanished and appeared  at  the  water&#39;s  edge fifty feet away, all in the flicker of an instant. Then he vanished  again and stood, in the same millisecond, at Jonathan&#39;s shoulder. "It&#39;s kind  of fun," he said.</p>\r\n<b>Page: 15</b><p>Jonathan was dazzled. He forgot to ask about heaven. "How do  you  do that? What does it feel like? How far can you go?"</p>\r\n</blockquote>'),
(4, 3, 1, '0000-00-00 00:00:00', 'vichu', 'node=p2,subnode=,page=17,para=3,endpage=18,endpara=4', '<blockquote class="quote">Quote from: <a href="http://yield/works/jonathan-livinsgston-seagull/?node=partp2"></a><br /><b>Page: 17 (3)</b><p>A month went by, or something that  felt  about  like  a  month,  and Jonathan learned at a tremendous rate. He always had learned quickly  from ordinary experience, and now, the special student of the Elder Himself, he took in new ideas like a streamlined feathered computer.</p>\r\n<p>But then the day came that  Chiang  vanished.  He  had  been  talking quietly with them all, exhorting them never to  stop  their  learning  and their practicing and their striving to  understand  more  of  the  perfect invisible principle of all life. Then, as  he  spoke,  his  feathers  went brighter and brighter and at last turned so brilliant that no  gull  could look upon him.</p>\r\n<p>"Jonathan," he said, and these were the last  words  that  he  spoke, "keep working on love."</p>\r\n<p>When they could see again, Chiang was gone.</p>\r\n<p>As the days went past, Jonathan found himself thinking time and again of the Earth from which he had come. If he had known there just  a  tenth, just a hundredth, of what he knew here, how  much  more  life  would  have meant! He stood on the sand and fell to wondering if there was a gull back there who might be struggling to break out  of  his  limits,  to  see  the meaning of flight beyond a way of  travel  to  get  a  breadcrumb  from  a rowboat. Perhaps there might even have been one made Outcast for  speaking his truth in the face of the Flock. And the more  Jonathan  practiced  his kindness lessons, and the more he worked to know the nature of  love,  the more he wanted to go back to Earth. For  in  spite  of  his  lonely  past, Jonathan Seagull was born  to  be  an  instructor,  and  his  own  way  of demonstrating love was to give something of the truth that he had seen  to a gull who asked only a chance to see truth for himself.</p>\r\n<b>Page: 18</b><p>Sullivan, adept now at thought-speed flight and helping the others to learn, was doubrful.</p>\r\n<p>"Jon, you were Outcast once. Why do you think that any of  the  gulls in your old time would listen to you now? You know the proverb,  and  it&#39;s true: The gull sees farthest who flies highest. Those gulls where you came from are standing on the ground, squawking and fighting among  themselves. They&#39;re a thousand miles from heaven - and you say you want to  show  them heaven from where they stand! Jon, they can&#39;t see their own wingtips! Stay here. Help the new gulls here, the ones who are high enough  to  see  what you have to tell them." He was quiet for a moment, and then he said, "What if Chiang had gone back to his old  worlds?  Where  would  you  have  been today?"</p>\r\n<p>The last point was the telling one, and Sullivan was right  The  gull sees farthest who flies highest.</p>\r\n<p>Jonathan stayed and worked with the new birds coming in, who were all very bright and quick with their lessons. But the old feeling  came  back, and he couldn&#39;t help but think that there might be one or two  gulls  back on Earth who would be able to learn, too. How  much  more  would  he  have known by now if Chiang had come to him on the day that he was Outcast!</p>\r\n</blockquote>'),
(5, 3, 1, '0000-00-00 00:00:00', 'same', 'node=p3,subnode=,page=23,para=2,endpage=23,endpara=3', '<blockquote class="quote">Quote from: <a href="http://yield/works/jonathan-livinsgston-seagull/?node=partp3"></a><br /><b>Page: 23 (2)</b><p>And so they flew in from the west that morning, eight of  them  in  a double-diamond formation, wingtips almost overlapping.  They  came  across the Flock&#39;s Council  Beach  at  a  hundred  thirty-five  miles  per  hour, Jonathan in the lead. Fletcher smoothly at his right  wing,  Henry  Calvin struggling gamely at his left. Then the whole formation rolled  slowly  to the right, as one bird... level... to... inverted... to... level, the wind whipping over them all.</p>\r\n<p>The squawks and grockles of everyday life in the Flock were  cut  off as though the formation were a giant knife, and eight  thousand  gull-eyes watched, without a single blink. One by  one,  each  of  the  eight  birds pulled sharply upward into a full loop and flew all the way  around  to  a dead-slow stand-up landing on the sand. Then as though this sort of  thing happened every day, Jonathan Seagull began his critique of the flight.</p>\r\n</blockquote>'),
(6, 3, 1, '0000-00-00 00:00:00', 'daddy', 'node=p2,subnode=,page=11,para=3,endpage=11,endpara=4', '<blockquote class="quote">Quote from: <a href="http://yield/works/jonathan-livinsgston-seagull/?node=partp2"></a><br /><b>Page: 11 (3)</b><p>It felt like a seagull body, but alreadv it flew far better than  his old one had ever flown. Why, with half the effort, he  thought,  I&#39;ll  get twice the speed, twice the performance of my best days on Earth!</p>\r\n<p>His feathers glowed brilliant white now, and his  wings  were  smooth and perfect as sheets of polished silver. He began, delightedly, to  learn about them, to press power into these new wings.</p>\r\n</blockquote>'),
(7, 17, 1, '0000-00-00 00:00:00', 'kids', 'node=c4,subnode=,page=13,para=3,endpage=13,endpara=', '<blockquote class="quote">Quote from: <a href="http://yield/works/the-prophet/?node=chapterc4"></a><br /><b>Page: 13 (3)</b><p>Your children are not your children.</p>\r\n<p>They are the sons and daughters of Life&#39;s longing for itself.</p>\r\n<p>They come through you but not from you,</p>\r\n<p>And though they are with you, yet they belong not to you.</p>\r\n<p>You may give them your love but not your thoughts.</p>\r\n<p>For they have their own thoughts.</p>\r\n<p>You may house their bodies but not their souls,</p>\r\n<p>For their souls dwell in the house of tomorrow, which you cannot visit, not even in your dreams.</p>\r\n</blockquote>'),
(8, 15, 1, '0000-00-00 00:00:00', 'fighters creed', 'node=s1,subnode=c7,page=66,para=2,endpage=67,endpara=', '<blockquote class="quote">Quote from: <a href="http://yield/works/essays-on-the-gita/?node=seriess1c7-chapter"></a><br /><br />\n<b>Warning</b>:  Invalid argument supplied for foreach() in <b>D:\\Imran\\xampp\\htdocs\\cs\\subds\\ym\\wp-content\\plugins\\wp-biblios\\csb-content.php</b> on line <b>74</b><br />\n</blockquote>'),
(9, 11, 1, '0000-00-00 00:00:00', 'works', 'node=s2c6,subnode=,page=335,para=1,endpage=335,endpara=1', '<blockquote class="quote">Quote from: <a href="http://yieldmore.org/works/essays-on-the-gita/?node=seriess2c6-chapter"></a><br /><b>Page: 335</b><p> once reshapes and assimilates everything in us to the law of the divine existence by a rapid transformation of the lower into the spiritual nature. The will of self-giving forces away by its power the veil between God and man; it annuls every error and annihilates every obstacle. Those who aspire in their human strength by effort of knowledge or effort of virtue or effort of laborious self-discipline, grow with much anxious difficulty towards the Eternal; but when the soul gives up its ego and its works to the Divine, God himself comes to us and takes up our burden. To the ignorant he brings the light of the divine knowledge, to the feeble the power of the divine will, to the sinner the liberation of the divine purity, to the suffering the infinite spiritual joy and Ananda. Their weakness and the stumblings of their human strength make no difference. &ldquo;This is my word of promise,&rdquo; cries the voice of the Godhead to Arjuna, &ldquo;that he who loves me shall not perish.&rdquo; Previous effort and preparation, the purity and the holiness of the Brahmin, the enlightened strength of the king-sage great in works and knowledge have their value, because they make it easier for the imperfect human creature to arrive at this wide vision and self-surrender; but even without this preparation all who take refuge in the divine Lover of man, the Vaishya once preoccupied with the narrowness of wealth-getting and the labour of production, the Shudra hampered by a thousand hard restrictions, woman shut in and stunted in her growth by the narrow circle society has drawn around her self-expansion, those too, <i>papa-yonayah</i>, on whom their past Karma has imposed even the very worst of births, the outcaste, the Pariah, the Chandala, find at once the gates of God opening before them. In the spiritual life all the external distinctions of which men make so much because they appeal with an oppressive force to the outward mind, cease before the equality of the divine Light and the wide omnipotence of an impartial Power.<a href="javascript:noteShow(this, ''f10'');"><sup><b>10</b></sup></a></p>\r\n</blockquote>');

-- --------------------------------------------------------

--
-- Table structure for table `wp_registration_log`
--

CREATE TABLE IF NOT EXISTS `wp_registration_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `IP` varchar(30) NOT NULL DEFAULT '',
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `date_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IP` (`IP`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_registration_log`
--

INSERT INTO `wp_registration_log` (`ID`, `email`, `IP`, `blog_id`, `date_registered`) VALUES
(1, 'imran@cselian.com', '123.201.63.76', 2, '2015-07-11 00:21:21'),
(2, 'imran@cselian.com', '123.201.63.76', 3, '2015-07-11 00:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `wp_signups`
--

CREATE TABLE IF NOT EXISTS `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  `title` longtext NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) NOT NULL DEFAULT '',
  `meta` longtext,
  PRIMARY KEY (`signup_id`),
  KEY `activation_key` (`activation_key`),
  KEY `user_email` (`user_email`),
  KEY `user_login_email` (`user_login`,`user_email`),
  KEY `domain_path` (`domain`(140),`path`(51))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wp_signups`
--

INSERT INTO `wp_signups` (`signup_id`, `domain`, `path`, `title`, `user_login`, `user_email`, `registered`, `activated`, `active`, `activation_key`, `meta`) VALUES
(1, '', '', '', 'vijaya', 'vijaya_srin@yahoo.com', '2015-07-11 00:59:14', '0000-00-00 00:00:00', 0, 'e6e64529e4cb6b17', 'a:0:{}'),
(2, '', '', '', 'weddingbabe8504', 'wilhelminekolodzieskimwx@yahoo.com', '2015-07-11 02:32:35', '2015-07-11 02:40:03', 1, 'c71850b32be821f1', 'a:0:{}'),
(3, '', '', '', 'weddingchica7917', 'beckischrefflerhdl@yahoo.com', '2015-07-11 10:47:51', '2015-07-11 10:50:48', 1, 'd6f19ce90e118972', 'a:0:{}'),
(4, '', '', '', 'weddingmom8168', 'lakitalofquistegu@yahoo.com', '2015-07-11 12:27:25', '2015-07-11 12:44:11', 1, '28355299da9de2e6', 'a:0:{}'),
(5, '', '', '', 'divorcelawyer7703', 'carnyreifmantwm@yahoo.com', '2015-07-11 19:13:45', '0000-00-00 00:00:00', 0, '280c2454bd988124', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_site`
--

CREATE TABLE IF NOT EXISTS `wp_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`(140),`path`(51))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_site`
--

INSERT INTO `wp_site` (`id`, `domain`, `path`) VALUES
(1, 'yieldmore.org', '/');

-- --------------------------------------------------------

--
-- Table structure for table `wp_sitemeta`
--

CREATE TABLE IF NOT EXISTS `wp_sitemeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=313 ;

--
-- Dumping data for table `wp_sitemeta`
--

INSERT INTO `wp_sitemeta` (`meta_id`, `site_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'site_name', 'YieldMore.org'),
(2, 1, 'admin_email', 'imran@cselian.com'),
(3, 1, 'admin_user_id', '1'),
(4, 1, 'registration', 'user'),
(5, 1, 'upload_filetypes', 'jpg jpeg png gif mov avi mpg 3gp 3g2 midi mid pdf doc ppt odt pptx docx pps ppsx xls xlsx key mp3 ogg wma m4a wav mp4 m4v webm ogv wmv flv'),
(6, 1, 'blog_upload_space', '100'),
(7, 1, 'fileupload_maxk', '1500'),
(8, 1, 'site_admins', 'a:2:{i:0;s:5:"Imran";i:1;s:7:"shakthi";}'),
(9, 1, 'allowedthemes', 'a:2:{s:12:"imperishable";b:1;s:13:"twentyfifteen";b:1;}'),
(10, 1, 'illegal_names', 'a:9:{i:0;s:3:"www";i:1;s:3:"web";i:2;s:4:"root";i:3;s:5:"admin";i:4;s:4:"main";i:5;s:6:"invite";i:6;s:13:"administrator";i:7;s:5:"files";i:8;s:4:"blog";}'),
(11, 1, 'wpmu_upgrade_site', '31535'),
(12, 1, 'welcome_email', 'Hi USERNAME,\r\n\r\nYour new SITE_NAME site has been successfully set up at:\r\nBLOG_URL\r\n\r\nYou can log in to the administrator account with the following information:\r\n\r\nUsername: USERNAME\r\nPassword: PASSWORD\r\nLog in here: BLOG_URLwp-login.php\r\n\r\nWe hope you enjoy your new site. Thanks!\r\n\r\n--The Team @ SITE_NAME'),
(13, 1, 'first_post', 'Welcome to <a href="SITE_URL">SITE_NAME</a>. This is your first post. Edit or delete it, then start blogging!'),
(14, 1, 'siteurl', 'http://yieldmore.org/'),
(15, 1, 'add_new_users', '1'),
(16, 1, 'upload_space_check_disabled', '1'),
(17, 1, 'subdomain_install', '0'),
(18, 1, 'global_terms_enabled', '0'),
(19, 1, 'ms_files_rewriting', '0'),
(20, 1, 'initial_db_version', '22441'),
(21, 1, 'active_sitewide_plugins', 'a:10:{s:20:"cs-admin/csadmin.php";i:1436574332;s:25:"wp-biblios/wp-biblios.php";i:1436574332;s:43:"remove-category-url/remove-category-url.php";i:1436574332;s:43:"simple-user-listing/simple-user-listing.php";i:1436574332;s:35:"oa-social-login/oa-social-login.php";i:1436574332;s:45:"tw-disable-revisions/tw-disable-revisions.php";i:1436574332;s:23:"wordfence/wordfence.php";i:1436574340;s:35:"cimy-swift-smtp/cimy_swift_smtp.php";i:1436577325;s:27:"cs-filethingie/register.php";i:1437206055;s:43:"register-plus-redux/register-plus-redux.php";i:1437206969;}'),
(22, 1, 'WPLANG', 'en_GB'),
(310, 1, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/en_GB/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_GB";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/en_GB/wordpress-4.2.2.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1437277223;s:15:"version_checked";s:5:"4.2.2";s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:4:"core";s:4:"slug";s:7:"default";s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/en_GB.zip";s:10:"autoupdate";b:1;}}}'),
(311, 1, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1437277224;s:7:"checked";a:2:{s:12:"imperishable";s:3:"1.0";s:14:"twentyfourteen";s:3:"1.2";}s:8:"response";a:1:{s:14:"twentyfourteen";a:4:{s:5:"theme";s:14:"twentyfourteen";s:11:"new_version";s:3:"1.4";s:3:"url";s:44:"https://wordpress.org/themes/twentyfourteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentyfourteen.1.4.zip";}}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:5:"theme";s:4:"slug";s:14:"twentyfourteen";s:8:"language";s:5:"en_GB";s:7:"version";s:3:"1.2";s:7:"updated";s:19:"2014-12-10 00:14:41";s:7:"package";s:78:"https://downloads.wordpress.org/translation/theme/twentyfourteen/1.2/en_GB.zip";s:10:"autoupdate";b:1;}}}'),
(312, 1, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1437277224;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:7:{s:35:"cimy-swift-smtp/cimy_swift_smtp.php";O:8:"stdClass":6:{s:2:"id";s:4:"5926";s:4:"slug";s:15:"cimy-swift-smtp";s:6:"plugin";s:35:"cimy-swift-smtp/cimy_swift_smtp.php";s:11:"new_version";s:5:"2.6.1";s:3:"url";s:46:"https://wordpress.org/plugins/cimy-swift-smtp/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/cimy-swift-smtp.2.6.1.zip";}s:43:"register-plus-redux/register-plus-redux.php";O:8:"stdClass":6:{s:2:"id";s:5:"17542";s:4:"slug";s:19:"register-plus-redux";s:6:"plugin";s:43:"register-plus-redux/register-plus-redux.php";s:11:"new_version";s:5:"4.2.4";s:3:"url";s:50:"https://wordpress.org/plugins/register-plus-redux/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/register-plus-redux.4.2.4.zip";}s:43:"remove-category-url/remove-category-url.php";O:8:"stdClass":7:{s:2:"id";s:5:"51705";s:4:"slug";s:19:"remove-category-url";s:6:"plugin";s:43:"remove-category-url/remove-category-url.php";s:11:"new_version";s:5:"1.0.2";s:3:"url";s:50:"https://wordpress.org/plugins/remove-category-url/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/remove-category-url.1.0.2.zip";s:14:"upgrade_notice";s:28:"Update Compatible with WPML.";}s:43:"simple-user-listing/simple-user-listing.php";O:8:"stdClass":6:{s:2:"id";s:5:"38145";s:4:"slug";s:19:"simple-user-listing";s:6:"plugin";s:43:"simple-user-listing/simple-user-listing.php";s:11:"new_version";s:5:"1.7.0";s:3:"url";s:50:"https://wordpress.org/plugins/simple-user-listing/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/simple-user-listing.1.7.0.zip";}s:35:"oa-social-login/oa-social-login.php";O:8:"stdClass":6:{s:2:"id";s:5:"27148";s:4:"slug";s:15:"oa-social-login";s:6:"plugin";s:35:"oa-social-login/oa-social-login.php";s:11:"new_version";s:3:"4.6";s:3:"url";s:46:"https://wordpress.org/plugins/oa-social-login/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/oa-social-login.4.6.zip";}s:45:"tw-disable-revisions/tw-disable-revisions.php";O:8:"stdClass":6:{s:2:"id";s:5:"36481";s:4:"slug";s:20:"tw-disable-revisions";s:6:"plugin";s:45:"tw-disable-revisions/tw-disable-revisions.php";s:11:"new_version";s:3:"1.0";s:3:"url";s:51:"https://wordpress.org/plugins/tw-disable-revisions/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/tw-disable-revisions.zip";}s:23:"wordfence/wordfence.php";O:8:"stdClass":6:{s:2:"id";s:5:"25305";s:4:"slug";s:9:"wordfence";s:6:"plugin";s:23:"wordfence/wordfence.php";s:11:"new_version";s:6:"6.0.11";s:3:"url";s:40:"https://wordpress.org/plugins/wordfence/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/wordfence.6.0.11.zip";}}}'),
(307, 1, '_site_transient_timeout_theme_roots', '1437279021'),
(308, 1, '_site_transient_theme_roots', 'a:2:{s:12:"imperishable";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";}'),
(161, 1, '_site_transient_timeout_browser_a3fdddf9462a655aa3b3b13edfeb2609', '1437496856'),
(162, 1, '_site_transient_browser_a3fdddf9462a655aa3b3b13edfeb2609', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"43.0.2357.132";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}'),
(65, 1, '_site_transient_timeout_browser_6f9d4e564c06c57f1de84278473090fb', '1437222746'),
(28, 1, '_site_transient_timeout_browser_f0b5f90f4c263af6757b10b6e9cf56e7', '1437178775'),
(29, 1, '_site_transient_browser_f0b5f90f4c263af6757b10b6e9cf56e7', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"43.0.2357.132";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}'),
(30, 1, 'user_count', '3'),
(31, 1, 'blog_count', '3'),
(32, 1, 'can_compress_scripts', '1'),
(206, 1, '_site_transient_timeout_browser_8d325166f6f70105251ee47f39b701a6', '1437619102'),
(207, 1, '_site_transient_browser_8d325166f6f70105251ee47f39b701a6', 'a:9:{s:8:"platform";s:4:"iPad";s:4:"name";s:4:"iPad";s:7:"version";s:3:"8.0";s:10:"update_url";s:0:"";s:7:"img_src";s:0:"";s:11:"img_src_ssl";s:0:"";s:15:"current_version";s:0:"";s:7:"upgrade";b:0;s:8:"insecure";b:0;}'),
(293, 1, '_site_transient_timeout_available_translations', '1437218264'),
(294, 1, '_site_transient_available_translations', 'a:59:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 06:57:37";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-27 06:36:25";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-08 17:43:43";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-08 11:08:34";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-03 00:26:43";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-09 09:31:33";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.2.2/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-13 14:52:11";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-17 17:39:55";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-25 13:39:01";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-05 20:09:08";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-15 10:49:37";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-10 14:16:27";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.5";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.5/haz.zip";s:3:"iso";a:1:{i:2;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-12 08:05:04";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-07 17:26:35";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 06:43:50";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.5";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.5/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-07 10:32:20";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-16 14:25:19";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-08 07:10:14";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-10 17:07:58";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2.2/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-09 10:15:05";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.5";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.5/ps.zip";s:3:"iso";a:1:{i:1;s:2:"ps";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-23 22:36:27";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-08 14:53:48";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-31 11:58:44";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 09:29:23";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.1.5";s:7:"updated";s:19:"2015-03-26 16:25:46";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.5/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-29 08:27:12";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-12 00:55:52";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-06 10:10:09";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 07:01:28";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.5";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.5/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-05 10:51:50";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-29 06:37:03";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}'),
(35, 1, 'registrationnotification', 'yes'),
(36, 1, 'welcome_user_email', 'Hi USERNAME,\r\n\r\nYour new account is set up.\r\n\r\nYou can log in with the following information:\r\nUsername: USERNAME\r\nPassword: PASSWORD\r\nLOGINLINK\r\n\r\nThanks!\r\n\r\n--The Team @ SITE_NAME'),
(37, 1, 'menu_items', 'a:0:{}'),
(38, 1, 'first_page', ''),
(39, 1, 'first_comment', ''),
(40, 1, 'first_comment_url', ''),
(41, 1, 'first_comment_author', ''),
(42, 1, 'limited_email_domains', ''),
(43, 1, 'banned_email_domains', ''),
(288, 1, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1437216864'),
(289, 1, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5223";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3269";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3204";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2734";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2503";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2001";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1906";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1836";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1787";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1769";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1738";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1728";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1621";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1419";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1357";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1299";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1207";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1165";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1150";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1021";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"975";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"942";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"932";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"896";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"865";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"853";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"806";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"791";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"767";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"743";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"738";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"736";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"695";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"687";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"682";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"669";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"649";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"645";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"640";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"639";}}'),
(190, 1, '_site_transient_timeout_browser_ad43eed614c4eb778229f4155a1eb627', '1437575351'),
(66, 1, '_site_transient_browser_6f9d4e564c06c57f1de84278473090fb', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"36.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}'),
(191, 1, '_site_transient_browser_ad43eed614c4eb778229f4155a1eb627', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"43.0.2357.134";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `name` (`name`(191)),
  KEY `slug` (`slug`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Books', 'books', 0),
(3, 'Kahlil Gibran', 'kahlil-gibran', 0),
(4, 'Richard Bach', 'richard-bach', 0),
(31, 'Books', 'books', 0),
(6, 'flying', 'flying', 0),
(7, 'love', 'love', 0),
(8, 'Articles', 'articles', 0),
(9, 'Sri Aurobindo', 'sri-aurobindo', 0),
(10, 'epic', 'epic', 0),
(11, 'poem', 'poem', 0),
(12, 'JRR Tolkien', 'jrr-tolkien', 0),
(13, 'Swami Paramarthananda', 'swami-paramarthananda', 0),
(15, 'Shelley', 'shelley', 0),
(16, 'Paramhansa Yogananda', 'paramhansa-yogananda', 0),
(17, 'Dwight Goddard', 'dwight-goddard', 0),
(18, 'C Rajagopalachari', 'c-rajagopalachari', 0),
(19, 'Programs', 'programs', 0),
(20, 'Songs', 'songs', 0),
(21, 'Organizations', 'organizations', 0),
(22, 'post-format-link', 'post-format-link', 0),
(32, 'Letters and Speeches', 'letters-and-speeches', 0),
(24, 'People', 'people', 0),
(25, 'Practices', 'practices', 0),
(26, 'Documentaries', 'documentaries', 0),
(27, 'Speak', 'speak', 0),
(28, '7 Utopians', '7-utopians', 0),
(29, 'Topics', 'topics', 0),
(30, 'Incubate', 'incubate', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(13, 2, 0),
(13, 4, 0),
(26, 31, 0),
(13, 6, 0),
(13, 7, 0),
(5, 9, 0),
(5, 10, 0),
(8, 10, 0),
(15, 12, 0),
(12, 13, 0),
(11, 9, 0),
(27, 31, 0),
(9, 3, 0),
(8, 15, 0),
(28, 24, 0),
(18, 9, 0),
(6, 16, 0),
(7, 17, 0),
(10, 18, 0),
(20, 4, 0),
(27, 12, 0),
(22, 19, 0),
(23, 19, 0),
(24, 20, 0),
(25, 21, 0),
(17, 32, 0),
(29, 25, 0),
(30, 25, 0),
(31, 26, 0),
(32, 25, 0),
(33, 20, 0),
(34, 20, 0),
(35, 28, 0),
(36, 29, 0),
(37, 24, 0),
(38, 20, 0),
(39, 30, 0),
(43, 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'work_type', '', 0, 1),
(3, 3, 'work_author', '', 0, 1),
(4, 4, 'work_author', 'Books by Richard Bach', 0, 2),
(31, 31, 'category', '', 0, 2),
(6, 6, 'post_tag', '', 0, 1),
(7, 7, 'post_tag', '', 0, 1),
(8, 8, 'category', '', 0, 0),
(9, 9, 'work_author', 'Books and Poems by Sri Aurobindo', 0, 3),
(10, 10, 'post_tag', '', 0, 2),
(11, 11, 'post_tag', '', 0, 0),
(12, 12, 'work_author', '', 0, 2),
(13, 13, 'work_author', '', 0, 1),
(15, 15, 'work_author', '', 0, 1),
(16, 16, 'work_author', '', 0, 1),
(17, 17, 'work_author', '', 0, 1),
(18, 18, 'work_author', '', 0, 1),
(19, 19, 'category', '', 0, 2),
(20, 20, 'category', '', 0, 4),
(21, 21, 'category', '', 0, 1),
(22, 22, 'post_format', '', 0, 0),
(32, 32, 'category', '', 0, 1),
(24, 24, 'category', '', 0, 2),
(25, 25, 'category', '', 0, 3),
(26, 26, 'category', '', 0, 1),
(27, 27, 'category', '', 0, 0),
(28, 28, 'category', 'Anything to do with changing the status quo, charity and <a href="/songs/short-and-sweet">building a vision new and justice to our time</a>', 27, 1),
(29, 29, 'category', '', 0, 1),
(30, 30, 'category', 'Articles / Books published here are under work and their final urls may change.', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=178 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'Imran'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp410_dfw,wp390_widgets'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '44'),
(15, 1, 'wp_user-settings', 'editor=html&libraryContent=browse&posts_list_mode=list&hidetb=1&post_dfw=off'),
(16, 1, 'wp_user-settings-time', '1436588814'),
(17, 1, 'closedpostboxes_work', 'a:0:{}'),
(18, 1, 'metaboxhidden_work', 'a:1:{i:0;s:7:"slugdiv";}'),
(21, 1, 'session_tokens', 'a:6:{s:64:"fc442ade1c287b891bd1ce6bdc0469b261025ebdd41c93dbb6858de30bcf870e";a:4:{s:10:"expiration";i:1437194380;s:2:"ip";s:13:"182.65.10.244";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36";s:5:"login";i:1435984780;}s:64:"0d243f8a693b7a0c2a6f7bd35a7855776b494580de080eb57320576953e37e57";a:4:{s:10:"expiration";i:1437783573;s:2:"ip";s:13:"123.201.63.76";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36";s:5:"login";i:1436573973;}s:64:"07805228ac3d450b9db4ca8c1e57ac7ce117f05ed5fc02c5cfb161213a9170b5";a:4:{s:10:"expiration";i:1437061225;s:2:"ip";s:13:"182.65.227.67";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36";s:5:"login";i:1436888425;}s:64:"72884e6126cb043f539e2e95fe575305070c02045ce1a31841cf785bb88529ff";a:4:{s:10:"expiration";i:1437064853;s:2:"ip";s:13:"67.23.232.183";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36";s:5:"login";i:1436892053;}s:64:"126e2e942923015bd6bb1979dad685c672653b264a4a6ed92f82e8af448e4baa";a:4:{s:10:"expiration";i:1438223898;s:2:"ip";s:14:"182.65.212.130";s:2:"ua";s:124:"Mozilla/5.0 (iPad; CPU OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12F69 Safari/600.1.4";s:5:"login";i:1437014298;}s:64:"d3fd3e1c0bd423b66a2fbfd235de31111fc471371059d0ed995ec50ddc1dcf77";a:4:{s:10:"expiration";i:1438223976;s:2:"ip";s:14:"182.65.212.130";s:2:"ua";s:124:"Mozilla/5.0 (iPad; CPU OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12F69 Safari/600.1.4";s:5:"login";i:1437014376;}}'),
(22, 2, 'nickname', 'Shasa'),
(23, 2, 'first_name', 'Shasa'),
(24, 2, 'last_name', 'YM'),
(25, 2, 'description', 'Shasa is a persona (not actual person) inspired by Shasa Courtney in WIlbur Smiths Burning Shore and Power of the Sword\r\n\r\nIn its original african bushmen language, it means good-water - their most sought after resource.\r\n\r\nIts also chosen for the explanation in Sri Yukteswar''s Holy Science where he likens baptism under water to the continuous sound heard by  those who experience Sat-Chit-Ananda (Existence-Consciousness-Bliss)'),
(26, 2, 'rich_editing', 'true'),
(27, 2, 'comment_shortcuts', 'false'),
(28, 2, 'admin_color', 'fresh'),
(29, 2, 'use_ssl', '0'),
(30, 2, 'show_admin_bar_front', 'true'),
(31, 2, 'wp_capabilities', 'a:1:{s:6:"author";b:1;}'),
(32, 2, 'wp_user_level', '2'),
(76, 2, 'oa_social_login_user_token', '2d93959d-a16e-42d1-8d3f-c4fd2e8dac5c'),
(34, 2, 'oa_social_login_identity_provider', 'Google'),
(35, 2, 'oa_social_login_user_picture', 'https://lh4.googleusercontent.com/-RabdStJTIyI/AAAAAAAAAAI/AAAAAAAAACM/R5ka0WH1o30/photo.jpg?sz=50'),
(36, 2, 'session_tokens', 'a:2:{s:64:"577cb5eac7ee08726c12bd43655bf6ac8a6c4e2f1513b3fcbdbaaa61e84721e1";a:4:{s:10:"expiration";i:1436958897;s:2:"ip";s:15:"123.201.139.235";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36";s:5:"login";i:1435749297;}s:64:"55d8c5f974ee03568999695b07b43c1373c27b0abd7731bc7a4a897b119b5bfb";a:4:{s:10:"expiration";i:1436961416;s:2:"ip";s:15:"123.201.139.235";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36";s:5:"login";i:1435751816;}}'),
(37, 1, 'oa_social_login_user_token', '4218736d-1801-4521-9105-8763426c8fb5'),
(38, 1, 'oa_social_login_identity_provider', 'LinkedIn|Facebook'),
(39, 1, 'oa_social_login_user_thumbnail', 'https://graph.facebook.com/10206913459091995/picture?type=square'),
(40, 3, 'nickname', 'Shasa'),
(41, 3, 'first_name', 'Shasa'),
(42, 3, 'last_name', 'Courteney'),
(43, 3, 'description', 'Shasa is a persona (not a real person) inspired by the character Shasa Courtney in WIlbur Smith''s Burning Shore and Power of the Sword.\r\n\r\nShasa is an African word that means good-water. A much sought after resource for the bushmen that live in the desert.\r\n\r\nIt also bears meaning from Yukteswars Holy Science where he points out that the baptism in water is symbolic of the steady sound of water heard by those who have attained Satchitananda.'),
(44, 3, 'rich_editing', 'true'),
(45, 3, 'comment_shortcuts', 'false'),
(46, 3, 'admin_color', 'fresh'),
(47, 3, 'use_ssl', '0'),
(48, 3, 'show_admin_bar_front', 'true'),
(49, 3, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(50, 3, 'wp_user_level', '0'),
(52, 3, 'oa_social_login_identity_provider', 'Google'),
(53, 3, 'oa_social_login_user_picture', 'https://lh4.googleusercontent.com/-RabdStJTIyI/AAAAAAAAAAI/AAAAAAAAACM/R5ka0WH1o30/photo.jpg?sz=50'),
(54, 3, 'session_tokens', 'a:1:{s:64:"e635ded895f2db091dd24ec39c1c20a3e84f35c72684e5e6d4a4b2d261f165b6";a:4:{s:10:"expiration";i:1436960111;s:2:"ip";s:15:"123.201.139.235";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36";s:5:"login";i:1435750511;}}'),
(55, 3, 'aim', ''),
(56, 3, 'yim', ''),
(57, 3, 'jabber', ''),
(58, 4, 'nickname', 'Shasa YM'),
(59, 4, 'first_name', 'Shasa'),
(60, 4, 'last_name', 'YM'),
(61, 4, 'description', 'Shasa is a persona (not actual person) inspired by Shasa Courtney in WIlbur Smiths Burning Shore and Power of the Sword\r\n\r\nIn its original african bushmen language, it means good-water - their most sought after resource.\r\n\r\nIts also chosen for the explanation in Sri Yukteswar''s Holy Science where he likens baptism under water to the continuous sound heard by  those who experience Sat-Chit-Ananda (Existence-Consciousness-Bliss)'),
(62, 4, 'rich_editing', 'true'),
(63, 4, 'comment_shortcuts', 'false'),
(64, 4, 'admin_color', 'fresh'),
(65, 4, 'use_ssl', '0'),
(66, 4, 'show_admin_bar_front', 'true'),
(67, 4, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(68, 4, 'wp_user_level', '0'),
(70, 4, 'oa_social_login_identity_provider', 'Google'),
(71, 4, 'oa_social_login_user_picture', 'https://lh4.googleusercontent.com/-RabdStJTIyI/AAAAAAAAAAI/AAAAAAAAACM/R5ka0WH1o30/photo.jpg?sz=50'),
(72, 4, 'session_tokens', 'a:1:{s:64:"be12a909d912181c0b21b5986a9d8b26d61d6ca03e8f7a868542e90d41071b91";a:4:{s:10:"expiration";i:1436960703;s:2:"ip";s:15:"123.201.139.235";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36";s:5:"login";i:1435751103;}}'),
(73, 4, 'aim', ''),
(74, 4, 'yim', ''),
(75, 4, 'jabber', ''),
(77, 2, 'aim', ''),
(78, 2, 'yim', ''),
(79, 2, 'jabber', ''),
(80, 1, 'closedpostboxes_post', 'a:1:{i:0;s:9:"formatdiv";}'),
(81, 1, 'metaboxhidden_post', 'a:5:{i:0;s:13:"trackbacksdiv";i:1;s:10:"postcustom";i:2;s:16:"commentstatusdiv";i:3;s:7:"slugdiv";i:4;s:9:"authordiv";}'),
(82, 2, 'wp_dashboard_quick_press_last_post_id', '35'),
(127, 7, 'use_ssl', '0'),
(126, 7, 'admin_color', 'fresh'),
(125, 7, 'comment_shortcuts', 'false'),
(124, 7, 'rich_editing', 'true'),
(123, 7, 'description', ''),
(122, 7, 'last_name', ''),
(121, 7, 'first_name', ''),
(120, 7, 'nickname', 'Shakthi YM'),
(119, 1, 'wp_3_dashboard_quick_press_last_post_id', '3'),
(118, 1, 'wp_2_dashboard_quick_press_last_post_id', '3'),
(117, 1, 'wp_3_user_level', '10'),
(116, 1, 'wp_3_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(115, 1, 'wp_2_user_level', '10'),
(114, 1, 'wp_2_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(113, 1, 'primary_blog', '1'),
(112, 1, 'source_domain', 'yieldmore.org'),
(109, 1, 'aim', ''),
(110, 1, 'yim', ''),
(111, 1, 'jabber', ''),
(128, 7, 'show_admin_bar_front', 'true'),
(133, 7, 'yim', ''),
(134, 7, 'jabber', ''),
(132, 7, 'aim', ''),
(131, 7, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(135, 7, 'primary_blog', '1'),
(136, 7, 'source_domain', 'yieldmore.org'),
(137, 7, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(138, 7, 'wp_user_level', '10'),
(139, 8, 'nickname', 'weddingbabe8504'),
(140, 8, 'first_name', ''),
(141, 8, 'last_name', ''),
(142, 8, 'description', ''),
(143, 8, 'rich_editing', 'true'),
(144, 8, 'comment_shortcuts', 'false'),
(145, 8, 'admin_color', 'fresh'),
(146, 8, 'use_ssl', '0'),
(147, 8, 'show_admin_bar_front', 'true'),
(150, 1, 'wp_3_user-settings', 'editor=html'),
(151, 1, 'wp_3_user-settings-time', '1436596668'),
(152, 1, 'wp_2_user-settings', 'editor=html'),
(153, 1, 'wp_2_user-settings-time', '1436597822'),
(154, 9, 'nickname', 'weddingchica7917'),
(155, 9, 'first_name', ''),
(156, 9, 'last_name', ''),
(157, 9, 'description', ''),
(158, 9, 'rich_editing', 'true'),
(159, 9, 'comment_shortcuts', 'false'),
(160, 9, 'admin_color', 'fresh'),
(161, 9, 'use_ssl', '0'),
(162, 9, 'show_admin_bar_front', 'true'),
(165, 10, 'nickname', 'weddingmom8168'),
(166, 10, 'first_name', ''),
(167, 10, 'last_name', ''),
(168, 10, 'description', ''),
(169, 10, 'rich_editing', 'true'),
(170, 10, 'comment_shortcuts', 'false'),
(171, 10, 'admin_color', 'fresh'),
(172, 10, 'use_ssl', '0'),
(173, 10, 'show_admin_bar_front', 'true'),
(176, 7, 'session_tokens', 'a:1:{s:64:"31dc1f258caf617c2b00caabd0caccefd7f1dfae22fc907efd6aca1f70277690";a:4:{s:10:"expiration";i:1438415567;s:2:"ip";s:13:"182.65.40.150";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36";s:5:"login";i:1437205967;}}'),
(177, 7, 'wp_dashboard_quick_press_last_post_id', '45');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  `spam` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`, `spam`, `deleted`) VALUES
(1, 'Imran', '$P$Bqg52eneQLtG9ID1URq/TlQZ.njtGg.', 'imran', 'imran@cselian.com', '', '2013-04-16 03:24:47', '', 0, 'Imran', 0, 0),
(2, 'Shasa YM', '$P$BnyEFWwpe2YNlOKQcWsAVt.D0PuoP81', 'shasa-ym', 'shasa@cselian.com', 'https://plus.google.com/107576976632478909078', '2015-07-01 11:45:00', '', 0, 'Shasa', 0, 0),
(3, 'Shakthi', '$P$Bqg52eneQLtG9ID1URq/TlQZ.njtGg.', 'shakthi', 'queenievee@yahoo.com', '', '2015-07-11 01:20:24', '', 0, 'Shakthi YM', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
