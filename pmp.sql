/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.49 : Database - internship
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`internship` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `internship`;

/*Table structure for table `tbl_address` */

DROP TABLE IF EXISTS `tbl_address`;

CREATE TABLE `tbl_address` (
  `addressid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country` bigint(20) DEFAULT NULL,
  `city` bigint(20) DEFAULT NULL,
  `pin` bigint(20) DEFAULT NULL,
  `address` tinytext,
  `usrid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_address` */

/*Table structure for table `tbl_approles` */

DROP TABLE IF EXISTS `tbl_approles`;

CREATE TABLE `tbl_approles` (
  `appid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `role` tinytext NOT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_approles` */

insert  into `tbl_approles`(`appid`,`role`,`status`) values (1,'Admin',''),(2,'Project Manager',''),(3,'Employee',''),(4,'Client','');

/*Table structure for table `tbl_cities` */

DROP TABLE IF EXISTS `tbl_cities`;

CREATE TABLE `tbl_cities` (
  `cityid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cityname` tinytext NOT NULL,
  `country` int(11) NOT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_cities` */

insert  into `tbl_cities`(`cityid`,`cityname`,`country`) values (1,'Vizag',1),(2,'Hyderabad',1);

/*Table structure for table `tbl_clientrequests` */

DROP TABLE IF EXISTS `tbl_clientrequests`;

CREATE TABLE `tbl_clientrequests` (
  `taskid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` bigint(20) NOT NULL,
  `taskname` varchar(255) NOT NULL,
  `enddate` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `taskrequestdate` date NOT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_clientrequests` */

insert  into `tbl_clientrequests`(`taskid`,`clientid`,`taskname`,`enddate`,`description`,`taskrequestdate`) values (1,2,'pdr','1995-09-08','nghh','2016-06-04');

/*Table structure for table `tbl_clients` */

DROP TABLE IF EXISTS `tbl_clients`;

CREATE TABLE `tbl_clients` (
  `clientid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clientname` text NOT NULL,
  `clientmail` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `clientphonenumber` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`clientid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_clients` */

insert  into `tbl_clients`(`clientid`,`clientname`,`clientmail`,`username`,`password`,`gender`,`pic`,`clientphonenumber`,`address`,`country`,`state`,`city`,`pin`,`status`) values (2,'rerer',NULL,'poi','pp@g.c',1,'','999999','',1,1,1,123,2),(3,'pdrpdrpdr',NULL,'','',1,'','9999999999','',1,1,1,12232,1),(4,'koti','k@g.c','o@g.c','dsfe',1,NULL,'1234','1-4',1,1,1,123,1);

/*Table structure for table `tbl_countries` */

DROP TABLE IF EXISTS `tbl_countries`;

CREATE TABLE `tbl_countries` (
  `countryid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `countryname` tinytext NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_countries` */

insert  into `tbl_countries`(`countryid`,`countryname`) values (1,'India'),(2,'United States');

/*Table structure for table `tbl_departments` */

DROP TABLE IF EXISTS `tbl_departments`;

CREATE TABLE `tbl_departments` (
  `deptid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deptname` tinytext NOT NULL,
  `status` bigint(1) NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_departments` */

insert  into `tbl_departments`(`deptid`,`deptname`,`status`) values (1,'Admins',1),(2,'Project Management',1),(3,'Developer',1),(4,'Tester',1),(5,'others',1);

/*Table structure for table `tbl_employees` */

DROP TABLE IF EXISTS `tbl_employees`;

CREATE TABLE `tbl_employees` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` tinytext NOT NULL,
  `email` varchar(255) NOT NULL,
  `depid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `roleid` int(11) NOT NULL,
  `phonenumber` varchar(22) NOT NULL,
  `city` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_employees` */

insert  into `tbl_employees`(`userid`,`fullname`,`email`,`depid`,`username`,`password`,`pic`,`gender`,`address`,`roleid`,`phonenumber`,`city`,`country`,`state`,`pin`,`status`) values (1,'pdr','p@g.c',1,'p@g.c','pdr','',1,'1-4',1,'8985844839',1,NULL,NULL,NULL,''),(2,'','',1,'','','',1,'2',1,'',1,1,1,1,''),(3,'','',1,'','','',1,'2',1,'',1,1,1,1,''),(4,'','',1,'','','',1,'2',1,'',1,1,1,1,''),(5,'','',2,'','','',1,'2',1,'',1,1,1,1,''),(7,'iooo','a@g.c',1,'qwe','qwe',NULL,1,'2',1234,'1-4',1,1,1,12,''),(8,'iooo','a@g.c',2,'p@g.c','qwe',NULL,1,'3',1234,'1-4',1,1,1,12,''),(9,'aaaa','k@g.c',4,'p@g.c','sdg',NULL,1,'3',1234,'1-4',1,1,1,12,'');

/*Table structure for table `tbl_gender` */

DROP TABLE IF EXISTS `tbl_gender`;

CREATE TABLE `tbl_gender` (
  `genderid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` tinytext NOT NULL,
  PRIMARY KEY (`genderid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_gender` */

insert  into `tbl_gender`(`genderid`,`gender`) values (1,'Male'),(2,'Female');

/*Table structure for table `tbl_priority` */

DROP TABLE IF EXISTS `tbl_priority`;

CREATE TABLE `tbl_priority` (
  `priorityid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `priority` tinytext NOT NULL,
  PRIMARY KEY (`priorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_priority` */

insert  into `tbl_priority`(`priorityid`,`priority`) values (1,'Hot(now)'),(2,'Urgent'),(3,'High'),(4,'\rMedium'),(5,'Low');

/*Table structure for table `tbl_projectdetails` */

DROP TABLE IF EXISTS `tbl_projectdetails`;

CREATE TABLE `tbl_projectdetails` (
  `projectid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `projectname` varchar(255) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `actualcomplete` date DEFAULT NULL,
  `projectworkstatus` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `projectdesc` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `mgrid` int(11) NOT NULL,
  `status` bigint(1) NOT NULL,
  PRIMARY KEY (`projectid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_projectdetails` */

insert  into `tbl_projectdetails`(`projectid`,`projectname`,`startdate`,`enddate`,`actualcomplete`,`projectworkstatus`,`priority`,`clientid`,`projectdesc`,`amount`,`mgrid`,`status`) values (2,'pdr','2016-05-03','2016-05-11','2016-05-03',4,3,3,'vwehrw',1,1,2),(5,'dr','2016-06-07','2016-06-02','2016-06-03',3,3,3,'retret\r\n',23,2,1),(7,'hello','1995-09-08','1995-06-09','1992-09-08',1,2,2,'bgh\r\n',123,2,1),(8,'lllllll','2016-09-08','2016-08-09',NULL,1,1,3,'gf',121,2,1);

/*Table structure for table `tbl_states` */

DROP TABLE IF EXISTS `tbl_states`;

CREATE TABLE `tbl_states` (
  `stateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `statename` tinytext NOT NULL,
  `countryid` bigint(20) NOT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_states` */

insert  into `tbl_states`(`stateid`,`statename`,`countryid`) values (1,'Andhra',1),(2,'qwertyuiop',2);

/*Table structure for table `tbl_status` */

DROP TABLE IF EXISTS `tbl_status`;

CREATE TABLE `tbl_status` (
  `statusid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_status` */

insert  into `tbl_status`(`statusid`,`status`) values (1,'Active'),(2,'Inactive');

/*Table structure for table `tbl_tasks` */

DROP TABLE IF EXISTS `tbl_tasks`;

CREATE TABLE `tbl_tasks` (
  `taskid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) NOT NULL,
  `projectid` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  `taskstatus` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `actualcomplete` date DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `employeeid` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_tasks` */

insert  into `tbl_tasks`(`taskid`,`taskname`,`projectid`,`priority`,`taskstatus`,`startdate`,`enddate`,`actualcomplete`,`description`,`employeeid`,`status`) values (2,'008008',2,1,1,'2016-06-09','2016-09-08','2016-09-05','yeu\r\n\r\n',3,''),(3,'007007',7,1,1,'2016-06-09','2016-09-08','2016-09-05','yeu\r\n',3,''),(4,'007007',5,1,1,'2016-06-09','2016-09-08','2016-09-05','yeu\r\n',3,''),(5,'poiuytrewq',2,4,2,'2016-06-09','2016-09-08','2017-06-08','',3,''),(6,'lllll',8,2,1,'2016-09-08','2016-08-09',NULL,'jtyut',1,'');

/*Table structure for table `tbl_users` */

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` tinytext NOT NULL,
  `email` varchar(255) NOT NULL,
  `depid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `phonenumber` varchar(22) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_users` */

insert  into `tbl_users`(`userid`,`fullname`,`email`,`depid`,`username`,`password`,`pic`,`gender`,`roleid`,`phonenumber`,`address`,`city`,`country`,`state`,`pin`,`status`) values (1,'pdr','p@g.c',1,'p@g.c','pdr','',1,1,'9098765432','1-4',1,1,1,1234,1),(2,'mona','py@g.c',1,'py@g.c','mona','',2,1,'909875432','1-5',2,NULL,NULL,NULL,1),(3,'sindhu','s@g.c',1,'s@g.c','nony','',1,1,'9098765434','1-6',3,NULL,NULL,NULL,1),(4,'poiuytrewq','yo@g.c',1,'ghjg','','',1,2,'1','',1,1,1,1,1),(5,'poiuytrewq','',1,'hghj','','',1,3,'123','',1,1,1,1,1),(7,'fuck','',2,'fuck@fuck.fuck','fuck','',1,2,'1','123-99',1,1,1,1,1),(9,'kodanda rama durgarao','hj@g.c',1,'jh@g.v','jkl','',1,4,'8985844839','1-4,gudurmandal',1,1,1,533780,1),(10,'iooo','a@g.c',1,'qwe','qwe','null',1,4,'1234','1-4',1,1,1,12,1),(11,'iooo','a@g.c',2,'p@g.c','qwe',NULL,1,3,'1234','1-4',1,1,1,12,1),(12,'koti','k@g.c',5,'o@g.c','dsfe',NULL,1,4,'1234','1-4',1,1,1,123,1),(13,'lucky','k@g.c',1,'p@g.c','rwwe',NULL,1,1,'1234','1-4',1,1,1,12,1),(14,'aaaa','a@g.c',4,'p@g.c','ssd',NULL,1,3,'1234','1-4',1,1,1,123,1),(15,'aaaa','k@g.c',4,'p@g.c','sdg',NULL,1,3,'1234','1-4',1,1,1,12,1);

/*Table structure for table `tbl_workstatus` */

DROP TABLE IF EXISTS `tbl_workstatus`;

CREATE TABLE `tbl_workstatus` (
  `statusid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_workstatus` */

insert  into `tbl_workstatus`(`statusid`,`status`) values (1,'Open'),(2,'Inprogress'),(3,'Close'),(4,'Completed');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
