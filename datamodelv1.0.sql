/*
SQLyog Enterprise - MySQL GUI v8.2 
MySQL - 5.0.45-community-nt : Database - capstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`capstore` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `capstore`;

/*Table structure for table `advertisement` */

DROP TABLE IF EXISTS `advertisement`;

CREATE TABLE `advertisement` (
  `advertisement_id` int(30) NOT NULL auto_increment,
  `media_id` varchar(30) default NULL,
  PRIMARY KEY  (`advertisement_id`),
  KEY `FK_advertisement` (`media_id`),
  CONSTRAINT `FK_advertisement` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `advertisement` */

/*Table structure for table `album` */

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `album_id` varchar(30) NOT NULL default '',
  `media_id` varchar(30) default NULL,
  PRIMARY KEY  (`album_id`),
  KEY `FK_album` (`media_id`),
  CONSTRAINT `FK_album` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `album` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` varchar(30) NOT NULL,
  `category_name` varchar(30) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `user_id` varchar(30) default NULL,
  `feedback_id` int(30) NOT NULL auto_increment,
  `id` varchar(30) default NULL,
  `feedback_content` longtext,
  `feedback_date` date default NULL,
  `rating` double default NULL,
  `type` varchar(10) default NULL,
  PRIMARY KEY  (`feedback_id`),
  KEY `FK_feedback` (`user_id`),
  CONSTRAINT `FK_feedback` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `media_id` varchar(30) NOT NULL,
  `media_path` varchar(30) default NULL,
  `media_type` varchar(30) default NULL,
  PRIMARY KEY  (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `media` */

/*Table structure for table `merchant` */

DROP TABLE IF EXISTS `merchant`;

CREATE TABLE `merchant` (
  `merchant_id` varchar(20) NOT NULL,
  `merchant_name` varchar(30) default NULL,
  `merchant_type` varchar(15) default NULL,
  `merchant_email` varchar(30) default NULL,
  `merchant_status` varchar(20) default NULL,
  `merchant_address` varchar(150) default NULL,
  `merchant_password` varchar(100) default NULL,
  `merchant_securityquestion` varchar(30) default NULL,
  `merchant_securityanswer` varchar(30) default NULL,
  `merchant_addeddate` date default NULL,
  `merchant_removeddate` date default NULL,
  PRIMARY KEY  (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `merchant` */

/*Table structure for table `offer` */

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `scheme_id` int(30) NOT NULL auto_increment,
  `scheme_name` varchar(30) default NULL,
  `value` varchar(30) default NULL,
  `type` varchar(30) default NULL,
  `merchant_id` varchar(30) default NULL,
  PRIMARY KEY  (`scheme_id`),
  KEY `FK_offer` (`merchant_id`),
  CONSTRAINT `FK_offer` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `offer` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` varchar(30) NOT NULL,
  `user_id` varchar(30) default NULL,
  `order_date` date default NULL,
  `cart_value` float default NULL,
  `order_status` varchar(20) default NULL,
  PRIMARY KEY  (`order_id`),
  KEY `FK_order` (`user_id`),
  CONSTRAINT `FK_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` varchar(30) NOT NULL default '',
  `category_id` varchar(20) default NULL,
  `merchant_id` varchar(20) default NULL,
  `product_cost` float default NULL,
  `product_name` varchar(30) default NULL,
  `product_tag` varchar(50) default NULL,
  `product_creationdate` date default NULL,
  `product_solddate` date default NULL,
  `product_brand` varchar(30) default NULL,
  `product_albumid` varchar(30) default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `FK_product` (`category_id`),
  KEY `FK_product2` (`product_albumid`),
  CONSTRAINT `FK_product` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_product2` FOREIGN KEY (`product_albumid`) REFERENCES `album` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

/*Table structure for table `productdescription` */

DROP TABLE IF EXISTS `productdescription`;

CREATE TABLE `productdescription` (
  `product_id` varchar(30) NOT NULL,
  `attribute_name` varchar(30) default NULL,
  `attribute_value` varchar(30) default NULL,
  PRIMARY KEY  (`product_id`),
  CONSTRAINT `FK_productdescription` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productdescription` */

/*Table structure for table `rewards` */

DROP TABLE IF EXISTS `rewards`;

CREATE TABLE `rewards` (
  `user_id` varchar(30) NOT NULL,
  `reward_points` varchar(30) default NULL,
  PRIMARY KEY  (`user_id`),
  CONSTRAINT `FK_rewards` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rewards` */

/*Table structure for table `scheme` */

DROP TABLE IF EXISTS `scheme`;

CREATE TABLE `scheme` (
  `scheme_id` int(30) default NULL,
  `product_id` varchar(30) default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  `entry_id` int(30) NOT NULL auto_increment,
  PRIMARY KEY  (`entry_id`),
  KEY `FK_scheme2` (`product_id`),
  KEY `FK_schemetooffer` (`scheme_id`),
  CONSTRAINT `FK_scheme` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_schemetooffer` FOREIGN KEY (`scheme_id`) REFERENCES `offer` (`scheme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scheme` */

/*Table structure for table `shipping` */

DROP TABLE IF EXISTS `shipping`;

CREATE TABLE `shipping` (
  `shipping_id` varchar(30) NOT NULL,
  `shipping_address` varchar(150) default NULL,
  `user_id` varchar(30) default NULL,
  `shipping_status` varchar(50) default NULL,
  `order_id` varchar(20) default NULL,
  `shippingdate` date default NULL,
  `deliverydate` date default NULL,
  PRIMARY KEY  (`shipping_id`),
  KEY `FK_shipping` (`user_id`),
  CONSTRAINT `FK_shipping` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shipping` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `merchant_id` varchar(30) default NULL,
  `stock` int(100) default NULL,
  `product_id` varchar(20) default NULL,
  `stock_id` int(30) NOT NULL auto_increment,
  PRIMARY KEY  (`stock_id`),
  KEY `FK_stock2` (`product_id`),
  KEY `FK_stock` (`merchant_id`),
  CONSTRAINT `FK_stock2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_stock` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `order_id` varchar(30) default NULL,
  `product_id` varchar(30) default NULL,
  `product_quantity` int(10) default NULL,
  `product_cost` float default NULL,
  `merchant_id` varchar(30) default NULL,
  `transaction_id` int(30) default NULL,
  `entry_id` int(30) NOT NULL auto_increment,
  `product_name` varchar(30) default NULL,
  `transaction_date` date default NULL,
  PRIMARY KEY  (`entry_id`),
  KEY `FK_transaction` (`product_id`),
  CONSTRAINT `FK_transaction` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_firstname` char(20) default NULL,
  `user_lastname` char(20) default NULL,
  `user_password` varchar(50) default NULL,
  `user_email` varchar(20) default NULL,
  `user_securityquestion` varchar(30) default NULL,
  `user_securityanswer` varchar(30) default NULL,
  `user_address` varchar(150) default NULL,
  `user_status` varchar(20) default NULL,
  `user_addeddate` date default NULL,
  `user_removeddate` date default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*Table structure for table `viewcount` */

DROP TABLE IF EXISTS `viewcount`;

CREATE TABLE `viewcount` (
  `product_id` varchar(30) NOT NULL,
  `count` int(10) default NULL,
  `category_id` varchar(30) default NULL,
  PRIMARY KEY  (`product_id`),
  CONSTRAINT `FK_viewcount` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `viewcount` */

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `wish_id` varchar(20) NOT NULL,
  `user_id` varchar(30) default NULL,
  `product_id` varchar(30) default NULL,
  `wish_creationdate` date default NULL,
  `wish_enddate` date default NULL,
  PRIMARY KEY  (`wish_id`),
  KEY `FK_wishlist` (`user_id`),
  KEY `FK_wishlist2` (`product_id`),
  CONSTRAINT `FK_wishlist` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_wishlist2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wishlist` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
