-- Generation time: Wed, 19 Sep 2018 16:02:03 +0200
-- Host: localhost
-- DB name: pdocrud
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `level` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `admin` VALUES ('1','Mr. Admin','admin@example.com','1234','1'); 


DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_title` varchar(255) NOT NULL,
  `ad_description` varchar(255) NOT NULL,
  `ad_category` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `featured_image1` varchar(255) NOT NULL,
  `featured_image2` varchar(255) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone_number` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `reason` varchar(250) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL COMMENT '0 undefined , 1 present , 2  absent',
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `audition`;
CREATE TABLE `audition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `performance_title` varchar(250) NOT NULL,
  `performer_name` varchar(255) NOT NULL,
  `length_of_performance` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL,
  `instruments` varchar(255) NOT NULL,
  `prop` varchar(255) NOT NULL,
  `microphones` varchar(255) NOT NULL,
  `cd` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `audition` VALUES ('4','tt','tt','tt','1','0','1','0','1','1','tt','tt','tt@g.com','ghgh'),
('5','uu','uu','uu','1','1','0','1','0','0','uu','uu','uu!@g.m','jhgjgh'),
('6','tt','tt','tt','1','0','1','0','1','1','tt','tt','tt@g.com','ghgh'); 


DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `booking_status_master`;
CREATE TABLE `booking_status_master` (
  `booking_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_text` varchar(200) NOT NULL,
  PRIMARY KEY (`booking_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `bookroom`;
