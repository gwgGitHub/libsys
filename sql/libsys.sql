/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.25-log : Database - libsys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`libsys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `libsys`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`admin_name`,`admin_pwd`) values (1,'admin','admin'),(2,'李白','admin'),(3,'韩信','admin'),(4,'露娜','admin'),(5,'赵云','admin'),(6,'兰陵王','admin');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_type_id` int(11) DEFAULT NULL,
  `book_author` varchar(255) DEFAULT NULL,
  `publish_press` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `is_borrow` int(11) DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `creation_time` date DEFAULT NULL,
  `last_update_time` date DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`book_id`,`book_code`,`book_name`,`book_type_id`,`book_author`,`publish_press`,`publish_date`,`is_borrow`,`created_by`,`creation_time`,`last_update_time`) values (1,'BK0000123','JAVA编程思想1',1,'诸葛亮','机械工业出版社','2019-01-18',0,'1','2019-05-18','2019-06-18'),(2,'BK0000124','JAVA编程思想2',2,'刘备','电子工业出版社','2019-01-19',1,'2','2019-05-19','2019-06-18'),(3,'BK0000125','JAVA编程思想3',3,'关羽','清华大学出版社','2019-01-20',0,'3','2019-05-20','2019-06-18'),(4,'BK0000126','JAVA编程思想4',4,'张飞','北大青鸟出版社','2019-01-21',1,'4','2019-05-21','2019-06-18'),(5,'BK0000127','JAVA编程思想5',5,'诸葛亮','中国人民大学出版社','2019-01-22',0,'5','2019-05-22','2019-06-18'),(6,'BK0000128','JAVA编程思想6',6,'刘备','机械工业出版社','2019-01-23',0,'6','2019-05-23','2019-06-18'),(7,'BK0000129','JAVA编程思想7',7,'关羽','电子工业出版社','2019-01-24',1,'1','2019-05-24','2019-06-18'),(10,'BK0000132','JAVA编程思想10',2,'刘备','中国人民大学出版社','2019-01-27',1,'4','2019-05-27','2019-06-22'),(11,'BK0000133','JAVA编程思想11',3,'关羽','机械工业出版社','2019-01-28',0,'5','2019-05-28','2019-06-18'),(12,'BK0000134','JAVA编程思想12',4,'张飞','电子工业出版社','2019-01-29',1,'6','2019-05-29','2019-06-18'),(13,'BK0000135','JAVA编程思想13',5,'诸葛亮','清华大学出版社','2019-01-30',0,'1','2019-05-30','2019-06-18'),(14,'BK0000136','JAVA编程思想14',6,'刘备','北大青鸟出版社','2019-01-31',1,'2','2019-05-31','2019-06-18'),(15,'BK0000137','JAVA编程思想15',7,'关羽','中国人民大学出版社','2019-02-01',0,'3','2019-06-01','2019-06-18'),(16,'BK0000138','JAVA编程思想16',8,'张飞','机械工业出版社','2019-02-02',1,'4','2019-06-02','2019-06-18'),(21,'12333','HelloWorld',4,'李四','北大青鸟出版社','2019-06-19',0,'admin','2019-06-22','2019-06-22'),(23,'dsg','asdf',3,'张三','北大青鸟出版社',NULL,0,'admin','2019-06-22','2019-06-22'),(24,'123','456565',3,'张三','北大青鸟出版社','2019-06-06',0,'admin','2019-06-22','2019-06-22');

/*Table structure for table `book_type` */

DROP TABLE IF EXISTS `book_type`;

CREATE TABLE `book_type` (
  `book_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `book_type` */

insert  into `book_type`(`book_type_id`,`book_type_name`) values (1,'小说'),(2,'文学'),(3,'传记'),(4,'艺术'),(5,'少儿'),(6,'经济'),(7,'管理'),(8,'科技');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `register_time` date DEFAULT NULL,
  `last_logintime` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`,`email`,`gender`,`register_time`,`last_logintime`) values (1,'zhangsan','admin','1257995475@qq.com','女','2019-05-18','2019-06-22'),(2,'lisi','admin','1257995476@qq.com','男','2019-05-18','2019-06-18'),(3,'wagnwu','admin','1257995477@qq.com','女','2019-05-18','2019-06-18'),(4,'zhaoliu','admin','1257995478@qq.com','男','2019-05-18','2019-06-18'),(5,'sunqi','admin','1257995479@qq.com','女','2019-05-18','2019-06-18'),(6,'wangba','admin','1257995480@qq.com','男','2019-05-18','2019-06-18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
