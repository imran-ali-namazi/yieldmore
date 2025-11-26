DROP TABLE IF EXISTS `wp_bookmarks`;

CREATE TABLE `wp_bookmarks` (
  `bk_post_ID` int(20) NOT NULL,
  `bk_user_ID` int(20) NOT NULL,
  `bk_name` varchar(256) NOT NULL,
  `bk_url` varchar(256) NOT NULL,
  `bk_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `wp_quotes`;

CREATE TABLE `wp_quotes` (
  `quote_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `quote_post_ID` bigint(20) NOT NULL,
  `quote_user_ID` bigint(20) NOT NULL,
  `quote_date` datetime NOT NULL,
  `quote_name` varchar(128) NOT NULL,
  `quote_config` varchar(256) NOT NULL,
  `quote_content` varchar(32768) NOT NULL,
  PRIMARY KEY (`quote_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

