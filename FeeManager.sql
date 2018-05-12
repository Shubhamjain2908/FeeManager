/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.0.37-community-nt : Database - feemanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`feemanager` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `feemanager`;

/*Table structure for table `accountant` */

DROP TABLE IF EXISTS `accountant`;

CREATE TABLE `accountant` (
  `name` varchar(100) default NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) default NULL,
  `pno` varchar(100) default NULL,
  `date` date default NULL,
  `gender` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `flag` int(10) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accountant` */

insert  into `accountant`(`name`,`username`,`email`,`pno`,`date`,`gender`,`password`,`flag`) values ('aaaaaaaaaa','12','got@hbo.com','1234567890','2018-01-06','Female','827ccb0eea8a706c4c34a16891f84e7b',1),('shubham jain','1234','sakj@gmail.com','null','2018-01-05','Male','827ccb0eea8a706c4c34a16891f84e7b',0);

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL default '',
  `password` varchar(100) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`) values ('admin','admin');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `CID` int(11) NOT NULL,
  `name` varchar(100) default NULL,
  `fee` varchar(100) default NULL,
  `duration` varchar(100) default NULL,
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `course` */

insert  into `course`(`CID`,`name`,`fee`,`duration`,`description`) values (1,'JAVA ','4000','5',' Java technology allows you to work and play in a secure computing environment. Upgrading to the latest Java version improves the security of your system, as older versions do not include the latest security updates. '),(2,'JAVA - Core','2000','3',' Java technology allows you to work and play in a secure computing environment. Upgrading to the latest Java version improves the security of your system, as older versions do not include the latest security updates. '),(3,'JAVA - Advance','2500','3',' Java technology allows you to work and play in a secure computing environment. Upgrading to the latest Java version improves the security of your system, as older versions do not include the latest security updates. '),(4,'Hadoop','12000','6','Apache Hadoop is an open-source software framework used for distributed storage and processing of dataset of big data using the MapReduce programming model. It consists of computer clusters built from commodity hardware.'),(5,'Hadoop Advance','18000','6','Apache Hadoop is an open-source software framework used for distributed storage and processing of dataset of big data using the MapReduce programming model. It consists of computer clusters built from commodity hardware.'),(6,'Hibernate','4000','2','Hibernate ORM is an object-relational mapping tool for the Java programming language. It provides a framework for mapping an object-oriented domain model to a relational database.'),(7,'MY Sql','2000','1','SQL is a standard language for storing, manipulating and retrieving data in databases.\r\n\r\nOur SQL tutorial will teach you how to use SQL in: MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, and other database systems.');

/*Table structure for table `courseenrolled` */

DROP TABLE IF EXISTS `courseenrolled`;

CREATE TABLE `courseenrolled` (
  `course` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) default NULL,
  `fee` varchar(100) default NULL,
  `paid` varchar(100) default NULL,
  `due` varchar(100) default NULL,
  PRIMARY KEY  (`course`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `courseenrolled` */

insert  into `courseenrolled`(`course`,`username`,`name`,`fee`,`paid`,`due`) values ('Hadoop Advance','admin','jon',NULL,'11000','7000'),('Hadoop Advance','dany','Jon snow',NULL,NULL,NULL),('JAVA','ff','aaa',NULL,NULL,NULL),('JAVA ','lkaslk','alsjm',NULL,NULL,NULL),('JAVA - Advance','101','tanish sharma','2500','2500','0'),('JAVA - Core','admin','Shubham Jain',NULL,NULL,NULL),('JAVA - Core ','jain','Shubham jain',NULL,NULL,NULL);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `email` varchar(100) default NULL,
  `comment` varchar(500) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`email`,`comment`) values ('sjain88715@gmail.com','Nice works....'),('asdasd@sda.dfs','sdasd'),('as@asd','Sas'),('sjain88715@gmail.com','bb'),('ab@gah.com','hhb'),('hskja@hamail.com','asd'),('sjain88715@gmail.com','nice work brother...');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `Name` varchar(100) default NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) default NULL,
  `pno` varchar(100) default NULL,
  `dob` date default NULL,
  `gender` varchar(100) default NULL,
  `course` varchar(100) NOT NULL,
  `fee` varchar(100) default NULL,
  `paid` varchar(100) default NULL,
  `due` varchar(100) default NULL,
  `Address` varchar(100) default NULL,
  `pincode` varchar(100) default NULL,
  `city` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `joiningdate` date default NULL,
  `password` varchar(100) default NULL,
  `flag` int(11) default NULL,
  `id` int(11) default NULL,
  PRIMARY KEY  (`username`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`Name`,`username`,`email`,`pno`,`dob`,`gender`,`course`,`fee`,`paid`,`due`,`Address`,`pincode`,`city`,`country`,`joiningdate`,`password`,`flag`,`id`) values ('tanish sharma','101','null','28291038462','2018-01-18','null','JAVA - Advance','2500','2500','0','SJAJ ASKJA ALSK','null','null','null','2018-01-18','e10adc3949ba59abbe56e057f20f883e',0,7),('shubham jain','1234','shubhamjain2908@gmail.com','8871574375','1996-08-29',NULL,'JAVA - Core','2000','2000','0','31 Greater Vaishali','452009','indore',NULL,'2018-01-18','922ec9531b1f94add983a8ce2ebdc97b',0,1),('jon','admin','shubhamjain2908@gmail.com','8871574375','1996-08-29','null','Hadoop Advance','18000','11000','7000','31 Greater Vaishali','90120','kasakas','null','2018-01-10','e10adc3949ba59abbe56e057f20f883e',0,4),('Jon snow','dany','dany@dragons.in','9873645890','1996-08-29','null','Hadoop Advance','18000','12000','6000','HBO office , Manhattan 29037281\r\nNew york city','null','null','null','2018-01-01','827ccb0eea8a706c4c34a16891f84e7b',0,6),('aaa','ff',NULL,'3232','2018-01-03',NULL,'JAVA ','4000','4000','0','123123','321312','adsd',NULL,'2018-01-03','81dc9bdb52d04dc20036dbd8313ed055',0,2),('shubham jain','jain',NULL,'08871574375','2018-01-10',NULL,'JAVA - Core','2000','1000','1000','31 Greater Vaishali','452009','indore',NULL,'2018-01-10','827ccb0eea8a706c4c34a16891f84e7b',0,3),('alsjm','lkaslk','null','9020921','2018-01-06','null','JAVA ','4000','4000','0','sanm,ads','9209','0912','null','2018-01-06','e10adc3949ba59abbe56e057f20f883e',0,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
