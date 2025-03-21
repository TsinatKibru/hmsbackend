-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hms_test
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add item',7,'add_item'),(26,'Can change item',7,'change_item'),(27,'Can delete item',7,'delete_item'),(28,'Can view item',7,'view_item'),(29,'Can add recipe',8,'add_recipe'),(30,'Can change recipe',8,'change_recipe'),(31,'Can delete recipe',8,'delete_recipe'),(32,'Can view recipe',8,'view_recipe'),(33,'Can add notification',9,'add_notification'),(34,'Can change notification',9,'change_notification'),(35,'Can delete notification',9,'delete_notification'),(36,'Can view notification',9,'view_notification'),(37,'Can add item transfer',10,'add_itemtransfer'),(38,'Can change item transfer',10,'change_itemtransfer'),(39,'Can delete item transfer',10,'delete_itemtransfer'),(40,'Can view item transfer',10,'view_itemtransfer'),(41,'Can add recipe item',11,'add_recipeitem'),(42,'Can change recipe item',11,'change_recipeitem'),(43,'Can delete recipe item',11,'delete_recipeitem'),(44,'Can view recipe item',11,'view_recipeitem'),(45,'Can add dish',12,'add_dish'),(46,'Can change dish',12,'change_dish'),(47,'Can delete dish',12,'delete_dish'),(48,'Can view dish',12,'view_dish'),(49,'Can add dish recipe',13,'add_dishrecipe'),(50,'Can change dish recipe',13,'change_dishrecipe'),(51,'Can delete dish recipe',13,'delete_dishrecipe'),(52,'Can view dish recipe',13,'view_dishrecipe'),(53,'Can add dish item',14,'add_dishitem'),(54,'Can change dish item',14,'change_dishitem'),(55,'Can delete dish item',14,'delete_dishitem'),(56,'Can view dish item',14,'view_dishitem'),(57,'Can add daily menu',15,'add_dailymenu'),(58,'Can change daily menu',15,'change_dailymenu'),(59,'Can delete daily menu',15,'delete_dailymenu'),(60,'Can view daily menu',15,'view_dailymenu'),(61,'Can add order',16,'add_order'),(62,'Can change order',16,'change_order'),(63,'Can delete order',16,'delete_order'),(64,'Can view order',16,'view_order'),(65,'Can add purchase',17,'add_purchase'),(66,'Can change purchase',17,'change_purchase'),(67,'Can delete purchase',17,'delete_purchase'),(68,'Can view purchase',17,'view_purchase');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_hmsrest_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_hmsrest_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `hmsrest_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'hmsrest','customuser'),(15,'hmsrest','dailymenu'),(12,'hmsrest','dish'),(14,'hmsrest','dishitem'),(13,'hmsrest','dishrecipe'),(7,'hmsrest','item'),(10,'hmsrest','itemtransfer'),(9,'hmsrest','notification'),(16,'hmsrest','order'),(17,'hmsrest','purchase'),(8,'hmsrest','recipe'),(11,'hmsrest','recipeitem'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-11-09 07:34:16.938294'),(2,'contenttypes','0002_remove_content_type_name','2023-11-09 07:34:16.981648'),(3,'auth','0001_initial','2023-11-09 07:34:17.141574'),(4,'auth','0002_alter_permission_name_max_length','2023-11-09 07:34:17.182099'),(5,'auth','0003_alter_user_email_max_length','2023-11-09 07:34:17.185088'),(6,'auth','0004_alter_user_username_opts','2023-11-09 07:34:17.194598'),(7,'auth','0005_alter_user_last_login_null','2023-11-09 07:34:17.199628'),(8,'auth','0006_require_contenttypes_0002','2023-11-09 07:34:17.199628'),(9,'auth','0007_alter_validators_add_error_messages','2023-11-09 07:34:17.211837'),(10,'auth','0008_alter_user_username_max_length','2023-11-09 07:34:17.214485'),(11,'auth','0009_alter_user_last_name_max_length','2023-11-09 07:34:17.214485'),(12,'auth','0010_alter_group_name_max_length','2023-11-09 07:34:17.227446'),(13,'auth','0011_update_proxy_permissions','2023-11-09 07:34:17.243807'),(14,'auth','0012_alter_user_first_name_max_length','2023-11-09 07:34:17.243807'),(15,'hmsrest','0001_initial','2023-11-09 07:34:18.372218'),(16,'admin','0001_initial','2023-11-09 07:34:18.469798'),(17,'admin','0002_logentry_remove_auto_add','2023-11-09 07:34:18.484278'),(18,'admin','0003_logentry_add_action_flag_choices','2023-11-09 07:34:18.497788'),(19,'hmsrest','0002_rename_recipeitem_recipeitems','2023-11-09 07:34:18.545073'),(20,'hmsrest','0003_recipeitem_delete_recipeitems_alter_recipe_items','2023-11-09 07:34:18.644644'),(21,'hmsrest','0004_remove_dish_items_remove_dish_recipes_and_more','2023-11-09 07:34:18.866101'),(22,'hmsrest','0005_dish_dishrecipe_dishitem_dish_items_dish_recipes','2023-11-09 07:34:19.021209'),(23,'hmsrest','0006_dailymenu','2023-11-09 07:34:19.128793'),(24,'hmsrest','0007_delete_dailymenu','2023-11-09 07:34:19.148593'),(25,'hmsrest','0008_dailymenu','2023-11-09 07:34:19.254294'),(26,'hmsrest','0009_remove_dailymenu_name','2023-11-09 07:34:19.271199'),(27,'hmsrest','0010_order','2023-11-09 07:34:19.283988'),(28,'hmsrest','0011_delete_order','2023-11-09 07:34:19.298217'),(29,'hmsrest','0012_order','2023-11-09 07:34:19.309786'),(30,'hmsrest','0013_alter_order_status','2023-11-09 07:34:19.318717'),(31,'hmsrest','0014_alter_order_status','2023-11-09 07:34:19.325154'),(32,'hmsrest','0015_purchase_remove_item_purchase_time_item_category_and_more','2023-11-09 07:34:19.481852'),(33,'hmsrest','0016_dish_service_charge_percentage_dish_tax_percentage_and_more','2023-11-09 07:34:19.718171'),(34,'hmsrest','0017_alter_itemtransfer_transfer_date','2023-11-09 07:34:19.741254'),(35,'hmsrest','0018_remove_dish_service_charge_percentage_and_more','2023-11-09 07:34:19.798000'),(36,'hmsrest','0019_notification_date','2023-11-09 07:34:19.828601'),(37,'hmsrest','0020_alter_notification_date','2023-11-09 07:34:19.844636'),(38,'hmsrest','0021_alter_item_price_alter_item_quantity_and_more','2023-11-09 07:34:19.983205'),(39,'hmsrest','0022_alter_item_price_alter_item_quantity_and_more','2023-11-09 07:34:20.100338'),(40,'hmsrest','0023_remove_item_quantity_remove_item_threshold_and_more','2023-11-09 07:34:20.151088'),(41,'hmsrest','0024_item_quantity_item_threshold_purchase_quantity_and_more','2023-11-09 07:34:20.262924'),(42,'hmsrest','0025_alter_item_quantity_alter_item_threshold','2023-11-09 07:34:20.336890'),(43,'hmsrest','0026_alter_item_quantity_alter_item_threshold','2023-11-09 07:34:20.465262'),(44,'hmsrest','0027_alter_item_quantity_alter_item_threshold_and_more','2023-11-09 07:34:20.610974'),(45,'sessions','0001_initial','2023-11-09 07:34:20.640002'),(46,'hmsrest','0028_alter_item_price_alter_item_quantity_and_more','2023-11-09 07:40:49.171829'),(47,'hmsrest','0029_alter_notification_amount','2023-11-09 07:55:17.094979'),(48,'hmsrest','0030_alter_dishitem_quantity_alter_dishrecipe_quantity_and_more','2023-11-14 05:56:07.131989'),(49,'hmsrest','0031_rename_totalcost_dish_totalprice','2023-11-14 06:00:28.962136'),(50,'hmsrest','0032_dish_category_order_service_charge_order_subtotal_and_more','2023-11-24 07:31:12.455353');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_customuser`
--

DROP TABLE IF EXISTS `hmsrest_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_customuser`
--

LOCK TABLES `hmsrest_customuser` WRITE;
/*!40000 ALTER TABLE `hmsrest_customuser` DISABLE KEYS */;
INSERT INTO `hmsrest_customuser` VALUES (1,'pbkdf2_sha256$600000$hH36W4EbAEXfsEAsLpFlmC$lGTCvOUFqiaGLxHHDjj6ZanyhbR1xDoXSziiCT5zaxU=',NULL,0,'tsinat1','','','',0,1,'2023-11-09 07:42:07.383646','purchaser'),(2,'pbkdf2_sha256$600000$sNd1qq78JQHqjl8A64Ez9j$1G8a3kVqxJJvL5UNFlHkQUYUv+TAE1K+TOGrbDMFAuA=',NULL,0,'tsinat2','','','',0,1,'2023-11-09 07:42:24.314586','storeKeeper'),(3,'pbkdf2_sha256$600000$ZEA0YbRjXfqz2y1QxkcTi2$+xH98VdLWyEVrMyG0OjsG6sB8yghwBwZUTSXliASa/k=',NULL,0,'tsinat3','','','',0,1,'2023-11-09 07:42:38.142598','cheff'),(4,'pbkdf2_sha256$600000$SvGxkVBuUrQucj0ljFUHY0$4BNVJyLBTNaVzxbjJdWxmZN8B4OYXRLDetnfQdx1Hj0=',NULL,0,'tsinat4','','','',0,1,'2023-11-09 07:42:51.023027','cashier'),(5,'pbkdf2_sha256$600000$WsdsGQs13kp9fMcLNNhxRr$tWNdMWJ4MY/XrOEEw+d/2IecudvbfpkaViaks+lhVE8=',NULL,0,'tsinat5','','','',0,1,'2023-11-09 07:43:03.600937','admin'),(6,'pbkdf2_sha256$600000$0xr27ixnrPWn2AdVuSzOp1$R3kCh/O2j1y5unXJrVkMtI43qNkvjMURrU5e+YxxBPY=',NULL,0,'taem','','','',0,1,'2024-01-20 20:55:05.424046','admin');
/*!40000 ALTER TABLE `hmsrest_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_customuser_groups`
--

DROP TABLE IF EXISTS `hmsrest_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hmsrest_customuser_groups_customuser_id_group_id_6bcb499d_uniq` (`customuser_id`,`group_id`),
  KEY `hmsrest_customuser_groups_group_id_7d63c9f6_fk_auth_group_id` (`group_id`),
  CONSTRAINT `hmsrest_customuser_g_customuser_id_b0ba6ee6_fk_hmsrest_c` FOREIGN KEY (`customuser_id`) REFERENCES `hmsrest_customuser` (`id`),
  CONSTRAINT `hmsrest_customuser_groups_group_id_7d63c9f6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_customuser_groups`
--

LOCK TABLES `hmsrest_customuser_groups` WRITE;
/*!40000 ALTER TABLE `hmsrest_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `hmsrest_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_customuser_user_permissions`
--

