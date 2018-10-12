-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: rock-community
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `id` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `permissions` int(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ID` (`id`),
  KEY `ID_2` (`id`),
  KEY `ID_3` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('5b4d5740-cdda-11e8-a50c-054d42488416','574906249@qq.com',1,'520lrj520'),('c45550f0-cba8-11e8-87e3-19208b46a236','linrunjia',1,'520lrj520');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `community` (
  `communityID` varchar(255) NOT NULL,
  `communityTime` varchar(255) NOT NULL,
  `communityUserID` varchar(255) NOT NULL,
  `communityUseYear` varchar(255) NOT NULL,
  `communityUseMonth` varchar(255) NOT NULL,
  `communityUseDay` varchar(255) NOT NULL,
  `communityUseHour` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`communityID`),
  KEY `communityUserID` (`communityUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES ('1f143430-cd47-11e8-b4f7-49f4dee12eb5','2018-10-11 19:16:38.259','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','11','20','fddsf'),('248e9ea0-cd7e-11e8-a7a7-af76b2421f7a','2018-10-12 01:50:29.770','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','22','hahah'),('248e9ea1-cd7e-11e8-a7a7-af76b2421f7a','2018-10-12 01:50:29.770','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','23','hahah'),('24f0faf0-cbb2-11e8-af19-fd4dfa8a3a9c','2018-10-09 18:57:41.919','c45550f0-cba8-11e9-87e3-19208b46a236','2018','10','9','22','已预约'),('39866680-cc66-11e8-a79f-3dcf055154d4','2018-10-10 16:26:45.864','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','10','17','已预约已预约已预约已预约已预约已预约已预约'),('a2037db0-cd47-11e8-a0d3-959b516a7253','2018-10-11 19:20:17.932','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','11','22','123'),('b825fab0-cd73-11e8-a7a7-af76b2421f7a','2018-10-12 00:35:52.923','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','11','贝斯课'),('b825fab1-cd73-11e8-a7a7-af76b2421f7a','2018-10-12 00:35:52.923','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','12','贝斯课'),('da672900-cd7d-11e8-a7a7-af76b2421f7a','2018-10-12 01:48:25.360','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','14','3231'),('da672901-cd7d-11e8-a7a7-af76b2421f7a','2018-10-12 01:48:25.360','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','15','3231'),('dace7420-cd6e-11e8-a7a7-af76b2421f7a','2018-10-12 00:01:03.586','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','9','排练'),('dace7421-cd6e-11e8-a7a7-af76b2421f7a','2018-10-12 00:01:03.586','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','10','排练'),('dc89ed80-cd73-11e8-a7a7-af76b2421f7a','2018-10-12 00:36:53.976','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','13','吉他课'),('dc89ed81-cd73-11e8-a7a7-af76b2421f7a','2018-10-12 00:36:53.976','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','14','吉他课'),('e98c7660-cc65-11e8-a79f-3dcf055154d4','2018-10-10 16:24:31.686','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','9','23','已预约'),('f4f80c30-cd73-11e8-a7a7-af76b2421f7a','2018-10-12 00:37:34.963','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','15','鼓课啊'),('f4f80c31-cd73-11e8-a7a7-af76b2421f7a','2018-10-12 00:37:34.963','c45550f0-cba8-11e8-87e3-19208b46a236','2018','10','12','16','鼓课啊');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `site` (
  `siteID` int(255) NOT NULL AUTO_INCREMENT,
  `siteName` varchar(255) NOT NULL,
  `optionTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionDate` varchar(255) NOT NULL,
  PRIMARY KEY (`siteID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'体育馆排练房','[\'17:00-18:00\',\'18:00-19:00\']','[\'星期一\',\'星期二\',\'星期三\',\'星期四\',\'星期五\',\'星期六\',\'星期日\']');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-12 16:24:17