CREATE TABLE `bookroom` (
  `booking_Id` int(11) NOT NULL AUTO_INCREMENT,
  `room_Id` int(11) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `no_of_adult` int(11) NOT NULL,
  `no_of_child` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `booking_amount` double NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `booking_status` int(11) NOT NULL,
  PRIMARY KEY (`booking_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `bookroom` VALUES ('1','1','jon','Snow','2016-11-04','2016-11-11','2','2','someemai@gmail.com','+919977848644','100','Paypal','1'); 


DROP TABLE IF EXISTS `car_booking`;
CREATE TABLE `car_booking` (
  `booking_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pick_up_location` varchar(255) NOT NULL,
  `drop_off_location` varchar(255) NOT NULL,
  `car_type` varchar(200) NOT NULL,
  `car_with` varchar(255) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `additional_request` varchar(255) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `checkout`;
CREATE TABLE `checkout` (
  `checkout_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `name_on_card` varchar(250) NOT NULL,
  `card_number` varchar(50) NOT NULL,
  `cvv_number` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL,
  `expiration_year` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `city_name` varchar(250) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(250) NOT NULL,
  `code` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `class` VALUES ('1','first','111','1'),
('2','second','2','5'),
('3','third','3','5'),
('4','fourth','4','5'); 


DROP TABLE IF EXISTS `class_routine`;
CREATE TABLE `class_routine` (
  `class_routine_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `day` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`class_routine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `contact_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip/postal_code` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(250) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `country` VALUES ('1','USA'),
('2','INDIA'),
('3','Australia'),
('4','Newzealand'); 


DROP TABLE IF EXISTS `cruises_booking`;
CREATE TABLE `cruises_booking` (
  `cruises_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cruise_destination` varchar(200) NOT NULL,
  `cruise_length` varchar(255) NOT NULL,
  `departure_month` varchar(200) NOT NULL,
  `day` varchar(200) NOT NULL,
  `cruise_departure_port` varchar(255) NOT NULL,
  `cruise_line` varchar(255) NOT NULL,
  `where_do_you_live?` varchar(255) NOT NULL,
  PRIMARY KEY (`cruises_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `cruises_booking` VALUES ('1','ttt','tut','6','6','766','767',''); 


DROP TABLE IF EXISTS `customer_feedback`;
CREATE TABLE `customer_feedback` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `products_quality_rating` varchar(250) NOT NULL,
  `products_interested` varchar(250) NOT NULL,
  `service_satisfraction` varchar(250) NOT NULL,
  `recommendation` varchar(250) NOT NULL,
  `how_long_have_you_been_a_customer_of_our_company` varchar(250) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `customer_support_request`;
CREATE TABLE `customer_support_request` (
  `request_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `your_full_name` varchar(11) NOT NULL,
  `your_email` varchar(11) NOT NULL,
  `category` varchar(200) NOT NULL,
  `importance` varchar(200) NOT NULL,
  `brief_description` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `send_a_copy` varchar(100) NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `customertable`;
CREATE TABLE `customertable` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_contact_number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `customer_address` varchar(200) DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_state` varchar(50) DEFAULT NULL,
  `customer_country` varchar(50) DEFAULT NULL,
  `postal_code` int(10) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

INSERT INTO `customertable` VALUES ('1','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('2','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('3','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('4','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('5','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('6','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('7','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('8','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('9','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('10','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('11','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('12','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('13','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('14','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('15','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('16','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('17','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('18','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('19','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('20','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('21','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('22','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('23','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('24','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('25','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('26','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('27','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('28','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('29','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL),
('30','bob',NULL,'builder@gmail.com',NULL,NULL,NULL,NULL,'99423',NULL); 


DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation` (
  `donation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `donation_amount` varchar(200) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  PRIMARY KEY (`donation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory` (
  `dormitory_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_room` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dormitory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

INSERT INTO `employee` VALUES ('108','teste','teste','teste','teste','teste','test'),
('8','Florence','Merrill','999 Eget Avenue','Pawtucket','AL','56012'),
('9','Vernonxxxxx','Klein','Ap #638-2444 Sem. Rd.','Wynne','VA','14715'),
('105','gary','ason','143 Pullman ave.','chicago','illinois','91391'),
('11','Susan','Floyd less','2138 Mauris Rd.','Kent ','SD','94619'),
('12','Ocean','Welch','Ap #328-4231 Aliquam Ave','Durango','MN','34848'),
('13','Olympia','Reid','Ap #119-6421 Vulputate St.','Laconia','AL','42649'),
('14','Leigh','Madden','1134 Commodo St.','Jeannette','IN','64702'),
('15','Jenna','Sims','Ap #188-3087 Semper Rd.','White Plains','CO','51000'),
('16','Marsden','Mcknight','891-2555 Ligula Av.','Peekskill','VT','38453'),
('17','Demetria','Mooney','Ap #400-7304 Vehicula Ave','Signal Hill','GA','32448'),
('18','April','Copeland','P.O. Box 940, 1713 Nunc Rd.','White Plains','CA','98831'),
('19','Jason','Hale','Ap #667-483 Vulputate, St.','Ventura','SC','09689'),
('20','Tana','Malone','640-9421 Arcu. Avenue','Modesto','CA','90815'),
('21','Dillon','Andrews','Ap #775-8997 Nunc Avenue','Juneau','GA','18307'),
('22','Stone','Kirkland','P.O. Box 686, 9425 Morbi Road','Colorado Springs','UT','93246'),
('23','Edward','Burton','5310 Vel, Avenue','Harrisburg','AK','15122'),
('24','Adam','Ramsey','6383 Euismod Road','Fulton','AZ','14148'),
('25','Serina','Randolph','Ap #832-9968 Cras Rd.','Baltimore','VT','02934'),
('26','Abraham','Beasley','1146 Scelerisque, Road','Pierre','WV','10668'),
('27','Kerry','Grant','P.O. Box 613, 193 Nullam St.','Bloomington','MN','59983'),
('28','Wyoming','Sullivan','9747 Volutpat Road','Auburn Hills','OR','85244'),
('29','Reese','Singleton','7322 Sagittis. Av.','Schaumburg','WY','97495'),
('30','Rosalyn','Spencer','P.O. Box 296, 6612 Est. Ave','Eatontown','WV','88032'),
('31','Shelby','Cohen','P.O. Box 196, 4793 Volutpat. Rd.','Basin','IA','03952'),
('32','Quinn','Wiley','P.O. Box 599, 2455 Accumsan Avenue','Centennial','SC','61389'),
('33','Kameko','Cox','181-6497 At Rd.','Nenana','AK','45163'),
('34','Brody','Mccarty','P.O. Box 588, 4717 Tellus. Street','Vicksburg','NJ','67362'),
('35','Lana','England','576-4991 Enim Av.','Johnstown','FL','72504'),
('36','Cassandra','Graves','1951 Turpis. Street','Dickinson','MS','14187'),
('37','Nicholas','Brock','222-910 Amet Rd.','Tonawanda','IA','04308'),
('38','Kuame','Huffman','793-1081 In, Av.','South El Monte','MA','80857'),
('39','Xenos','Clarke','437-3387 Arcu Road','Newburgh','NV','05780'),
('40','Cooper','Jensen','P.O. Box 138, 4309 Non Rd.','Opelousas','VA','93062'),
('41','Deacon','Tyson','156-1937 Ultrices Rd.','Spokane Valley','FL','76778'),
('42','Dawn','Potter','8472 Pellentesque Rd.','Chesapeake','OH','66729'),
('43','Zane','Calderon','739-7377 Nascetur Rd.','Elsmere','VA','62940'),
('44','Cecilia','Carney','3243 Lorem Ave','Shawnee','NM','22241'),
('45','Connor','Marquez','5263 Purus Ave','Lockport','ID','40334'),
('46','Gillian','Kirk','P.O. Box 570, 1525 Magna Av.','Ada','CT','30771'),
('47','Wallace','Gillespie','550-2279 Tellus, Ave','Missoula','WA','96349'),
('48','Risa','Ayers','Ap #948-9845 Mi Avenue','Pass Christian','OH','72881'),
('49','Callum','Solomon','178-516 Ultrices. Rd.','Fall River','MD','03691'),
('50','Nola','Rojas','Ap #185-9503 Sed Street','Juneau','NH','77099'),
('51','Talon','Rowland','4575 Massa. Street','Marquette','IN','37429'),
('52','Cheryl','Bowers','1348 Ut Rd.','Hutchinson','IL','44144'),
('53','Bree','Gaines','Ap #190-9800 Facilisi. Rd.','Bowling Green','ME','62391'),
('54','Lacota','Bonner','3229 Felis. St.','Jenks','DE','54999'),
('55','Bradley','Freeman','2339 Sit Rd.','New Orleans','WY','83323'),
('56','Jasper','Santiago','2990 Malesuada Rd.','Williamsport','IL','00409'),
('57','Hilary','Conner','2000 Diam. Rd.','Roanoke','MN','50683'),
('58','Zena','Fox','9604 Dolor Road','Palm Springs','WA','93143'),
('59','Britanni','Schmidt','485-6357 Dictum Road','Bradbury','VT','48121'),
('60','Caleb','Lynn','Ap #318-2121 Sapien Rd.','Kettering','MS','74815'),
('61','Madeson','Robbins','P.O. Box 690, 861 Magna. Avenue','Bismarck','MN','37748'),
('62','Emily','Richmond','P.O. Box 629, 2724 Velit. Av.','Las Cruces','VA','34490'),
('63','Damian','Wilson','Ap #209-5365 Pulvinar Road','Boulder','ND','37920'),
('64','Mikayla','Mendez','P.O. Box 244, 1762 Libero. Ave','Buffalo','SD','28431'),
('65','Igor','Gutierrez','192-1646 Hendrerit. St.','Chicopee','CT','94701'),
('66','Heather','Terrell','P.O. Box 107, 7190 Augue, Rd.','Statesboro','MI','36440'),
('67','Rose','Barry','P.O. Box 358, 4774 Sagittis Street','Fairmont','UT','37251'),
('68','Bernard','Gilmore','546-292 Venenatis St.','Sandpoint','OH','35643'),
('69','Meghan','Mack','1845 Consectetuer Av.','Blacksburg','OH','09551'),
('70','Lillith','Terrell','P.O. Box 495, 7797 Leo. Ave','Augusta','DE','44898'),
('71','Jaquelyn','James','795-3722 Lectus. Street','Alpharetta','WI','91617'),
('72','Karly','Beard','370-8115 Mus. Ave','Norfolk','GA','78062'),
('73','Kareem','Cooke','9070 Ante, Av.','Somersworth','WA','87594'),
('74','Amethyst','Bass','Ap #387-6244 Malesuada Av.','Clarksville','NE','24386'),
('75','Silas','Bates','P.O. Box 220, 5319 Faucibus Ave','West Lafayette','OH','49890'),
('76','Sybil','Watts','502-6016 Ultrices, Road','Santa Clarita','AK','42911'),
('77','Warren','Hays','Ap #387-9280 Dui, Avenue','Dover','PA','75674'),
('78','Kirsten','Martin','P.O. Box 548, 6344 Sit Av.','Benton Harbor','MD','65775'),
('79','Cade','Lowe','4356 Lorem, Ave','Valdez','NM','37102'),
('80','Penelope','Moss','Ap #705-2124 Phasellus Rd.','Reedsport','AK','74040'),
('81','Chase','Andrews','9353 Rutrum Av.','Salt Lake City','MO','89592'),
('82','Fatima','Mcconnell','P.O. Box 144, 1027 Aliquam Avenue','Yazoo City','CT','84334'),
('83','Kelly','Garcia','P.O. Box 902, 1916 Vel, Road','Plymouth','AK','91414'),
('84','Aubrey','Leblanc','Ap #479-3210 Magnis Street','Phoenix','MD','89834'),
('85','Cassidy','Dyer','P.O. Box 169, 959 Et, Road','Clarksville','NY','71212'),
('86','Rina','Lawrence','8469 Eu Road','Berkeley','KY','14459'),
('87','Malcolm','Richard','8826 Erat St.','Boston','CA','22844'),
('88','Avye','Fowler','Ap #942-4652 Aliquam Rd.','Roseville','IN','43892'),
('89','Jeremy','Randolph','Ap #939-5888 Mollis. Rd.','Rolling Hills Estates','MI','72412'),
('90','Ray','Clayton','P.O. Box 422, 2469 Curabitur Rd.','Hope','IN','64889'),
('91','Lynn','Turner','249 Sed Street','Austin','IN','05518'),
('92','Eric','Guzman','173-245 Arcu. Ave','Temecula','LA','91680'),
('93','Daphne','Preston','Ap #542-5775 Nibh Rd.','Sun Valley','TN','31014'),
('94','Ivy','Vazquez','P.O. Box 292, 8217 Vel Avenue','Half Moon Bay','TX','92194'),
('95','Teegan','Jimenez','5503 Odio, Rd.','GuÃ¡nica','SC','12336'),
('96','Quemby','Floyd','200-5264 Laoreet Ave','Orangeburg','WI','93197'),
('97','Aristotle','Harris','348-9080 Ultrices Rd.','Cheyenne','MA','74732'),
('98','avel','Floyd','502-9689 Ante Street','Hartland','NV','81261'),
('99','Liberty','Gomez','Ap #685-1260 Velit Avenue','Baltimore','SC','21141'),
('100','Ivy','Hebert','4393 Sodales Av.','Des Moines','MD','25787'),
('101','adan ','rivera','ad','heredia','he','1'),
('110','segdsf','dgsdfgs','dfgsdfgsdfg','sdfgsdfg','mo','12312'); 


DROP TABLE IF EXISTS `empsalary`;
CREATE TABLE `empsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Department` varchar(255) DEFAULT NULL,
  `Salary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

INSERT INTO `empsalary` VALUES ('1','Sales and Marketing','281'),
('2','Legal Department','737'),
('3','Tech Support','808'),
('4','Sales and Marketing','670'),
('5','Asset Management','937'),
('6','Asset Management','581'),
('7','Payroll','621'),
('8','Advertising','919'),
('9','Quality Assurance','717'),
('10','Quality Assurance','875'),
('11','Public Relations','554'),
('12','Legal Department','775'),
('13','Payroll','434'),
('14','Public Relations','765'),
('15','Public Relations','667'),
('16','Human Resources','339'),
('17','Quality Assurance','691'),
('18','Asset Management','970'),
('19','Tech Support','849'),
('20','Asset Management','935'),
('21','Customer Relations','463'),
('22','Sales and Marketing','981'),
('23','Media Relations','906'),
('24','Asset Management','842'),
('25','Asset Management','339'),
('26','Payroll','241'),
('27','Media Relations','946'),
('28','Asset Management','510'),
('29','Tech Support','855'),
('30','Research and Development','401'),
('31','Accounting','576'),
('32','Legal Department','758'),
('33','Customer Service','996'),
('34','Accounting','597'),
('35','Customer Service','823'),
('36','Payroll','973'),
('37','Asset Management','427'),
('38','Human Resources','739'),
('39','Tech Support','960'),
('40','Asset Management','485'),
('41','Public Relations','777'),
('42','Accounting','807'),
('43','Tech Support','283'),
('44','Human Resources','216'),
('45','Public Relations','327'),
('46','Quality Assurance','586'),
('47','Research and Development','717'),
('48','Advertising','472'),
('49','Customer Service','938'),
('50','Accounting','309'),
('51','Sales and Marketing','751'),
('52','Media Relations','278'),
('53','Quality Assurance','355'),
('54','Media Relations','827'),
('55','Customer Relations','257'),
('56','Asset Management','247'),
('57','Customer Service','525'),
('58','Accounting','664'),
('59','Customer Service','260'),
('60','Finances','395'),
('61','Sales and Marketing','296'),
('62','Media Relations','847'),
('63','Quality Assurance','993'),
('64','Payroll','732'),
('65','Human Resources','263'),
('66','Human Resources','804'),
('67','Advertising','502'),
('68','Legal Department','571'),
('69','Advertising','266'),
('70','Finances','979'),
('71','Accounting','655'),
('72','Finances','944'),
('73','Customer Relations','399'),
('74','Public Relations','241'),
('75','Research and Development','858'),
('76','Human Resources','577'),
('77','Customer Service','810'),
('78','Sales and Marketing','482'),
('79','Media Relations','390'),
('80','Quality Assurance','247'),
('81','Customer Service','258'),
('82','Human Resources','382'),
('83','Research and Development','636'),
('84','Sales and Marketing','261'),
('85','Public Relations','984'),
('86','Quality Assurance','852'),
('87','Sales and Marketing','557'),
('88','Legal Department','271'),
('89','Public Relations','684'),
('90','Legal Department','920'),
('91','Payroll','293'),
('92','Customer Relations','979'),
('93','Payroll','983'),
('94','Advertising','573'),
('95','Finances','868'),
('96','Research and Development','643'),
('97','Media Relations','220'),
('98','Media Relations','903'),
('99','Accounting','963'),
('100','Research and Development','488'); 


DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(250) NOT NULL,
  `event_location` text NOT NULL,
  `event_date_and_time` date NOT NULL,
  `description_of_event` varchar(250) NOT NULL,
  `link_to_url/website` varchar(255) NOT NULL,
  `include_youtube_video` varchar(255) NOT NULL,
  `event_image` varchar(255) NOT NULL,
  `no_of_tickets` varchar(200) NOT NULL,
  `cost_per_ticket` varchar(200) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `paypal_account` varchar(255) NOT NULL,
  `paypal_currency` varchar(255) NOT NULL,
  `voucher_code` varchar(250) NOT NULL,
  `ZIP` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `event_laguage_option` varchar(200) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `event` VALUES ('14','df','fff','2016-08-17','dff','dfsf','fsdf','fdf','dfdf','dff','ff','dfd','ff@j.vom','dfdf','fdfds','fdsf','Fdsf','','1','1','1','0,1,2'),
('15','gvv','vv','2016-08-10','vv','vv','vv','1472215796Desired Output (Edit).docx','vv','vv','vv','vv','ff@j.vom','gfg','fgfg','fdgdf','g4543','','1','1','1','0,1'),
('16','hh','hhh','2016-08-09','hh','hh','hh','1472288950export1.png','55','55','fdg','gfg','g@g.b','6565','fg','fg','566','','2','1','1','0,1'); 


DROP TABLE IF EXISTS `eventtable`;
CREATE TABLE `eventtable` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(250) NOT NULL,
  `event_location` varchar(250) NOT NULL,
  `event_date_and_time` date NOT NULL,
  `event_end_date_time` date NOT NULL,
  `description_of_event` varchar(250) NOT NULL,
  `link_to_url/website` varchar(255) NOT NULL,
  `include_youtube_video` varchar(255) NOT NULL,
  `event_image` varchar(255) NOT NULL,
  `no._of_tickets` varchar(200) NOT NULL,
  `cost_per_ticket` varchar(200) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `paypal_account` varchar(255) NOT NULL,
  `paypal_currency` varchar(255) NOT NULL,
  `voucher_code` varchar(250) NOT NULL,
  `telephone/mobile` varchar(250) NOT NULL,
  `ZIP` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `event_laguage_option` varchar(200) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `eventtable` VALUES ('1','birthday','home','2017-05-31','2017-05-31','birthday','','','','','','','','','','','','','','','','',''),
('2','marriage','garden','2017-05-18','2017-05-31','','','','','','','','','','','','','','','','','',''); 


DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `expense_category`;
CREATE TABLE `expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `expense_category` VALUES ('1','Teacher Salary'),
('2','Classroom Equipments'),
('3','Classroom Decorations'),
('4','Inventory Purchase'),
('5','Exam Accessories'); 


DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `products_quality_rating` varchar(250) NOT NULL,
  `products_interested` varchar(250) NOT NULL,
  `service_satisfaction` varchar(250) NOT NULL,
  `recommendation` varchar(250) NOT NULL,
  `how_long_have_you_been_a_customer_of_our_company` varchar(250) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `feedback` VALUES ('1','Jon','snow','builder@gmail.com','7894561230','','','0','','','hello'),
('2','gg','gg','gg@h.bon','8647534','','','0','','','fgdfgdfg'),
('3','uu','uu','uu@g','5446','','','0','','','vgfgdfg'),
('4','uu','uu','uu@g','5446','','','2','','','vgfgdfg'); 


DROP TABLE IF EXISTS `flight_booking`;
CREATE TABLE `flight_booking` (
  `booking_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `city/airport_from` varchar(200) NOT NULL,
  `city/airport_to` varchar(200) NOT NULL,
  `depart_on` date NOT NULL,
  `return_on` date NOT NULL,
  `class` varchar(100) NOT NULL,
  `adults` int(10) NOT NULL,
  `children` int(10) NOT NULL,
  `senior` int(10) NOT NULL,
  `person` varchar(50) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade_point` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mark_from` int(11) NOT NULL,
  `mark_upto` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `gym_membership`;
CREATE TABLE `gym_membership` (
  `membership_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `membership_person_wise` varchar(255) NOT NULL,
  `member_type` varchar(200) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `age` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`membership_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `gym_membership` VALUES ('2','0,1','0','dvcv','0','45','gf@h.no','856856','nhfgh','gdfg','fgdfg','gfg','gdfg'),
('5','0','0','tt','0','tt','tt@g.com','5687698796','gdfg','tt','tt','tt','tt'); 


DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_paid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `due` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `payment_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `jm_users`;
CREATE TABLE `jm_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  `user_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jm_users` VALUES ('1','','fucking girlfriend','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','http://pdocrud.com/script/uploads/1481931260_parte1.jpg'),
('2','','sdsqDQ','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','http://pdocrud.com/script/uploads/1482153211_monte-melqonyani-ynt-na88597.1.jpg'),
('3','','azerty','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','1472896582icone_site.png'),
('4','','111','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','1473306357a1.jpg'),
('5','','jj','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','1473706378aus.jpg'),
('6','','jj','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','1473706381aus.jpg'),
('7','','dddd','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','1473754742temp.jpg'),
('8','','Test','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0',''),
('9','','Test','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','http://pdocrud.com/script/uploads/1481663564_Imatge_Breu Presentacio.jpg'),
('10','','asdasdas','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','http://pdocrud.com/script/uploads/1481696679_50ib.png'),
('11','','ssdfsdf','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0',''),
('12','','assd','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0',''),
('13','','assd','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','http://pdocrud.com/script/uploads/1481797254_zebravett.png'),
('14','','dsfsdf','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','http://pdocrud.com/script/uploads/1481890247_Untitled.jpg'),
('15','','test','','','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00','0','','','0','http://pdocrud.com/script/uploads/1482006408_2.png'); 


DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(200) NOT NULL,
  `job_description` text NOT NULL,
  `salary_range` varchar(200) NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `job_application`;
CREATE TABLE `job_application` (
  `application_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `zip/pin_code` varchar(100) NOT NULL,
  `education` varchar(200) NOT NULL,
  `resume` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `job_application` VALUES ('1','k','j','2016-09-02','test@test.com','9999999999','m','789 far road','tou','NB','Sweden','07978','BA','life','testin'); 


DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bengali` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `arabic` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dutch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `russian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `chinese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `turkish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portuguese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hungarian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `french` longtext COLLATE utf8_unicode_ci NOT NULL,
  `greek` longtext COLLATE utf8_unicode_ci NOT NULL,
  `german` longtext COLLATE utf8_unicode_ci NOT NULL,
  `italian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `thai` longtext COLLATE utf8_unicode_ci NOT NULL,
  `urdu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hindi` longtext COLLATE utf8_unicode_ci NOT NULL,
  `latin` longtext COLLATE utf8_unicode_ci NOT NULL,
  `indonesian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `japanese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `korean` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `language` VALUES ('1','login','login','????','login','????','login','?????','??','giri?','login','bejelentkezés','Connexion','???????','Login','login','???????????','??? ??','?????','login','login','????','???'),
('2','account_type','account type','?????????? ????','tipo de cuenta','??? ??????','type account','??? ?????','????','hesap türü','tipo de conta','fiók típusát','Type de compte','??? ???? ??? ???????????','Kontotyp','tipo di account','???????????','?????? ?? ???','???? ??????','propter speciem','Jenis akun','?????','?? ??'),
('3','admin','admin','????????','administración','????','admin','?????','??','yönetim','administrador','admin','administrateur','?? admin','Admin','Admin','???????????','?????','???????','Lorem ipsum dolor sit','admin','???','???'),
('4','teacher','teacher','??????','profesor','????','leraar','???????','??','ö?retmen','professor','tanár','professeur','????????','Lehrer','insegnante','???','?????','??????','Magister','guru','??','??'),
('5','student','student','?????','estudiante','????','student','???????','??','ö?renci','estudante','diák','étudiant','????????','Schüler','studente','????????','???? ???','?????','discipulo','mahasiswa','??','??'),
('6','parent','parent','???? ?? ????','padre','???','ouder','????????','?','ebeveyn','parente','szül?','mère','??????? ????????','Elternteil','genitore','?????????','??????','???? - ????','parente','induk','?','???'),
('7','email','email','?????','email','?????? ??????????','e-mail','?? ??????????? ?????','????','E-posta','e-mail','E-mail','email','e-mail','E-Mail-','e-mail','??????','?? ???','????','email','email','???','???'),
('8','password','password','??????????','contraseña','???? ????','wachtwoord','??????','??','?ifre','senha','jelszó','mot de passe','??? ??????','Passwort','password','????????','???','???????','Signum','kata sandi','?????','??'),
('9','forgot_password ?','forgot password ?','?????????? ???? ??????','¿Olvidó su contraseña?','???? ???? ???????','wachtwoord vergeten?','?????? ???????','?????','?ifremi unuttum?','Esqueceu a senha?','Elfelejtett jelszó?','Mot de passe oublié?','???????? ??? ??????;','Passwort vergessen?','dimenticato la password?','???????????','??? ??? ???? ????','???? ????????? ????','oblitus esne verbi?','lupa password?','??????????','????? ?? ????'),
('10','reset_password','reset password','?????????? ?????','restablecer la contraseña','????? ????? ???? ??????','reset wachtwoord','???????? ??????','????','?ifrenizi s?f?rlamak','redefinir a senha','Jelszó visszaállítása','réinitialiser le mot de passe','??????????? ??? ?????? ?????????','Kennwort zurücksetzen','reimpostare la password','???????????????','??? ??? ?? ???','??????? ?????','Duis adipiscing','reset password','???????????','??? ???'),
('11','reset','reset','????? ????','reajustar','????? ?????','reset','?????','??','ayarlamak','restabelecer','vissza','remettre','?????????','rücksetzen','reset','????????','?? ???','????? ????','Duis','ulang','????','???'),
('12','admin_dashboard','admin dashboard','???????? ??????????','administrador salpicadero','?????? ??? ???????','admin dashboard','????? ??????','????','Admin paneli','Admin Dashboard','admin m?szerfal','administrateur tableau de bord','?????? ??????? ??? ???????????','Admin-Dashboard','Admin Dashboard','???????????????????????','????? ??? ????','?????????? ????????','Lorem ipsum dolor sit Dashboard','admin dashboard','?????????','??? ?? ??'),
('13','account','account','?????','cuenta','????','rekening','????','??','hesap','conta','számla','compte','???????????','Konto','conto','?????','??????','????','propter','rekening','?????','??'),
('14','profile','profile','??????','perfil','???','profiel','???????','??','profil','perfil','profil','profil','??????','Profil','profilo','???????','???????','???????','profile','profil','??????','???'),
('15','change_password','change password','?????????? ????????','cambiar la contraseña','????? ???? ??????','wachtwoord wijzigen','???????? ??????','????','?ifresini de?i?tirmek','alterar a senha','jelszó megváltoztatása','changer le mot de passe','???????? ??? ?????? ?????????','Kennwort ändern','cambiare la password','???????????????','??? ??? ?????','??????? ?????????','mutare password','mengubah password','??????????','??? ??'),
('16','logout','logout','?? ???','logout','????? ??????','logout','?????','??','logout','Sair','logout','Déconnexion','??????????','logout','Esci','??????????','??? ??? ????','??????','logout','logout','?????','?? ??'),
('17','panel','panel','???????','panel','????','paneel','??????','??','panel','painel','bizottság','panneau','???????','Platte','pannello','??????????','????','????','panel','panel','???','??'),
('18','dashboard_help','dashboard help','?????????? ???????','salpicadero ayuda','???? ??????? ??????','dashboard hulp','????????? ?????? ??????','?????','pano yard?m','dashboard ajuda','m?szerfal help','tableau de bord aide','?????? ???????','Dashboard-Hilfe','dashboard aiuto','??????????????????????','??? ???? ???','???????? ???','Dashboard auxilium','dashboard bantuan','??????????','?? ?? ???'),
('19','dashboard','dashboard','??????????','salpicadero','???? ???????','dashboard','????????? ??????','???','gösterge paneli','painel de instrumentos','m?szerfal','tableau de bord','??????','Armaturenbrett','cruscotto','???????','??? ????','????????','Dashboard','dasbor','???????','???'),
('20','student_help','student help','??????????? ???????','ayuda estudiantil','?????? ??????','student hulp','??????? ??????','?????','Ö?renci yard?m','ajuda estudante','diák segítségével','aide aux étudiants','???????? ???????','Schüler-Hilfe','help studente','?????????????????','???? ??? ?? ???','????? ???','Discipulus auxilium','membantu siswa','??????','?? ???'),
('21','teacher_help','teacher help','?????? ???????','ayuda del maestro','?????? ??????','leraar hulp','??????? ??????','?????','ö?retmen yard?m','ajuda de professores','tanár segítségével','aide de l\'enseignant','??????? ??? ?????????????','Lehrer-Hilfe','aiuto dell\'insegnante','????????????','????? ?? ???','?????? ???','doctor auxilium','bantuan guru','??????','??? ??'),
('22','subject_help','subject help','????? ???????','ayuda sujeto','?????? ???????','Onderwerp hulp','????????? ??????','????','konusu yard?m','ajuda assunto','tárgy segítségével','l\'objet de l\'aide','?????????? ???????','Thema Hilfe','Aiuto Subject','???????????????????','????? ???','???? ???','agitur salus','bantuan subjek','?????','?? ??'),
('23','subject','subject','?????','sujeto','?????','onderwerp','????','??','konu','assunto','tárgy','sujet','????','Thema','soggetto','??????','?????','????','agitur','subyek','???','??'),
('24','class_help','class help','???? ???????','clase de ayuda','?????? ??????','klasse hulp','????? ??????','????','s?n?f yard?m','classe ajuda','osztály segítségével','aide de la classe','????????? ???????','Klasse Hilfe','help classe','????????????????????????','???? ???','????? ???','genus auxilii','kelas bantuan','???????','??? ??'),
('25','class','class','????','clase','???','klasse','?????','?','s?n?f','classe','osztály','classe','?????????','Klasse','classe','????','????','????','class','kelas','???','???'),
('26','exam_help','exam help','????????? ???????','ayuda examen','?????? ??????','examen hulp','??????? ??????','????','s?nav yard?m','exame ajuda','vizsga help','aide à l\'examen','????????? ???????','Prüfung Hilfe','esame di guida','???????????????????','?????? ???','??????? ???','ipsum Auxilium','ujian bantuan','?????','??? ??'),
('27','exam','exam','???????','examen','??????','tentamen','???????','??','s?nav','exame','vizsgálat','exam','???????','Prüfung','esame','??????','??????','???????','Lorem ipsum','ujian','??','??'),
('28','marks_help','marks help','????? ???????','marcas ayudan','?????? ??????','markeringen helpen','????? ????????','????','i?aretleri yard?m','marcas ajudar','jelek segítenek','marques aident','?????? ????????','Markierungen helfen','segni aiutano','???????????????','???? ???','????? ???','notas auxilio','tanda membantu','???????','??? ? ???'),
('29','marks-attendance','marks-attendance','?????-?????????','marcas-asistencia','??????-??????','merken-deelname','?????-????????????','????','i?aretleri-kat?l?m','marcas de comparecimento','jelek-ellátás','marques-participation','?????? ??????????','Marken-Teilnahme','marchi-presenze','??????????????????????','???? ?????','????? ????????','signa eius ministrabant,','tanda-pertemuan','???·??','?? ??'),
('30','grade_help','grade help','????? ???????','ayuda de grado','?????? ????','leerjaar hulp','?????? ??????','???','s?n?f yard?m','ajuda grau','fokozat help','aide de qualité','?????? ???????','Grade-Hilfe','aiuto grade','?????????????','???? ???','????? ???','gradus ope','kelas bantuan','????????','? ??'),
('31','exam-grade','exam-grade','???????? ??????','examen de grado','?????? ????','examen-grade','??????? ??????','????','s?nav notu','exame de grau','vizsga-grade','examen de qualité','????????? ?????????','Prüfung-Grade','esami-grade','???????','?????? ????','??????? ?????','ipsum turpis,','ujian-grade','??????','?? ??'),
('32','class_routine_help','class routine help','??????? ????? ???????','clase ayuda rutina','?????? ?????? ???????','klasroutine hulp','????? ?????? ??????','?????','s?n?f rutin yard?m','classe ajuda rotina','osztály rutin segít','classe aide routine','????????? ???????? ???????','Klasse Routine Hilfe','Classe aiuto di routine','?????????????????????????','???? ????? ???','???? ???????? ???','uno genere auxilium','kelas bantuan rutin','???????????','??? ?? ??'),
('33','class_routine','class routine','??????? ?????','rutina de la clase','??? ?????????','klasroutine','????? ???????????','???','s?n?f rutin','rotina classe','osztály rutin','routine de classe','????????? ???????','Klasse Routine','classe di routine','?????????','???? ?????','???? ????????','in genere uno,','rutin kelas','???·????','??? ??'),
('34','invoice_help','invoice help','????? ???????','ayuda factura','?????? ????????','factuur hulp','????-??????? ??????','????','fatura yard?m','ajuda factura','számla segítségével','aide facture','????????? ???????','Rechnungs Hilfe','help fattura','???????????????????','?????? ???','????? ??????','auxilium cautionem','bantuan faktur','??????','?? ??'),
('35','payment','payment','??????','pago','???','betaling','??????','??','ödeme','pagamento','fizetés','paiement','???????','Zahlung','pagamento','???????????','???????','??????','pecunia','pembayaran','???','??'),
('36','book_help','book help','?????? ???????','libro de ayuda','???? ????????','boek hulp','????? ??????','????','kitap yard?m?','livro ajuda','könyv segít','livre aide','??????? ??? ???????','Buch-Hilfe','della guida','????????????????','???? ???','?????? ???','auxilium libro,','Buku bantuan','???????','? ???'),
('37','library','library','?????????','biblioteca','?????','bibliotheek','??????????','??','kütüphane','biblioteca','könyvtár','bibliothèque','??????????','Bibliothek','biblioteca','????????','????????','?????????','library','perpustakaan','???','???'),
('38','transport_help','transport help','????????? ???????','ayuda de transporte','?????? ?????','vervoer help','????????? ??????','????','ula??m yard?m','ajuda de transporte','szállítás Súgó','le transport de l\'aide','??????? ?? ????????','Transport Hilfe','help trasporti','?????????????????','??? ? ??? ???','?????? ???','auxilium onerariis','transportasi bantuan','??????','?? ??'),
('39','transport','transport','??????','transporte','???','vervoer','?????????','??','ta??ma','transporte','szállítás','transport','????????','Transport','trasporto','????????','??? ? ???','??????','onerariis','angkutan','??','??'),
('40','dormitory_help','dormitory help','??????? ???????','dormitorio de ayuda','???? ????????','slaapzaal hulp','????????? ??????','????','yatakhane yard?m','dormitório ajuda','kollégiumi help','dortoir aide','??????? ???????','Wohnheim Hilfe','dormitorio aiuto','??????????????','??????? ???','????????? ???','dormitorium auxilium','asrama bantuan','?????','??? ???'),
('41','dormitory','dormitory','?????? - ???????','dormitorio','??????','slaapzaal','???????','??','yatakhane','dormitório','hálóterem','dortoir','???????','Wohnheim','dormitorio','?????','???????','?????????','dormitorium','asrama mahasiswa','?','???'),
('42','noticeboard_help','noticeboard help','?????????? ???????','tablón de anuncios de la ayuda','??????? ??????','prikbord hulp','????? ??? ?????????? ??????','????','noticeboard yard?m','avisos ajuda','üzen?falán help','panneau d\'aide','???????????? ???????','Brett-Hilfe','bacheca aiuto','???????????????????????','noticeboard ???','Noticeboard ???','auxilium noticeboard','pengumuman bantuan','???????','? noticeboard ???'),
('43','noticeboard-event','noticeboard-event','??????????-??????','tablón de anuncios de eventos','??????? ?????','prikbord-event','????? ??? ??????????-???????','?????','noticeboard olay','avisos de eventos','üzen?falán esemény','panneau d\'événement','???????????? ????????','Brett-Ereignis','bacheca-evento','??????????????????????','noticeboard ?????','Noticeboard ????','noticeboard eventus,','pengumuman-acara','???????','? noticeboard ???'),
('44','bed_ward_help','bed ward help','?????? ??????? ???????','cama ward ayuda','???? ???? ????????','bed ward hulp','??????? ?????????? ??????','??????','yatak ko?u? yard?m','ajuda cama enfermaria','ágy Ward help','lit salle de l\'aide','??????? ??????? ???????','Betten-Station Hilfe','Letto reparto aiuto','???????????????????','???? ???? ???','?????? ????? ???','lectum stans auxilium','tidur bangsal bantuan','?????????','?? ?? ??'),
('45','settings','settings','??????','configuración','???????','instellingen','?????????','??','ayarlar?','definições','beállítások','paramètres','?????????','Einstellungen','Impostazioni','??????????','???????','????????','occasus','Pengaturan','??','??'),
('46','system_settings','system settings','??????? ??????','configuración del sistema','??????? ??????','systeeminstellingen','????????? ???????','????','sistem ayarlar?','configurações do sistema','rendszerbeállításokat','les paramètres du système','????????? ??? ??????????','Systemeinstellungen','impostazioni di sistema','??????????????','???? ?? ???????','??????? ????????','ratio occasus','pengaturan sistem','??????','??? ??'),
('47','manage_language','manage language','???? ? ????????','gestionar idioma','????? ?????','beheren taal','????????? ????','????','dil yönetmek','gerenciar língua','kezelni nyelv','gérer langue','?????????? ??????','verwalten Sprache','gestire lingua','??????????','???? ?? ??????','???? ?? ???????','moderari linguam,','mengelola bahasa','?????','??? ??'),
('48','backup_restore','backup restore','??????? ??????????','copia de seguridad a restaurar','??????? ????? ?????????','backup terugzetten','???????????? ?????????? ???????????','????','yedekleme geri','de backup restaurar','Backup Restore','restauration de sauvegarde','?????????? ?????????? ?????????','Backup wiederherstellen','ripristino di backup','??????????????????????','??? ?? ????','????? ????','tergum restituunt','backup restore','????????????','?? ??'),
('49','profile_help','profile help','??????? ????????','Perfil Ayuda','??? ????????','profile hulp','?????? ??????','????','yard?m profile','Perfil ajuda','profile help','profil aide','?????? ???????','Profil Hilfe','profilo di aiuto','????????????????????','??? ???????','???????? ???','Auctor nullam opem','Profil bantuan','?????????','?? ???'),
('50','manage_student','manage student','?????????? ? ????????','gestionar estudiante','????? ??????','beheren student','????????? ????????','????','ö?renci yönetmek','gerenciar estudante','kezelni diák','gérer étudiant','?????????? ??? ????????','Schüler verwalten','gestire studente','??????????????','???? ??? ?? ??????','????? ?? ???????','curo alumnorum','mengelola siswa','?????','?? ??'),
('51','manage_teacher','manage teacher','?????? ? ????????','gestionar maestro','????? ??????','beheren leraar','????????? ???????','????','ö?retmen yönetmek','gerenciar professor','kezelni tanár','gérer enseignant','?????????? ??? ?????????????','Lehrer verwalten','gestire insegnante','?????????','???? ?? ??????','?????? ?? ???????','magister curo','mengelola guru','?????','?? ??'),
('52','noticeboard','noticeboard','??????????','tablón de anuncios','???????','prikbord','????? ??? ??????????','??','noticeboard','quadro de avisos','üzen?falán','panneau d\'affichage','????????????','Brett','bacheca','??????????','noticeboard','Noticeboard','noticeboard','pengumuman','???','? noticeboard'),
('53','language','language','????','idioma','???','taal','????','?','dil','língua','nyelv','langue','??????','Sprache','lingua','????','????','????','Lingua','bahasa','??','??'),
('54','backup','backup','???????','reserva','???','reservekopie','?????????','??','yedek','backup','mentés','sauvegarde','?????????','Sicherungskopie','di riserva','??????????????','??? ??','?????','tergum','backup','??????','??'),
('55','calendar_schedule','calendar schedule','??????????? ????????','horario de calendario','?????? ??????','kalender schema','????????? ??????????','????','takvim program?','agenda calendário','naptári ütemezés','calendrier calendrier','????????????????? ??? ???????????','Kalender Zeitplan','programma di calendario','??????????????????','?????? ?????','??????? ???????','kalendarium ipsum','jadwal kalender','????????????','??? ??'),
('56','select_a_class','select a class','???? ?????? ????????','seleccionar una clase','??? ???','selecteer een class','???????? ?????','?????','bir s?n?f seçin','selecionar uma classe','válasszon ki egy osztályt','sélectionner une classe','???????? ??? ?????????','Wählen Sie eine Klasse','selezionare una classe','?????????','??? ???? ????? ????','?? ???? ?? ??? ????','eligere genus','pilih kelas','??????','???? ??'),
('57','student_list','student list','??????????? ??????','lista de alumnos','????? ??????','student lijst','?????? ???????','????','ö?renci listesi','lista de alunos','diák lista','liste des étudiants','???????? ??? ????????','Schülerliste','elenco degli studenti','???????????????','???? ??? ?? ?????','????? ????','Discipulus album','daftar mahasiswa','??????','?? ??'),
('58','add_student','add student','????? ???','añadir estudiante','????? ????','voeg student','???????? ????????','????','ö?renci eklemek','adicionar estudante','hozzá hallgató','ajouter étudiant','????????? ????????','Student hinzufügen','aggiungere studente','?????????????','???? ??? ????','????? ????','adde elit','menambahkan mahasiswa','?????','??? ??'),
('59','roll','roll','???','rollo','???','broodje','?????','?','rulo','rolo','tekercs','rouleau','????','Rolle','rotolo','????','???','???','volumen','gulungan','???','?'),
('60','photo','photo','???','foto','???','foto','????','??','foto?raf','foto','fénykép','photo','??????????','Foto','foto','???????','?????','?????','Lorem ipsum','foto','??','??'),
('61','student_name','student name','??????????? ???','Nombre del estudiante','??? ??????','naam van de leerling','??? ????????','????','Ö?renci ad?','nome do aluno','tanuló nevét','nom de l\'étudiant','?? ????? ??? ??????','Studentennamen','nome dello studente','????????????','???? ??? ?? ???','????? ?? ???','ipsum est nomen','nama siswa','?????','??? ??'),
('62','address','address','??????','dirección','?????','adres','?????','??','adres','endereço','cím','adresse','?????????','Adresse','indirizzo','???????','??????','???','Oratio','alamat','????','??'),
('63','options','options','????','Opciones','??????','opties','?????','??','seçenekleri','opções','lehet?ségek','les options','????????','Optionen','Opzioni','????????','????????','??????','options','Pilihan','?????','??'),
('64','marksheet','marksheet','marksheet','marksheet','marksheet','Marksheet','marksheet','marksheet','Marksheet','marksheet','Marksheet','relevé de notes','Marksheet','marksheet','Marksheet','marksheet','marksheet','???????','marksheet','marksheet','marksheet','marksheet'),
('65','id_card','id card','???? ?????','carnet de identidad','????? ??????','id-kaart','????????????? ????????','???','kimlik kart?','carteira de identidade','személyi igazolvány','carte d\'identité','id ?????','Ausweis','carta d\'identità','???????????','?????? ????','? ?? ?????','id ipsum','id card','ID???','???'),
('66','edit','edit','??????? ???','editar','?????','uitgeven','?????????????','??','düzenleme','editar','szerkeszt','modifier','edit','bearbeiten','modifica','?????','??? ????? ????','??????? ????','edit','mengedit','??','??'),
('67','delete','delete','???? ????','borrar','???','verwijderen','???????','??','silmek','excluir','töröl','effacer','????????','löschen','cancellare','??','????','?????','vel deleri,','menghapus','????','??'),
('68','personal_profile','personal profile','????????? ????????','perfil personal','??? ????','persoonlijk profiel','?????? ???????','????','ki?isel profil','perfil pessoal','személyes profil','profil personnel','????????? ??????','persönliches Profil','profilo personale','???????????????????????','???? ???????','????????? ????????','personal profile','profil pribadi','????','?? ???'),
('69','academic_result','academic result','???????? ?????','resultado académico','????? ??????????','academische resultaat','????????????? ?????????','????','akademik sonuç','resultado acadêmico','tudományos eredmény','résultat académique','?????????? ??????????','Studienergebnis','risultato accademico','??????????','?????? ?????','??????? ??????','Ex academicis','Hasil akademik','????','?? ????'),
('70','name','name','???','nombre','???','naam','????????','??','isim','nome','név','nom','?????','Name','nome','????','???','???','nomen,','nama','??','??'),
('71','birthday','birthday','???????','cumpleaños','??? ?????','verjaardag','???? ????????','??','do?um günü','aniversário','születésnap','anniversaire','????????','Geburtstag','compleanno','???????','??????','???????','natalis','ulang tahun','???','??'),
('72','sex','sex','?????','sexo','???','seks','????','??','seks','sexo','szex','sexe','????','Sex','sesso','???','????','????','sex','seks','????','??'),
('73','male','male','?????','masculino','???','mannelijk','???????','??','erkek','masculino','férfi','mâle','?????????','männlich','maschio','??????','???????','??','masculus','laki-laki','??','??'),
('74','female','female','?????','femenino','????','vrouw','???????','?','kad?n','feminino','n?i','femelle','???????','weiblich','femminile','???????','??????','?????','femina,','perempuan','??','??'),
('75','religion','religion','????','religión','???','religie','???????','??','din','religião','vallás','religion','????????','Religion','religione','?????','????','????','religionis,','agama','??','??'),
('76','blood_group','blood group','?????? ?????','grupo sanguíneo','????? ????','bloedgroep','?????? ?????','??','kan grubu','grupo sanguíneo','vércsoport','groupe sanguin','????? ???????','Blutgruppe','gruppo sanguigno','??????????','??? ?? ????','???? ????','sanguine coetus','golongan darah','???','???'),
('77','phone','phone','???','teléfono','????','telefoon','???????','??','telefon','telefone','telefon','téléphone','????????','Telefon','telefono','????????','???','????','Praesent','telepon','??','??'),
('78','father_name','father name','????? ???','Nombre del padre','??? ????','naam van de vader','????????','????','baba ad?','nome pai','apa név','nom de père','?? ????? ??? ??????','Der Name des Vaters','nome del padre','???????','???? ?? ???','???? ?? ???','nomine Patris,','Nama ayah','?????','???? ??'),
('79','mother_name','mother name','?????? ???','Nombre de la madre','??? ????','moeder naam','??? ??????','?????','anne ad?','Nome mãe','anyja név','nom de la mère','?? ????? ??? ???????','Name der Mutter','Nome madre','???????','??? ?? ???','???? ?? ???','matris nomen,','Nama ibu','????','??? ??'),
('80','edit_student','edit student','???????? ?????','edit estudiante','????? ??????','bewerk student','?????????????? ???????','????','edit ö?renci','edição aluno','szerkesztés diák','modifier étudiant','??????????? ??? ????????','Schüler bearbeiten','modifica dello studente','?????????????','????? ?? ???? ???','??????? ?????','edit studiosum','mengedit siswa','????','?? ??'),
('81','teacher_list','teacher list','?????? ??????','lista maestra','????? ??????','leraar lijst','?????? ????????','????','ö?retmen listesi','lista de professores','tanár lista','Liste des enseignants','????? ??? ?????????????','Lehrer-Liste','elenco degli insegnanti','??????????','????? ?????','?????? ????','magister album','daftar guru','?????','??? ??'),
('82','add_teacher','add teacher','?????? ???','añadir profesor','????? ??????','voeg leraar','???????? ???????','????','ö?retmen ekle','adicionar professor','hozzá tanár','ajouter enseignant','????????? ????????','Lehrer hinzufügen','aggiungere insegnante','????????','????? ????','?????? ????','Magister addit','menambah guru','?????','??? ??'),
('83','teacher_name','teacher name','?????? ???','Nombre del profesor','??? ??????','leraarsnaam','??? ???????','????','ö?retmen ad?','nome professor','tanár név','nom des enseignants','????? ??? ?????????????','Lehrer Name','Nome del docente','???????','????? ?? ???','?????? ?? ???','magister nomine','nama guru','???','?? ??'),
('84','edit_teacher','edit teacher','???????? ??????','edit maestro','????? ??????','leraar bewerken','??????? ???????','????','edit ö?retmen','editar professor','szerkesztés tanár','modifier enseignant','edit ?????????????','edit Lehrer','modifica insegnante','????????','????? ?????','??????? ???? ??????','edit magister','mengedit guru','?????','?? ??'),
('85','manage_parent','manage parent','??????? ? ????????','gestionar los padres','????? ????','beheren ouder','????????? ?????????','?????','ebeveyn yönetmek','gerenciar pai','kezelni szül?','gérer parent','?????????? ???????','verwalten Mutter','gestione genitore','????????????','?????? ?? ??????','???? - ???? ?? ???????','curo parent','mengelola orang tua','????','?? ??'),
('86','parent_list','parent list','??? ??????','lista primaria','????? ??????','ouder lijst','????????????? ??????','???','ebeveyn listesi','lista pai','szül? lista','liste parent','??????? ?????','geordneten Liste','elenco padre','????????????????','?????? ?? ?????','???? - ???? ????','parente album','daftar induk','????','?? ??'),
('87','parent_name','parent name','??? ???','Nombre del padre','??? ??????','oudernaam','???????? ????????','??','ebeveyn isim','nome do pai','szül? név','nom du parent','??????? ?????','Mutternamen','nome del padre','?????????????','?????? ?? ???','???? - ???? ?? ???','Nomen parentis,','nama orang tua','????','?? ??'),
('88','relation_with_student','relation with student','???????? ????? ???????','relación con el estudiante','??????? ?? ??????','relatie met student','????????? ? ????????','?????','ö?renci ile ili?kisi','relação com o aluno','kapcsolatban diák','relation avec l\'élève','????? ?? ??? ??????','Zusammenhang mit Studenten','rapporto con lo studente','???????????????????????','???? ??? ?? ???? ????','?????? ?? ??? ?????','cum inter ipsum','hubungan dengan siswa','??????','???? ??'),
('89','parent_email','parent email','??? ?????','correo electrónico de los padres','?????? ?????????? ????','ouder email','???????? ??????','???????','ebeveyn email','e-mail dos pais','szül? e-mail','parent email','email ??? ?????','Eltern per E-Mail','email genitore','???????????????','?????? ?? ?? ???','???? - ???? ????','parente email','email induk','??????','??? ???'),
('90','parent_phone','parent phone','???????? ???','teléfono de los padres','?????? ????????','ouder telefoon','???????? ???????','????','ebeveyn telefon','telefone dos pais','szül? telefon','mère de téléphone','??????? ????????','Elterntelefon','telefono genitore','????????????????????','?????? ???','???? - ???? ?? ???','parentis phone','telepon orang tua','??????','?? ??'),
('91','parrent_address','parrent address','parrent ??????','Dirección Parrent','????? parrent','parrent adres','Parrent ?????','parrent??','parrent adresi','endereço Parrent','parrent cím','adresse Parrent','parrent ?????????','parrent Adresse','Indirizzo parrent','??????? parrent','parrent ??????','parrent ???','oratio parrent','alamat parrent','parrent????','parrent ??'),
('92','parrent_occupation','parrent occupation','parrent ??????','ocupación Parrent','???????? parrent','parrent bezetting','Parrent ?????????','parrent??','parrent i?gal','ocupação Parrent','parrent Foglalkozás','occupation Parrent','parrent ?????????','parrent Beruf','occupazione parrent','????? parrent','parrent ????','parrent ?????','opus parrent','pendudukan parrent','parrent??','parrent ??'),
('93','add','add','??? ???','añadir','?????','toevoegen','?????????','?','eklemek','adicionar','hozzáad','ajouter','????????','hinzufügen','aggiungere','?????','????','??????','Adde','menambahkan','???','??'),
('94','parent_of','parent of','???????','matriz de','???? ?','ouder van','????????','?','ebeveyn','pai','szül?','parent d\'','??????','Muttergesellschaft der','madre di','????????????','??????','?? ???? - ????','parentem,','induk dari','??','? ??'),
('95','profession','profession','????','profesión','????','beroep','?????????','??','meslek','profissão','szakma','profession','?????????','Beruf','professione','?????','????','???????','professio','profesi','??','??'),
('96','edit_parent','edit parent','???????? ????????','edit padres','????? ????????','bewerk ouder','??????? ????????','???','edit ebeveyn','edição pai','szerkesztés szül?','modifier parent','edit ?????','edit Mutter','modifica genitore','??????????????','??? ????? ???? ??????','??????? ???','edit parent','mengedit induk','???','?? ??'),
('97','add_parent','add parent','???????? ???','añadir los padres','????? ??????','Voeg een ouder','???????? ????????','???','ebeveyn ekle','adicionar pai','hozzá szül?','ajouter parent','????????? ???????','Mutter hinzufügen','aggiungere genitore','??????????????','?????? ????','???? - ???? ????','adde parent','menambahkan orang tua','????','??? ??'),
('98','manage_subject','manage subject','????? ? ????????','gestionar sujeto','????? ???????','beheren onderwerp','????????? ????','????','konuyu yönetmek','gerenciar assunto','kezelni tárgy','gérer sujet','?????????? ?????????','Thema verwalten','gestire i soggetti','???????????????','????? ?? ??????','???? ?? ???????','subiectum disponat','mengelola subjek','?????','?? ??'),
('99','subject_list','subject list','????? ??????','lista por materia','????? ???????','Onderwerp lijst','?????? ????????','????','konu listesi','lista por assunto','téma lista','liste de sujets','?????????? ?????','Themenliste','lista soggetto','????????????','????? ?? ?????','???? ????','subiectum album','daftar subjek','?????????','?? ??'),
('100','add_subject','add subject','????? ???','Añadir asunto','????? ???????','Onderwerp toevoegen','???????? ????','????','konu ekle','adicionar assunto','Tárgy hozzáadása','ajouter l\'objet','???????? ???????','Thema hinzufügen','aggiungere soggetto','???????????','?????','?????? ????','re addere','menambahkan subjek','?????','??? ??'),
('101','subject_name','subject name','????? ???','nombre del sujeto','??? ???????','Onderwerp naam','??? ????????','????','konu ad?','nome do assunto','tárgy megnevezése','nom du sujet','?????????? ?????','Thema Namen','nome del soggetto','??????????','????? ?? ???','???? ?? ???','agitur nomine','nama subjek','???????','?? ??'),
('102','edit_subject','edit subject','???????? ?????','Editar asunto','????? ???????','Onderwerp bewerken','???????? ????','????','düzenleme konusu','Editar assunto','Tárgy szerkesztése','modifier l\'objet','edit ????','Betreff bearbeiten','Modifica oggetto','???????????','????? ??? ????? ????','???? ??????? ????','edit subiecto','mengedit subjek','????','?? ??'),
('103','manage_class','manage class','????? ? ????????','gestionar clase','????? ????','beheren klasse','????????? ?????','???','s?n?f yönetmek','gerenciar classe','kezelni osztály','gérer classe','?????????? ?????','Klasse verwalten','gestione della classe','??????????????????','???? ?? ??????','???? ?? ???????','genus regendi','mengelola kelas','??????','????? ??'),
('104','class_list','class list','???? ??????','lista de la clase','????? ???','klasse lijst','?????? ?????','???','s?n?f listesi','lista de classe','class lista','liste de classe','??????? ?????????????','Klassenliste','elenco di classe','??????????','???? ?????','????? ????','genus album','daftar kelas','??????','??? ??'),
('105','add_class','add class','?????? ???','agregar la clase','????? ???','voeg klasse','???????? ?????','???','s?n?f eklemek','adicionar classe','hozzá osztály','ajouter la classe','?????????? ????','Klasse hinzufügen','aggiungere classe','??????????','???? ???? ????','???? ????','adde genus','menambahkan kelas','??????','???? ??'),
('106','class_name','class name','??????? ???','nombre de la clase','??? ?????','class naam','??? ??????','??','s?n?f ad?','nome da classe','osztály neve','nom de la classe','????? ??? ??????','Klassennamen','nome della classe','????????','???? ???','???? ?? ???','Classis nomine','nama kelas','????','??? ??'),
('107','numeric_name','numeric name','???????? ???','nombre numérico','??? ?????','numerieke naam','???????? ???','????','Say?sal isim','nome numérico','numerikus név','nom numérique','?????????? ?????','numerischen Namen','nome numerico','??????????','???? ???','???????? ???','secundum numerum est secundum nomen,','Nama numerik','?????','?? ??'),
('108','name_numeric','name numeric','???????? ??? ???','nombre numérico','????? ?????','naam numerieke','??????? ????????','????','say?sal isim','nome numérico','név numerikus','nommer numérique','????? ??????????','nennen numerischen','nome numerico','??????????','???? ???','???????? ?? ???','secundum numerum est secundum nomen,','nama numerik','?????????','?? ???'),
('109','edit_class','edit class','???????? ????','clase de edición','?????? ?????','bewerken klasse','??????? ?????','???','s?n?f düzenle','edição classe','szerkesztés osztály','modifier la classe','edit ?????????','Klasse bearbeiten','modifica della classe','??????????','????? ????','??????? ????','edit genere','mengedit kelas','?????','?? ???'),
('110','manage_exam','manage exam','??????? ????????','gestionar examen','????? ????????','beheren examen','????????? ???????','????','s?nav? yönetmek','gerenciar exame','kezelni vizsga','gérer examen','?????????? ?????????','Prüfung verwalten','gestire esame','????????????','?????? ?? ??????','??????? ?? ???????','curo ipsum','mengelola ujian','?????','?? ??'),
('111','exam_list','exam list','???????? ??????','lista de exámenes','????? ????????','examen lijst','?????? ???????','????','s?nav listesi','lista de exames','vizsga lista','liste d\'examen','????? ?????????','Prüfungsliste','elenco esami','?????????','?????? ?????','??????? ????','Lorem ipsum album','daftar ujian','??????','?? ??'),
('112','add_exam','add exam','???????? ???','agregar examen','????? ??????','voeg examen','???????? ???????','????','s?nav eklemek','adicionar exame','hozzá vizsga','ajouter examen','?????????? ?????????','Prüfung hinzufügen','aggiungere esame','???????????','?????? ??? ???? ????','??????? ????','adde ipsum','menambahkan ujian','?????','??? ??'),
('113','exam_name','exam name','???????? ???','nombre del examen','??? ????????','examen naam','???????? ???????','????','s?nav ad?','nome do exame','Vizsga neve','nom de l\'examen','?? ????? ?????????','Prüfungsnamen','nome dell\'esame','???????','?????? ?? ???','??????? ?? ???','ipsum nomen,','Nama ujian','???','?? ??'),
('114','date','date','?????','fecha','?????','datum','????','??','tarih','data','dátum','date','??????????','Datum','data','??????','?????','?????','date','tanggal','??','??'),
('115','comment','comment','???????','comentario','?????','commentaar','???????????','??','yorum','comentário','megjegyzés','commentaire','??????','Kommentar','commento','????????','?????','???????','comment','komentar','????','??'),
('116','edit_exam','edit exam','???????? ???????','examen de edición','?????? ?????','bewerk examen','??????? ???????','????','edit s?nav?','edição do exame','szerkesztés vizsga','modifier examen','edit ?????????','edit Prüfung','modifica esame','???????????','????? ??????','??????? ???????','edit ipsum','mengedit ujian','????','?? ??'),
('117','manage_exam_marks','manage exam marks','??????? ????? ? ????????','gestionar marcas de examen','????? ?????? ????????','beheren examencijfers','????????? ??????????????? ???????','?????','s?nav i?aretleri yönetmek','gerenciar marcas exame','kezelni vizsga jelek','gérer les marques d\'examen','?????????? ??? ??????? ?????????','Prüfungsnoten verwalten','gestire i voti degli esami','????????????????????','?????? ?? ?????? ?? ??????','??????? ?? ????? ?? ???????','ipsum curo indicia','mengelola nilai ujian','????????','?? ??? ??'),
('118','manage_marks','manage marks','????? ? ????????','gestionar marcas','????? ??????','beheren merken','????????? ?????','????','i?aretleri yönetmek','gerenciar marcas','kezelni jelek','gérer les marques','?????????? ??? ???????','Markierungen verwalten','gestire i marchi','?????????????????','?????? ?? ??????','????? ?? ???????','curo indicia','mengelola tanda','??????','??? ??'),
('119','select_exam','select exam','???????? ????????','seleccione examen','??? ????????','selecteer examen','??????? ???????','????','s?nav? seçin','selecionar exame','válassza ki a vizsga','sélectionnez examen','???????? ?????????','Prüfung wählen','seleziona esame','????????','?????? ????? ????','??????? ?? ???','velit ipsum','pilih ujian','?????','??? ??'),
('120','select_class','select class','???? ????????','seleccione clase','??? ???','selecteren klasse','??????? ?????','??????','s?n?f seçin','selecionar classe','válassza osztály','sélectionnez classe','???????? ?????????','Klasse wählen','seleziona classe','?????????','???? ????? ????','???? ?? ??? ????','genus eligere,','pilih kelas','??????','???? ??'),
('121','select_subject','select subject','????? ???????? ????','seleccione tema','??? ???????','Selecteer onderwerp','???????? ????','????','konu seçin','selecionar assunto','Válassza a Tárgy','sélectionner le sujet','???????? ????','Thema wählen','seleziona argomento','???????????','????? ????? ????','???? ?? ???','eligere subditos','pilih subjek','?????','??? ??'),
('122','select_an_exam','select an exam','???? ??????? ????????','seleccione un examen','??? ????????','selecteer een examen','??????? ???????','????','Bir s?nav seçin','selecionar um exame','válasszon ki egy vizsga','sélectionner un examen','???????? ??? ???????','Wählen Sie eine Prüfung','selezionare un esame','????????','?????? ????? ????','?? ??????? ?? ???','Eligebatur autem ipsum','pilih ujian','?????','??? ??'),
('123','mark_obtained','mark obtained','??????? ???????','calificación obtenida','??????? ?????? ???','markeren verkregen','???????? ????????','???','i?aretlemek elde','marca obtida','jelölje kapott','marquer obtenu','???? ??? ??????????','Markieren Sie erhalten','contrassegnare ottenuto','??????????????????????','???? ?? ????','??? ???????','attende obtinuit','menandai diperoleh','?????','?? ??'),
('124','attendance','attendance','????????','asistencia','??????','opkomst','????????????','??','kat?l?m','comparecimento','részvétel','présence','????????','Teilnahme','partecipazione','????????????','?????','????????','auscultant','kehadiran','??','??'),
('125','manage_grade','manage grade','????? ????????','gestión de calidad','????? ????','beheren leerjaar','????????? ?????','???','notu yönetmek','gerenciar grau','kezelni fokozat','gérer de qualité','?????????? ?????????','Klasse verwalten','gestione grade','??????????','???? ?? ??????','????? ?? ???????','moderari gradu','mengelola kelas','???????','?? ??'),
('126','grade_list','grade list','????? ??????','Lista de grado','????? ????','cijferlijst','?????? ??????','????','s?n?f listesi','lista grau','fokozat lista','liste de qualité','????? ??????','Notenliste','elenco grade','??????????','???? ?????','????? ?? ????','gradus album','daftar kelas','??????','?? ??'),
('127','add_grade','add grade','????? ??? ????','añadir grado','????? ????','voeg leerjaar','???????? ?????','???','not eklemek','adicionar grau','hozzá fokozat','ajouter note','???????? ??????','Klasse hinzufügen','aggiungere grade','?????????','???? ??? ???? ????','????? ????','adde gradum,','menambahkan kelas','???????','??? ??'),
('128','grade_name','grade name','????? ???','Nombre de grado','??? ????','rangnaam','???????? ?????','????','s?n?f ad?','nome da classe','fokozat név','nom de la catégorie','????? ??????','Klasse Name','nome del grado','????????','???? ???','????? ?? ???','nomen, gradus,','nama kelas','?????','?? ??'),
('129','grade_point','grade point','????? ???????','de calificaciones','??????','rangpunt','????','??','not','ponto de classe','fokozatú pont','cumulative','??????','Noten','punto di grado','???????','???? ??????','????? ?????','gradus punctum','indeks prestasi','?????','??'),
('130','mark_from','mark from','????? ????','marca de','????? ??','mark uit','???? ??','???','mark dan','marca de','jelölést','marque de','???? ???','Marke aus','segno da','??????????????','???? ??','????? ??','marcam','mark dari','?????','???'),
('131','mark_upto','mark upto','??????? ???????','marcar hasta','??????? ???','mark tot','???????? ??','????','kadar i?aretlemek','marcar até','jelölje upto','marquer jusqu\'à','???? ?????','Markieren Sie bis zu','contrassegnare fino a','?????????????????','?? ?? ????','?? ???????','Genitus est notare','menandai upto','???????','???'),
('132','edit_grade','edit grade','???????? ?????','edit grado','????? ????','Cijfer bewerken','??????? ??????','????','edit notu','edição grau','szerkesztés fokozat','edit qualité','edit ??????','edit Grad','modifica grade','?????????','????? ????','??????? ?????','edit gradu','mengedit kelas','??????','?? ??'),
('133','manage_class_routine','manage class routine','??????? ????? ????????','gestionar rutina de la clase','????? ?????? ?????????','beheren klasroutine','????????? ?????? ??????','?????','s?n?f rutin yönetmek','gerenciar rotina classe','kezelni class rutin','gérer la routine de classe','?????????????? ???? ???????','verwalten Klasse Routine','gestione classe di routine','?????????????????????????','???? ????? ?? ??????','???? ???????? ?? ???????','uno in genere tractare','mengelola rutinitas kelas','??????????','??? ???? ??'),
('134','class_routine_list','class routine list','??????? ????? ??????','clase de lista de rutina','????? ????????? ??????','klasroutine lijst','????? ?????? ??????','??????','s?n?f rutin listesi','classe de lista de rotina','osztály rutin lista','classe liste routine','????? list ????????','Klasse Routine Liste','classe lista di routine','???????????????','???? ????? ?? ????? ?????','???? ???????? ????','uno genere album','Daftar rutin kelas','?????????','??? ?? ??'),
('135','add_class_routine','add class routine','??????? ????? ?????','añadir rutina de la clase','????? ??? ?????????','voeg klasroutine','???????? ???????????? ??????','?????','s?n?f rutin eklemek','adicionar rotina classe','hozzá class rutin','ajouter routine de classe','?????????? ???? ???????','Klasse hinzufügen Routine','aggiungere classe di routine','?????????????????','???? ????? ??? ???? ????','???? ???????? ????','adde genus moris','menambahkan rutin kelas','???·???????','??? ??? ??'),
('136','day','day','???','día','???','dag','????','?','gün','dia','nap','jour','?????','Tag','giorno','???','??','???','die,','hari','?','?'),
('137','starting_time','starting time','?????? ????','tiempo de inicio','???? ?????','starttijd','????? ??????','????','ba?lang?ç ??zaman?','tempo começando','indítási id?','temps de démarrage','??? ???????','Startzeit','tempo di avviamento','????????????','??? ???? ????','??? ?? ?????? ??','tum satus','waktu mulai','????','?? ??'),
('138','ending_time','ending time','???? ???','hora de finalización','????? ??????','eindtijd','????? ?????????','????','biti? zaman?n?','tempo final','befejezési id?pont','heure de fin','??? ?????','Endzeit','ora finale','???????????','??? ???','??? ?????? ???? ??','et finis temporis,','akhir waktu','????','?? ??'),
('139','edit_class_routine','edit class routine','???????? ????? ?????','rutina de la clase de edición','?????? ????? ?????????','bewerk klasroutine','????????? ?????????????? ?????','?????','s?n?f düzenle rutin','rotina de edição de classe','szerkesztés osztály rutin','routine modifier de classe','edit ???? ???????','edit Klasse Routine','modifica della classe di routine','?????????????????????','????? ???? ?????','??????? ???? ????????','edit uno genere','rutin mengedit kelas','??????????','?? ??? ??'),
('140','manage_invoice/payment','manage invoice/payment','????? / ??????? ????????','gestionar factura / pago','????? ?????? / ???','beheren factuur / betaling','????????? ????? / ??????','????/??','fatura / ödeme yönetmek','gerenciar fatura / pagamento','kezelni számla / fizetési','gérer facture / paiement','?????????? ?????????? / ????????','Verwaltung Rechnung / Zahlung','gestione fattura / pagamento','???????????????? / ???????????','?????? / ??????? ?? ??????','????? / ?????? ?? ???????','curo cautionem / solutionem','mengelola tagihan / pembayaran','???/????','???? / ?? ??'),
('141','invoice/payment_list','invoice/payment list','????? / ??????? ??????','lista de facturas / pagos','????? ?????? / ???','factuur / betaling lijst','?????? ????? / ??????','??/????','fatura / ödeme listesi','lista de fatura / pagamento','számla / fizetési lista','liste facture / paiement','????? ?????????? / ????????','Rechnung / Zahlungsliste','elenco fattura / pagamento','???????????????? / ???????????','?????? / ??????? ?? ?????','????? / ?????? ????','cautionem / list pretium','daftar tagihan / pembayaran','???/????','???? / ?????'),
('142','add_invoice/payment','add invoice/payment','????? / ??????? ???','añadir factura / pago','????? ?????? / ???','voeg factuur / betaling','???????? ????? / ??????','????/??','fatura / ödeme eklemek','adicionar factura / pagamento','hozzá számla / fizetési','ajouter facture / paiement','???????? ?????????? / ????????','hinzufügen Rechnung / Zahlung','aggiungere fatturazione / pagamento','??????????????? / ???????????','?????? / ??????? ????','????? / ?????? ??????','add cautionem / solutionem','menambahkan tagihan / pembayaran','???/?????','?? / ??? ??'),
('143','title','title','?????','título','???','titel','????????','??','ba?l?k','título','cím','titre','??????','Titel','titolo','??????????','?????','??????','title','judul','????','??'),
('144','description','description','?????','descripción','???','beschrijving','????????','??','tan?m','descrição','leírás','description','?????????','Beschreibung','descrizione','??????','?????','?????','description','deskripsi','??','??'),
('145','amount','amount','??????','cantidad','????','bedrag','??????????','?','miktar','quantidade','mennyiség','montant','????','Menge','importo','?????','???','????','tantum','jumlah','?','?'),
('146','status','status','??????','estado','????','toestand','??????','??','durum','estado','állapot','statut','?????????','Status','stato','?????','????','??????','status','status','?????','??'),
('147','view_invoice','view invoice','????? ?????','vista de la factura','??? ????????','view factuur','??? ?????-???????','????','view fatura','vista da fatura','view számla','vue facture','??????? ?????????','Ansicht Rechnung','vista fattura','????????????','?????? ??????','????? ?????','propter cautionem','lihat faktur','??????','?? ??'),
('148','paid','paid','??????','pagado','?????','betaald','??????????','??','ücretli','pago','fizetett','payé','??????????','bezahlt','pagato','????????','??? ???','???????','solutis','dibayar','?????','??'),
('149','unpaid','unpaid','???????','no pagado','??? ?????','onbetaald','????????????','??','ödenmemi?','não remunerado','kifizetetlen','non rémunéré','????????','unbezahlt','non pagato','?????????????','??? ??????','???????','non est constitutus,','dibayar','???','???? ??'),
('150','add_invoice','add invoice','????? ???','añadir factura','????? ????????','voeg factuur','???????? ????','????','faturay? eklemek','adicionar fatura','hozzá számla','ajouter facture','????????? ?????????','Rechnung hinzufügen','aggiungere fattura','???????????????','?????? ??? ????','????? ????','add cautionem','menambahkan faktur','??????','??? ??'),
('151','payment_to','payment to','???????','pago a','??? ?','betaling aan','??????','??','için ödeme','pagamento','fizetés','paiement','???????','Zahlung an','pagamento','??????????????','???????','?? ??????','pecunia','pembayaran kepada','?????','? ??'),
('152','bill_to','bill to','???','proyecto de ley para','????? ????? ?','wetsvoorstel om','???????????? ?','??','bill','projeto de lei para','törvényjavaslat','projet de loi','?????????? ??? ???','Gesetzentwurf zur','disegno di legge per','???','??','??? ?? ???','latumque','RUU untuk','????','??'),
('153','invoice_title','invoice title','????? ???????','Título de la factura','????? ????????','factuur titel','???????? ?????','????','fatura ba?l?k','título fatura','számla cím','titre de la facture','?????? ?????????','Rechnungs Titel','title fattura','??????????????','?????? ?????','????? ??????','title cautionem','judul faktur','????????','?? ??'),
('154','invoice_id','invoice id','????? ????','Identificación de la factura','?????? ????','factuur id','????-??????? ID','????','fatura id','id fatura','számla id','Identifiant facture','id ?????????','Rechnung-ID','fattura id','?????????????????','?????? ID','????? ????','id cautionem','faktur id','???ID','?? ID'),
('155','edit_invoice','edit invoice','???????? ?????','edit factura','????? ????????','bewerk factuur','?????????????? ?????-???????','????','edit fatura','edição fatura','szerkesztés számla','modifier la facture','edit ?????????','edit Rechnung','modifica fattura','???????????????','????? ??????','??????? ?????','edit cautionem','mengedit faktur','?????','?? ??'),
('156','manage_library_books','manage library books','?????????? ?? ? ????????','gestionar libros de la biblioteca','????? ????? ?????','beheren bibliotheekboeken','????????? ???????????? ?????','????','kitaplar? kütüphane yönetmek','gerenciar os livros da biblioteca','kezelni könyvtári könyvek','gérer des livres de bibliothèque','?????????????? ?? ?????? ??? ???????????','Bücher aus der Bibliothek verwalten','gestire i libri della biblioteca','???????????????????????','??? ???? ?? ?????? ????','????????? ?? ???????? ?? ???????','curo bibliotheca librorum,','mengelola buku perpustakaan','????????','??? ? ??'),
('157','book_list','book list','???????????','lista de libros','????? ?????','boekenlijst','?????? ????','??','kitap listesi','lista de livros','book lista','liste de livres','????? ???????','Buchliste','elenco libri','???????????????','???? ?? ?????','?????? ????','album','daftar buku','??????','?? ??'),
('158','add_book','add book','?? ???','Añadir libro','????? ????','boek toevoegen','???????? ?????','???','kitap eklemek','adicionar livro','Könyv hozzáadása','ajouter livre','????????? ?? ??????','Buch hinzufügen','aggiungere il libro','????????????','???? ????','?????? ????','adde libri','menambahkan buku','????','?? ??'),
('159','book_name','book name','?????? ???','Nombre del libro','??? ??????','boeknaam','???????? ?????','??','kitap ad?','nome livro','book név','nom de livre','?? ????? ??? ???????','Buchnamen','nome del libro','???????????','???? ?? ???','????? ?? ???','librum nomine','nama buku','????','? ??'),
('160','author','author','????','autor','??????','auteur','?????','??','yazar','autor','szerz?','auteur','??????????','Autor','autore','????????','????','????','auctor','penulis','??','??'),
('161','price','price','???','precio','?????','prijs','????','??','fiyat','preço','ár','prix','????','Preis','prezzo','????','????','????','price','harga','??','??'),
('162','available','available','??????','disponible','????','beschikbaar','?????????','???','mevcut','disponível','rendelkezésre álló','disponible','??????????','verfügbar','disponibile','????????????','??????','??????','available','tersedia','?????','???'),
('163','unavailable','unavailable','????????','indisponible','??? ????','niet beschikbaar','??????????','???','yok','indisponível','érhet? el','indisponible','?????????','nicht verfügbar','non disponibile','?????','?????? ????','????????','unavailable','tidak tersedia','??????','??'),
('164','edit_book','edit book','???????? ??','libro de edición','???? ?????','bewerk boek','??????? ?????','????','edit kitap','edição do livro','edit könyv','edit livre','?????????????? ?? ??????','edit Buch','modifica book','????????????','????? ????','??????? ??????','edit Liber','mengedit buku','????','?? ?'),
('165','manage_transport','manage transport','?????? ? ????????','gestionar el transporte','????? ?????','beheren van vervoerssystemen','????????? ???????????','????','ula??m yönetmek','gerenciar o transporte','kezelni a közlekedés','la gestion du transport','?????????? ??? ?????????','Transport verwalten','gestire i trasporti','?????????????????','??? ? ??? ?? ??????','?????? ?? ???????','curo onerariis','mengelola transportasi','?????','?? ??'),
('166','transport_list','transport list','?????? ??????','Lista de transportes','????? ?????','lijst vervoer','???? ?????????','????','ta??ma listesi','Lista de transportes','szállítás lista','liste de transport','????? ??? ?????????','Transportliste','elenco trasporti','??????????????','??? ? ??? ?? ?????','?????? ????','turpis album','daftar transport','????','?? ??'),
('167','add_transport','add transport','?????? ??? ????','añadir el transporte','????? ?????','voeg vervoer','???????? ?????????','????','ta??ma ekle','adicionar transporte','hozzá a közlekedés','ajouter transports','????????? ?????????','add-Transport','aggiungere il trasporto','?????????????','??? ? ??? ????','?????? ????','adde onerariis','tambahkan transportasi','??????????','??? ??'),
('168','route_name','route name','??? ???','nombre de la ruta','??? ?????','naam van de route','??? ???????','????','rota ismi','nome da rota','útvonal nevét','nom de la route','????? ?????????','Routennamen','nome del percorso','???????????','????? ???','????? ?? ???','iter nomine','Nama rute','??????','?? ??'),
('169','number_of_vehicle','number of vehicle','?????? ??????','número de vehículo','??? ?? ????????','aantal voertuigkilometers','?????????? ??????????','?????','Arac?n say?s?','número de veículo','számú gépjárm?','nombre de véhicules','??????? ??? ????????','Anzahl der Fahrzeug','numero di veicolo','????????????????','???? ?? ?????','???? ?? ??????','de numero scilicet vehiculum','jumlah kendaraan','????','??? ?'),
('170','route_fare','route fare','??? ?????','ruta hacer','?????? ????','route doen','??????? ??????','???','yol yapmak','rota fazer','útvonal do','itinéraire faire','???????? ?????','Route zu tun','r','?????????','????? ????','????? ????','iter faciunt,','rute lakukan','????','??? ?'),
('171','edit_transport','edit transport','???????? ??????','transporte de edición','????? ?????','vervoer bewerken','??????? ?????????','????','edit ula??m','edição transporte','szerkesztés szállítás','transport modifier','edit ?????????','edit Transport','modifica dei trasporti','?????????????','????? ??? ? ???','??????? ??????','edit onerariis','mengedit transportasi','????','?? ??'),
('172','manage_dormitory','manage dormitory','??????? ? ????????','gestionar dormitorio','????? ????','beheren slaapzaal','????????? ?????????','????','yurt yönetmek','gerenciar dormitório','kezelni kollégiumi','gérer dortoir','?????????? ???????','Schlafsaal verwalten','gestione dormitorio','???????????','??????? ?? ??????','????????? ?? ???????','curo dormitorio','mengelola asrama','????','???? ??'),
('173','dormitory_list','dormitory list','??????? ??????','lista dormitorio','????? ????','slaapzaal lijst','?????? ?????????','????','yurt listesi','lista dormitório','kollégiumi lista','liste de dortoir','????? ???????','Schlafsaal Liste','elenco dormitorio','????????????','??????? ?????','????????? ????','dormitorium album','daftar asrama','?????','??? ??'),
('174','add_dormitory','add dormitory','??????? ???','añadir dormitorio','????? ????','voeg slaapzaal','???????? ?????????','????','yurt ekle','adicionar dormitório','hozzá kollégiumi','ajouter dortoir','???????? ???????','Schlaf hinzufügen','aggiungere dormitorio','??????????','??????? ????','????????? ????','adde dormitorio','menambahkan asrama','????','???? ??'),
('175','dormitory_name','dormitory name','??????? ???','Nombre del dormitorio','??? ??????','slaapzaal naam','??? ?????????','???','yurt ad?','nome dormitório','kollégiumi név','nom de dortoir','????? ???????','Schlaf Namen','Nome dormitorio','?????????','??????? ???','????????? ???','dormitorium nomine','Nama asrama','??','??? ??'),
('176','number_of_room','number of room','???? ??????','número de habitación','??? ?????','aantal kamer','????? ???????','????','oda say?s?','número de quarto','száma szobában','nombre de salle','??? ?????? ??? ????????','Anzahl der Zimmer','numero delle camera','????????????','???? ?? ?????','???? ?? ??????','numerus locus','Jumlah kamar','????','?? ?'),
('177','manage_noticeboard','manage noticeboard','?????????? ????????','gestionar tablón de anuncios','????? ???????','beheren prikbord','????????? ????? ??????????','????','Noticeboard yönetmek','gerenciar avisos','kezelni üzen?falán','gérer panneau d\'affichage','?????????? ????????????','Brett verwalten','gestione bacheca','????????????????','noticeboard ?? ??????','Noticeboard ?? ???????','curo noticeboard','mengelola pengumuman','??????','? noticeboard ??'),
('178','noticeboard_list','noticeboard list','?????????? ??????','tablón de anuncios de la lista','????? ???????','prikbord lijst','?????? ????? ??? ??????????','????','noticeboard listesi','lista de avisos','üzen?falán lista','liste de panneau d\'affichage','????? ????????????','Brett-Liste','elenco bacheca','????????????????','noticeboard ?????','Noticeboard ????','noticeboard album','daftar pengumuman','?????','? noticeboard ??'),
('179','add_noticeboard','add noticeboard','?????????? ???','añadir tablón de anuncios','????? ???????','voeg prikbord','???????? ????? ??????????','????','Noticeboard ekle','adicionar avisos','hozzá üzen?falán','ajouter panneau d\'affichage','???????? ????????????','Brett hinzufügen','aggiungere bacheca','???????????????','noticeboard ????','Noticeboard ????','adde noticeboard','menambahkan pengumuman','??????','? noticeboard ??'),
('180','notice','notice','?????????','aviso','?????','kennisgeving','???????????','??','uyar?','aviso','értesítés','délai','??????????','Bekanntmachung','avviso','???????????','????','?????','Observa','pemberitahuan','??','??'),
('181','add_notice','add notice','????? ??? ????','añadir aviso','????? ?????','voeg bericht','???????? ???????????','????','haber ekle','adicionar aviso','hozzá értesítés','ajouter un avis','????????? ??????????','Hinweis hinzufügen','aggiungere preavviso','????????????????????????','???? ?? ????? ????','????? ????','addunt et titulum','tambahkan pemberitahuan','?????','??? ??'),
('182','edit_noticeboard','edit noticeboard','???????? ??????????','edit tablón de anuncios','????? ???????','bewerk prikbord','??????? ????? ??? ??????????','????','edit noticeboard','edição de avisos','szerkesztés üzen?falán','modifier panneau d\'affichage','edit ????????????','Brett bearbeiten','modifica bacheca','???????????????','??? ????? ???? noticeboard','??????? Noticeboard','edit noticeboard','mengedit pengumuman','?????','??? noticeboard'),
('183','system_name','system name','????????? ???','Nombre del sistema','??? ??????','Name System','??? ???????','????','sistemi ad?','nome do sistema','rendszer neve','nom du système','????? ??? ??????????','Systemnamen','nome del sistema','????????','???? ?? ???','?????? ???','ratio nominis','Nama sistem','?????','??? ??'),
('184','save','save','?????','guardar','???','besparen','?????????','??','kurtarmak','salvar','kivéve','sauver','?????','sparen','salvare','???????','?? ????? ??','?????','salvum','menyimpan','??','??'),
('185','system_title','system title','??????? ???????','Título de sistema','????? ??????','systeem titel','???????? ???????','????','Sistem ba?l?k','título sistema','rendszer cím','titre du système','?????? ??? ??????????','System-Titel','titolo di sistema','????????','???? ?????','?????? ??????','ratio title','title sistem','?????????','??? ??'),
('186','paypal_email','paypal email','PayPal ?????','paypal email','??? ??? ?????? ??????????','paypal e-mail','PayPal ?? ??????????? ?????','PayPal????','paypal e-posta','paypal e-mail','paypal email','paypal email','paypal ??????????? ???????????','paypal E-Mail','paypal-mail','paypal ??????','?? ??? ?? ???','????? ????','Paypal email','email paypal','Paypal????','??? ???'),
('187','currency','currency','??????','moneda','????','valuta','??????','??','para','moeda','valuta','monnaie','???????','Währung','valuta','???????','?????','??????','currency','mata uang','??','??'),
('188','phrase_list','phrase list','????? ??????','lista de frases','????? ????','zinnenlijst','?????? ?????','????','ifade listesi','lista de frases','kifejezés lista','liste de phrase','????? ?????','Phrasenliste','elenco frasi','?????????','???? ?????','???????? ????','dicitur album','Daftar frase','???????','?? ??'),
('189','add_phrase','add phrase','????????? ?????','añadir la frase','????? ?????','voeg zin','???????? ?????','????','ifade eklemek','adicionar frase','adjunk kifejezést','ajouter la phrase','????????? ?????','Begriff hinzufügen','aggiungere la frase','????????','???? ????','???????? ??????','addere phrase','menambahkan frase','???????','??? ??'),
('190','add_language','add language','???? ?????','añadir idioma','????? ???','add taal','???????? ????','????','dil ekle','adicionar língua','nyelv hozzáadása','ajouter la langue','????????? ??????','Sprache hinzufügen','aggiungere la lingua','?????????','???? ?? ????','???? ??????','addere verbis','menambahkan bahasa','?????','??? ??'),
('191','phrase','phrase','?????','frase','???????','frase','?????','??','ifade','frase','kifejezés','phrase','?????','Ausdruck','frase','???','????','????????','phrase','frasa','????','?'),
('192','manage_backup_restore','manage backup restore','??????? ?????????? ? ????????','gestionar copias de seguridad a restaurar','????? ??????? ????? ?????????','beheer van back-up herstellen','????????? ???????????? ?????????? ???????????','??????','yedekleme geri yönetmek','gerenciar o backup de restauração','kezelni a biztonsági mentés visszaállítása','gérer de restauration de sauvegarde','?????????? ?????????? ?????????? ?????????','verwalten Backup wiederherstellen','gestire il ripristino di backup','????????????????????????????','??? ?? ???? ??????','????? ???? ?? ???????','curo tergum restituunt','mengelola backup restore','??????????????','?? ?? ??'),
('193','restore','restore','?????????? ???','restaurar','???????','herstellen','??????????????','??','geri','restaurar','visszaad','restaurer','???????????','wiederherstellen','ripristinare','??????','????','????','reddite','mengembalikan','????','??'),
('194','mark','mark','???','marca','?????','mark','????','??','i?aret','marca','jel','marque','??????','Marke','marchio','???????????','????','?????','Marcus','tanda','???','?'),
('195','grade','grade','?????','grado','????','graad','?????','??','s?n?f','grau','fokozat','grade','??????','Klasse','grado','????','????','?????','gradus,','kelas','????','??'),
('196','invoice','invoice','?????','factura','??????','factuur','????-???????','??','fatura','fatura','számla','facture','?????????','Rechnung','fattura','?????????????','??????','????','cautionem','faktur','?????','??'),
('197','book','book','??','libro','????','boek','?????','?','kitap','livro','könyv','livre','??????','Buch','libro','???????','????','?????','Liber','buku','?','?'),
('198','all','all','??','todo','??','alle','???','??','tüm','tudo','minden','tout','???','alle','tutto','???????','????','??','omnes','semua','???','??'),
('199','upload_&_restore_from_backup','upload & restore from backup','????? &amp; ??????? ???? ??????????','cargar y restaurar copia de seguridad','????? ???????? ?? ?????? ??????????','uploaden en terugzetten van een backup','????????? ? ???????????? ?? ????????? ?????','?????????','yükleyebilir ve yedekten geri yükleme','fazer upload e restauração de backup','feltölteni és visszaállítani backup','télécharger et restauration de la sauvegarde','????????? ??? ????????? ??? backup','Upload &amp; Wiederherstellung von Backups','caricare e ripristinare dal backup','???????????????????????????????????','?? ??? ???? ??? ??? ?? ?? ????','????? ?? ????? ?? ????','restituo ex tergum upload,','meng-upload &amp; restore dari backup','?????????????????','??? ? ???? ??'),
('200','manage_profile','manage profile','????????? ????????','gestionar el perfil','????? ????? ??????','te beheren!','????????? ????????','??????','profilini yönetmek','gerenciar o perfil','Profil kezelése','gérer le profil','?????????????? ?? ??????','Profil verwalten','gestire il profilo','????????????????','??????? ?? ??? ????','???????? ?? ???????','curo profile','mengelola profil','???????????????','??? (? ??) ??'),
('201','update_profile','update profile','???????? ?????','actualizar el perfil','????? ????? ??????','Profiel bijwerken','???????? ???????','??????','profilinizi güncelleyin','atualizar o perfil','frissíteni profil','mettre à jour le profil','??????????? ?? ??????','Profil aktualisieren','aggiornare il profilo','?????????????','??????? ?? ?? ???','????????? ?????','magna eget ipsum','memperbarui profil','?????????','???? ????'),
('202','new_password','new password','???? ??????????','nueva contraseña','???? ???? ?????','nieuw wachtwoord','????? ??????','???','Yeni ?ifre','nova senha','Új jelszó','nouveau mot de passe','??? ??????','Neues Passwort','nuova password','????????????','??? ??? ???','??? ???????','novum password','kata sandi baru','????????','? ??'),
('203','confirm_new_password','confirm new password','???? ?????????? ??????? ????','confirmar nueva contraseña','????? ???? ?????? ???????','Bevestig nieuw wachtwoord','??????????? ????? ??????','?????','yeni parolay? onaylay?n','confirmar nova senha','er?sítse meg az új jelszót','confirmer le nouveau mot de passe','????????????? ?? ??? ??????','Bestätigen eines neuen Kennwortes','conferma la nuova password','??????????????????','??? ??? ??? ?? ?????','?? ??????? ?? ??????','confirma novum password','konfirmasi password baru','???????????','? ??? ?????'),
('204','update_password','update password','?????????? ?????','actualizar la contraseña','????? ???? ????','updaten wachtwoord','???????? ??????','????','Parolan?z? güncellemek','atualizar senha','frissíti jelszó','mettre à jour le mot de passe','??????????? ??? ?????? ?????????','Kennwort aktualisieren','aggiornare la password','????????????????','??? ?? ???','??????? ??????','scelerisque eget','memperbarui sandi','????????','??? ????'),
('205','teacher_dashboard','teacher dashboard','?????? ??????????','tablero maestro','???? ????? ?????? ??????','leraar dashboard','??????? ????????? ??????','?????','ö?retmen pano','dashboard professor','tanár m?szerfal','enseignant tableau de bord','?????? ??? ?????????????','Lehrer-Dashboard','dashboard insegnante','?????????','????? ??? ????','?????? ????????','magister Dashboard','dashboard guru','??????????','?? ?? ??'),
('206','backup_restore_help','backup restore help','??????? ?????????? ???????','copia de seguridad restaurar ayuda','??????? ????? ????????? ????????','backup helpen herstellen','???????????? ????????? ????? ??????','???????','yedekleme yard?m geri','de backup restaurar ajuda','Backup Restore segítségével','restauration de sauvegarde de l\'aide','?????????? ?????????? ????????? ???????','Backup wiederherstellen Hilfe','Backup Restore aiuto','???????????????????????????????????','??? ?? ?? ??? ????','????? ??? ????','auxilium tergum restituunt','backup restore bantuan','????????????','?? ??? ??'),
('207','student_dashboard','student dashboard','????? ??????????','salpicadero estudiante','???? ??????? ????????','student dashboard','??????? ????????? ??????','??????','Ö?renci paneli','dashboard estudante','tanuló m?szerfal','tableau de bord de l\'élève','?????? ??? ????????','Schüler Armaturenbrett','studente dashboard','?????????????????','???? ??? ?? ??? ????','????? ????????','Discipulus Dashboard','dashboard mahasiswa','??????????','?? ?? ??'),
('208','parent_dashboard','parent dashboard','??????? ??????????','salpicadero padres','???? ????? ?????? ????','ouder dashboard','???????? ????????? ??????','?????','ebeveyn kontrol paneli','dashboard pai','szül? m?szerfal','parent tableau de bord','??????? ??????','Mutter Armaturenbrett','dashboard genitore','?????????????????????','?????? ?? ??? ????','???? - ???? ????????','Dashboard parent','orangtua dashboard','?????','?? ?? ??'),
('209','view_marks','view marks','????? ?????','Vista marcas','?????? ???','view merken','??? ?????','????','görünümü i?aretleri','vista marcas','view jelek','Vue marques','?????? ?????','Ansicht Marken','Vista marchi','?????????????????','?????? ??????','????? ?? ?????','propter signa','lihat tanda','??????','?? ??'),
('210','delete_language','delete language','???? ?????','eliminar el lenguaje','??? ?????','verwijderen taal','??????? ????','????','dili silme','excluir língua','törlése nyelv','supprimer la langue','???????? ??????','Sprache löschen','eliminare lingua','??????','???? ?? ???? ?? ???','???? ?? ?????','linguam turpis','menghapus bahasa','???????','??? ??'),
('211','settings_updated','settings updated','?????? ?????','configuración actualizado','????????? ???????','instellingen bijgewerkt','????????? ?????????','????','ayarlar? güncellendi','definições atualizadas','beállítások frissítve','paramètres mis à jour','????????? ?????????','Einstellungen aktualisiert','impostazioni aggiornate','?????????????????????','??????? ?? ???? ????','???????? ??????','venenatis eu','pengaturan diperbarui','?????','??? ????'),
('212','update_phrase','update phrase','????? ?????','actualización de la frase','????? ???????','Update zin','?????????? ?????','????','güncelleme ifade','atualização frase','frissítést kifejezés','mise à jour phrase','????????? ?????','Update Begriff','aggiornamento frase','???????????','?? ??? ????','?????? ????????','eget dictum','frase pembaruan','??????','???? ??'),
('213','login_failed','login failed','???? ?????? ??????','Error de acceso','??? ????? ??????','inloggen is mislukt','?????? ?????','????','giri? ba?ar?s?z oldu','Falha no login','bejelentkezés sikertelen','Échec de la connexion','??????? ???????','Fehler bei der Anmeldung','Accesso non riuscito','??????????????????','??? ?? ?????','????? ????','tincidunt defecit','Login gagal','???????????','??? ??'),
('214','live_chat','live chat','???? ?????','chat en vivo','??????? ?????','live chat','??????-???','????','canl? sohbet','chat ao vivo','él? chat','chat en direct','live chat','Live-Chat','live chat','?????????','????? ???','???? ???','Vivamus nibh','live chat','???????','??? ??'),
('215','client 1','client 1','???????????? 1','cliente 1','?????? 1','client 1','?????? 1','???1','istemcisi 1','cliente 1','ügyfél 1','client 1','?????? 1','Client 1','client 1','?????? 1','?????? 1','?????? 1','I huius','client 1','??????1','????? 1'),
('216','buyer','buyer','??????','comprador','????','koper','??????????','??','al?c?','comprador','vev?','acheteur','?????????','Käufer','compratore','???????','??????','???????','qui emit,','pembeli','????','???'),
('217','purchase_code','purchase code','????? ???','código de compra','??? ??????','aankoop code','??????? ???','????','sat?n alma kodu','código de compra','vásárlási kódot','code d\'achat','??????? ?????','Kauf-Code','codice di acquisto','???????????????','??????? ?? ???','???? ???','Mauris euismod','kode pembelian','?????','?? ??'),
('218','system_email','system email','??????? ?????','correo electrónico del sistema','???? ?????? ??????????','systeem e-mail','??????? ??????????? ?????','????','sistem e-posta','e-mail do sistema','a rendszer az e-mail','email de système','e-mail ??????????','E-Mail-System','email sistema','??????????','???? ?? ?? ???','??????? ????','Praesent sit amet','email sistem','??????????','??? ?? ??'),
('219','option','option','??????','opción','????','optie','???????','??','seçenek','opção','opció','option','???????','Option','opzione','???????????','????','??????','optio','pilihan','?????','???'),
('220','edit_phrase','edit phrase','???????? ?????','edit frase','????? ???????','bewerk zin','??????? ?????','???','edit ifade','edição frase','szerkesztés kifejezés','modifier phrase','edit ?????','edit Begriff','modifica frase','????????','????? ?? ????','??????? ????????','edit phrase','mengedit frase','??????','?? ?'),
('221','forgot_your_password','Forgot Your Password','','','','','','','','','','','','','','','','','','','',''),
('222','forgot_password','Forgot Password','','','','','','','','','','','','','','','','','','','',''),
('223','back_to_login','Back To Login','','','','','','','','','','','','','','','','','','','',''),
('224','return_to_login_page','Return to Login Page','','','','','','','','','','','','','','','','','','','',''),
('225','admit_student','Admit Student','','','','','','','','','','','','','','','','','','','',''),
('226','admit_bulk_student','Admit Bulk Student','','','','','','','','','','','','','','','','','','','',''),
('227','student_information','Student Information','','','','','','','','','','','','','','','','','','','',''),
('228','student_marksheet','Student Mark Sheet','','','','','','','','','','','','','','','','','','','',''),
('229','daily_attendance','Daily Attendance','','','','','','','','','','','','','','','','','','','',''),
('230','exam_grades','','','','','','','','','','','','','','','','','','','','',''),
('231','message','','','','','','','','','','','','','','','','','','','','',''),
('232','general_settings','','','','','','','','','','','','','','','','','','','','',''),
('233','language_settings','','','','','','','','','','','','','','','','','','','','',''),
('234','edit_profile','','','','','','','','','','','','','','','','','','','','',''),
('235','event_schedule','','','','','','','','','','','','','','','','','','','','',''),
('236','cancel','','','','','','','','','','','','','','','','','','','','',''),
('237','addmission_form','','','','','','','','','','','','','','','','','','','','',''),
('238','value_required','','','','','','','','','','','','','','','','','','','','',''),
('239','select','','','','','','','','','','','','','','','','','','','','',''),
('240','gender','','','','','','','','','','','','','','','','','','','','',''),
('241','add_bulk_student','','','','','','','','','','','','','','','','','','','','',''),
('242','student_bulk_add_form','','','','','','','','','','','','','','','','','','','','',''),
('243','select_excel_file','','','','','','','','','','','','','','','','','','','','',''),
('244','upload_and_import','','','','','','','','','','','','','','','','','','','','',''),
('245','manage_classes','','','','','','','','','','','','','','','','','','','','',''),
('246','manage_sections','','','','','','','','','','','','','','','','','','','','',''),
('247','add_new_teacher','','','','','','','','','','','','','','','','','','','','',''),
('248','section_name','','','','','','','','','','','','','','','','','','','','',''),
('249','nick_name','','','','','','','','','','','','','','','','','','','','',''),
('250','add_new_section','','','','','','','','','','','','','','','','','','','','',''),
('251','add_section','','','','','','','','','','','','','','','','','','','','',''),
('252','update','','','','','','','','','','','','','','','','','','','','',''),
('253','section','','','','','','','','','','','','','','','','','','','','',''),
('254','select_class_first','','','','','','','','','','','','','','','','','','','','',''),
('255','parent_information','','','','','','','','','','','','','','','','','','','','',''),
('256','relation','','','','','','','','','','','','','','','','','','','','',''),
('257','add_form','','','','','','','','','','','','','','','','','','','','',''),
('258','all_parents','','','','','','','','','','','','','','','','','','','','',''),
('259','parents','','','','','','','','','','','','','','','','','','','','',''),
('260','add_new_parent','','','','','','','','','','','','','','','','','','','','',''),
('261','add_new_student','','','','','','','','','','','','','','','','','','','','',''),
('262','all_students','','','','','','','','','','','','','','','','','','','','',''),
('263','view_marksheet','','','','','','','','','','','','','','','','','','','','',''),
('264','text_align','','','','','','','','','','','','','','','','','','','','',''),
('265','clickatell_username','','','','','','','','','','','','','','','','','','','','',''),
('266','clickatell_password','','','','','','','','','','','','','','','','','','','','',''),
('267','clickatell_api_id','','','','','','','','','','','','','','','','','','','','',''),
('268','sms_settings','','','','','','','','','','','','','','','','','','','','',''),
('269','data_updated','','','','','','','','','','','','','','','','','','','','',''),
('270','data_added_successfully','','','','','','','','','','','','','','','','','','','','',''),
('271','edit_notice','','','','','','','','','','','','','','','','','','','','',''),
('272','private_messaging','','','','','','','','','','','','','','','','','','','','',''),
('273','messages','','','','','','','','','','','','','','','','','','','','',''),
('274','new_message','','','','','','','','','','','','','','','','','','','','',''),
('275','write_new_message','','','','','','','','','','','','','','','','','','','','',''),
('276','recipient','','','','','','','','','','','','','','','','','','','','',''),
('277','select_a_user','','','','','','','','','','','','','','','','','','','','',''),
('278','write_your_message','','','','','','','','','','','','','','','','','','','','',''),
('279','send','','','','','','','','','','','','','','','','','','','','',''),
('280','current_password','','','','','','','','','','','','','','','','','','','','',''),
('281','exam_marks','','','','','','','','','','','','','','','','','','','','',''),
('282','marks_obtained','','','','','','','','','','','','','','','','','','','','',''),
('283','total_marks','','','','','','','','','','','','','','','','','','','','',''),
('284','comments','','','','','','','','','','','','','','','','','','','','',''),
('285','theme_settings','','','','','','','','','','','','','','','','','','','','',''),
('286','select_theme','','','','','','','','','','','','','','','','','','','','',''),
('287','theme_selected','','','','','','','','','','','','','','','','','','','','',''),
('288','language_list','','','','','','','','','','','','','','','','','','','','',''),
('289','payment_cancelled','','','','','','','','','','','','','','','','','','','','',''),
('290','study_material','','','','','','','','','','','','','','','','','','','','',''),
('291','download','','','','','','','','','','','','','','','','','','','','',''),
('292','select_a_theme_to_make_changes','','','','','','','','','','','','','','','','','','','','',''),
('293','manage_daily_attendance','','','','','','','','','','','','','','','','','','','','',''),
('294','select_date','','','','','','','','','','','','','','','','','','','','',''),
('295','select_month','','','','','','','','','','','','','','','','','','','','',''),
('296','select_year','','','','','','','','','','','','','','','','','','','','',''),
('297','manage_attendance','','','','','','','','','','','','','','','','','','','','',''),
('298','twilio_account','','','','','','','','','','','','','','','','','','','','',''),
('299','authentication_token','','','','','','','','','','','','','','','','','','','','',''),
('300','registered_phone_number','','','','','','','','','','','','','','','','','','','','',''),
('301','select_a_service','','','','','','','','','','','','','','','','','','','','',''),
('302','active','','','','','','','','','','','','','','','','','','','','',''),
('303','disable_sms_service','','','','','','','','','','','','','','','','','','','','',''),
('304','not_selected','','','','','','','','','','','','','','','','','','','','',''),
('305','disabled','','','','','','','','','','','','','','','','','','','','',''),
('306','present','','','','','','','','','','','','','','','','','','','','',''),
('307','absent','','','','','','','','','','','','','','','','','','','','',''),
('308','accounting','','','','','','','','','','','','','','','','','','','','',''),
('309','income','','','','','','','','','','','','','','','','','','','','',''),
('310','expense','','','','','','','','','','','','','','','','','','','','',''),
('311','incomes','','','','','','','','','','','','','','','','','','','','',''),
('312','invoice_informations','','','','','','','','','','','','','','','','','','','','',''),
('313','payment_informations','','','','','','','','','','','','','','','','','','','','',''),
('314','total','','','','','','','','','','','','','','','','','','','','',''),
('315','enter_total_amount','','','','','','','','','','','','','','','','','','','','',''),
('316','enter_payment_amount','','','','','','','','','','','','','','','','','','','','',''),
('317','payment_status','','','','','','','','','','','','','','','','','','','','',''),
('318','method','','','','','','','','','','','','','','','','','','','','',''),
('319','cash','','','','','','','','','','','','','','','','','','','','',''),
('320','check','','','','','','','','','','','','','','','','','','','','',''),
('321','card','','','','','','','','','','','','','','','','','','','','',''),
('322','data_deleted','','','','','','','','','','','','','','','','','','','','',''),
('323','total_amount','','','','','','','','','','','','','','','','','','','','',''),
('324','take_payment','','','','','','','','','','','','','','','','','','','','',''),
('325','payment_history','','','','','','','','','','','','','','','','','','','','',''),
('326','amount_paid','','','','','','','','','','','','','','','','','','','','',''),
('327','due','','','','','','','','','','','','','','','','','','','','',''),
('328','payment_successfull','','','','','','','','','','','','','','','','','','','','',''),
('329','creation_date','','','','','','','','','','','','','','','','','','','','',''),
('330','invoice_entries','','','','','','','','','','','','','','','','','','','','',''),
('331','paid_amount','','','','','','','','','','','','','','','','','','','','',''),
('332','send_sms_to_all','','','','','','','','','','','','','','','','','','','','',''),
('333','yes','','','','','','','','','','','','','','','','','','','','',''),
('334','no','','','','','','','','','','','','','','','','','','','','',''),
('335','activated','','','','','','','','','','','','','','','','','','','','',''),
('336','sms_service_not_activated','','','','','','','','','','','','','','','','','','','','',''),
('337','add_study_material','','','','','','','','','','','','','','','','','','','','',''),
('338','file','','','','','','','','','','','','','','','','','','','','',''),
('339','file_type','','','','','','','','','','','','','','','','','','','','',''),
('340','select_file_type','','','','','','','','','','','','','','','','','','','','',''),
('341','image','','','','','','','','','','','','','','','','','','','','',''),
('342','doc','','','','','','','','','','','','','','','','','','','','',''),
('343','pdf','','','','','','','','','','','','','','','','','','','','',''),
('344','excel','','','','','','','','','','','','','','','','','','','','',''),
('345','other','','','','','','','','','','','','','','','','','','','','',''),
('346','expenses','','','','','','','','','','','','','','','','','','','','',''),
('347','add_new_expense','','','','','','','','','','','','','','','','','','','','',''),
('348','add_expense','','','','','','','','','','','','','','','','','','','','',''),
('349','edit_expense','','','','','','','','','','','','','','','','','','','','',''),
('350','total_mark','','','','','','','','','','','','','','','','','','','','',''),
('351','send_marks_by_sms','','','','','','','','','','','','','','','','','','','','',''),
('352','send_marks','','','','','','','','','','','','','','','','','','','','',''),
('353','select_receiver','','','','','','','','','','','','','','','','','','','','',''),
('354','students','','','','','','','','','','','','','','','','','','','','',''),
('355','marks_of','','','','','','','','','','','','','','','','','','','','',''),
('356','for','','','','','','','','','','','','','','','','','','','','',''),
('357','message_sent','','','','','','','','','','','','','','','','','','','','',''),
('358','expense_category','','','','','','','','','','','','','','','','','','','','',''),
('359','add_new_expense_category','','','','','','','','','','','','','','','','','','','','',''),
('360','add_expense_category','','','','','','','','','','','','','','','','','','','','',''),
('361','category','','','','','','','','','','','','','','','','','','','','',''),
('362','select_expense_category','','','','','','','','','','','','','','','','','','','','',''),
('363','message_sent!','','','','','','','','','','','','','','','','','','','','',''),
('364','reply_message','','','','','','','','','','','','','','','','','','','','',''),
('365','account_updated','','','','','','','','','','','','','','','','','','','','',''),
('366','upload_logo','','','','','','','','','','','','','','','','','','','','',''),
('367','upload','Upload','','','','','','','','','','','','','','','','','','','',''),
('368','study_material_info_saved_successfuly','','','','','','','','','','','','','','','','','','','','',''),
('369','edit_study_material','','','','','','','','','','','','','','','','','','','','',''),
('370','default_theme','','','','','','','','','','','','','','','','','','','','',''),
('371','default','','','','','','','','','','','','','','','','','','','','',''); 


DROP TABLE IF EXISTS `library_membership`;
CREATE TABLE `library_membership` (
  `membership_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `date_issue` date NOT NULL,
  `membership_categories` varchar(100) NOT NULL,
  `membership_is` varchar(200) NOT NULL,
  `decalaration` varchar(255) NOT NULL,
  PRIMARY KEY (`membership_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `library_membership` VALUES ('1','uu','0','uu@g.com','656546','2016-08-09','nhgh','gfdg','fgd'); 


DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL,
  `last_login_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `login` VALUES ('1','dave','dave@test.com','dave','admin','2018-05-09','1'),
('2','John','john@test.com','john','developer','2018-05-09','1'); 


DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark` (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark_obtained` int(11) NOT NULL DEFAULT '0',
  `mark_total` int(11) NOT NULL DEFAULT '100',
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `message_thread`;
CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`message_thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `multi_lang`;
CREATE TABLE `multi_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `multi_lang` VALUES ('2','??????','??????'),
('3','?????','?????\r\n'),
('4','título','título'),
('5','????????','????????\r\n'),
('6','?????','?????'),
('7','otsikko','otsikko'),
('8','cím','cím'),
('9','??','??\r\n'); 


DROP TABLE IF EXISTS `multilang`;
CREATE TABLE `multilang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf32_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;



DROP TABLE IF EXISTS `multilang_myisam`;
CREATE TABLE `multilang_myisam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `descripption` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `noticeboard`;
CREATE TABLE `noticeboard` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `order_change`;
CREATE TABLE `order_change` (
  `order_id` bigint(20) NOT NULL,
  `exchange_id` bigint(20) NOT NULL,
  `order_number` bigint(20) NOT NULL,
  `requisition_number` bigint(20) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `contact_name` varchar(200) NOT NULL,
  `contact_number` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `address_line2` varchar(200) NOT NULL,
  `ciry` varchar(100) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `your_name` varchar(100) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `reason_for_change` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` double NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `orderdetails` VALUES ('1','12336','34','34','3','33'),
('2','12336','24','34','3','33'),
('3','12336','14','34','3','33'),
('4','578','198409','46','545','0'),
('5','93062','9089','89','9080','0'),
('6','76778','8903_G','32','332','0'),
('7','66729','h_9090','22','322','0'),
('8','72881','F_23','333','5','0'),
('9','96349','S18409','331','212','0'); 


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  `order_amount` decimal(10,0) NOT NULL,
  `order_status` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;

INSERT INTO `orders` VALUES ('39','578','2016-09-30','Xenos Clarke','943','Completed'),
('40','93062','2016-09-08','Cooper Jensen','32','qsdCompleted'),
('41','76778','2016-09-08','Deacon Tyson','77','Pending'),
('42','66729','2018-09-15','Dawn Potter','45','Completed'),
('43','62940','2016-09-08','Zane Calderon','20','Completed'),
('44','22241','2016-09-08','Cecilia Carney','29','Completed'),
('45','40334','2016-09-08','Connor Marquez','87','Completed'),
('46','30771','2016-09-08','Gillian Kirk','461','Completed'),
('47','96349','2016-09-08','Wallace Gillespie','71','Completed'),
('48','72881','2016-09-08','Risa Ayers','18','Completed'),
('50','77099','2016-09-08','Nola Rojas','20','Completed'),
('51','37429','2016-09-08','Talon Rowland','77','Completed'),
('52','44144','2016-09-08','Cheryl Bowers','26','Completed'),
('53','62391','2016-09-08','Bree Gaines','96','Completed'),
('54','54999','2016-09-08','Lacota Bonner','5','Completed'),
('55','83323','2016-09-08','Bradley Freeman','37','Completed'),
('56','409','2016-09-08','Jasper Santiago','68','Completed'),
('57','50683','2016-09-08','Hilary Conner','28','Completed'),
('58','93143','2016-09-08','Zena Fox','37','Completed'),
('59','48121','2016-09-08','Britanni Schmidt','1','Completed'),
('60','74815','2016-09-08','Caleb Lynn','95','Completed'),
('61','37748','2016-09-08','Madeson Robbins','73','Completed'),
('62','34490','2016-09-08','Emily Richmond','77','Completed'),
('63','37920','2016-09-08','Damian Wilson','67','Completed'),
('64','28431','2016-09-08','Mikayla Mendez','5','Completed'),
('65','94701','2016-09-08','Igor Gutierrez','25','Completed'),
('66','36440','2016-09-08','Heather Terrell','8','Completed'),
('67','37251','2016-09-08','Rose Barry','64','Completed'),
('68','35643','2016-09-08','Bernard Gilmore','95','Completed'),
('69','9551','2016-09-08','Meghan Mack','89','Completed'),
('70','44898','2016-09-08','Lillith Terrell','43','Completed'),
('71','91617','2016-09-08','Jaquelyn James','57','Completed'),
('72','78062','2016-09-08','Karly Beard','56','Completed'),
('73','87594','2016-09-08','Kareem Cooke','7','Completed'),
('74','24386','2016-09-08','Amethyst Bass','70','Completed'),
('75','49890','2016-09-08','Silas Bates','27','Completed'),
('76','42911','2016-09-08','Sybil Watts','24','Completed'),
('77','75674','2016-09-08','Warren Hays','39','Completed'),
('78','65775','2016-09-08','Kirsten Martin','25','Completed'),
('79','37102','2016-09-08','Cade Lowe','7','Completed'),
('80','74040','2016-09-08','Penelope Moss','59','Completed'),
('81','89592','2016-09-08','Chase Andrews','76','Completed'),
('82','84334','2016-09-08','Fatima Mcconnell','4','Completed'),
('83','91414','2016-09-08','Kelly Garcia','91','Completed'),
('84','89834','2016-09-08','Aubrey Leblanc','41','Completed'),
('85','71212','2016-09-08','Cassidy Dyer','33','Completed'),
('86','14459','2016-09-08','Rina Lawrence','43','Completed'),
('87','22844','2016-09-08','Malcolm Richard','17','Completed'),
('88','43892','2016-09-08','Avye Fowler','55','Completed'),
('89','72412','2016-09-08','Jeremy Randolph','22','Completed'),
('90','64889','2016-09-08','Ray Clayton','46','Completed'),
('91','5518','2016-09-08','Lynn Turner','64','Completed'),
('92','91680','2016-09-08','Eric Guzman','84','Completed'),
('93','31014','2016-09-08','Daphne Preston','27','Completed'),
('94','92194','2016-09-08','Ivy Vazquez','81','Completed'),
('95','12336','2016-09-08','Teegan Jimenez','26','Completed'),
('96','93197','2016-09-08','Quemby Floyd','88','Completed'),
('97','74732','2016-09-08','Aristotle Harris','62','Completed'),
('98','81261','2016-09-08','Abel Floyd','43','Completed'),
('99','21141','2016-09-08','Liberty Gomez','32','Completed'),
('128','5','2016-09-09','44','55','33'),
('131','2222','2016-12-08','sdfsdfc','0','yxcyxc'),
('134','20','2016-12-07','ason','200','ok'),
('135','1','2016-12-15','qsd','0','0'),
('138','444','2016-12-01','ppp','10','0'),
('140','0','2018-09-07','','800','Completed'),
('141','0','2018-09-07','','800','Completed'),
('142','0','2018-09-07','','800','Completed'),
('143','0','2018-09-07','','800','Completed'),
('144','0','2018-09-08','','800','Completed'),
('145','0','0000-00-00','','0',''),
('146','0','2018-09-09','','800','Completed'),
('147','0','2018-09-09','','800','Completed'); 


DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `billing_address_line_1` varchar(250) NOT NULL,
  `billing_address_line_2` varchar(250) NOT NULL,
  `billing_city` varchar(250) NOT NULL,
  `billing_state` varchar(250) NOT NULL,
  `billing_country` varchar(250) NOT NULL,
  `shipping_address_line_1` varchar(250) NOT NULL,
  `shipping_address_line_2` varchar(250) NOT NULL,
  `shipping_city` varchar(250) NOT NULL,
  `shipping_state` varchar(250) NOT NULL,
  `shipping_country` varchar(250) NOT NULL,
  `order_amount` double NOT NULL,
  `order_date` date NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_status` varchar(100) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

INSERT INTO `ordertable` VALUES ('41','0','pritesh','gupta','999dsf','priteshgupta@hotmail.com','106 A block','Leeds Apartment','Indore','MP','Country','same','same','same','same','same','0','0000-00-00','',''),
('42','0','neha','joshi','98273455454','mehajosthi@gmail.com','sdf','ds','df','dsf','dfs','dsf','fds','sdf','sdf','dsf','0','0000-00-00','',''),
('43','0','ds','sd','','','','','','2','2','','','','','','0','0000-00-00','',''),
('44','0','test','tssg','','','','','','3','1','','','','','','0','0000-00-00','',''); 


DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profession` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(100) NOT NULL,
  `post_content` varchar(255) NOT NULL,
  `post_category` varchar(200) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `add_file` varchar(255) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `pricetable`;
CREATE TABLE `pricetable` (
  `price_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `price_title` varchar(100) NOT NULL,
  `price_type` varchar(100) DEFAULT NULL,
  `price_value` varchar(100) NOT NULL,
  `price_currency` varchar(50) NOT NULL,
  `price_interval` varchar(100) NOT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` varchar(15) NOT NULL,
  `product_name` varchar(70) NOT NULL,
  `product_line` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `product_url` varchar(255) NOT NULL,
  `qty_available` smallint(6) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_sell_price` decimal(10,2) NOT NULL,
  `tax` float NOT NULL,
  `product_discount` float NOT NULL,
  `added_date` date NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `productLine` (`product_line`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `products` VALUES ('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.','http://findicons.com/files/icons/590/motorola/128/razr_product_red.png','http://pdocrud.com/demo/pages','7933','48.81','95.70','0','5','2016-12-20'),
('S10_1949','1952 Alpine Renault 1300','Classic Cars','1:10','Classic Metal Creations','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','http://findicons.com/files/icons/1673/diagram_part_2/96/diagram_v2_17.png','http://demo.digitaldreamstech.com/formdoid/script/documentation/formdoid/','7305','50.00','214.30','0','0','2016-12-20'),
('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','1:10','Highway 66 Mini Classics','Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.','http://findicons.com/files/icons/53/cats/128/drive_product_red_usb.png','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6625','68.99','118.94','0','0','2016-12-20'),
('S10_4698','2003 Harley-Davidson Eagle Drag Bike','Motorcycles','1:10','Red Start Diecast','Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine','http://findicons.com/files/icons/2738/pretty_office_icon_set_part_9/128/product_documentation.png','http://demo.digitaldreamstech.com/SimplifiedDB/documentation/PDO/pdo-transactions.php','5582','91.02','193.66','0','0','2016-12-20'),
('S10_4757','1972 Alfa Romeo GTA','Classic Cars','1:10','Motor City Art Classics','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','http://findicons.com/files/icons/2834/flatastic_part_2/128/product.png','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3252','85.68','136.00','0','0','2016-12-20'),
('S10_4962','1962 LanciaA Delta 16V','Classic Cars','1:10','Second Gear Diecast','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','http://displays2go.com.au/slir/w144-h144/images/product_images/1369184182.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6791','103.42','147.74','0','0','2016-12-20'),
('S12_1099','1968 Ford Mustang','Classic Cars','1:12','Autoart Studio Design','Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/item/wordpress-awesome-import-export-plugin/12896266','68','95.34','194.57','0','0','2016-12-20'),
('S12_1108','2001 Ferrari Enzo','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','http://displays2go.com.au/slir/w144-h144/images/product_images/1392593620.jpeg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3619','95.59','207.80','0','0','2016-12-20'),
('S12_1666','1958 Setra Bus','Trucks and Buses','1:12','Welly Diecast Productions','Model features 30 windows, skylights & glare resistant glass, working steering system, original logos','http://displays2go.com.au/slir/w144-h144/images/product_images/1369181990.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1579','77.90','136.67','0','0','2016-12-20'),
('S12_2823','2002 Suzuki XREO','Motorcycles','1:12','Unimax Art Galleries','Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1392609013.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9997','66.27','150.62','0','0','2016-12-20'),
('S12_3148','1969 Corvair Monza','Classic Cars','1:18','Welly Diecast Productions','1:18 scale die-cast about 10\" long doors open, hood opens, trunk opens and wheels roll','http://displays2go.com.au/images/product_images/1392665476.gif','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6906','89.14','151.08','0','0','2016-12-20'),
('S12_3380','1968 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','http://demo.digitaldreamstech.com/wp-awesome-import-export-documentation','9123','75.16','117.44','0','0','2016-12-20'),
('S12_3891','1969 Ford Falcon','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1049','83.05','173.02','0','0','2016-12-20'),
('S12_3990','1970 Plymouth Hemi Cuda','Classic Cars','1:12','Studio M Art Models','Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5663','31.92','79.80','0','0','2016-12-20'),
('S12_4473','1957 Chevy Pickup','Trucks and Buses','1:12','Exoto Designs','1:12 scale die-cast about 20\" long Hood opens, Rubber wheels','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6125','55.70','118.50','0','0','2016-12-20'),
('S12_4675','1969 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7323','58.73','115.16','0','0','2016-12-20'),
('S18_1097','1940 Ford Pickup Truck','Trucks and Buses','1:18','Studio M Art Models','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2613','58.33','116.67','0','0','2016-12-20'),
('S18_1129','1993 Mazda RX-7','Classic Cars','1:18','Highway 66 Mini Classics','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','http://demo.digitaldreamstech.com/formdoid/','3975','83.51','141.54','0','0','2016-12-20'),
('S18_1342','1937 Lincoln Berline','Vintage Cars','1:18','Motor City Art Classics','Features opening engine cover, doors, trunk, and fuel filler cap. Color black','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8693','60.62','102.74','0','0','2016-12-20'),
('S18_1367','1936 Mercedes-Benz 500K Special Roadster','Vintage Cars','1:18','Studio M Art Models','This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8635','24.26','53.91','0','0','2016-12-20'),
('S18_1589','1965 Aston Martin DB5','Classic Cars','1:18','Classic Metal Creations','Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9042','65.96','124.44','0','0','2016-12-20'),
('S18_1662','1980s Black Hawk Helicopter','Planes','1:18','Red Start Diecast','1:18 scale replica of actual Army\'s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5330','77.27','157.69','0','0','2016-12-20'),
('S18_1749','1917 Grand Touring Sedan','Vintage Cars','1:18','Welly Diecast Productions','This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/item/pdomodel-database-abstraction-and-helper-php-class/15832775','2724','86.70','170.00','0','0','2016-12-20'),
('S18_1889','1948 Porsche 356-A Roadster','Classic Cars','1:18','Gearbox Collectibles','This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8826','53.90','77.00','0','0','2016-12-20'),
('S18_1984','1995 Honda Civic','Classic Cars','1:18','Min Lin Diecast','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9772','93.89','142.25','0','0','2016-12-20'),
('S18_2238','1998 Chrysler Plymouth Prowler','Classic Cars','1:18','Gearbox Collectibles','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4724','101.51','163.73','0','0','2016-12-20'),
('S18_2248','1911 Ford Town Car','Vintage Cars','1:18','Motor City Art Classics','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','540','33.30','60.54','0','0','2016-12-20'),
('S18_2319','1964 Mercedes Tour Bus','Trucks and Buses','1:18','Unimax Art Galleries','Exact replica. 100+ parts. working steering system, original logos','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8258','74.86','122.73','0','0','2016-12-20'),
('S18_2325','1932 Model A Ford J-Coupe','Vintage Cars','1:18','Autoart Studio Design','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9354','58.48','127.13','0','0','2016-12-20'),
('S18_2432','1926 Ford Fire Engine','Trucks and Buses','1:18','Carousel DieCast Legends','Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2018','24.92','60.77','0','0','2016-12-20'),
('S18_2581','P-51-D Mustang','Planes','1:72','Gearbox Collectibles','Has retractable wheels and comes with a stand','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','992','49.00','84.48','0','0','2016-12-20'),
('S18_2625','1936 Harley Davidson El Knucklehead','Motorcycles','1:18','Welly Diecast Productions','Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4357','24.23','60.57','0','0','2016-12-20'),
('S18_2795','1928 Mercedes-Benz SSK','Vintage Cars','1:18','Gearbox Collectibles','This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','548','72.56','168.75','0','0','2016-12-20'),
('S18_2870','1999 Indy 500 Monte Carlo SS','Classic Cars','1:18','Red Start Diecast','Features include opening and closing doors. Color: Red','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8164','56.76','132.00','0','0','2016-12-20'),
('S18_2949','1913 Ford Model T Speedster','Vintage Cars','1:18','Carousel DieCast Legends','This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4189','60.78','101.31','0','0','2016-12-20'),
('S18_2957','1934 Ford V8 Coupe','Vintage Cars','1:18','Min Lin Diecast','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5649','34.35','62.46','0','0','2016-12-20'),
('S18_3029','1999 Yamaha Speed Boat','Ships','1:18','Min Lin Diecast','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4259','51.61','86.02','0','0','2016-12-20'),
('S18_3136','18th Century Vintage Horse Carriage','Vintage Cars','1:18','Red Start Diecast','Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.\r\n\r\nThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5992','60.74','104.72','0','0','2016-12-20'),
('S18_3140','1903 Ford Model A','Vintage Cars','1:18','Unimax Art Galleries','Features opening trunk,  working steering system','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3913','68.30','136.59','0','0','2016-12-20'),
('S18_3232','1992 Ferrari 360 Spider red','Classic Cars','1:18','Unimax Art Galleries','his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8347','77.90','169.34','0','0','2016-12-20'),
('S18_3233','1985 Toyota Supra','Classic Cars','1:18','Highway 66 Mini Classics','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7733','57.01','107.57','0','0','2016-12-20'),
('S18_3259','Collectable Wooden Train','Trains','1:18','Carousel DieCast Legends','Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6450','67.56','100.84','0','0','2016-12-20'),
('S18_3278','1969 Dodge Super Bee','Classic Cars','1:18','Min Lin Diecast','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1917','49.05','80.41','0','0','2016-12-20'),
('S18_3320','1917 Maxwell Touring Car','Vintage Cars','1:18','Exoto Designs','Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7913','57.54','99.21','0','0','2016-12-20'),
('S18_3482','1976 Ford Gran Torino','Classic Cars','1:18','Gearbox Collectibles','Highly detailed 1976 Ford Gran Torino \"Starsky and Hutch\" diecast model. Very well constructed and painted in red and white patterns.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9127','73.49','146.99','0','0','2016-12-20'),
('S18_3685','1948 Porsche Type 356 Roadster','Classic Cars','1:18','Gearbox Collectibles','This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8990','62.16','141.28','0','0','2016-12-20'),
('S18_3782','1957 Vespa GS150','Motorcycles','1:18','Studio M Art Models','Features rotating wheels , working kick stand. Comes with stand.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7689','32.95','62.17','0','0','2016-12-20'),
('S18_3856','1941 Chevrolet Special Deluxe Cabriolet','Vintage Cars','1:18','Exoto Designs','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2378','64.58','105.87','0','0','2016-12-20'),
('S18_4027','1970 Triumph Spitfire','Classic Cars','1:18','Min Lin Diecast','Features include opening and closing doors. Color: White.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5545','91.92','143.62','0','0','2016-12-20'),
('S18_4409','1932 Alfa Romeo 8C2300 Spider Sport','Vintage Cars','1:18','Exoto Designs','This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6553','43.26','92.03','0','0','2016-12-20'),
('S18_4522','1904 Buick Runabout','Vintage Cars','1:18','Exoto Designs','Features opening trunk,  working steering system','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8290','52.66','87.77','0','0','2016-12-20'),
('S18_4600','1940s Ford truck','Trucks and Buses','1:18','Motor City Art Classics','This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940\'s Pick-Up truck is painted in classic dark green color, and features rotating wheels.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3128','84.76','121.08','0','0','2016-12-20'),
('S18_4668','1939 Cadillac Limousine','Vintage Cars','1:18','Studio M Art Models','Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6645','23.14','50.31','0','0','2016-12-20'),
('S18_4721','1957 Corvette Convertible','Classic Cars','1:18','Classic Metal Creations','1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1249','69.93','148.80','0','0','2016-12-20'),
('S18_4933','1957 Ford Thunderbird','Classic Cars','1:18','Studio M Art Models','This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3209','34.21','71.27','0','0','2016-12-20'),
('S24_1046','1970 Chevy Chevelle SS 454','Classic Cars','1:24','Unimax Art Galleries','This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1005','49.24','73.49','0','0','2016-12-20'),
('S24_1444','1970 Dodge Coronet','Classic Cars','1:24','Highway 66 Mini Classics','1:24 scale die-cast about 18\" long doors open, hood opens and rubber wheels','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4074','32.37','57.80','0','0','2016-12-20'),
('S24_1578','1997 BMW R 1100 S','Motorcycles','1:24','Autoart Studio Design','Detailed scale replica with working suspension and constructed from over 70 parts','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7003','60.86','112.70','0','0','2016-12-20'),
('S24_1628','1966 Shelby Cobra 427 S/C','Classic Cars','1:24','Carousel DieCast Legends','This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it\'s own display case.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8197','29.18','50.31','0','0','2016-12-20'),
('S24_1785','1928 British Royal Navy Airplane','Planes','1:24','Classic Metal Creations','Official logos and insignias','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3627','66.74','109.42','0','0','2016-12-20'),
('S24_1937','1939 Chevrolet Deluxe Coupe','Vintage Cars','1:24','Motor City Art Classics','This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7332','22.57','33.19','0','0','2016-12-20'),
('S24_2000','1960 BSA Gold Star DBD34','Motorcycles','1:24','Highway 66 Mini Classics','Detailed scale replica with working suspension and constructed from over 70 parts','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','15','37.32','76.17','0','0','2016-12-20'),
('S24_2011','18th century schooner','Ships','1:24','Carousel DieCast Legends','All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1898','82.34','122.89','0','0','2016-12-20'),
('S24_2022','1938 Cadillac V-16 Presidential Limousine','Vintage Cars','1:24','Classic Metal Creations','This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2847','20.61','44.80','0','0','2016-12-20'),
('S24_2300','1962 Volkswagen Microbus','Trucks and Buses','1:24','Autoart Studio Design','This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2327','61.34','127.79','0','0','2016-12-20'),
('S24_2360','1982 Ducati 900 Monster','Motorcycles','1:24','Highway 66 Mini Classics','Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6840','47.10','69.26','0','0','2016-12-20'),
('S24_2766','1949 Jaguar XK 120','Classic Cars','1:24','Classic Metal Creations','Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2350','47.25','90.87','0','0','2016-12-20'),
('S24_2840','1958 Chevy Corvette Limited Edition','Classic Cars','1:24','Carousel DieCast Legends','The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2542','15.91','35.36','0','0','2016-12-20'),
('S24_2841','1900s Vintage Bi-Plane','Planes','1:24','Autoart Studio Design','Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5942','34.25','68.51','0','0','2016-12-20'),
('S24_2887','1952 Citroen-15CV','Classic Cars','1:24','Exoto Designs','Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1452','72.82','117.44','0','0','2016-12-20'),
('S24_2972','1982 Lamborghini Diablo','Classic Cars','1:24','Second Gear Diecast','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7723','16.24','37.76','0','0','2016-12-20'),
('S24_3151','1912 Ford Model T Delivery Wagon','Vintage Cars','1:24','Min Lin Diecast','This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9173','46.91','88.51','0','0','2016-12-20'),
('S24_3191','1969 Chevrolet Camaro Z28','Classic Cars','1:24','Exoto Designs','1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4695','50.51','85.61','0','0','2016-12-20'),
('S24_3371','1971 Alpine Renault 1600s','Classic Cars','1:24','Welly Diecast Productions','This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7995','38.58','61.23','0','0','2016-12-20'),
('S24_3420','1937 Horch 930V Limousine','Vintage Cars','1:24','Autoart Studio Design','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2902','26.30','65.75','0','0','2016-12-20'),
('S24_3432','2002 Chevy Corvette','Classic Cars','1:24','Gearbox Collectibles','The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9446','62.11','107.08','0','0','2016-12-20'),
('S24_3816','1940 Ford Delivery Sedan','Vintage Cars','1:24','Carousel DieCast Legends','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6621','48.64','83.86','0','0','2016-12-20'),
('S24_3856','1956 Porsche 356A Coupe','Classic Cars','1:18','Classic Metal Creations','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6600','98.30','140.43','0','0','2016-12-20'),
('S24_3949','Corsair F4U ( Bird Cage)','Planes','1:24','Second Gear Diecast','Has retractable wheels and comes with a stand. Official logos and insignias.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6812','29.34','68.24','0','0','2016-12-20'),
('S24_3969','1936 Mercedes Benz 500k Roadster','Vintage Cars','1:24','Red Start Diecast','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2081','21.75','41.03','0','0','2016-12-20'),
('S24_4048','1992 Porsche Cayenne Turbo Silver','Classic Cars','1:24','Exoto Designs','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6582','69.78','118.28','0','0','2016-12-20'),
('S24_4258','1936 Chrysler Airflow','Vintage Cars','1:24','Second Gear Diecast','Features opening trunk,  working steering system. Color dark green.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4710','57.46','97.39','0','0','2016-12-20'),
('S24_4278','1900s Vintage Tri-Plane','Planes','1:24','Unimax Art Galleries','Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2756','36.23','72.45','0','0','2016-12-20'),
('S24_4620','1961 Chevrolet Impala','Classic Cars','1:18','Classic Metal Creations','This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7869','32.33','80.84','0','0','2016-12-20'),
('S32_1268','1980’s GM Manhattan Express','Trucks and Buses','1:32','Motor City Art Classics','This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5099','53.93','96.31','0','0','2016-12-20'),
('S32_1374','1997 BMW F650 ST','Motorcycles','1:32','Exoto Designs','Features official die-struck logos and baked enamel finish. Comes with stand.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','178','66.92','99.89','0','0','2016-12-20'),
('S32_2206','1982 Ducati 996 R','Motorcycles','1:32','Gearbox Collectibles','Features rotating wheels , working kick stand. Comes with stand.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9241','24.14','40.23','0','0','2016-12-20'),
('S32_2509','1954 Greyhound Scenicruiser','Trucks and Buses','1:32','Classic Metal Creations','Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','2874','25.98','54.11','0','0','2016-12-20'),
('S32_3207','1950\'s Chicago Surface Lines Streetcar','Trains','1:32','Gearbox Collectibles','This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8601','26.72','62.14','0','0','2016-12-20'),
('S32_3522','1996 Peterbilt 379 Stake Bed with Outrigger','Trucks and Buses','1:32','Red Start Diecast','This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','814','33.61','64.64','0','0','2016-12-20'),
('S32_4289','1928 Ford Phaeton Deluxe','Vintage Cars','1:32','Highway 66 Mini Classics','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','136','33.02','68.79','0','0','2016-12-20'),
('S32_4485','1974 Ducati 350 Mk3 Desmo','Motorcycles','1:32','Second Gear Diecast','This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3341','56.13','102.05','0','0','2016-12-20'),
('S50_1341','1930 Buick Marquette Phaeton','Vintage Cars','1:50','Studio M Art Models','Features opening trunk,  working steering system','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7062','27.06','43.64','0','0','2016-12-20'),
('S50_1392','Diamond T620 Semi-Skirted Tanker','Trucks and Buses','1:50','Highway 66 Mini Classics','This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1016','68.29','115.75','0','0','2016-12-20'),
('S50_1514','1962 City of Detroit Streetcar','Trains','1:50','Classic Metal Creations','This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1645','37.49','58.58','0','0','2016-12-20'),
('S50_4713','2002 Yamaha YZR M1','Motorcycles','1:50','Autoart Studio Design','Features rotating wheels , working kick stand. Comes with stand.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','600','34.17','81.36','0','0','2016-12-20'),
('S700_1138','The Schooner Bluenose','Ships','1:700','Autoart Studio Design','All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1897','34.00','66.67','0','0','2016-12-20'),
('S700_1691','American Airlines: B767-300','Planes','1:700','Min Lin Diecast','Exact replia with official logos and insignias and retractable wheels','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5841','51.15','91.34','0','0','2016-12-20'),
('S700_1938','The Mayflower','Ships','1:700','Studio M Art Models','Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','737','43.30','86.61','0','0','2016-12-20'),
('S700_2047','HMS Bounty','Ships','1:700','Unimax Art Galleries','Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','3501','39.83','90.52','0','0','2016-12-20'),
('S700_2466','America West Airlines B757-200','Planes','1:700','Motor City Art Classics','Official logos and insignias. Working steering system. Rotating jet engines','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','9653','68.80','99.72','0','0','2016-12-20'),
('S700_2610','The USS Constitution Ship','Ships','1:700','Red Start Diecast','All wood with canvas sails. Measures 31 1/2\" Length x 22 3/8\" High x 8 1/4\" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7083','33.97','72.28','0','0','2016-12-20'),
('S700_2824','1982 Camaro Z28','Classic Cars','1:18','Carousel DieCast Legends','Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2\" Long.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','6934','46.53','101.15','0','0','2016-12-20'),
('S700_2834','ATA: B757-300','Planes','1:700','Highway 66 Mini Classics','Exact replia with official logos and insignias and retractable wheels','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','7106','59.33','118.65','0','0','2016-12-20'),
('S700_3167','F/A 18 Hornet 1/72','Planes','1:72','Motor City Art Classics','10\" Wingspan with retractable landing gears.Comes with pilot','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','551','54.40','80.00','0','0','2016-12-20'),
('S700_3505','The Titanic','Ships','1:700','Carousel DieCast Legends','Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','1956','51.09','100.17','0','0','2016-12-20'),
('S700_3962','The Queen Mary','Ships','1:700','Welly Diecast Productions','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','5088','53.63','99.31','0','0','2016-12-20'),
('S700_4002','American Airlines: MD-11S','Planes','1:700','Second Gear Diecast','Polished finish. Exact replia with official logos and insignias and retractable wheels','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','8820','36.27','74.03','0','0','2016-12-20'),
('S72_1253','Boeing X-32A JSF','Planes','1:72','Motor City Art Classics','10\" Wingspan with retractable landing gears.Comes with pilot','http://displays2go.com.au/slir/w144-h144/images/product_images/1384248587.jpg','https://codecanyon.net/user/ddeveloper/portfolio?ref=ddeveloper','4857','32.77','49.66','0','0','2016-12-20'); 


DROP TABLE IF EXISTS `productsizes`;
CREATE TABLE `productsizes` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size` enum('x-small','small','medium','large','x-large') NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `productsizes` VALUES ('6','x-small'),
('7','medium'),
('8','x-large'),
('9','small'); 


DROP TABLE IF EXISTS `producttable`;
CREATE TABLE `producttable` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(250) NOT NULL,
  `product_price` double NOT NULL,
  `product_sell_price` double NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `product_description` varchar(250) NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `qty_available` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `product_rating` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO `producttable` VALUES ('1','pp','250','300','10000','this is description about product','f','232','0000-00-00 00:00:00','2'),
('3','sfsdf','222','300','100','sfd','f','232','2016-12-14 10:34:00','2'),
('4','ppp','300','2522','12','df','2','22','0000-00-00 00:00:00','21'),
('5','ppp','300','2522','12','df','2','22','0000-00-00 00:00:00','21'),
('6','ppp','300','2522','12','df','2','22','0000-00-00 00:00:00','21'),
('7','pP','909','990','90','SD','dsf','232','0000-00-00 00:00:00','2'),
('8','pP','909','990','90','SD','dsf','232','0000-00-00 00:00:00','2'),
('9','pP','909','990','90','SD','dsf','232','0000-00-00 00:00:00','2'),
('10','neha','201','333','333','3','3','33','0000-00-00 00:00:00','3'),
('11','neha','33','333','333','3','3','33','0000-00-00 00:00:00','3'),
('12','neha','33','333','333','3','3','33','0000-00-00 00:00:00','3'),
('13','sadf','324','3434','34','34','df','324','0000-00-00 00:00:00','34'),
('15','Test prod','1000','12000','2','dfs','sfd','23','2016-08-31 00:00:00','34'),
('16','Test prod','34','3333','333','fds','dsf','234','2016-08-31 00:00:00','3'),
('17','fgfdfdg','500','300','25','gfdgdfg','jjhjhj','33','2016-09-15 00:00:00','5'),
('18','test','2','123','12','sadfsdf','asd','213','2016-09-20 00:00:00','1'),
('19','??','5','3','0','????','222','1','2016-09-28 00:00:00','1'),
('20','rf','66','879','7',',n,n','n,','76','2016-09-28 00:00:00','3'),
('21','','0','0','0','','','87','0000-00-00 00:00:00','0'),
('22','0','45','44','0','devesh','11','11','2016-12-01 00:00:00','5'),
('23','xasasd','0','0','0','','','0','0000-00-00 00:00:00','0'),
('24','','0','0','0','','','56','0000-00-00 00:00:00','0'),
('25','','0','0','0','','','79','0000-00-00 00:00:00','0'),
('26','yyyy','5565','-4','3','3333','5555','4','2016-12-18 00:00:00','5'),
('27','xcvxcv','344','333','33','33','33','33','2016-12-06 00:00:00','33'); 


DROP TABLE IF EXISTS `registration_1`;
CREATE TABLE `registration_1` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) COLLATE utf32_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf32_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf32_unicode_ci NOT NULL,
  `about_yourself` text COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO `registration_1` VALUES ('80','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','admin@gmail.com','1234','sdff'),
('81','sdf','adminsdf@sdfsadf.dfgdf','admin@ddt2016','dsf'),
('82','pritesh','pritesh@gmail.com','1234qwer','sdsdf'),
('83','pritesh','ss@fff.com','sdf','sdf'),
('84','d','admin@gmail.com','admin@ddt2016','dfdss'),
('85','asd','admin@sdfsdaf.com','12346','sdf'),
('86','asd','admin@sdfsdaf.com','12346','sdf'),
('87','sdf','pfa@gmail.com','admin@ddt2016','sdf'),
('88','ff','admin@fddfs.gg','admin@ddt2016','dsd'),
('89','sd','admin@sdf.ff','admin@ddt2016','f'); 


DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservation_id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zip/postal_code` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `booking_date` date NOT NULL,
  `class` varchar(250) NOT NULL,
  `adults` varchar(50) NOT NULL,
  `infants` varchar(50) NOT NULL,
  `children` varchar(50) NOT NULL,
  `amount` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `roomtable`;
CREATE TABLE `roomtable` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(200) NOT NULL,
  `room_type` varchar(200) NOT NULL,
  `room_desc` varchar(250) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `class_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` varchar(250) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `section` VALUES ('7','a','1','1','03:00:00','06:00:00','2'),
('8','b','2','1','08:00:00','09:00:00','1'),
('9','c5','3','2','10:00:00','16:00:00','1'),
('10','b','1','2','06:00:00','04:00:00','1'),
('11','c','2','3','04:10:00','20:00:00','1'),
('12','d','2','3','16:00:00','06:35:00','1'),
('13','c','4','3','04:00:00','10:00:00','1'),
('14','a','3','3','04:00:00','06:00:00','1'),
('15','b','3','1','03:00:00','04:00:00','1'),
('16','a','4','2','05:00:00','06:00:00','1'); 


DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `settings` VALUES ('1','system_name','Ekattor School Management System Pro'),
('2','system_title','Ekattor School'),
('3','address','Dhaka, Bangladesh'),
('4','phone','+8012654159'),
('5','paypal_email','payment@school.com'),
('6','currency','usd'),
('7','system_email','school@ekattor.com'),
('20','active_sms_service','disabled'),
('11','language','english'),
('12','text_align','left-to-right'),
('13','clickatell_user',''),
('14','clickatell_password',''),
('15','clickatell_api_id',''),
('16','skin_colour','default'),
('17','twilio_account_sid',''),
('18','twilio_auth_token',''),
('19','twilio_sender_phone_number',''); 


DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(250) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `state` VALUES ('1','MP','2'),
('2','UP','2'),
('3','Texas','1'),
('4','Victoria','1'); 


DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `register_number` varchar(255) NOT NULL,
  `joining_date` date NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(250) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(120) NOT NULL,
  `present_address` varchar(255) NOT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `pin_code` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `roll_number` varchar(255) NOT NULL,
  `mother_tongue` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `religion` varchar(250) NOT NULL,
  `previous_school` varchar(250) NOT NULL,
  `previous_school_address` varchar(255) NOT NULL,
  `previous_qualification` varchar(250) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `transport_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_status` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `student` VALUES ('1','1','2016-10-13','Nitishassss','dfs','Patil','female','2016-10-26','n@gmail.com','546232','indore','indore','75676','indore','mp','india','b-','indore','hindu','1','hindu','1','hindu','hds','indore','10','2','2','1','nitisha','429632e44c203d63b3fd5dbcc673d009','1','1'),
('2','2','2016-11-16','vaishali','yes','patel','1','1992-11-16','vaishali@gmail.com','8956235698','indore','kasravad','452001','indore','madhya pradesh','0','a+','indore','hindu','2','hindi','3','hindu','kasravad public school','kasravad public school','nursery','2','1','1','vaishali','vaishali','','1'),
('3','3','2016-11-16','ankit','no','patidar','0','2016-11-16','ankit@gmail.com','7896523569','indore','indore','452001','indore','madhya pradesh','0','a+','indore','hindu','3','hindi','1','hindu','kasravad public school','apolo tower','nursery','3','3','1','ankit','ankit','1','1'),
('4','3','2016-11-09','x','x','x','1','2016-11-02','n@gm.com','8529632569','x','apolo tower','45665','indore','madhya pradesh','1','a+','indore','hindu','3','hindi','1','hindu','kasravad public school','apolo tower','nursery','1','4','1','admin','admin@ddt2016','','1'),
('5','8','2016-11-10','rahul','fg','verma','0','1995-11-10','rahul@gmail.com','56239856322','apolo tower','apolo tower','45665','indore','madhya pradesh','0','a+','indore','hindu','3','hindi','2','hindu','fd public school','fd public school','nursery','2','1','1','rahul','rahul','','1'),
('6','122','2016-11-24','snehal','dsa','kri','1','2016-11-09','snehal@gmail.com','9632569856','indore','indore','452001','indore','mp','0','b+','indore','hindu','0810it101041','hindi','4','hindu','dsf','indore','sdf','4','2','1','snehal@gmail.com','d1f6648a66b1e7c82e34dd142e8a0330','','1'),
('7','143','2016-11-24','aliya','asd','bhatt','1','2016-11-08','aliya@gmail.com','9632569856','indore','indore','452001','indore','mp','0','b+','indore','hindu','0810it101042','hindi','2','hindu','dsf','indore','sdf','4','3','2','aliya@gmail.com','e3cb970693574ea75d091a6049f8a3ff','','2'),
('8','5236','2016-11-17','kareena','kapoor','khan','1','2016-11-29','kareena@gmail.com','8526356985','indore','indore','452001','indore','mp','0','a+','indore','hindu','0810it101043','hindi','2','hindu','dsf','indore','sdf','3','4','1','kareena@gmail.com','9efbd0268d38eb6fc0d3805890956549','','1'),
('9','342','2016-11-22','karishma','kko','kapoor','1','2016-11-22','karishma@gmail.com','sa','indore','indoire','452001','mumbai','maharashtra','0','a+','indore','hindu','0810it101045','hindi','2','hindu','dsf','indore','sdf','4','1','1','karishma@gmail.com','b3af3417c0a445baa5a4816045f44c9f','','1'),
('10','543','2016-11-16','nn','ds','sdf','0','2016-11-08','nn@gmail.com','45','fdg','fdg','451','fgd','fdg','1','fgd','f','dfg','12','df','3','dfg','fdg','gfd','fdg','4','2','1','nn@gmail.com','eab71244afb687f16d8c4f5ee9d6ef0e','','1'),
('11','','0000-00-00','Jen','','mile','male','0000-00-00','','','','','','','','','','','','','','0','','','','','0','7','0','','','','0'),
('12','2324','0000-00-00','Pritesh','','gupta','','0000-00-00','digidreamstech@gmail.com','','','','','','','','','','','','','0','','','','','0','0','0','','','','0'); 


DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `religion` longtext COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_vehicle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `route_fare` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE `user_meta` (
  `user_meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(250) COLLATE utf32_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`user_meta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO `user_meta` VALUES ('31','19','2432re32d23r34r','43rfewrfasdfdsaf'),
('32','21','m1','v1'),
('33','21','m2','v2'),
('52','26','Total Experience1','5 years22'),
('53','26','Total Experience2','5 years33'),
('54','26','Total Experience3','5 years44'),
('55','26','Total Experience4','5 years55'),
('56','26','Total Experience5','5 years66'),
('57','26','Total Experience6','5 years77'),
('58','26','Total Experience7','5 years88'),
('59','26','Total Experience8','5 years99'),
('60','27','My Meta','hello'),
('61','27','Second Meta','how are you'),
('62','28','My Meta','hello'),
('63','28','Second Meta','how are you'); 


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `hobbies` varchar(200) NOT NULL,
  `educational_status` varchar(200) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `about_yourself` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES ('26','Jon ','Snow','jon','tfJQra$cwN','test@gmail.com','99009900','0','2016-11-11','Footbal, volleyball, dddd','BE','DDT','USA','newyork','0','3','452005','about desc.'),
('32','test','tesss','Pritesh','KW#RqNcAjz','digidreamstech@gmail.com','9977848644','','0000-00-00','','',NULL,'','Indore','','India','452005',NULL); 


DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(200) NOT NULL,
  `number_of_seats` int(11) NOT NULL,
  `maximum_allowed` int(11) NOT NULL,
  `vehicle_type` varchar(120) NOT NULL,
  `contact_person` varchar(120) NOT NULL,
  `insurance_renewal_date` date NOT NULL,
  `user_id` varchar(250) NOT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `vehicle` VALUES ('1','1','20','19','busss','driver1','2016-10-12','1'),
('2','mp09-2434','30','30','bus','sunail','2016-11-30','5'); 


DROP TABLE IF EXISTS `website_design_request`;
CREATE TABLE `website_design_request` (
  `request_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_of_website` varchar(200) NOT NULL,
  `service_you_need` varchar(200) NOT NULL,
  `website_reference_links` varchar(255) NOT NULL,
  `your_name` varchar(200) NOT NULL,
  `your_email` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `ask/suggest` varchar(255) NOT NULL,
  `upload_file1` varchar(255) NOT NULL,
  `upload_file2` varchar(255) NOT NULL,
  `upload_file3` varchar(255) NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wp_users` VALUES ('1','admin','$P$B9OuhJ738rLcCB3ItvVH2CsKSYm2H4/','admin','vaishali.ddtech@gmail.com','','2016-04-06 13:04:39','','0','admin'),
('3','','','','','','0000-00-00 00:00:00','','',''); 


DROP TABLE IF EXISTS `x0t2u_users`;
CREATE TABLE `x0t2u_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `x0t2u_users` VALUES ('721','Super User','j351','j351@g.c','$2y$10$rQwOGiYdFcPonc231OsCYOJ/qLghLad/heaUgQleaHOk9VaAeDSza','0','1','2016-04-19 06:40:09','2016-05-02 08:35:41','0','','0000-00-00 00:00:00','0','','','0'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