DROP TABLE IF EXISTS `hmsrest_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hmsrest_customuser_user__customuser_id_permission_b260c215_uniq` (`customuser_id`,`permission_id`),
  KEY `hmsrest_customuser_u_permission_id_b24ad94f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `hmsrest_customuser_u_customuser_id_bae296f6_fk_hmsrest_c` FOREIGN KEY (`customuser_id`) REFERENCES `hmsrest_customuser` (`id`),
  CONSTRAINT `hmsrest_customuser_u_permission_id_b24ad94f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_customuser_user_permissions`
--

LOCK TABLES `hmsrest_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `hmsrest_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `hmsrest_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_dailymenu`
--

DROP TABLE IF EXISTS `hmsrest_dailymenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_dailymenu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu_type` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_dailymenu`
--

LOCK TABLES `hmsrest_dailymenu` WRITE;
/*!40000 ALTER TABLE `hmsrest_dailymenu` DISABLE KEYS */;
INSERT INTO `hmsrest_dailymenu` VALUES (1,'lunch','rare','2023-11-10'),(2,'lunch','notmuch','2023-11-16');
/*!40000 ALTER TABLE `hmsrest_dailymenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_dailymenu_dishes`
--

DROP TABLE IF EXISTS `hmsrest_dailymenu_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_dailymenu_dishes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dailymenu_id` bigint NOT NULL,
  `dish_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hmsrest_dailymenu_dishes_dailymenu_id_dish_id_fa9e880e_uniq` (`dailymenu_id`,`dish_id`),
  KEY `hmsrest_dailymenu_dishes_dish_id_ed3d0c2a_fk_hmsrest_dish_id` (`dish_id`),
  CONSTRAINT `hmsrest_dailymenu_di_dailymenu_id_58f2928a_fk_hmsrest_d` FOREIGN KEY (`dailymenu_id`) REFERENCES `hmsrest_dailymenu` (`id`),
  CONSTRAINT `hmsrest_dailymenu_dishes_dish_id_ed3d0c2a_fk_hmsrest_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `hmsrest_dish` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_dailymenu_dishes`
--

LOCK TABLES `hmsrest_dailymenu_dishes` WRITE;
/*!40000 ALTER TABLE `hmsrest_dailymenu_dishes` DISABLE KEYS */;
INSERT INTO `hmsrest_dailymenu_dishes` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,4),(5,2,5),(6,2,6);
/*!40000 ALTER TABLE `hmsrest_dailymenu_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_dish`
--

DROP TABLE IF EXISTS `hmsrest_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_dish` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `theoretical_quantity` int unsigned DEFAULT NULL,
  `error_margin` decimal(5,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `totalprice` decimal(10,2) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `hmsrest_dish_chk_1` CHECK ((`theoretical_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_dish`
--

LOCK TABLES `hmsrest_dish` WRITE;
/*!40000 ALTER TABLE `hmsrest_dish` DISABLE KEYS */;
INSERT INTO `hmsrest_dish` VALUES (1,'Spaghetti Bolognese',106.00,2,0.00,200.00,134.09,'main_course'),(2,'Chicken Alfredo Pasta',52.00,11,0.00,200.00,65.78,'main_course'),(3,'Chicken Stir-Fry',257.80,23,0.00,200.00,253.00,'main_course'),(4,'Caprese Salad',113.70,32,0.00,200.00,253.00,'main_course'),(5,'Margherita Pizza',137.00,502,0.00,200.00,253.00,'main_course'),(6,'Chicken Alfredo',80.00,301,0.00,150.00,189.75,'main_course'),(7,'shiro',126.00,2,0.00,170.00,215.05,'main_course'),(8,'macarooni',106.00,2,0.00,150.00,189.75,'main_course'),(9,'macaroni2',106.00,2,0.00,170.00,215.05,'main_course'),(10,'ater2',126.00,2,0.00,200.00,253.00,'main_course');
/*!40000 ALTER TABLE `hmsrest_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_dishitem`
--

DROP TABLE IF EXISTS `hmsrest_dishitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_dishitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `dish_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmsrest_dishitem_dish_id_1ba993d3_fk_hmsrest_dish_id` (`dish_id`),
  KEY `hmsrest_dishitem_item_id_73d23f8e_fk_hmsrest_item_id` (`item_id`),
  CONSTRAINT `hmsrest_dishitem_dish_id_1ba993d3_fk_hmsrest_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `hmsrest_dish` (`id`),
  CONSTRAINT `hmsrest_dishitem_item_id_73d23f8e_fk_hmsrest_item_id` FOREIGN KEY (`item_id`) REFERENCES `hmsrest_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_dishitem`
--

LOCK TABLES `hmsrest_dishitem` WRITE;
/*!40000 ALTER TABLE `hmsrest_dishitem` DISABLE KEYS */;
INSERT INTO `hmsrest_dishitem` VALUES (1,1.000,1,13),(14,1.000,2,13),(15,10.000,2,6),(16,1000000.000,3,16),(17,1.000,3,17),(18,20.000,3,18),(19,10.000,4,1),(20,20.000,4,15),(21,500.000,5,26),(22,300.000,6,29),(23,1000.000,7,37),(24,1000.000,8,36),(25,1000.000,9,36),(26,1000.000,10,37);
/*!40000 ALTER TABLE `hmsrest_dishitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_dishrecipe`
--

DROP TABLE IF EXISTS `hmsrest_dishrecipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_dishrecipe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `dish_id` bigint NOT NULL,
  `recipe_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmsrest_dishrecipe_dish_id_6c8cb7fc_fk_hmsrest_dish_id` (`dish_id`),
  KEY `hmsrest_dishrecipe_recipe_id_97a9f1bb_fk_hmsrest_recipe_id` (`recipe_id`),
  CONSTRAINT `hmsrest_dishrecipe_dish_id_6c8cb7fc_fk_hmsrest_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `hmsrest_dish` (`id`),
  CONSTRAINT `hmsrest_dishrecipe_recipe_id_97a9f1bb_fk_hmsrest_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `hmsrest_recipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_dishrecipe`
--

LOCK TABLES `hmsrest_dishrecipe` WRITE;
/*!40000 ALTER TABLE `hmsrest_dishrecipe` DISABLE KEYS */;
INSERT INTO `hmsrest_dishrecipe` VALUES (1,1.000,1,1),(2,1.000,3,1),(3,2.000,4,1),(4,1.000,5,1),(5,1.000,5,2),(6,1.000,6,2),(7,1.000,7,1),(8,1.000,8,1),(9,1.000,9,2),(10,1.000,10,1);
/*!40000 ALTER TABLE `hmsrest_dishrecipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_item`
--

DROP TABLE IF EXISTS `hmsrest_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `expiration_date` date NOT NULL,
  `category` varchar(255) NOT NULL,
  `quantity` decimal(10,3) NOT NULL,
  `threshold` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_item`
--

LOCK TABLES `hmsrest_item` WRITE;
/*!40000 ALTER TABLE `hmsrest_item` DISABLE KEYS */;
INSERT INTO `hmsrest_item` VALUES (1,'cheese',0.010,'2023-11-22','solid',0.000,5.000),(2,'Milk',150.000,'2023-11-16','liquid',30.000,10.000),(3,'Apples',0.300,'2023-11-30','solid',50000.000,5.000),(4,'Orange Juice',200.000,'2023-11-23','liquid',0.000,1.000),(5,'Flour',0.100,'2023-11-30','solid',89000.000,10.000),(6,'Butter',0.200,'2023-11-23','solid',47000.000,10.000),(7,'Eggs',10.000,'2023-11-23','countable',250.000,10.000),(8,'Sugar',0.040,'2023-11-16','solid',87000.000,10.000),(9,'Yogurt',100.000,'2023-11-30','liquid',20.000,10.000),(10,'Raspberries',0.100,'2023-11-30','solid',36999.000,10.000),(11,'Blueberries',0.300,'2023-12-02','solid',40000.000,10.000),(12,'Parmesan Cheese',0.060,'2023-12-09','solid',50000.000,1000.000),(13,'Pasta',50.000,'2023-12-09','countable',19.000,10.000),(14,'Strawberries',0.300,'2023-11-22','solid',47000.000,10.000),(15,'tomato',0.080,'2023-12-06','solid',30000.000,5.000),(16,'chicken breasts',0.100,'2023-11-23','solid',20000.000,5.000),(17,'soy sauce',100.000,'2023-12-09','countable',20.000,5.000),(18,'cornstarch',0.090,'2023-11-30','solid',30000.000,4.000),(19,'vegetable oil',90.000,'2023-11-23','liquid',20.000,5.000),(20,'pepper',0.020,'2024-02-10','solid',50000.000,0.000),(21,'onion',100.000,'2024-02-10','solid',0.000,0.000),(22,'broccoli',0.080,'2023-12-01','solid',10000.000,1.000),(23,'Garlic',0.100,'2023-12-09','solid',50000.000,5000.000),(24,'grated ginger',0.080,'2023-12-09','solid',10000.000,2.000),(25,'rice',0.080,'2023-12-06','solid',10000.000,4.000),(26,'Pizza Dough',0.050,'2023-07-08','solid',99000.000,5000.000),(27,'Mozzarella Cheese',0.100,'2023-11-22','solid',49000.000,5000.000),(28,'Basil Leaves',0.090,'2023-12-01','solid',49000.000,4000.000),(29,'Fettuccine',0.080,'2023-12-09','solid',49000.000,3000.000),(30,'Cream',0.070,'2023-12-09','solid',44000.000,2000.000),(31,'Anchovy',100.000,'2023-11-30','solid',0.000,5.000),(32,'Mayonnaise',100.000,'2023-11-30','liquid',30.000,5.000),(33,'Croutons',100.000,'2023-12-08','solid',0.000,5.000),(34,'Chicken Breast',100.000,'2023-12-01','countable',20.000,5.000),(35,'carrot',0.040,'2023-11-30','solid',4000.000,5000.000),(36,'macarooni',0.050,'2024-02-10','solid',80000.000,0.000),(37,'ater',0.070,'2024-02-10','solid',80000.000,0.000),(38,'salad',100.000,'2024-08-25','countable',0.000,5.000);
/*!40000 ALTER TABLE `hmsrest_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_itemtransfer`
--

DROP TABLE IF EXISTS `hmsrest_itemtransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_itemtransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `items` json NOT NULL,
  `status` varchar(10) NOT NULL,
  `grant_user_id` bigint NOT NULL,
  `request_user_id` bigint NOT NULL,
  `transfer_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmsrest_itemtransfer_grant_user_id_b504a866_fk_hmsrest_c` (`grant_user_id`),
  KEY `hmsrest_itemtransfer_request_user_id_03dac034_fk_hmsrest_c` (`request_user_id`),
  CONSTRAINT `hmsrest_itemtransfer_grant_user_id_b504a866_fk_hmsrest_c` FOREIGN KEY (`grant_user_id`) REFERENCES `hmsrest_customuser` (`id`),
  CONSTRAINT `hmsrest_itemtransfer_request_user_id_03dac034_fk_hmsrest_c` FOREIGN KEY (`request_user_id`) REFERENCES `hmsrest_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_itemtransfer`
--

LOCK TABLES `hmsrest_itemtransfer` WRITE;
/*!40000 ALTER TABLE `hmsrest_itemtransfer` DISABLE KEYS */;
INSERT INTO `hmsrest_itemtransfer` VALUES (1,'[{\"name\": \"cheese\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"5\"}, {\"name\": \"Milk\", \"unit\": \"l\", \"status\": \"approved\", \"category\": \"liquid\", \"quantity\": \"5\"}, {\"name\": \"Flour\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"10\"}, {\"name\": \"Raspberries\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"3\"}, {\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"20\"}, {\"name\": \"Strawberries\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"3\"}, {\"name\": \"Butter\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"2\"}, {\"name\": \"Eggs\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"50\"}]','pending',2,3,'2023-11-10 08:56:43.668039'),(2,'[{\"name\": \"Sugar\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"10\"}, {\"name\": \"Orange Juice\", \"unit\": \"l\", \"status\": \"approved\", \"category\": \"liquid\", \"quantity\": \"10\"}]','pending',2,3,'2023-11-10 09:09:04.410740'),(3,'[{\"name\": \"Flour\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-10 09:09:43.236709'),(4,'[{\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-10 09:11:52.001498'),(5,'[{\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-10 11:42:07.726677'),(6,'[{\"name\": \"Sugar\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-10 11:44:17.624842'),(7,'[{\"name\": \"Sugar\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-10 11:52:07.559117'),(8,'[{\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-11 11:08:56.921510'),(9,'[{\"name\": \"Sugar\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}]','pending',1,3,'2023-11-12 08:46:06.698723'),(10,'[{\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',1,3,'2023-11-12 08:52:37.195164'),(11,'[{\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',1,3,'2023-11-12 08:53:29.175591'),(12,'[{\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-12 08:56:35.781565'),(13,'[{\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-12 09:03:34.262328'),(14,'[{\"name\": \"Raspberries\", \"unit\": \"g\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}, {\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"1\"}]','pending',2,3,'2023-11-15 18:02:38.460936'),(15,'[{\"name\": \"Cream\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}, {\"name\": \"Fettuccine\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}, {\"name\": \"Basil Leaves\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}, {\"name\": \"Mozzarella Cheese\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}, {\"name\": \"Pizza Dough\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}, {\"name\": \"Butter\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"1\"}, {\"name\": \"Pasta\", \"unit\": \"count\", \"status\": \"approved\", \"category\": \"countable\", \"quantity\": \"10\"}]','pending',2,3,'2023-11-16 08:33:46.668291'),(16,'[{\"name\": \"Chicken Breast\", \"unit\": \"count\", \"status\": \"rejected\", \"category\": \"countable\", \"quantity\": \"5\"}, {\"name\": \"Croutons\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"5\"}, {\"name\": \"Mayonnaise\", \"unit\": \"L\", \"status\": \"approved\", \"category\": \"liquid\", \"quantity\": \"5\"}, {\"name\": \"Anchovy\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"5\"}, {\"name\": \"Cream\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"5\"}]','pending',2,3,'2023-11-18 07:50:27.780139'),(17,'[{\"name\": \"macarooni\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"10\"}, {\"name\": \"ater\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"10\"}]','pending',2,3,'2024-01-19 06:03:35.251424'),(18,'[{\"name\": \"carrot\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"36\"}, {\"name\": \"ater\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"10\"}, {\"name\": \"macarooni\", \"unit\": \"kg\", \"status\": \"approved\", \"category\": \"solid\", \"quantity\": \"10\"}]','pending',2,3,'2024-01-21 09:18:17.491367');
/*!40000 ALTER TABLE `hmsrest_itemtransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_notification`
--

DROP TABLE IF EXISTS `hmsrest_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned NOT NULL,
  `chanegdEntityName` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `entity_type_id` int NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmsrest_notification_entity_type_id_3bb2d255_fk_django_co` (`entity_type_id`),
  CONSTRAINT `hmsrest_notification_entity_type_id_3bb2d255_fk_django_co` FOREIGN KEY (`entity_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `hmsrest_notification_chk_1` CHECK ((`entity_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_notification`
--

LOCK TABLES `hmsrest_notification` WRITE;
/*!40000 ALTER TABLE `hmsrest_notification` DISABLE KEYS */;
INSERT INTO `hmsrest_notification` VALUES (1,2,'milk','created',100.000,0,7,'2023-11-09 07:59:35.333444'),(2,1,'cheese','created',50.000,0,7,'2023-11-09 07:59:35.436254'),(3,1,'cheese','deducted',100000.000,1,7,'2023-11-09 08:06:03.590631'),(4,2,'milk','deducted',100.000,1,7,'2023-11-09 08:20:42.174043'),(5,3,'Apples','added',50000.000,1,7,'2023-11-09 09:01:56.642450'),(6,4,'Orange Juice','added',20.000,1,7,'2023-11-09 09:01:56.759264'),(7,4,'Orange Juice','deducted',20.000,1,7,'2023-11-09 09:05:23.764877'),(8,5,'Flour','added',100000.000,1,7,'2023-11-10 08:46:47.485521'),(9,6,'Butter','added',50000.000,1,7,'2023-11-10 08:46:47.599144'),(10,2,'Milk','added',30.000,1,7,'2023-11-10 08:46:47.699618'),(11,7,'Eggs','added',300.000,1,7,'2023-11-10 08:46:47.806671'),(12,8,'Sugar','added',100000.000,1,7,'2023-11-10 08:46:47.908555'),(13,9,'Yogurt','added',20.000,1,7,'2023-11-10 08:46:48.025093'),(14,10,'Raspberries','added',40000.000,1,7,'2023-11-10 08:46:48.125617'),(15,11,'Blueberries','added',40000.000,1,7,'2023-11-10 08:46:48.233293'),(16,12,'Parmesan Cheese','added',40000.000,1,7,'2023-11-10 08:46:48.345339'),(17,13,'Pasta','added',60.000,1,7,'2023-11-10 08:46:48.425673'),(18,14,'Strawberries','added',50000.000,1,7,'2023-11-10 08:46:48.508274'),(19,15,'tomato','added',30000.000,1,7,'2023-11-10 12:01:44.115253'),(20,12,'Transfer 12','itemtransfer',1.000,1,10,'2023-11-12 08:56:35.805683'),(21,13,'Transfer 13','itemtransfer',1.000,1,10,'2023-11-12 09:03:34.311241'),(22,16,'chicken breasts','added',20000.000,1,7,'2023-11-14 06:32:07.398500'),(23,17,'soy sauce','added',20.000,1,7,'2023-11-14 06:32:07.477588'),(24,18,'cornstarch','added',30000.000,1,7,'2023-11-14 06:32:07.527747'),(25,19,'vegetable oil','added',20.000,1,7,'2023-11-14 06:32:07.589379'),(26,20,'pepper','added',10000.000,1,7,'2023-11-14 06:32:07.668100'),(27,21,'onion','added',30000.000,1,7,'2023-11-14 06:32:07.762039'),(28,22,'broccoli','added',10000.000,1,7,'2023-11-14 06:32:07.871973'),(29,23,'garlic','added',10000.000,1,7,'2023-11-14 06:32:07.981820'),(30,24,'grated ginger','added',10000.000,1,7,'2023-11-14 06:32:08.092337'),(31,25,'rice','added',10000.000,1,7,'2023-11-14 06:32:08.202358'),(32,14,'Transfer 14','itemtransfer',2.000,1,10,'2023-11-15 18:02:38.489640'),(33,26,'Pizza Dough','added',100000.000,1,7,'2023-11-16 08:22:49.870730'),(34,27,'Mozzarella Cheese','added',50000.000,1,7,'2023-11-16 08:22:49.947019'),(35,28,'Basil Leaves','added',50000.000,1,7,'2023-11-16 08:22:50.011772'),(36,29,'Fettuccine','added',50000.000,1,7,'2023-11-16 08:22:50.089969'),(37,30,'Cream','added',50000.000,1,7,'2023-11-16 08:22:50.186713'),(38,12,'Parmesan Cheese','added',50000.000,1,7,'2023-11-16 08:22:50.281186'),(39,15,'Transfer 15','itemtransfer',7.000,1,10,'2023-11-16 08:33:46.678414'),(40,23,'Garlic','added',50000.000,1,7,'2023-11-18 07:47:09.965365'),(41,31,'Anchovy','added',30.000,1,7,'2023-11-18 07:47:10.106875'),(42,32,'Mayonnaise','added',30.000,1,7,'2023-11-18 07:47:10.263981'),(43,33,'Croutons','added',50.000,1,7,'2023-11-18 07:47:10.431442'),(44,34,'Chicken Breast','added',20.000,1,7,'2023-11-18 07:47:10.564486'),(45,33,'Croutons','deducted',50.000,1,7,'2023-11-18 07:47:49.709747'),(46,16,'Transfer 16','itemtransfer',5.000,1,10,'2023-11-18 07:50:27.780139'),(47,35,'carrot','added',40000.000,1,7,'2023-11-20 07:19:10.331918'),(48,36,'macarooni','added',100000.000,1,7,'2024-01-19 05:32:49.988992'),(49,37,'ater','added',100000.000,1,7,'2024-01-19 05:32:50.083210'),(50,17,'Transfer 17','itemtransfer',2.000,1,10,'2024-01-19 06:03:35.256449'),(51,20,'pepper','added',50000.000,1,7,'2024-01-21 09:06:48.693046'),(52,21,'onion','added',50.000,1,7,'2024-01-21 09:06:48.758660'),(53,21,'onion','deducted',50.000,1,7,'2024-01-21 09:08:39.540160'),(54,18,'Transfer 18','itemtransfer',3.000,1,10,'2024-01-21 09:18:17.511856'),(55,38,'salad','added',20.000,1,7,'2024-08-24 05:52:11.059932'),(56,38,'salad','added',20.000,1,7,'2024-08-24 05:54:20.894643'),(57,38,'salad','deducted',20.000,0,7,'2024-08-24 05:54:32.669975');
/*!40000 ALTER TABLE `hmsrest_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_notification_recipient_user`
--

DROP TABLE IF EXISTS `hmsrest_notification_recipient_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_notification_recipient_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `customuser_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hmsrest_notification_rec_notification_id_customus_cfdfde24_uniq` (`notification_id`,`customuser_id`),
  KEY `hmsrest_notification_customuser_id_e2e04cea_fk_hmsrest_c` (`customuser_id`),
  CONSTRAINT `hmsrest_notification_customuser_id_e2e04cea_fk_hmsrest_c` FOREIGN KEY (`customuser_id`) REFERENCES `hmsrest_customuser` (`id`),
  CONSTRAINT `hmsrest_notification_notification_id_96b367e0_fk_hmsrest_n` FOREIGN KEY (`notification_id`) REFERENCES `hmsrest_notification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_notification_recipient_user`
--

LOCK TABLES `hmsrest_notification_recipient_user` WRITE;
/*!40000 ALTER TABLE `hmsrest_notification_recipient_user` DISABLE KEYS */;
INSERT INTO `hmsrest_notification_recipient_user` VALUES (1,1,2),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2),(20,20,2),(21,21,2),(22,22,2),(23,23,2),(24,24,2),(25,25,2),(26,26,2),(27,27,2),(28,28,2),(29,29,2),(30,30,2),(31,31,2),(32,32,2),(33,33,2),(34,34,2),(35,35,2),(36,36,2),(37,37,2),(38,38,2),(39,39,2),(40,40,2),(41,41,2),(42,42,2),(43,43,2),(44,44,2),(45,45,2),(46,46,2),(47,47,2),(48,48,2),(49,49,2),(50,50,2),(51,51,2),(52,52,2),(53,53,2),(54,54,2),(55,55,2),(56,56,2),(57,57,2);
/*!40000 ALTER TABLE `hmsrest_notification_recipient_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_order`
--

DROP TABLE IF EXISTS `hmsrest_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `time` datetime(6) NOT NULL,
  `tableNumber` int NOT NULL,
  `status` varchar(10) NOT NULL,
  `items` json NOT NULL,
  `service_charge` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderId` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_order`
--

LOCK TABLES `hmsrest_order` WRITE;
/*!40000 ALTER TABLE `hmsrest_order` DISABLE KEYS */;
INSERT INTO `hmsrest_order` VALUES (1,1,'2023-11-10 14:03:42.730077',1,'paid','[{\"id\": 1, \"name\": \"Spaghetti Bolognese\", \"price\": \"200.00\", \"quantity\": 1}]',30.00,200.00,20.00,250.00),(2,2,'2023-11-16 09:16:35.755148',1,'paid','[{\"id\": 1, \"name\": \"Spaghetti Bolognese\", \"price\": \"200.00\", \"quantity\": 1}, {\"id\": 4, \"name\": \"Caprese Salad\", \"price\": \"200.00\", \"quantity\": 1}, {\"id\": 5, \"name\": \"Margherita Pizza\", \"price\": \"200.00\", \"quantity\": 1}, {\"id\": 6, \"name\": \"Chicken Alfredo\", \"price\": \"150.00\", \"quantity\": 1}]',112.50,750.00,75.00,937.00),(3,3,'2023-11-18 07:57:07.307580',2,'paid','[{\"id\": 4, \"name\": \"Caprese Salad\", \"price\": \"200.00\", \"quantity\": 3}]',30.00,200.00,20.00,250.00),(4,4,'2023-11-24 10:53:35.579248',1,'paid','[{\"id\": 1, \"cost\": \"106.00\", \"name\": \"Spaghetti Bolognese\", \"items\": [{\"item\": {\"id\": 13, \"name\": \"Pasta\", \"price\": \"50.000\", \"category\": \"countable\"}, \"quantity\": \"1.000\"}], \"price\": 200, \"recipes\": [{\"recipe\": {\"id\": 1, \"cost\": \"56.00\", \"name\": \"Tomato Sauce\", \"items\": [{\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 400}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"134.09\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 2}, {\"id\": 2, \"cost\": \"52.00\", \"name\": \"Chicken Alfredo Pasta\", \"items\": [{\"item\": {\"id\": 13, \"name\": \"Pasta\", \"price\": \"50.000\", \"category\": \"countable\"}, \"quantity\": \"1.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"quantity\": \"10.000\"}], \"price\": 200, \"recipes\": [], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"65.78\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 11}]',0.00,400.00,40.00,440.00),(5,5,'2023-11-24 10:59:40.222591',2,'pending','[{\"id\": 5, \"cost\": \"137.00\", \"name\": \"Margherita Pizza\", \"items\": [{\"item\": {\"id\": 26, \"name\": \"Pizza Dough\", \"price\": \"0.050\", \"category\": \"solid\"}, \"quantity\": \"500.000\"}], \"price\": 200, \"recipes\": [{\"recipe\": {\"id\": 1, \"cost\": \"56.00\", \"name\": \"Tomato Sauce\", \"items\": [{\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 400}, \"quantity\": \"1.000\"}, {\"recipe\": {\"id\": 2, \"cost\": \"19.00\", \"name\": \"Alfredo Sauce\", \"items\": [{\"item\": {\"id\": 12, \"name\": \"Parmesan Cheese\", \"price\": \"0.060\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 300}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"253.00\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 502}, {\"id\": 6, \"cost\": \"80.00\", \"name\": \"Chicken Alfredo\", \"items\": [{\"item\": {\"id\": 29, \"name\": \"Fettuccine\", \"price\": \"0.080\", \"category\": \"solid\"}, \"quantity\": \"300.000\"}], \"price\": 150, \"recipes\": [{\"recipe\": {\"id\": 2, \"cost\": \"19.00\", \"name\": \"Alfredo Sauce\", \"items\": [{\"item\": {\"id\": 12, \"name\": \"Parmesan Cheese\", \"price\": \"0.060\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 300}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"189.75\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 301}]',0.00,350.00,35.00,385.00),(6,6,'2023-11-24 11:13:07.740781',1,'paid','[{\"id\": 1, \"cost\": \"106.00\", \"name\": \"Spaghetti Bolognese\", \"items\": [{\"item\": {\"id\": 13, \"name\": \"Pasta\", \"price\": \"50.000\", \"category\": \"countable\"}, \"quantity\": \"1.000\"}], \"price\": 200, \"recipes\": [{\"recipe\": {\"id\": 1, \"cost\": \"56.00\", \"name\": \"Tomato Sauce\", \"items\": [{\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 400}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"134.09\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 2}, {\"id\": 2, \"cost\": \"52.00\", \"name\": \"Chicken Alfredo Pasta\", \"items\": [{\"item\": {\"id\": 13, \"name\": \"Pasta\", \"price\": \"50.000\", \"category\": \"countable\"}, \"quantity\": \"1.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"quantity\": \"10.000\"}], \"price\": 200, \"recipes\": [], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"65.78\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 11}]',0.00,400.00,40.00,440.00),(7,7,'2024-01-19 06:09:06.356059',1,'paid','[{\"id\": 7, \"cost\": \"126.00\", \"name\": \"shiro\", \"items\": [{\"item\": {\"id\": 37, \"name\": \"ater\", \"price\": \"0.070\", \"category\": \"solid\"}, \"quantity\": \"1000.000\"}], \"price\": 170, \"recipes\": [{\"recipe\": {\"id\": 1, \"cost\": \"56.00\", \"name\": \"Tomato Sauce\", \"items\": [{\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 400}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"215.05\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 2}, {\"id\": 8, \"cost\": \"106.00\", \"name\": \"macarooni\", \"items\": [{\"item\": {\"id\": 36, \"name\": \"macarooni\", \"price\": \"0.050\", \"category\": \"solid\"}, \"quantity\": \"1000.000\"}], \"price\": 150, \"recipes\": [{\"recipe\": {\"id\": 1, \"cost\": \"56.00\", \"name\": \"Tomato Sauce\", \"items\": [{\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 400}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"189.75\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 2}]',0.00,320.00,32.00,352.00),(8,8,'2024-01-19 09:06:00.243881',5,'ready','[{\"id\": 4, \"cost\": \"113.70\", \"name\": \"Caprese Salad\", \"items\": [{\"item\": {\"id\": 1, \"name\": \"cheese\", \"price\": \"0.010\", \"category\": \"solid\"}, \"quantity\": \"10.000\"}, {\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"quantity\": \"20.000\"}], \"price\": 200, \"recipes\": [{\"recipe\": {\"id\": 1, \"cost\": \"56.00\", \"name\": \"Tomato Sauce\", \"items\": [{\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 400}, \"quantity\": \"2.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"253.00\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 32}]',0.00,200.00,20.00,220.00),(9,9,'2024-01-21 09:28:43.559697',20,'paid','[{\"id\": 9, \"cost\": \"106.00\", \"name\": \"macaroni2\", \"items\": [{\"item\": {\"id\": 36, \"name\": \"macarooni\", \"price\": \"0.050\", \"category\": \"solid\"}, \"quantity\": \"1000.000\"}], \"price\": 170, \"recipes\": [{\"recipe\": {\"id\": 2, \"cost\": \"19.00\", \"name\": \"Alfredo Sauce\", \"items\": [{\"item\": {\"id\": 12, \"name\": \"Parmesan Cheese\", \"price\": \"0.060\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 300}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"215.05\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 2}, {\"id\": 10, \"cost\": \"126.00\", \"name\": \"ater2\", \"items\": [{\"item\": {\"id\": 37, \"name\": \"ater\", \"price\": \"0.070\", \"category\": \"solid\"}, \"quantity\": \"1000.000\"}], \"price\": 200, \"recipes\": [{\"recipe\": {\"id\": 1, \"cost\": \"56.00\", \"name\": \"Tomato Sauce\", \"items\": [{\"item\": {\"id\": 15, \"name\": \"tomato\", \"price\": \"0.080\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}, {\"item\": {\"id\": 6, \"name\": \"Butter\", \"price\": \"0.200\", \"category\": \"solid\"}, \"used_quantity\": \"200.000\"}], \"error_margin\": \"0.00\", \"theoretical_quantity\": 400}, \"quantity\": \"1.000\"}], \"category\": \"main_course\", \"quantity\": 1, \"totalprice\": \"253.00\", \"error_margin\": \"0.00\", \"theoretical_quantity\": 2}]',0.00,370.00,37.00,407.00);
/*!40000 ALTER TABLE `hmsrest_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_purchase`
--

DROP TABLE IF EXISTS `hmsrest_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_purchase` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vendor` varchar(255) NOT NULL,
  `purchase_date` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmsrest_purchase_item_id_dcf51b73_fk_hmsrest_item_id` (`item_id`),
  CONSTRAINT `hmsrest_purchase_item_id_dcf51b73_fk_hmsrest_item_id` FOREIGN KEY (`item_id`) REFERENCES `hmsrest_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_purchase`
--

LOCK TABLES `hmsrest_purchase` WRITE;
/*!40000 ALTER TABLE `hmsrest_purchase` DISABLE KEYS */;
INSERT INTO `hmsrest_purchase` VALUES (1,'dairyfarm','2023-11-09 07:43:14.640645','rejected',1,100000.000),(2,'dairyfarm','2023-11-09 07:59:35.285275','rejected',2,100.000),(3,'dairyfarm','2023-11-09 07:59:35.415088','approved',1,50.000),(4,'Orchard Farms','2023-11-09 09:01:56.618643','approved',3,50000.000),(5,'Citrus Delights','2023-11-09 09:01:56.730204','rejected',4,20.000),(6,'mart','2023-11-10 08:46:47.434022','approved',5,100000.000),(7,'mart','2023-11-10 08:46:47.567293','approved',6,50000.000),(8,'mart','2023-11-10 08:46:47.675983','approved',2,30.000),(9,'mart','2023-11-10 08:46:47.777525','approved',7,300.000),(10,'mart','2023-11-10 08:46:47.874899','approved',8,100000.000),(11,'mart','2023-11-10 08:46:47.986434','approved',9,20.000),(12,'mart','2023-11-10 08:46:48.091140','approved',10,40000.000),(13,'mart','2023-11-10 08:46:48.204177','approved',11,40000.000),(14,'mart','2023-11-10 08:46:48.308333','approved',12,40000.000),(15,'mart','2023-11-10 08:46:48.404484','approved',13,60.000),(16,'mart','2023-11-10 08:46:48.484182','approved',14,50000.000),(17,'farmyard','2023-11-10 12:01:44.077519','approved',15,30000.000),(18,'farmers','2023-11-14 06:32:07.365957','approved',16,20000.000),(19,'farmers','2023-11-14 06:32:07.450972','approved',17,20.000),(20,'farmers','2023-11-14 06:32:07.512778','approved',18,30000.000),(21,'farmers','2023-11-14 06:32:07.573120','approved',19,20.000),(22,'farmers','2023-11-14 06:32:07.652252','approved',20,10000.000),(23,'farmers','2023-11-14 06:32:07.730632','approved',21,30000.000),(24,'farmers','2023-11-14 06:32:07.840283','approved',22,10000.000),(25,'farmers','2023-11-14 06:32:07.951606','approved',23,10000.000),(26,'farmers','2023-11-14 06:32:08.063486','approved',24,10000.000),(27,'farmers','2023-11-14 06:32:08.171119','approved',25,10000.000),(28,'farma','2023-11-16 08:22:49.836111','approved',26,100000.000),(29,'mert','2023-11-16 08:22:49.935676','approved',27,50000.000),(30,'mert','2023-11-16 08:22:49.994880','approved',28,50000.000),(31,'mert','2023-11-16 08:22:50.074953','approved',29,50000.000),(32,'mert','2023-11-16 08:22:50.158323','approved',30,50000.000),(33,'mert','2023-11-16 08:22:50.250487','approved',12,50000.000),(34,'farmers','2023-11-18 07:47:09.930382','approved',23,50000.000),(35,'merkato','2023-11-18 07:47:10.059988','approved',31,30.000),(36,'merkato','2023-11-18 07:47:10.232720','approved',32,30.000),(37,'markato','2023-11-18 07:47:10.382524','rejected',33,50.000),(38,'merkato','2023-11-18 07:47:10.531737','approved',34,20.000),(39,'kera','2023-11-20 07:19:10.300616','pending',35,40000.000),(40,'merkato','2024-01-19 05:32:49.965527','approved',36,100000.000),(41,'merkato','2024-01-19 05:32:50.066803','approved',37,100000.000),(42,'merkato','2024-01-21 09:06:48.661158','approved',20,50000.000),(43,'merkato','2024-01-21 09:06:48.740944','rejected',21,50.000),(44,'atkilt tera','2024-08-24 05:52:11.028598','approved',38,20.000),(45,'atkilit tera','2024-08-24 05:54:20.863085','rejected',38,20.000);
/*!40000 ALTER TABLE `hmsrest_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_recipe`
--

DROP TABLE IF EXISTS `hmsrest_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_recipe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `error_margin` decimal(5,2) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `theoretical_quantity` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `hmsrest_recipe_chk_1` CHECK ((`theoretical_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_recipe`
--

LOCK TABLES `hmsrest_recipe` WRITE;
/*!40000 ALTER TABLE `hmsrest_recipe` DISABLE KEYS */;
INSERT INTO `hmsrest_recipe` VALUES (1,'Tomato Sauce',0.00,56.00,400),(2,'Alfredo Sauce',0.00,19.00,300),(3,'Alfredo Sauce',0.00,19.00,300),(4,'Alfredo Sauce',0.00,19.00,300);
/*!40000 ALTER TABLE `hmsrest_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmsrest_recipeitem`
--

DROP TABLE IF EXISTS `hmsrest_recipeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hmsrest_recipeitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `used_quantity` decimal(10,3) DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `recipe_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmsrest_recipeitem_item_id_52b3fd69_fk_hmsrest_item_id` (`item_id`),
  KEY `hmsrest_recipeitem_recipe_id_63066c44_fk_hmsrest_recipe_id` (`recipe_id`),
  CONSTRAINT `hmsrest_recipeitem_item_id_52b3fd69_fk_hmsrest_item_id` FOREIGN KEY (`item_id`) REFERENCES `hmsrest_item` (`id`),
  CONSTRAINT `hmsrest_recipeitem_recipe_id_63066c44_fk_hmsrest_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `hmsrest_recipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmsrest_recipeitem`
--

LOCK TABLES `hmsrest_recipeitem` WRITE;
/*!40000 ALTER TABLE `hmsrest_recipeitem` DISABLE KEYS */;
INSERT INTO `hmsrest_recipeitem` VALUES (1,200.000,15,1),(2,200.000,6,1),(3,200.000,12,2),(4,200.000,12,3),(5,200.000,12,4),(6,100.000,30,4);
/*!40000 ALTER TABLE `hmsrest_recipeitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 12:02:28
