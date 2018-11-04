# Host: localhost  (Version: 5.5.53)
# Date: 2018-11-03 09:48:43
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "qd_admin"
#

DROP TABLE IF EXISTS `qd_admin`;
CREATE TABLE `qd_admin` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(16) NOT NULL,
  `password` char(32) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `last_ip` char(15) NOT NULL DEFAULT '',
  `last_date` int(10) unsigned NOT NULL DEFAULT '0',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` char(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for table "qd_admin_active"
#

DROP TABLE IF EXISTS `qd_admin_active`;
CREATE TABLE `qd_admin_active` (
  `sess_id` char(32) NOT NULL DEFAULT '',
  `user_id` smallint(5) unsigned NOT NULL,
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_admin_role"
#

DROP TABLE IF EXISTS `qd_admin_role`;
CREATE TABLE `qd_admin_role` (
  `user_id` smallint(5) unsigned NOT NULL,
  `role_id` smallint(5) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_adv"
#

DROP TABLE IF EXISTS `qd_adv`;
CREATE TABLE `qd_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `type` char(5) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `codes` text NOT NULL,
  `start_date` int(10) unsigned NOT NULL DEFAULT '0',
  `end_date` int(10) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`adv_id`),
  KEY `position_id` (`position_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_adv_position"
#

DROP TABLE IF EXISTS `qd_adv_position`;
CREATE TABLE `qd_adv_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `codes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_aftersales"
#

DROP TABLE IF EXISTS `qd_aftersales`;
CREATE TABLE `qd_aftersales` (
  `as_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_id` char(15) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_qty` smallint(5) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cause` text NOT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`as_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_aftersales_message"
#

DROP TABLE IF EXISTS `qd_aftersales_message`;
CREATE TABLE `qd_aftersales_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `as_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `as_id` (`as_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_article"
#

DROP TABLE IF EXISTS `qd_article`;
CREATE TABLE `qd_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(180) NOT NULL,
  `picture` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `brief` varchar(240) NOT NULL DEFAULT '',
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_article_cate"
#

DROP TABLE IF EXISTS `qd_article_cate`;
CREATE TABLE `qd_article_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(60) NOT NULL,
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_brand"
#

DROP TABLE IF EXISTS `qd_brand`;
CREATE TABLE `qd_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(255) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_email_queue"
#

DROP TABLE IF EXISTS `qd_email_queue`;
CREATE TABLE `qd_email_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `tpl_id` char(30) NOT NULL DEFAULT '',
  `subject` varchar(240) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `last_err` varchar(255) NOT NULL DEFAULT '',
  `err_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_email_subscription"
#

DROP TABLE IF EXISTS `qd_email_subscription`;
CREATE TABLE `qd_email_subscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_email_template"
#

DROP TABLE IF EXISTS `qd_email_template`;
CREATE TABLE `qd_email_template` (
  `id` char(30) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `subject` varchar(240) NOT NULL DEFAULT '',
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_feedback"
#

DROP TABLE IF EXISTS `qd_feedback`;
CREATE TABLE `qd_feedback` (
  `fb_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `mobile` char(30) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `code` varchar(30) DEFAULT '0',
  PRIMARY KEY (`fb_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for table "qd_feedback_message"
#

DROP TABLE IF EXISTS `qd_feedback_message`;
CREATE TABLE `qd_feedback_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fb_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fb_id` (`fb_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_friendlink"
#

DROP TABLE IF EXISTS `qd_friendlink`;
CREATE TABLE `qd_friendlink` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods"
#

DROP TABLE IF EXISTS `qd_goods`;
CREATE TABLE `qd_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(180) NOT NULL DEFAULT '',
  `goods_sn` char(20) NOT NULL DEFAULT '',
  `now_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_image` varchar(30) NOT NULL DEFAULT '',
  `goods_brief` text NOT NULL,
  `goods_content` text NOT NULL,
  `goods_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `stock_qty` smallint(4) unsigned NOT NULL DEFAULT '0',
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `newarrival` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bargain` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `production_ability` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT '',
  `payment_term` varchar(255) DEFAULT '',
  `package` varchar(255) DEFAULT '',
  `moq` varchar(255) DEFAULT '',
  PRIMARY KEY (`goods_id`),
  KEY `cate_id` (`cate_id`),
  FULLTEXT KEY `indexing` (`goods_name`,`meta_keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_album"
#

DROP TABLE IF EXISTS `qd_goods_album`;
CREATE TABLE `qd_goods_album` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `image` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_attr"
#

DROP TABLE IF EXISTS `qd_goods_attr`;
CREATE TABLE `qd_goods_attr` (
  `goods_id` mediumint(8) unsigned NOT NULL,
  `attr_id` mediumint(8) NOT NULL,
  `value` varchar(160) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_cate"
#

DROP TABLE IF EXISTS `qd_goods_cate`;
CREATE TABLE `qd_goods_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(60) NOT NULL DEFAULT '',
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_cate_attr"
#

DROP TABLE IF EXISTS `qd_goods_cate_attr`;
CREATE TABLE `qd_goods_cate_attr` (
  `attr_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `opts` text NOT NULL,
  `uom` varchar(20) NOT NULL DEFAULT '',
  `filtrate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_cate_brand"
#

DROP TABLE IF EXISTS `qd_goods_cate_brand`;
CREATE TABLE `qd_goods_cate_brand` (
  `cate_id` smallint(5) unsigned NOT NULL,
  `brand_id` smallint(5) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_optional"
#

DROP TABLE IF EXISTS `qd_goods_optional`;
CREATE TABLE `qd_goods_optional` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opt_text` varchar(80) NOT NULL DEFAULT '',
  `opt_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_optional_type"
#

DROP TABLE IF EXISTS `qd_goods_optional_type`;
CREATE TABLE `qd_goods_optional_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_related"
#

DROP TABLE IF EXISTS `qd_goods_related`;
CREATE TABLE `qd_goods_related` (
  `goods_id` mediumint(8) NOT NULL,
  `related_id` mediumint(8) NOT NULL,
  `direction` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`goods_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_goods_review"
#

DROP TABLE IF EXISTS `qd_goods_review`;
CREATE TABLE `qd_goods_review` (
  `review_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rating` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `replied` text NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_help"
#

DROP TABLE IF EXISTS `qd_help`;
CREATE TABLE `qd_help` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_help_cate"
#

DROP TABLE IF EXISTS `qd_help_cate`;
CREATE TABLE `qd_help_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(60) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_navigation"
#

DROP TABLE IF EXISTS `qd_navigation`;
CREATE TABLE `qd_navigation` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_oauth"
#

DROP TABLE IF EXISTS `qd_oauth`;
CREATE TABLE `qd_oauth` (
  `party` char(10) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL,
  `params` text NOT NULL,
  `instruction` varchar(240) NOT NULL DEFAULT '',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`party`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_order"
#

DROP TABLE IF EXISTS `qd_order`;
CREATE TABLE `qd_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `shipping_method` smallint(5) unsigned NOT NULL DEFAULT '0',
  `payment_method` smallint(5) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `memos` varchar(240) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `thirdparty_trade_id` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_order_consignee"
#

DROP TABLE IF EXISTS `qd_order_consignee`;
CREATE TABLE `qd_order_consignee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `receiver` varchar(20) NOT NULL DEFAULT '',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `borough` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(240) NOT NULL DEFAULT '',
  `zip` char(6) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_order_goods"
#

DROP TABLE IF EXISTS `qd_order_goods`;
CREATE TABLE `qd_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(180) NOT NULL DEFAULT '',
  `goods_image` varchar(30) NOT NULL DEFAULT '',
  `goods_qty` smallint(5) NOT NULL DEFAULT '1',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `is_reviewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_order_goods_optional"
#

DROP TABLE IF EXISTS `qd_order_goods_optional`;
CREATE TABLE `qd_order_goods_optional` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `opt_id` int(10) unsigned NOT NULL DEFAULT '0',
  `opt_type` varchar(20) NOT NULL DEFAULT '',
  `opt_text` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_order_log"
#

DROP TABLE IF EXISTS `qd_order_log`;
CREATE TABLE `qd_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `operate` char(10) NOT NULL,
  `cause` varchar(240) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_order_shipping"
#

DROP TABLE IF EXISTS `qd_order_shipping`;
CREATE TABLE `qd_order_shipping` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `carrier_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tracking_no` varchar(20) NOT NULL DEFAULT '',
  `memos` varchar(240) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_payment_method"
#

DROP TABLE IF EXISTS `qd_payment_method`;
CREATE TABLE `qd_payment_method` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pcode` varchar(20) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `instruction` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_request_error"
#

DROP TABLE IF EXISTS `qd_request_error`;
CREATE TABLE `qd_request_error` (
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `count` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `lockout` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_role"
#

DROP TABLE IF EXISTS `qd_role`;
CREATE TABLE `qd_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '',
  `role_desc` varchar(240) NOT NULL DEFAULT '',
  `role_acl` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_sendmail_limit"
#

DROP TABLE IF EXISTS `qd_sendmail_limit`;
CREATE TABLE `qd_sendmail_limit` (
  `ip` char(15) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` char(30) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_setting"
#

DROP TABLE IF EXISTS `qd_setting`;
CREATE TABLE `qd_setting` (
  `sk` varchar(30) NOT NULL,
  `sv` text NOT NULL,
  PRIMARY KEY (`sk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_shipping_carrier"
#

DROP TABLE IF EXISTS `qd_shipping_carrier`;
CREATE TABLE `qd_shipping_carrier` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `tracking_url` varchar(255) NOT NULL DEFAULT '',
  `service_tel` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_shipping_method"
#

DROP TABLE IF EXISTS `qd_shipping_method`;
CREATE TABLE `qd_shipping_method` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `instruction` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user"
#

DROP TABLE IF EXISTS `qd_user`;
CREATE TABLE `qd_user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(16) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `avatar` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mobile_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_account"
#

DROP TABLE IF EXISTS `qd_user_account`;
CREATE TABLE `qd_user_account` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_account_log"
#

DROP TABLE IF EXISTS `qd_user_account_log`;
CREATE TABLE `qd_user_account_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `cause` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_consignee"
#

DROP TABLE IF EXISTS `qd_user_consignee`;
CREATE TABLE `qd_user_consignee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `receiver` varchar(20) NOT NULL DEFAULT '',
  `province` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `city` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `borough` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `address` varchar(240) NOT NULL DEFAULT '',
  `zip` char(6) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_favorite"
#

DROP TABLE IF EXISTS `qd_user_favorite`;
CREATE TABLE `qd_user_favorite` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL,
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_group"
#

DROP TABLE IF EXISTS `qd_user_group`;
CREATE TABLE `qd_user_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(60) NOT NULL,
  `min_exp` int(10) unsigned NOT NULL DEFAULT '0',
  `discount_rate` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_oauth"
#

DROP TABLE IF EXISTS `qd_user_oauth`;
CREATE TABLE `qd_user_oauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `party` char(10) NOT NULL DEFAULT '',
  `oauth_key` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_profile"
#

DROP TABLE IF EXISTS `qd_user_profile`;
CREATE TABLE `qd_user_profile` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birth_year` smallint(4) unsigned NOT NULL DEFAULT '0',
  `birth_month` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `birth_day` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `signature` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_user_record"
#

DROP TABLE IF EXISTS `qd_user_record`;
CREATE TABLE `qd_user_record` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `created_ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `last_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "qd_visitor_stats"
#

DROP TABLE IF EXISTS `qd_visitor_stats`;
CREATE TABLE `qd_visitor_stats` (
  `sessid` char(32) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pv` smallint(5) unsigned NOT NULL DEFAULT '1',
  `referrer` varchar(80) NOT NULL DEFAULT '',
  `browser` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `platform` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `area` char(10) NOT NULL DEFAULT '',
  KEY `sessid` (`sessid`) USING BTREE,
  KEY `ip` (`ip`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
