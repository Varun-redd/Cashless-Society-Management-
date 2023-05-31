-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 31, 2021 at 08:16 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cashless`
--
CREATE DATABASE IF NOT EXISTS `cashless` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cashless`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add client register_ model', 7, 'add_clientregister_model'),
(20, 'Can change client register_ model', 7, 'change_clientregister_model'),
(21, 'Can delete client register_ model', 7, 'delete_clientregister_model'),
(22, 'Can add client posts_ model', 8, 'add_clientposts_model'),
(23, 'Can change client posts_ model', 8, 'change_clientposts_model'),
(24, 'Can delete client posts_ model', 8, 'delete_clientposts_model'),
(25, 'Can add feedbacks_ model', 9, 'add_feedbacks_model'),
(26, 'Can change feedbacks_ model', 9, 'change_feedbacks_model'),
(27, 'Can delete feedbacks_ model', 9, 'delete_feedbacks_model');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'Client_Site', 'clientposts_model'),
(7, 'Client_Site', 'clientregister_model'),
(9, 'Client_Site', 'feedbacks_model'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Remote_User', '0001_initial', '2019-04-23 07:01:48.050781'),
(2, 'contenttypes', '0001_initial', '2019-04-23 07:01:49.494140'),
(3, 'auth', '0001_initial', '2019-04-23 07:02:03.837890'),
(4, 'admin', '0001_initial', '2019-04-23 07:02:05.832031'),
(5, 'admin', '0002_logentry_remove_auto_add', '2019-04-23 07:02:05.863281'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-04-23 07:02:07.041015'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-04-23 07:02:07.839843'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-04-23 07:02:08.330078'),
(9, 'auth', '0004_alter_user_username_opts', '2019-04-23 07:02:08.361328'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-04-23 07:02:08.921875'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-04-23 07:02:08.953125'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-23 07:02:08.989257'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-04-23 07:02:09.785156'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-23 07:02:10.580078'),
(15, 'sessions', '0001_initial', '2019-04-23 07:02:11.764648'),
(16, 'Remote_User', '0002_clientposts_model', '2019-04-25 05:53:57.702132'),
(17, 'Remote_User', '0003_clientposts_model_usefulcounts', '2019-04-25 10:00:02.521468'),
(18, 'Remote_User', '0004_auto_20190429_1027', '2019-04-29 04:57:32.672296'),
(19, 'Remote_User', '0005_clientposts_model_dislikes', '2019-04-29 05:15:16.668390'),
(20, 'Remote_User', '0006_Review_model', '2019-04-29 05:19:26.382257'),
(21, 'Remote_User', '0007_clientposts_model_names', '2019-04-30 04:45:46.472656');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('49qo7iki5uxczhyymi8ka7dnh6a2wva5', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-08 09:19:45.486328'),
('4x6b78w9rfcn34v650kd2j7oij6atr8p', 'Zjk0Y2RlYjc4OTJhNWMyZjQyNmM4ZGRhYTVjNmVlNDFhZGE4ZmU3NTp7InVzZXJpZCI6Nn0=', '2019-12-27 12:07:42.082031'),
('b9cu6cjsfqfm5mame5dy1ikpiiy7yn3w', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-09 11:00:08.480453'),
('bsevrgzuv7nr9289x9d8j4gzj5ps3pbz', 'MzkyN2QwMjRhMjFkZjA5MWRjZTc1MjJmM2U0OTEwNmNhMzNhZmY1Nzp7InVzZXJpZCI6OX0=', '2020-01-16 13:18:09.875000'),
('ct13q5fpn94zvnij8ekixwzcky2imc5e', 'YWUzM2IzMWJiYmQ3YmY2YzlkMGFlNTM1YmU5ZGM4YjQ0MmY1YTc0NTp7InVzZXJpZCI6NH0=', '2019-05-14 11:44:10.978515'),
('e07j4duysh402dedtomm8icctvs9ljgy', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-09 06:08:12.306625'),
('hbv74sg6w6e4wp89vq807vw0xhkh5s1h', 'Y2I3OTYyN2ZmMTljZmYyZDNhNjBiNThlZDczOWUwNGIyMmYxYzgzYzp7InVzZXJpZCI6Nn0=', '2020-01-13 13:05:45.904945'),
('hhtt48je70l9nzw6dee4ocuxxm9blqej', 'NGRhY2JkNmQ4ZTM4OTU0Y2UzMzFlZmZmOTgzYmE0MWVkOThiNjc2NTp7Im5hbWUiOjEsInVzZXJpZCI6MX0=', '2019-05-09 10:12:38.380843'),
('o7x1vhluuypdfmgv7fmv6nohgfn5ub55', 'NzMyZjlhNzFhZjk2ZGUzZmFiMmIzYjMwNTJkYTg5MDUzNmNlMDk4Mjp7InVzZXJpZCI6MTZ9', '2021-05-04 12:51:55.659179'),
('qnaolidvfx6bu9ra3uyqvkgva7bv92f1', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-14 05:34:50.069335'),
('rgumw3fz24yq74friq3o587i2ahunvev', 'NWJmMjlkNTQ5ZmQwMmIyMDBiYTQzNjE1MjM2MTYxNjg0OTQ3NmJiZjp7InVzZXJpZCI6MTF9', '2020-03-17 09:36:48.323242'),
('tejgl09oettnyva23kqdbns5nfz5g8ug', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-09 11:19:24.387679'),
('tw2mri5kieos2vh71pq29he5gx90xdds', 'eyJ1c2VyaWQiOjE5fQ:1lnd1i:sBigkHa1tcdLkPkRy7EBgwgfy_RjmHOg127XeKpfT-I', '2021-06-14 08:11:58.312766'),
('u5icgvq3qt5nthdlv99go3r804ccghbo', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-09 06:00:13.573226');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_account_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_account_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Acname` varchar(600) NOT NULL,
  `Acaddress` varchar(300) NOT NULL,
  `Acno` varchar(300) NOT NULL,
  `climit` varchar(300) NOT NULL,
  `alimit` varchar(200) NOT NULL,
  `Bname` varchar(300) NOT NULL,
  `cvv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `remote_user_account_model`
--

INSERT INTO `remote_user_account_model` (`id`, `Acname`, `Acaddress`, `Acno`, `climit`, `alimit`, `Bname`, `cvv`) VALUES
(1, 'Dinesh', '#783,4th Cross,Malleshwram,Bangalore', '144372509', '43086', '86', 'SBI', '1345'),
(2, 'Manjunath', 'InidaKarnatakaBangalore,#74,4th Cross,R Nagar', '144372509', '43086', '8086', 'SBI', '1522'),
(3, 'Ramesh', 'InidaKarnatakaMubay,#72,4th Cross,V Nagar', '144372509', '597853', '597853', 'SBI', '2735'),
(4, 'Ravi', 'InidaKarnatakaOoty,#72,4th Cross,R Nagar', '144372509', '611278002', '889598', 'SBI', '2643'),
(5, 'Koli', 'InidiaKarnatakaKovai,#82,4th Cross,R Nagar', '144372509', '611278002', '611278002', 'SBI', '2643'),
(6, 'Roja', 'InidiaKarnatakaKovai,#82,4th Cross,R Nagar', '144372509', '696853', '696853', 'SBI', '2735'),
(7, 'tmksmanju', 'IndiaKarnatakaSalem,#78,4th Cross,R Nagar', '144372509', '696853', '670853', 'SBI', '2735'),
(8, 'Gopi', 'IndiaKarnataka#4th Main,3rd cross,Rajajinagar,Bangalore', '144372509', '696853', '696853', 'SBI', '2735'),
(9, 'Gopal', 'IndiaKarnataka#11th Cross,Sampige Road,Malleshwaram,Bangalore', '144372509', '696853', '661853', 'SBI', '2735'),
(10, 'Rajesh', 'IndiaKarnataka#4th Cross,Margosa Road,Malleshwaram,Bangalore', '144372509', '696853', '661853', 'SBI', '2735');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_clientregister_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_clientregister_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `remote_user_clientregister_model`
--

INSERT INTO `remote_user_clientregister_model` (`id`, `username`, `email`, `password`, `phoneno`, `country`, `state`, `city`) VALUES
(10, 'Dinesh', 'Dinesh123@gmail.com', 'Dinesh', '9535866270', 'India', 'Karnataka', '#783,4th Cross,Malleshwram,Ban'),
(11, 'Manjunath', 'tmksmanju13@gmail.com', 'Manjunath', '9535866270', 'Inida', 'Karnataka', 'Bangalore,#74,4th Cross,R Nagar'),
(12, 'Ramesh', 'Ramesh123@gmail.com', 'Ramesh', '9535866270', 'Inida', 'Karnataka', 'Mubay,#72,4th Cross,V Nagar'),
(13, 'Ravi', 'Ravi123@gmail.com', 'Ravi', '9535866270', 'Inida', 'Karnataka', 'Ooty,#72,4th Cross,R Nagar'),
(14, 'Koli', 'Koli123@gmail.com', 'Koli', '9535866270', 'Inidia', 'Karnataka', 'Kovai,#82,4th Cross,R Nagar'),
(15, 'Roja', 'Roja.123@gmail.com', 'Roja', '9535866270', 'Inidia', 'Karnataka', 'Kovai,#82,4th Cross,R Nagar'),
(16, 'tmksmanju', 'tmksmanju13@gmail.com', 'tmksmanju', '9535866270', 'India', 'Karnataka', 'Salem,#78,4th Cross,R Nagar'),
(17, 'Gopi', 'Gopi.123@gmail.com', 'Gopi', '9535866270', 'India', 'Karnataka', '#4th Main,3rd cross,Rajajinagar,Bangalore'),
(18, 'Gopal', 'Gopalan.123@gmail.com', 'Gopal', '9535866270', 'India', 'Karnataka', '#11th Cross,Sampige Road,Malleshwaram,Bangalore'),
(19, 'Rajesh', 'Rajesh.123@gmail.com', 'Rajesh', '9535866270', 'India', 'Karnataka', '#4th Cross,Margosa Road,Malleshwaram,Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_fraud_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_fraud_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Acname` varchar(600) NOT NULL,
  `Acaddress` varchar(300) NOT NULL,
  `Acno` varchar(300) NOT NULL,
  `ftype` varchar(300) NOT NULL,
  `dt` varchar(300) NOT NULL,
  `pname` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `remote_user_fraud_model`
--

INSERT INTO `remote_user_fraud_model` (`id`, `Acname`, `Acaddress`, `Acno`, `ftype`, `dt`, `pname`) VALUES
(13, 'Dinesh', '#783,4th Cross,Malleshwram,Bangalore', '144372509', 'Wrong CVV', '2021-05-03 13:29:33.869140', 'whilful fridge'),
(14, 'Dinesh', '#783,4th Cross,Malleshwram,Bangalore', '144372509', 'No Cash', '2021-05-03 13:30:11.894531', 'HP Laptop'),
(15, 'Dinesh', '#783,4th Cross,Malleshwram,Bangalore', '144372509', 'No Cash', '2021-05-03 13:32:18.102539', 'HP Laptop'),
(16, 'Dinesh', '#783,4th Cross,Malleshwram,Bangalore', '144372509', 'Wrong CVV', '2021-05-03 13:35:53.316406', 'whilful fridge'),
(17, 'tmksmanju', 'IndiaKarnatakaSalem,#78,4th Cross,R Nagar', '144372509', 'Wrong CVV', '2021-05-03 15:01:30.609375', 'ViVo Mobile'),
(18, 'tmksmanju', 'IndiaKarnatakaSalem,#78,4th Cross,R Nagar', '144372509', 'No Cash', '2021-05-03 15:04:26.869140', 'HP Super Computer'),
(19, 'Gopal', 'IndiaKarnataka#11th Cross,Sampige Road,Malleshwaram,Bangalore', '144372509', 'Wrong CVV', '2021-05-31 13:38:18.020166', 'Samsung_Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_product_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_product_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_desc` varchar(600) NOT NULL,
  `names` varchar(300) NOT NULL,
  `sanalysis` varchar(300) NOT NULL,
  `senderstatus` varchar(300) NOT NULL,
  `ratings` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `p_price` varchar(100) NOT NULL,
  `pcat` varchar(200) NOT NULL,
  `c_name` varchar(200) NOT NULL,
  `p_uses` varchar(300) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `DT` varchar(100) NOT NULL,
  `topics` varchar(200) NOT NULL,
  `sprovider` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `remote_user_product_model`
--

INSERT INTO `remote_user_product_model` (`id`, `p_desc`, `names`, `sanalysis`, `senderstatus`, `ratings`, `likes`, `p_price`, `pcat`, `c_name`, `p_uses`, `dislikes`, `DT`, `topics`, `sprovider`) VALUES
(4, 'It is manufactured by vivo from China and providing with different mobile sets.', 'ViVo Mobile', 'nutral', 'process', 12, 10, '13000', 'Electronics', 'Vivo', '3 cameros,3 GB RAM,64 GB Space', -5, '2019-12-30 13:42:49.241859', '', 'Flipcart'),
(5, 'It is V17 Version mobile and Available in all places', 'ViVo V17', 'nutral', 'process', 6, 1, '35000', 'Electronics', 'Vivo', '3 cameros,6 GB RAM,128 GB Space', -1, '2019-12-30 17:49:36.396156', '', 'Flipcart'),
(6, 'IT is manufactured by HP and Distributing throughout India', 'HP Laptop', 'nutral', 'process', 4, 2, '35000', 'Electronics', 'HP', 'Good battery back up,High Resolution Monitor', -1, '2019-12-30 18:06:35.494789', '', 'Snapdeal'),
(7, 'The samsumg Tvs are most popular products in India', 'Samsung TV', 'nutral', 'process', 6, 3, '70000', 'Electronics', 'Samsung', 'LED Display with USB Posts', -1, '2019-12-30 18:29:54.734046', '', 'Amazon'),
(12, 'The godrej fridge is for kitchen vegetable storage', 'Godrej Fridge', 'nutral', 'process', 0, 0, '18000', 'Kitchens', 'Godrej', 'added 3 cooler in back end', 0, '2021-05-04 18:40:19.917968', '', 'Flipcart'),
(13, 'The #dell is best desktop with all peripherals  ', 'Dell Desktop', 'nutral', 'process', 0, 0, '25000', 'Electronics', 'Dell', 'all components ', 0, '2021-05-04 18:43:25.936523', 'dell', 'Snapdeal'),
(14, 'The dell laptop are very good in natural and is manufactured by dell.', 'dell laptops', 'se', 'process', 0, 0, '25000', 'Electronics', 'dell', 'to develop software and for other business ', 0, '2021-05-04 18:44:21.164062', '', 'Flipcart'),
(15, 'It is best product to store home based vegetable', 'whilful fridge', 'se', 'process', 6, 1, '18000', 'Electronics', 'whilful', 'to store home made vegetables', -1, '2021-05-04 18:49:29.108398', '', 'Snapdeal'),
(16, 'It is one of the best pc for fast data computing', 'HP Super Computer', 'se', 'process', 3, 1, '790000', 'Electronics', 'HP', 'to develop software and for other business ', -1, '2021-05-03 15:03:48.946289', '', 'Flipcart'),
(17, 'It is one of the best pc for fast data computing', 'HP Super Computer', 'se', 'process', 0, 0, '790000', 'Electronics', 'HP', 'to develop software and for other business ', 0, '2021-05-03 15:03:49.120117', '', 'Flipcart'),
(18, 'This product is manufactured by samsung and laptops are distributing throughout world.', 'Samsung_Laptop', 'se', 'process', 0, 2, '35000', 'Electronics', 'Samsung', 'smart monitor,4GB RAM,1 TB HD ', 0, '2021-05-31 13:35:43.037301', '', 'Flipcart');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_purchaseconfirm_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_purchaseconfirm_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `dt` varchar(300) NOT NULL,
  `addr` varchar(250) NOT NULL,
  `daddr` varchar(250) NOT NULL,
  `dtype` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `remote_user_purchaseconfirm_model`
--

INSERT INTO `remote_user_purchaseconfirm_model` (`id`, `uname`, `pname`, `price`, `dt`, `addr`, `daddr`, `dtype`) VALUES
(7, 'Dinesh', 'whilful fridge', '18000', '2021-05-03 13:36:56.711914', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'Delivered'),
(8, 'Dinesh', 'HP Laptop', '35000', '2021-05-03 14:45:31.995117', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'Delivered'),
(9, 'tmksmanju', 'ViVo Mobile', '13000', '2021-05-03 15:02:28.594726', 'Salem,#78,4th Cross,R Nagar', 'Salem,#78,4th Cross,R Nagar', 'Delivered'),
(10, 'Manjunath', 'HP Laptop', '35000', '2021-05-03 15:07:48.344726', 'Bangalore,#74,4th Cross,R Nagar', 'Bangalore,#74,4th Cross,K Nagar', 'Fraud Seller'),
(11, 'Gopal', 'Samsung_Laptop', '35000', '2021-05-31 13:39:30.162292', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', 'Delivered'),
(12, 'Gopal', 'Samsung_Laptop', '35000', '2021-05-31 13:40:10.202582', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', 'Delivered'),
(13, 'Rajesh', 'Samsung_Laptop', '35000', '2021-05-31 13:42:49.489693', '#4th Cross,Margosa Road,Malleshwaram,Bangalore', '#14th Cross,Margosa Road,Malleshwaram,Bangalore', 'Fraud Seller');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_purchase_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_purchase_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `dt` varchar(300) NOT NULL,
  `addr` varchar(250) NOT NULL,
  `yc` varchar(250) NOT NULL,
  `pstatus` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `remote_user_purchase_model`
--

INSERT INTO `remote_user_purchase_model` (`id`, `uname`, `pname`, `price`, `dt`, `addr`, `yc`, `pstatus`) VALUES
(11, 'Dinesh', 'HP Laptop', '35000', '2021-05-03 13:14:32.382812', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'Delivered'),
(12, 'Dinesh', 'ViVo Mobile', '13000', '2021-05-03 13:15:18.186523', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'No Cash'),
(13, 'Dinesh', 'whilful fridge', '18000', '2021-05-03 13:16:52.202148', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'Wrong CVV'),
(14, 'Dinesh', 'whilful fridge', '18000', '2021-05-03 13:29:33.869140', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'Wrong CVV'),
(15, 'Dinesh', 'HP Laptop', '35000', '2021-05-03 13:30:11.894531', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'No Cash'),
(16, 'Dinesh', 'HP Laptop', '35000', '2021-05-03 13:32:18.102539', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'No Cash'),
(17, 'Dinesh', 'whilful fridge', '18000', '2021-05-03 13:35:53.316406', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'Wrong CVV'),
(18, 'Dinesh', 'whilful fridge', '18000', '2021-05-03 13:36:00.677734', '#783,4th Cross,Malleshwram,Ban', '#783,4th Cross,Malleshwram,Ban', 'Delivered'),
(19, 'tmksmanju', 'ViVo Mobile', '13000', '2021-05-03 15:01:30.609375', 'Salem,#78,4th Cross,R Nagar', 'Salem,#78,4th Cross,R Nagar', 'Wrong CVV'),
(20, 'tmksmanju', 'ViVo Mobile', '13000', '2021-05-03 15:02:03.229492', 'Salem,#78,4th Cross,R Nagar', 'Salem,#78,4th Cross,R Nagar', 'Pending'),
(21, 'tmksmanju', 'ViVo Mobile', '13000', '2021-05-03 15:02:03.312500', 'Salem,#78,4th Cross,R Nagar', 'Salem,#78,4th Cross,R Nagar', 'Delivered'),
(22, 'tmksmanju', 'HP Super Computer', '790000', '2021-05-03 15:04:26.869140', 'Salem,#78,4th Cross,R Nagar', 'Salem,#78,4th Cross,R Nagar', 'No Cash'),
(23, 'Manjunath', 'HP Laptop', '35000', '2021-05-03 15:07:27.388671', 'Bangalore,#74,4th Cross,R Nagar', 'Bangalore,#74,4th Cross,R Nagar', 'Fraud Seller'),
(24, 'Gopal', 'Samsung_Laptop', '35000', '2021-05-31 13:38:18.020166', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', 'Wrong CVV'),
(25, 'Gopal', 'Samsung_Laptop', '35000', '2021-05-31 13:39:05.001853', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', 'Delivered'),
(26, 'Gopal', 'Samsung_Laptop', '35000', '2021-05-31 13:39:05.050856', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', '#11th Cross,Sampige Road,Malleshwaram,Bangalore', 'Delivered'),
(27, 'Rajesh', 'Samsung_Laptop', '35000', '2021-05-31 13:42:29.955575', '#4th Cross,Margosa Road,Malleshwaram,Bangalore', '#4th Cross,Margosa Road,Malleshwaram,Bangalore', 'Fraud Seller');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_recommend_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_recommend_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname1` varchar(100) NOT NULL,
  `pname` varchar(250) NOT NULL,
  `loc` varchar(250) NOT NULL,
  `usefull` varchar(100) NOT NULL,
  `dt` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `remote_user_recommend_model`
--

INSERT INTO `remote_user_recommend_model` (`id`, `uname1`, `pname`, `loc`, `usefull`, `dt`) VALUES
(6, 'tmksmanju', 'ViVo Mobile', 'India', 'IT is recommended by me', '2021-05-03 15:00:52.031250'),
(7, 'Rajesh', 'Samsung_Laptop', 'can purchase', 'I am recommending this product', '2021-05-31 13:43:43.034755');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_review_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_review_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `ureview` varchar(100) NOT NULL,
  `sanalysis` varchar(100) NOT NULL,
  `dt` varchar(300) NOT NULL,
  `tname` varchar(250) NOT NULL,
  `feedback` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `remote_user_review_model`
--

INSERT INTO `remote_user_review_model` (`id`, `uname`, `ureview`, `sanalysis`, `dt`, `tname`, `feedback`) VALUES
(4, 'tmksmanju', 'It is good product', 'positive', '2021-05-03 15:01:10.210937', 'ViVo Mobile', 'can purchase'),
(5, 'Rajesh', 'It is good laptop', 'positive', '2021-05-31 13:43:19.215393', 'Samsung_Laptop', 'Can purchase');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
