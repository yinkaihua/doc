/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.47 : Database - easycms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`easycms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `easycms`;

/*Table structure for table `t_channel` */

DROP TABLE IF EXISTS `t_channel`;

CREATE TABLE `t_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父栏目ID，为0表示顶级栏目',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `name` varchar(100) DEFAULT NULL COMMENT '显示名称',
  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `level` tinyint(4) DEFAULT NULL COMMENT '栏目级别',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态；1：正常，9：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_channel` */

insert  into `t_channel`(`id`,`pid`,`site_id`,`name`,`path`,`create_time`,`level`,`sort`,`state`) values (9,0,7,'Bootstrap','/bootstrap',NULL,1,1,1),(10,0,7,'Python','/python',NULL,1,2,1);

/*Table structure for table `t_dict` */

DROP TABLE IF EXISTS `t_dict`;

CREATE TABLE `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_code` varchar(10) NOT NULL COMMENT '分类code',
  `key` varchar(10) DEFAULT NULL COMMENT '键',
  `value` varchar(10) DEFAULT NULL COMMENT '值',
  `desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_dict` */

insert  into `t_dict`(`id`,`catalog_code`,`key`,`value`,`desc`,`sort`) values (1,'state','valid','1','正常',1),(2,'state','invalid','9','无效',2);

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父菜单，0表示顶级菜单',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '菜单级别',
  `text` varchar(100) NOT NULL COMMENT '菜单名',
  `action` varchar(100) DEFAULT NULL COMMENT '菜单链接，0表示无链接',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序字段',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，1：正常，9：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`pid`,`level`,`text`,`action`,`sort`,`state`) values (1,0,1,'系统设置','0',1,1),(2,1,2,'菜单管理','menu/view',1,1),(19,0,1,'网站维护','0',2,1),(20,19,2,'站点管理','site/view',1,1),(21,19,2,'栏目管理','channel/view',2,1),(23,0,1,'内容管理','0',3,1),(24,23,2,'文章','article/view',1,1),(29,23,2,'活动','a',2,1),(30,23,2,'推荐','a',3,1),(31,1,2,'字典','dict/view',2,1);

/*Table structure for table `t_site` */

DROP TABLE IF EXISTS `t_site`;

CREATE TABLE `t_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL COMMENT '访问域名',
  `name` varchar(100) DEFAULT NULL COMMENT '站点名称',
  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `account` int(11) DEFAULT NULL COMMENT '创建人ID',
  `account_name` varchar(100) DEFAULT NULL COMMENT '创建人姓名',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态；1：正常，9：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_site` */

insert  into `t_site`(`id`,`domain`,`name`,`path`,`create_time`,`account`,`account_name`,`state`) values (7,'www.coding17.com','一起来coding','coding17','2016-02-15 15:06:47',1000,'admin',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
