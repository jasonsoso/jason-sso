/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.19 : Database - jason_sso
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jason_sso` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

/*Table structure for table `security_authority` */

DROP TABLE IF EXISTS `security_authority`;

CREATE TABLE `security_authority` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permission` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `security_authority` */

insert  into `security_authority`(`id`,`name`,`permission`) values ('40289f813e60ae93013e60bcd7880003','删除权限','authority:delete'),('40289f813e60ae93013e60bd4d670004','查看权限','authority:list'),('40289f813e60ae93013e60bea4510005','编辑权限','authority:edit'),('40289f813e60ae93013e60bfacc60006','创建权限','authority:create'),('40289f813e60ae93013e60c051e70007','删除角色','role:create'),('40289f813e60ae93013e60c1fcc80008','编辑角色','role:edit'),('40289f813e60ae93013e60c2bb490009','刪除角色','role:delete'),('40289f813e60ae93013e60c3509f000a','查看角色','role:list'),('40289f813e60ae93013e60c44463000b','查看用戶','user:list'),('40289f813e60ae93013e60c4899e000c','编辑用户','user:edit'),('40289f813e60c593013e60c640ae0001','新增用户','user:create'),('40289f813e60c593013e60c69fb00002','删除用户','user:delete');

/*Table structure for table `security_role` */

DROP TABLE IF EXISTS `security_role`;

CREATE TABLE `security_role` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `show_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `security_role` */

insert  into `security_role`(`id`,`name`,`show_name`) values ('40289f813e60c815013e60da83770001','admin','管理员'),('40289f813e60c815013e60e072140004','test','测试人员'),('40289f813e60c815013e60e0c9050005','testuser','测试用户人员');

/*Table structure for table `security_role_authority` */

DROP TABLE IF EXISTS `security_role_authority`;

CREATE TABLE `security_role_authority` (
  `role_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authority_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`authority_id`),
  KEY `FKD8297599CF354522` (`role_id`),
  KEY `FKD82975994615BE5F` (`authority_id`),
  CONSTRAINT `FKD82975994615BE5F` FOREIGN KEY (`authority_id`) REFERENCES `security_authority` (`id`),
  CONSTRAINT `FKD8297599CF354522` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `security_role_authority` */

insert  into `security_role_authority`(`role_id`,`authority_id`) values ('40289f813e60c815013e60da83770001','40289f813e60ae93013e60bcd7880003'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60bd4d670004'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60bea4510005'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60bfacc60006'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60c051e70007'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60c1fcc80008'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60c2bb490009'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60c3509f000a'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60c44463000b'),('40289f813e60c815013e60da83770001','40289f813e60ae93013e60c4899e000c'),('40289f813e60c815013e60da83770001','40289f813e60c593013e60c640ae0001'),('40289f813e60c815013e60da83770001','40289f813e60c593013e60c69fb00002'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60bcd7880003'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60bd4d670004'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60bea4510005'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60c051e70007'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60c1fcc80008'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60c2bb490009'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60c3509f000a'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60c44463000b'),('40289f813e60c815013e60e072140004','40289f813e60ae93013e60c4899e000c'),('40289f813e60c815013e60e072140004','40289f813e60c593013e60c640ae0001'),('40289f813e60c815013e60e072140004','40289f813e60c593013e60c69fb00002'),('40289f813e60c815013e60e0c9050005','40289f813e60ae93013e60c44463000b'),('40289f813e60c815013e60e0c9050005','40289f813e60ae93013e60c4899e000c'),('40289f813e60c815013e60e0c9050005','40289f813e60c593013e60c640ae0001'),('40289f813e60c815013e60e0c9050005','40289f813e60c593013e60c69fb00002');

/*Table structure for table `security_user` */

DROP TABLE IF EXISTS `security_user`;

CREATE TABLE `security_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `truename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_non_expired` bit(1) NOT NULL,
  `account_non_locked` bit(1) NOT NULL,
  `credentials_non_expired` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `security_user` */

insert  into `security_user`(`id`,`username`,`truename`,`password`,`email`,`photo`,`account_non_expired`,`account_non_locked`,`credentials_non_expired`,`enabled`) values (1,'jasonsoso','jasonsoso','2c14647b42fde65ede6c8c716978ec73','jasonsoso@jasonsoso.com',NULL,'','','',''),(2,'jasontest','jasontest','2c14647b42fde65ede6c8c716978ec73','648636045@qq.com',NULL,'','','','');

/*Table structure for table `security_user_role` */

DROP TABLE IF EXISTS `security_user_role`;

CREATE TABLE `security_user_role` (
  `role_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK6DD3562BCF354522` (`role_id`),
  KEY `FK6DD3562B158FB49B` (`user_id`),
  CONSTRAINT `FK6DD3562B158FB49B` FOREIGN KEY (`user_id`) REFERENCES `security_user` (`id`),
  CONSTRAINT `FK6DD3562BCF354522` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `security_user_role` */

insert  into `security_user_role`(`role_id`,`user_id`) values ('40289f813e60c815013e60da83770001',1),('40289f813e60c815013e60e072140004',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
