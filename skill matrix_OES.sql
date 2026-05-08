/*
SQLyog Ultimate v8.82 
MySQL - 5.1.45-community : Database - oes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oes` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `oes`;

/*Table structure for table `contact_feed` */

DROP TABLE IF EXISTS `contact_feed`;

CREATE TABLE `contact_feed` (
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contact_feed` */

insert  into `contact_feed`(`name`,`email`,`message`) values ('Dev Prakash Singh','devsingh98011@gmail.com','This is a very good website'),('Ragini','ragini@gmail.com','Excellent website');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `u_name` varchar(50) NOT NULL,
  `pswd` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`u_name`,`pswd`,`type`) values ('admin','1234','Admin'),('ankitsingh','357','Student'),('Ayush Jaiswal','Ayush878','Student'),('Ayush878','878','Student'),('devprakash001','dev','Student'),('kumnamrata','123456789','Student'),('Nikhil','Nikhil@25','Student'),('rox','rox123','Student');

/*Table structure for table `ques_mstr` */

DROP TABLE IF EXISTS `ques_mstr`;

CREATE TABLE `ques_mstr` (
  `ques_id` int(100) NOT NULL,
  `que` varchar(600) DEFAULT NULL,
  `op1` varchar(100) DEFAULT NULL,
  `op2` varchar(100) DEFAULT NULL,
  `op3` varchar(100) DEFAULT NULL,
  `op4` varchar(100) DEFAULT NULL,
  `ans` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ques_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ques_mstr` */

insert  into `ques_mstr`(`ques_id`,`que`,`op1`,`op2`,`op3`,`op4`,`ans`) values (2,'Which of the following is a valid declaration of a float in Java?','float f = 5.0;','float f = 5;','float f = 5.0f;','Both B and C','Both B and C'),(3,'Which of the following keywords is used to create a class in Java?','new','class','create','object','class'),(4,'Which of the following is not a Java primitive data type?','int','float','String','boolean','String'),(5,'What does JVM stand for?','Java Virtual Machine','Java Variable Machine','Java Visual Machine','Java Version Machine','Java Virtual Machine'),(6,'Which of the following methods can be used to read input from the console in Java?','System.in','Scanner','InputStream','Both A and B','Both A and B'),(7,'Which operator is used to compare two values in Java?','=','==','===','!=','=='),(8,'Which of the following is used to handle exceptions in Java?','try-catch','if-else','switch-case','for-loop','try-catch'),(9,'What is the default value of a boolean variable in Java?','true','false','0','null','false'),(10,'Which of the following is a correct way to declare an array in Java?','int arr[] = new int[5];','int arr = new int[5];','int[] arr = int[5];','int arr[5];','int arr[] = new int[5];'),(11,'What is the correct file extension for Python files?','.pyth','.python','.py','.p','.py'),(12,'Which of the following is a valid way to declare a variable in Python?','int x = 10','x = 10','var x=10','x: int = 10','x = 10'),(13,'Which keyword is used to define a function in Python?','def','func','define','function','def'),(15,'How do you insert comments in Python?','// comment','# comment','/* comment */','-- comment','# comment'),(16,'Which of the following data types is not built into Python?','List','Tuple','Set','Map','Map'),(17,'Which symbol is used for exponentiation in Python?','^','**','*','%','**'),(18,'What is the output of print(2 * 3 ** 2)?','18','12','6','9','12'),(19,'Which of the following functions can be used to convert a string to an integer in Python?','int()','str()','float()','convert','int()'),(20,'How do you create a list in Python?','list = [1, 2, 3]','list = (1, 2, 3)','list = {1, 2, 3}','list = <1, 2, 3>','list = [1, 2, 3]'),(22,'How do you declare a variable in PHP?','$var = \"Hello\";','var $var = \"Hello\";','$var: \"Hello\";','variable $var = \"Hello\";','$var = \"Hello\";'),(25,'What is the output of echo 10 + \"10\"; in PHP?','20','10','1010','Error','20'),(26,'Which superglobal variable is used to access form data in PHP?','$_GET','$_POST','$_REQUEST','All of the above','All of the above'),(27,'How do you create an array in PHP?','$arr = array();','$arr =[];','Both A and B','$arr = new array();','Both A and B'),(28,'What function is used to include a file in PHP?','include()','require()','Both A and B','load()','Both A and B'),(29,'Which of the following is used to start a session in PHP?','session_start();','start_session();','session_begin();','begin_session();','session_start();'),(30,'How can you get the length of a string in PHP?','strlen()','count()','length()','size()','strlen()');

/*Table structure for table `result_mstr` */

DROP TABLE IF EXISTS `result_mstr`;

CREATE TABLE `result_mstr` (
  `user_id` varchar(100) NOT NULL,
  `exam_date` date DEFAULT NULL,
  `score` int(100) DEFAULT NULL,
  `t_attempt` int(100) DEFAULT NULL,
  `c_answer` int(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `result_mstr` */

insert  into `result_mstr`(`user_id`,`exam_date`,`score`,`t_attempt`,`c_answer`) values ('AYUSH JAISWAL','2024-11-26',0,0,0),('devprakash001','2024-11-26',0,0,0),('Nikhil','2024-09-14',10,26,10);

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `u_name` varchar(100) DEFAULT NULL,
  `pswd` varchar(30) DEFAULT NULL,
  `d_reg` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `quali1` varchar(20) DEFAULT NULL,
  `quali2` varchar(30) DEFAULT NULL,
  `addr` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact` decimal(10,0) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_info` */

insert  into `user_info`(`u_name`,`pswd`,`d_reg`,`dob`,`gender`,`quali1`,`quali2`,`addr`,`city`,`contact`,`email`) values ('ankitsingh','357','2024-09-08','2006-12-16','male','B.Tech','M.Tech','Rajaji Puram','Lucknow','9555332604','ankit@gmail.com'),('Ayush878','878','2024-09-12','2005-05-08','male','BCA','MCA','A-180 vimal ngr luucknow','lucknow','8707331446','aayush878@gmail.com'),('kumnamrata','123456789','2024-07-23','1997-07-23','female','mca','M.Tech','a 32 rajajipuram','lucknow','8543984255','kumnamrata.in@gmail.com'),('rox','rox123','2024-09-11','2002-09-13','male','BCA','phd','sdf','Lucknow','9555332604','asds@gmail.com'),('devprakash001','98','2024-09-13','2005-06-30','male','BCA','MCA','1/253 jankipuram','Lucknow','9838011971','devsingh98011@gmail.com'),('Nikhil','Nikhil@25','2024-09-14','2004-04-25','male','BCA','MCA','Ballia','Ballia','9151316783','mauryanikhil254@gmail.com'),('Anany sharma','anany123@','2024-09-23','2003-04-05','male','BCA','MCA','Rajaji Puram','Lucknow','8948725759','ananysharma252@gmail.com'),('Ayush Jaiswal','Ayush878','2024-11-26','2005-05-08','male','bca','MCA','A-180 vimal nagar ','Lucknow','8707331446','aayushjaiswal878@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
