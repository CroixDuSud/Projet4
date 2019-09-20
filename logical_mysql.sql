-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: logicaldoc
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(40) COLLATE utf8_bin NOT NULL,
  `next_val` bigint(20) NOT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('ld_attributeset',100),('ld_bookmark',100),('ld_dashlet',100),('ld_document',100),('ld_extoption',100),('ld_folder',100),('ld_folder_history',100),('ld_generic',100),('ld_group',100),('ld_history',100),('ld_link',100),('ld_menu',5000),('ld_messagetemplate',100),('ld_note',100),('ld_rating',100),('ld_sequence',100),('ld_session',100),('ld_systemmessage',100),('ld_template',100),('ld_tenant',100),('ld_ticket',100),('ld_user',100),('ld_user_history',100),('ld_version',100);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_attributeset`
--

DROP TABLE IF EXISTS `ld_attributeset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_attributeset` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `ld_readonly` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_ATTRIBUTESET` (`ld_name`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_attributeset`
--

LOCK TABLES `ld_attributeset` WRITE;
/*!40000 ALTER TABLE `ld_attributeset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_attributeset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_attributeset_ext`
--

DROP TABLE IF EXISTS `ld_attributeset_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_attributeset_ext` (
  `ld_attsetid` bigint(20) NOT NULL,
  `ld_mandatory` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_editor` int(11) NOT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_stringvalue` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_stringvalues` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_intvalue` bigint(20) DEFAULT NULL,
  `ld_doublevalue` float DEFAULT NULL,
  `ld_datevalue` datetime DEFAULT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_setid` bigint(20) NOT NULL,
  `ld_hidden` int(11) NOT NULL,
  `ld_multiple` int(11) NOT NULL,
  `ld_parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_setid`,`ld_name`),
  KEY `FK_ATT_ATTSET` (`ld_attsetid`),
  CONSTRAINT `FK_ATT_ATTSET` FOREIGN KEY (`ld_attsetid`) REFERENCES `ld_attributeset` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_attributeset_ext`
--

LOCK TABLES `ld_attributeset_ext` WRITE;
/*!40000 ALTER TABLE `ld_attributeset_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_attributeset_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_bookmark`
--

DROP TABLE IF EXISTS `ld_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_bookmark` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_userid` bigint(20) NOT NULL,
  `ld_docid` bigint(20) NOT NULL,
  `ld_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_filetype` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `ld_type` int(11) NOT NULL,
  PRIMARY KEY (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_bookmark`
--

LOCK TABLES `ld_bookmark` WRITE;
/*!40000 ALTER TABLE `ld_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_contact`
--

DROP TABLE IF EXISTS `ld_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_contact` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_userid` bigint(20) DEFAULT NULL,
  `ld_firstname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_lastname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_email` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `ld_company` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_address` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `ld_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_mobile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_contact`
--

LOCK TABLES `ld_contact` WRITE;
/*!40000 ALTER TABLE `ld_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_dashlet`
--

DROP TABLE IF EXISTS `ld_dashlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_dashlet` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_query` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_content` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_DASHLET` (`ld_name`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_dashlet`
--

LOCK TABLES `ld_dashlet` WRITE;
/*!40000 ALTER TABLE `ld_dashlet` DISABLE KEYS */;
INSERT INTO `ld_dashlet` VALUES (1,'2019-09-20 15:04:44',1,0,1,'checkout','event.checkedoutdocs','document','from Document where lockUserId=$user.id and status=1 order by date desc',NULL,10),(2,'2019-09-20 15:04:44',1,0,1,'checkin','event.checkedindocs','docevent','from DocumentHistory where userId=$user.id and event=\'event.checkedin\' order by date desc',NULL,10),(3,'2019-09-20 15:04:44',1,0,1,'locked','event.lockeddocs','document','from Document where lockUserId=$user.id and status=2 order by date desc',NULL,10),(4,'2019-09-20 15:04:44',1,0,1,'download','event.downloadeddocs','docevent','from DocumentHistory where userId=$user.id and event=\'event.downloaded\' order by date desc',NULL,10),(5,'2019-09-20 15:04:44',1,0,1,'change','event.changeddocs','docevent','from DocumentHistory where userId=$user.id and event=\'event.changed\' order by date desc',NULL,10),(6,'2019-09-20 15:04:44',1,0,1,'notes','lastnotes','note','from DocumentNote where userId=$user.id order by date desc',NULL,10),(7,'2019-09-20 15:04:44',1,0,1,'tagcloud','tagcloud','content',NULL,NULL,10);
/*!40000 ALTER TABLE `ld_dashlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_document`
--

DROP TABLE IF EXISTS `ld_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_document` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_immutable` int(11) NOT NULL,
  `ld_customid` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ld_version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_fileversion` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_creation` datetime NOT NULL,
  `ld_publisher` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_publisherid` bigint(20) NOT NULL,
  `ld_creator` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_creatorid` bigint(20) NOT NULL,
  `ld_status` int(11) DEFAULT NULL,
  `ld_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_lockuserid` bigint(20) DEFAULT NULL,
  `ld_lockuser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_language` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ld_filename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_filesize` bigint(20) DEFAULT NULL,
  `ld_indexed` int(11) NOT NULL,
  `ld_barcoded` int(11) NOT NULL,
  `ld_signed` int(11) NOT NULL,
  `ld_stamped` int(11) NOT NULL,
  `ld_digest` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_folderid` bigint(20) DEFAULT NULL,
  `ld_templateid` bigint(20) DEFAULT NULL,
  `ld_exportstatus` int(11) NOT NULL,
  `ld_exportid` bigint(20) DEFAULT NULL,
  `ld_exportname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_exportversion` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ld_docref` bigint(20) DEFAULT NULL,
  `ld_docreftype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_deleteuserid` bigint(20) DEFAULT NULL,
  `ld_deleteuser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_rating` int(11) DEFAULT NULL,
  `ld_comment` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_workflowstatus` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_workflowstatusdisp` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_published` int(11) NOT NULL,
  `ld_startpublishing` datetime DEFAULT NULL,
  `ld_stoppublishing` datetime DEFAULT NULL,
  `ld_transactionid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_extresid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_tgs` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_pages` int(11) NOT NULL,
  `ld_nature` int(11) NOT NULL,
  `ld_formid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_DOCUMENT` (`ld_customid`,`ld_tenantid`),
  KEY `FK75ED9C0276C86307` (`ld_templateid`),
  KEY `LD_DOC_LUID` (`ld_lockuserid`),
  KEY `LD_DOC_FID` (`ld_folderid`),
  KEY `LD_DOC_RID` (`ld_docref`),
  KEY `LD_DOC_STATUS` (`ld_status`),
  CONSTRAINT `FK75ED9C0276C86307` FOREIGN KEY (`ld_templateid`) REFERENCES `ld_template` (`ld_id`),
  CONSTRAINT `FK75ED9C027C565C60` FOREIGN KEY (`ld_folderid`) REFERENCES `ld_folder` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_document`
--

LOCK TABLES `ld_document` WRITE;
/*!40000 ALTER TABLE `ld_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_document_ext`
--

DROP TABLE IF EXISTS `ld_document_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_document_ext` (
  `ld_docid` bigint(20) NOT NULL,
  `ld_mandatory` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_editor` int(11) NOT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_stringvalue` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_stringvalues` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_intvalue` bigint(20) DEFAULT NULL,
  `ld_doublevalue` float DEFAULT NULL,
  `ld_datevalue` datetime DEFAULT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_setid` bigint(20) DEFAULT NULL,
  `ld_hidden` int(11) NOT NULL,
  `ld_multiple` int(11) NOT NULL,
  `ld_parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_docid`,`ld_name`),
  KEY `LD_EXT_NAME` (`ld_name`),
  CONSTRAINT `FK4E0884647C693DFD` FOREIGN KEY (`ld_docid`) REFERENCES `ld_document` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_document_ext`
--

LOCK TABLES `ld_document_ext` WRITE;
/*!40000 ALTER TABLE `ld_document_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_document_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_extoption`
--

DROP TABLE IF EXISTS `ld_extoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_extoption` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_setid` bigint(20) NOT NULL,
  `ld_attribute` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_value` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_label` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_position` int(11) NOT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_EXTOPTION` (`ld_setid`,`ld_attribute`,`ld_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_extoption`
--

LOCK TABLES `ld_extoption` WRITE;
/*!40000 ALTER TABLE `ld_extoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_extoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_folder`
--

DROP TABLE IF EXISTS `ld_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_folder` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_parentid` bigint(20) NOT NULL,
  `ld_securityref` bigint(20) DEFAULT NULL,
  `ld_description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_creation` datetime DEFAULT NULL,
  `ld_creator` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_creatorid` bigint(20) DEFAULT NULL,
  `ld_templateid` bigint(20) DEFAULT NULL,
  `ld_templocked` int(11) NOT NULL,
  `ld_deleteuserid` bigint(20) DEFAULT NULL,
  `ld_deleteuser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_quotadocs` bigint(20) DEFAULT NULL,
  `ld_quotasize` bigint(20) DEFAULT NULL,
  `ld_hidden` int(11) NOT NULL,
  `ld_foldref` bigint(20) DEFAULT NULL,
  `ld_level` int(11) DEFAULT NULL,
  `ld_storage` int(11) DEFAULT NULL,
  `ld_maxversions` int(11) DEFAULT NULL,
  `ld_color` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_tgs` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_qthreshold` int(11) DEFAULT NULL,
  `ld_qrecipients` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  KEY `FK_FOLDER_PARENT` (`ld_parentid`),
  KEY `FK_FOLDER_TEMPLATE` (`ld_templateid`),
  KEY `LD_FLD_NAME` (`ld_name`),
  CONSTRAINT `FK_FOLDER_PARENT` FOREIGN KEY (`ld_parentid`) REFERENCES `ld_folder` (`ld_id`),
  CONSTRAINT `FK_FOLDER_TEMPLATE` FOREIGN KEY (`ld_templateid`) REFERENCES `ld_template` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_folder`
--

LOCK TABLES `ld_folder` WRITE;
/*!40000 ALTER TABLE `ld_folder` DISABLE KEYS */;
INSERT INTO `ld_folder` VALUES (4,'2019-09-20 15:04:43',1,0,1,'Default',5,NULL,NULL,1,'2019-09-20 15:04:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'2019-09-20 15:04:43',1,0,1,'/',5,NULL,NULL,1,'2019-09-20 15:04:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ld_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_folder_ext`
--

DROP TABLE IF EXISTS `ld_folder_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_folder_ext` (
  `ld_folderid` bigint(20) NOT NULL,
  `ld_mandatory` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_editor` int(11) NOT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_stringvalue` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_stringvalues` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_intvalue` bigint(20) DEFAULT NULL,
  `ld_doublevalue` float DEFAULT NULL,
  `ld_datevalue` datetime DEFAULT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_setid` bigint(20) DEFAULT NULL,
  `ld_hidden` int(11) NOT NULL,
  `ld_multiple` int(11) NOT NULL,
  `ld_parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_folderid`,`ld_name`),
  CONSTRAINT `FK_FOLDEREXT_FOLDER` FOREIGN KEY (`ld_folderid`) REFERENCES `ld_folder` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_folder_ext`
--

LOCK TABLES `ld_folder_ext` WRITE;
/*!40000 ALTER TABLE `ld_folder_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_folder_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_folder_history`
--

DROP TABLE IF EXISTS `ld_folder_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_folder_history` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_docid` bigint(20) DEFAULT NULL,
  `ld_folderid` bigint(20) DEFAULT NULL,
  `ld_userid` bigint(20) DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_event` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_comment` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_reason` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_path` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_pathold` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_notified` int(11) NOT NULL,
  `ld_sessionid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_new` int(11) DEFAULT NULL,
  `ld_filename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_userlogin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_filenameold` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  KEY `LD_FHIST_FID` (`ld_folderid`),
  KEY `LD_FHIST_NOT` (`ld_notified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_folder_history`
--

LOCK TABLES `ld_folder_history` WRITE;
/*!40000 ALTER TABLE `ld_folder_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_folder_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_foldergroup`
--

DROP TABLE IF EXISTS `ld_foldergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_foldergroup` (
  `ld_folderid` bigint(20) NOT NULL,
  `ld_groupid` bigint(20) NOT NULL,
  `ld_write` int(11) NOT NULL,
  `ld_add` int(11) NOT NULL,
  `ld_security` int(11) NOT NULL,
  `ld_immutable` int(11) NOT NULL,
  `ld_delete` int(11) NOT NULL,
  `ld_rename` int(11) NOT NULL,
  `ld_import` int(11) NOT NULL,
  `ld_export` int(11) NOT NULL,
  `ld_sign` int(11) NOT NULL,
  `ld_archive` int(11) NOT NULL,
  `ld_workflow` int(11) NOT NULL,
  `ld_download` int(11) NOT NULL,
  `ld_calendar` int(11) NOT NULL,
  `ld_subscription` int(11) NOT NULL,
  `ld_print` int(11) NOT NULL,
  `ld_password` int(11) NOT NULL,
  `ld_move` int(11) NOT NULL,
  `ld_email` int(11) NOT NULL,
  `ld_automation` int(11) NOT NULL,
  PRIMARY KEY (`ld_folderid`,`ld_groupid`),
  CONSTRAINT `FK_FGROUP_FOLDER` FOREIGN KEY (`ld_folderid`) REFERENCES `ld_folder` (`ld_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_foldergroup`
--

LOCK TABLES `ld_foldergroup` WRITE;
/*!40000 ALTER TABLE `ld_foldergroup` DISABLE KEYS */;
INSERT INTO `ld_foldergroup` VALUES (4,-10000,1,1,0,0,1,1,0,0,0,0,0,1,1,0,1,0,1,1,0),(4,2,1,1,0,0,1,1,0,0,0,0,0,1,1,0,1,0,1,1,0),(4,3,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,1,0),(4,4,1,1,0,0,1,1,0,0,0,0,0,1,1,0,1,0,1,1,0),(5,-10000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),(5,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),(5,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),(5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0);
/*!40000 ALTER TABLE `ld_foldergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_foldertag`
--

DROP TABLE IF EXISTS `ld_foldertag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_foldertag` (
  `ld_folderid` bigint(20) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_tag` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  KEY `FK_TAG_FOLDER` (`ld_folderid`),
  KEY `LD_FTAG_TAG` (`ld_tag`),
  CONSTRAINT `FK_TAG_FOLDER` FOREIGN KEY (`ld_folderid`) REFERENCES `ld_folder` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_foldertag`
--

LOCK TABLES `ld_foldertag` WRITE;
/*!40000 ALTER TABLE `ld_foldertag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_foldertag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_generic`
--

DROP TABLE IF EXISTS `ld_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_generic` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_subtype` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_qualifier` bigint(20) DEFAULT NULL,
  `ld_string1` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_string2` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_string3` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_string4` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_integer1` bigint(20) DEFAULT NULL,
  `ld_integer2` bigint(20) DEFAULT NULL,
  `ld_integer3` bigint(20) DEFAULT NULL,
  `ld_double1` float DEFAULT NULL,
  `ld_double2` float DEFAULT NULL,
  `ld_date1` datetime DEFAULT NULL,
  `ld_date2` datetime DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_GENERIC` (`ld_type`,`ld_subtype`,`ld_qualifier`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_generic`
--

LOCK TABLES `ld_generic` WRITE;
/*!40000 ALTER TABLE `ld_generic` DISABLE KEYS */;
INSERT INTO `ld_generic` VALUES (-52,'2019-09-20 15:04:41',1,0,1,'usersetting','dashlet-notes',1,'0',NULL,NULL,NULL,6,1,0,NULL,NULL,NULL,NULL),(-51,'2019-09-20 15:04:41',1,0,1,'usersetting','dashlet-locked',1,'0',NULL,NULL,NULL,3,0,1,NULL,NULL,NULL,NULL),(-50,'2019-09-20 15:04:41',1,0,1,'usersetting','dashlet-checkout',1,'0',NULL,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ld_generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_generic_ext`
--

DROP TABLE IF EXISTS `ld_generic_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_generic_ext` (
  `ld_genid` bigint(20) NOT NULL,
  `ld_mandatory` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_editor` bigint(20) NOT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_stringvalue` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_stringvalues` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_intvalue` bigint(20) DEFAULT NULL,
  `ld_doublevalue` float DEFAULT NULL,
  `ld_datevalue` datetime DEFAULT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_setid` bigint(20) DEFAULT NULL,
  `ld_hidden` int(11) NOT NULL,
  `ld_multiple` int(11) NOT NULL,
  `ld_parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_genid`,`ld_name`),
  CONSTRAINT `FK913AF772CF8376C7` FOREIGN KEY (`ld_genid`) REFERENCES `ld_generic` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_generic_ext`
--

LOCK TABLES `ld_generic_ext` WRITE;
/*!40000 ALTER TABLE `ld_generic_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_generic_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_group`
--

DROP TABLE IF EXISTS `ld_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_group` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_source` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_GROUP` (`ld_name`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_group`
--

LOCK TABLES `ld_group` WRITE;
/*!40000 ALTER TABLE `ld_group` DISABLE KEYS */;
INSERT INTO `ld_group` VALUES (-10000,'2019-09-20 15:04:40',1,0,1,'publisher','Group of publishers',0,'local'),(-1010,'2019-09-20 15:04:41',1,0,1,'_user_-1010','',1,'local'),(-1,'2019-09-20 15:04:40',1,0,1,'_user_1',NULL,1,'local'),(1,'2019-09-20 15:04:40',1,0,1,'admin','Group of admins',0,'local'),(2,'2019-09-20 15:04:40',1,0,1,'author','Group of authors',0,NULL),(3,'2019-09-20 15:04:40',1,0,1,'guest','Group of guests',0,'local'),(4,'2019-09-20 15:04:40',1,0,1,'poweruser','Group of power users',0,'local');
/*!40000 ALTER TABLE `ld_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_history`
--

DROP TABLE IF EXISTS `ld_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_history` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_docid` bigint(20) DEFAULT NULL,
  `ld_folderid` bigint(20) DEFAULT NULL,
  `ld_userid` bigint(20) DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_event` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_comment` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_reason` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_path` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_pathold` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_notified` int(11) NOT NULL,
  `ld_sessionid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_new` int(11) DEFAULT NULL,
  `ld_filename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_filenameold` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_userlogin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  KEY `LD_HIST_DOCID` (`ld_docid`),
  KEY `LD_HIST_UID` (`ld_userid`),
  KEY `LD_HIST_NOT` (`ld_notified`),
  KEY `LD_HIST_EVENT` (`ld_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_history`
--

LOCK TABLES `ld_history` WRITE;
/*!40000 ALTER TABLE `ld_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_link`
--

DROP TABLE IF EXISTS `ld_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_link` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_docid1` bigint(20) DEFAULT NULL,
  `ld_docid2` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_LINK` (`ld_docid1`,`ld_docid2`,`ld_type`),
  KEY `FK1330661CADD6217` (`ld_docid2`),
  CONSTRAINT `FK1330661CADD6216` FOREIGN KEY (`ld_docid1`) REFERENCES `ld_document` (`ld_id`),
  CONSTRAINT `FK1330661CADD6217` FOREIGN KEY (`ld_docid2`) REFERENCES `ld_document` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_link`
--

LOCK TABLES `ld_link` WRITE;
/*!40000 ALTER TABLE `ld_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_menu`
--

DROP TABLE IF EXISTS `ld_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_menu` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_parentid` bigint(20) NOT NULL,
  `ld_securityref` bigint(20) DEFAULT NULL,
  `ld_icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_position` int(11) NOT NULL,
  PRIMARY KEY (`ld_id`),
  KEY `FK_MENU_PARENT` (`ld_parentid`),
  CONSTRAINT `FK_MENU_PARENT` FOREIGN KEY (`ld_parentid`) REFERENCES `ld_menu` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_menu`
--

LOCK TABLES `ld_menu` WRITE;
/*!40000 ALTER TABLE `ld_menu` DISABLE KEYS */;
INSERT INTO `ld_menu` VALUES (-2070,'2019-09-20 15:04:46',1,0,1,'dropbox',16,NULL,'document.png',1,NULL,1),(-6,'2019-09-20 15:04:39',1,0,1,'deletedfolders',90,NULL,'menu.png',1,NULL,1),(-5,'2019-09-20 15:04:39',1,0,1,'deleteddocs',90,NULL,'menu.png',1,NULL,1),(-3,'2019-09-20 15:04:39',1,0,1,'lockeddocs',90,NULL,'menu.png',1,NULL,1),(-2,'2019-09-20 15:04:39',1,0,1,'lastchanges',90,NULL,'menu.png',1,NULL,1),(1,'2019-09-20 15:04:38',1,0,1,'/',1,NULL,'menu.png',1,NULL,1),(2,'2019-09-20 15:04:38',1,0,1,'administration',1,NULL,'menu.png',1,NULL,20),(3,'2019-09-20 15:04:39',1,0,1,'clienandextapps',7,NULL,'menu.png',1,NULL,1),(5,'2019-09-20 15:04:39',1,0,1,'frontend',1,NULL,'menu.png',1,NULL,1),(7,'2019-09-20 15:04:39',1,0,1,'settings',2,NULL,'menu.png',1,NULL,60),(8,'2019-09-20 15:04:38',1,0,1,'impex',2,NULL,'menu.png',1,NULL,40),(9,'2019-09-20 15:04:38',1,0,1,'security',2,NULL,'menu.png',1,NULL,20),(14,'2019-09-20 15:04:39',1,0,1,'scheduledtasks',80,NULL,'menu.png',1,NULL,1),(16,'2019-09-20 15:04:39',1,0,1,'tools',110,NULL,'menu.png',1,NULL,20),(25,'2019-09-20 15:04:39',1,0,1,'documentmetadata',2,NULL,'menu.png',1,NULL,30),(40,'2019-09-20 15:04:40',1,0,1,'personal',110,NULL,'menu.png',1,NULL,10),(70,'2019-09-20 15:04:40',1,0,1,'general',80,NULL,'menu.png',1,NULL,20),(71,'2019-09-20 15:04:40',1,0,1,'sessions',70,NULL,'menu.png',1,NULL,20),(72,'2019-09-20 15:04:40',1,0,1,'logs',70,NULL,'menu.png',1,NULL,20),(73,'2019-09-20 15:04:40',1,0,1,'runlevel',70,NULL,'menu.png',1,NULL,20),(80,'2019-09-20 15:04:39',1,0,1,'system',2,NULL,'system.png',1,NULL,10),(90,'2019-09-20 15:04:39',1,0,1,'reports',2,NULL,'reports.png',1,NULL,50),(100,'2019-09-20 15:04:39',1,0,1,'parameters',7,NULL,'settings.png',1,NULL,60),(105,'2019-09-20 15:04:39',1,0,1,'repositories',7,NULL,'repositories.png',1,NULL,60),(110,'2019-09-20 15:04:39',1,0,1,'mainmenu',5,NULL,'menu.png',1,NULL,10),(200,'2019-09-20 15:04:40',1,0,1,'textcontent',16,NULL,'text.png',1,NULL,1),(1500,'2019-09-20 15:04:39',1,0,1,'documents',5,NULL,'menu.png',1,NULL,50),(1510,'2019-09-20 15:04:39',1,0,1,'search',5,NULL,'menu.png',1,NULL,60),(1520,'2019-09-20 15:04:39',1,0,1,'dashboard',5,NULL,'menu.png',1,NULL,40),(1525,'2019-09-20 15:04:39',1,0,1,'messages',1520,NULL,'menu.png',1,NULL,40),(1530,'2019-09-20 15:04:40',1,0,1,'contacts',40,NULL,'menu.png',1,NULL,1),(1535,'2019-09-20 15:04:40',1,0,1,'interfacedensity',110,NULL,'menu.png',1,NULL,5),(1600,'2019-09-20 15:04:39',1,0,1,'history',1500,NULL,'menu.png',1,NULL,10),(1601,'2019-09-20 15:04:39',1,0,1,'sessions',1600,NULL,'menu.png',1,NULL,10),(1602,'2019-09-20 15:04:39',1,0,1,'trash',1500,NULL,'menu.png',1,NULL,10),(1603,'2019-09-20 15:04:39',1,0,1,'versions',1500,NULL,'menu.png',1,NULL,10),(1605,'2019-09-20 15:04:39',1,0,1,'aliases',1500,NULL,'menu.png',1,NULL,10);
/*!40000 ALTER TABLE `ld_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_menugroup`
--

DROP TABLE IF EXISTS `ld_menugroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_menugroup` (
  `ld_menuid` bigint(20) NOT NULL,
  `ld_groupid` bigint(20) NOT NULL,
  `ld_write` int(11) NOT NULL,
  PRIMARY KEY (`ld_menuid`,`ld_groupid`),
  KEY `FK_MENUGROUP_GROUP` (`ld_groupid`),
  CONSTRAINT `FK_MENUGROUP_GROUP` FOREIGN KEY (`ld_groupid`) REFERENCES `ld_group` (`ld_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_MGROUP_MENU` FOREIGN KEY (`ld_menuid`) REFERENCES `ld_menu` (`ld_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_menugroup`
--

LOCK TABLES `ld_menugroup` WRITE;
/*!40000 ALTER TABLE `ld_menugroup` DISABLE KEYS */;
INSERT INTO `ld_menugroup` VALUES (-2070,-10000,0),(-2070,2,0),(-2070,3,0),(-2070,4,0),(2,4,0),(5,-10000,0),(5,2,0),(5,3,0),(5,4,0),(14,4,0),(25,4,0),(200,2,0),(200,3,0),(200,4,0),(1500,-10000,0),(1500,2,0),(1500,3,0),(1500,4,0),(1510,-10000,0),(1510,2,0),(1510,3,0),(1510,4,0),(1520,-10000,0),(1520,2,0),(1520,3,0),(1520,4,0),(1525,-10000,0),(1525,2,0),(1525,3,0),(1525,4,0),(1530,-10000,0),(1530,2,0),(1530,3,0),(1530,4,0),(1535,-10000,0),(1535,2,0),(1535,3,0),(1535,4,0),(1602,-10000,0),(1602,2,0),(1602,3,0),(1602,4,0),(1603,-10000,0),(1603,2,0),(1603,3,0),(1603,4,0);
/*!40000 ALTER TABLE `ld_menugroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_messagetemplate`
--

DROP TABLE IF EXISTS `ld_messagetemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_messagetemplate` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_language` varchar(10) COLLATE utf8_bin NOT NULL,
  `ld_description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_body` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_subject` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_MSGTEMPL` (`ld_name`,`ld_language`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_messagetemplate`
--

LOCK TABLES `ld_messagetemplate` WRITE;
/*!40000 ALTER TABLE `ld_messagetemplate` DISABLE KEYS */;
INSERT INTO `ld_messagetemplate` VALUES (1,'2019-09-20 15:04:44',1,0,1,'task.report','en',NULL,'$task<br/>\r\n$I18N.get(\'startedon\'): <b>$DateTool.format($started, true)</b><br/>\r\n$I18N.get(\'finishedon\'): <b>$DateTool.format($ended, true)</b><br/>\r\n<hr/>\r\n#if( $error )\r\n$I18N.get(\'error\'): <b>$error</b>\r\n<hr />\r\n#end\r\n$report','system','$product - $task'),(2,'2019-09-20 15:04:44',1,0,1,'psw.rec1','en',NULL,'$I18N.format(\'emailnotifyaccount\', $user.fullName) <br/>\r\n$I18N.get(\'username\'): <b>$user.username</b> <br/>\r\n$I18N.get(\'password\'): <b>$password</b> <br/>\r\n$I18N.get(\'clickhere\'): <a href=\"$url\">$url</a>','system','$product - $I18N.get(\'emailnotifyaccountobject\')'),(3,'2019-09-20 15:04:44',1,0,1,'psw.rec2','en',NULL,'$product - $I18N.get(\'passwordrequest\') <br/>\r\n$I18N.get(\'clickhere\'): <a href=\"$url\">$url</a>','system','$product - $I18N.get(\'passwordrequest\')'),(4,'2019-09-20 15:04:44',1,0,1,'newdoc','en',NULL,'$I18N.get(\'newdocscreated\')<br/>\r\n<hr/>\r\n$message\r\n<hr/>\r\n$I18N.get(\'user\'): <b>$creator.fullName</b><br/>\r\n$I18N.get(\'date\'): <b>$DateTool.format($CURRENT_DATE, true)</b><br/>\r\n<hr/>\r\n<b>$I18N.get(\'documents\')</b>:\r\n#foreach( $doc in $documents )\r\n  <br/>$doc.fileName | <a href=\"$DocTool.downloadUrl($doc)\">$I18N.get(\'download\')</a> | <a href=\"$DocTool.displayUrl($doc)\">$I18N.get(\'display\')</a>\r\n#end','system','$product - $I18N.get(\'newdocscreated\')');
/*!40000 ALTER TABLE `ld_messagetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_note`
--

DROP TABLE IF EXISTS `ld_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_note` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_docid` bigint(20) NOT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_userid` bigint(20) DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_filename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_message` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_snippet` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_page` int(11) NOT NULL,
  PRIMARY KEY (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_note`
--

LOCK TABLES `ld_note` WRITE;
/*!40000 ALTER TABLE `ld_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_patch`
--

DROP TABLE IF EXISTS `ld_patch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_patch` (
  `ld_patch` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_version` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_patch`
--

LOCK TABLES `ld_patch` WRITE;
/*!40000 ALTER TABLE `ld_patch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_patch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_rating`
--

DROP TABLE IF EXISTS `ld_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_rating` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_docid` bigint(20) NOT NULL,
  `ld_userid` bigint(20) NOT NULL,
  `ld_vote` int(11) NOT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_RATING` (`ld_docid`,`ld_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_rating`
--

LOCK TABLES `ld_rating` WRITE;
/*!40000 ALTER TABLE `ld_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_recipient`
--

DROP TABLE IF EXISTS `ld_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_recipient` (
  `ld_messageid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_mode` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_read` int(11) NOT NULL,
  KEY `LD_RCP_MID_NAME` (`ld_messageid`,`ld_name`),
  CONSTRAINT `FK406A04126621DEBE` FOREIGN KEY (`ld_messageid`) REFERENCES `ld_systemmessage` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_recipient`
--

LOCK TABLES `ld_recipient` WRITE;
/*!40000 ALTER TABLE `ld_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_sequence`
--

DROP TABLE IF EXISTS `ld_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_sequence` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_objectid` bigint(20) NOT NULL,
  `ld_lastreset` datetime DEFAULT NULL,
  `ld_value` bigint(20) NOT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_SEQUENCE` (`ld_name`,`ld_objectid`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_sequence`
--

LOCK TABLES `ld_sequence` WRITE;
/*!40000 ALTER TABLE `ld_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_session`
--

DROP TABLE IF EXISTS `ld_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_session` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_sid` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_node` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_tenantname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_creation` datetime DEFAULT NULL,
  `ld_lastrenew` datetime DEFAULT NULL,
  `ld_status` int(11) NOT NULL,
  `ld_clientid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_clientaddr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_clienthost` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_SESSION` (`ld_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_session`
--

LOCK TABLES `ld_session` WRITE;
/*!40000 ALTER TABLE `ld_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_systemmessage`
--

DROP TABLE IF EXISTS `ld_systemmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_systemmessage` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_messagetext` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_subject` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_sentdate` datetime NOT NULL,
  `ld_datescope` int(11) DEFAULT NULL,
  `ld_prio` int(11) DEFAULT NULL,
  `ld_confirmation` int(11) DEFAULT NULL,
  `ld_lastnotified` datetime DEFAULT NULL,
  `ld_status` int(11) NOT NULL,
  `ld_trials` int(11) DEFAULT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_html` int(11) NOT NULL,
  PRIMARY KEY (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_systemmessage`
--

LOCK TABLES `ld_systemmessage` WRITE;
/*!40000 ALTER TABLE `ld_systemmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_systemmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_tag`
--

DROP TABLE IF EXISTS `ld_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_tag` (
  `ld_docid` bigint(20) DEFAULT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_tag` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  KEY `FK55BBDA227C693DFD` (`ld_docid`),
  KEY `LD_TAG_TAG` (`ld_tag`),
  CONSTRAINT `FK55BBDA227C693DFD` FOREIGN KEY (`ld_docid`) REFERENCES `ld_document` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_tag`
--

LOCK TABLES `ld_tag` WRITE;
/*!40000 ALTER TABLE `ld_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_temp`
--

DROP TABLE IF EXISTS `ld_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_temp` (
  `ld_int` bigint(20) DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_string` varchar(4000) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_temp`
--

LOCK TABLES `ld_temp` WRITE;
/*!40000 ALTER TABLE `ld_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_template`
--

DROP TABLE IF EXISTS `ld_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_template` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `ld_readonly` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_TEMPLATE` (`ld_name`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_template`
--

LOCK TABLES `ld_template` WRITE;
/*!40000 ALTER TABLE `ld_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_template_ext`
--

DROP TABLE IF EXISTS `ld_template_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_template_ext` (
  `ld_templateid` bigint(20) NOT NULL,
  `ld_mandatory` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_editor` int(11) NOT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_stringvalue` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_stringvalues` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_intvalue` bigint(20) DEFAULT NULL,
  `ld_doublevalue` float DEFAULT NULL,
  `ld_datevalue` datetime DEFAULT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_setid` bigint(20) DEFAULT NULL,
  `ld_hidden` int(11) NOT NULL,
  `ld_multiple` int(11) NOT NULL,
  `ld_parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_templateid`,`ld_name`),
  CONSTRAINT `FK6BABB84376C86307` FOREIGN KEY (`ld_templateid`) REFERENCES `ld_template` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_template_ext`
--

LOCK TABLES `ld_template_ext` WRITE;
/*!40000 ALTER TABLE `ld_template_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_template_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_tenant`
--

DROP TABLE IF EXISTS `ld_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_tenant` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_displayname` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_enabled` int(11) NOT NULL,
  `ld_expire` datetime DEFAULT NULL,
  `ld_street` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_postalcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_maxusers` int(11) DEFAULT NULL,
  `ld_maxsessions` int(11) DEFAULT NULL,
  `ld_maxrepodocs` bigint(20) DEFAULT NULL,
  `ld_maxreposize` bigint(20) DEFAULT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_qthreshold` int(11) DEFAULT NULL,
  `ld_qrecipients` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_maxguests` int(11) DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_TENANT` (`ld_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_tenant`
--

LOCK TABLES `ld_tenant` WRITE;
/*!40000 ALTER TABLE `ld_tenant` DISABLE KEYS */;
INSERT INTO `ld_tenant` VALUES (1,'2019-09-20 15:04:38',1,0,1,'default','Default',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ld_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_ticket`
--

DROP TABLE IF EXISTS `ld_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_ticket` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_ticketid` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_docid` bigint(20) NOT NULL,
  `ld_userid` bigint(20) NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_creation` datetime NOT NULL,
  `ld_expired` datetime DEFAULT NULL,
  `ld_count` int(11) NOT NULL,
  `ld_suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_TICKET` (`ld_ticketid`),
  KEY `FK_TICKET_USER` (`ld_userid`),
  CONSTRAINT `FK_TICKET_USER` FOREIGN KEY (`ld_userid`) REFERENCES `ld_user` (`ld_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_ticket`
--

LOCK TABLES `ld_ticket` WRITE;
/*!40000 ALTER TABLE `ld_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_uniquetag`
--

DROP TABLE IF EXISTS `ld_uniquetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_uniquetag` (
  `ld_tag` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ld_tag`,`ld_tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_uniquetag`
--

LOCK TABLES `ld_uniquetag` WRITE;
/*!40000 ALTER TABLE `ld_uniquetag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_uniquetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_update`
--

DROP TABLE IF EXISTS `ld_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_update` (
  `ld_update` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_version` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_update`
--

LOCK TABLES `ld_update` WRITE;
/*!40000 ALTER TABLE `ld_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_user`
--

DROP TABLE IF EXISTS `ld_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_user` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_enabled` int(11) NOT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_passwordmd4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_firstname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_street` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_postalcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_language` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ld_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_emailsignature` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_telephone2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_passwordchanged` datetime DEFAULT NULL,
  `ld_passwordexpires` int(11) NOT NULL,
  `ld_source` int(11) NOT NULL,
  `ld_quota` bigint(20) NOT NULL,
  `ld_welcomescreen` int(11) DEFAULT NULL,
  `ld_ipwhitelist` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_ipblacklist` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_passwordexpired` int(11) NOT NULL,
  `ld_defworkspace` bigint(20) DEFAULT NULL,
  `ld_email2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_emailsignature2` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_certexpire` datetime DEFAULT NULL,
  `ld_certdn` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_certpass` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_secondfactor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_USER` (`ld_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_user`
--

LOCK TABLES `ld_user` WRITE;
/*!40000 ALTER TABLE `ld_user` DISABLE KEYS */;
INSERT INTO `ld_user` VALUES (-1010,'2019-09-20 15:04:41',1,0,1,1,'_system','',NULL,'User','System','','','','',NULL,'fr','system@acme.com',NULL,'',NULL,1,NULL,0,0,-1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'2019-09-20 15:04:40',1,0,1,1,'admin','d033e22ae348aeb566fc214aec3585c4da997','U8FeEPvxYRhKNCBsLa0K+1rD1tTtR6yctJIwxje2QMwEOlEQx9HuiA==','Admin','Admin','','','','',NULL,'fr','admin@admin.net',NULL,'','',0,NULL,0,0,-1,1520,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ld_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_user_history`
--

DROP TABLE IF EXISTS `ld_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_user_history` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_userid` bigint(20) DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_event` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_comment` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_reason` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_notified` int(11) NOT NULL,
  `ld_sessionid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_new` int(11) DEFAULT NULL,
  `ld_filename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_userlogin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  KEY `LD_UHIST_UID` (`ld_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_user_history`
--

LOCK TABLES `ld_user_history` WRITE;
/*!40000 ALTER TABLE `ld_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_usergroup`
--

DROP TABLE IF EXISTS `ld_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_usergroup` (
  `ld_groupid` bigint(20) NOT NULL,
  `ld_userid` bigint(20) NOT NULL,
  PRIMARY KEY (`ld_groupid`,`ld_userid`),
  KEY `FK2435438DB8B12CA9` (`ld_userid`),
  CONSTRAINT `FK2435438D76F11EA1` FOREIGN KEY (`ld_groupid`) REFERENCES `ld_group` (`ld_id`),
  CONSTRAINT `FK2435438DB8B12CA9` FOREIGN KEY (`ld_userid`) REFERENCES `ld_user` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_usergroup`
--

LOCK TABLES `ld_usergroup` WRITE;
/*!40000 ALTER TABLE `ld_usergroup` DISABLE KEYS */;
INSERT INTO `ld_usergroup` VALUES (-1010,-1010),(-1,1),(1,1);
/*!40000 ALTER TABLE `ld_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_version`
--

DROP TABLE IF EXISTS `ld_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_version` (
  `ld_id` bigint(20) NOT NULL,
  `ld_lastmodified` datetime NOT NULL,
  `ld_recordversion` bigint(20) NOT NULL,
  `ld_deleted` int(11) NOT NULL,
  `ld_tenantid` bigint(20) NOT NULL,
  `ld_immutable` int(11) NOT NULL,
  `ld_customid` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ld_version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_fileversion` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ld_date` datetime DEFAULT NULL,
  `ld_creation` datetime DEFAULT NULL,
  `ld_publisher` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_publisherid` bigint(20) NOT NULL,
  `ld_creator` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_creatorid` bigint(20) NOT NULL,
  `ld_status` int(11) DEFAULT NULL,
  `ld_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_lockuserid` bigint(20) DEFAULT NULL,
  `ld_lockuser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_language` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ld_filename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_filesize` bigint(20) DEFAULT NULL,
  `ld_indexed` int(11) NOT NULL,
  `ld_barcoded` int(11) NOT NULL,
  `ld_signed` int(11) NOT NULL,
  `ld_stamped` int(11) NOT NULL,
  `ld_digest` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_folderid` bigint(20) DEFAULT NULL,
  `ld_foldername` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_templateid` bigint(20) DEFAULT NULL,
  `ld_templatename` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_tgs` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_userid` bigint(20) DEFAULT NULL,
  `ld_versiondate` datetime DEFAULT NULL,
  `ld_comment` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_event` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_documentid` bigint(20) NOT NULL,
  `ld_exportstatus` int(11) NOT NULL,
  `ld_exportid` bigint(20) DEFAULT NULL,
  `ld_exportname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_exportversion` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ld_deleteuserid` bigint(20) DEFAULT NULL,
  `ld_workflowstatus` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_workflowstatusdisp` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `ld_published` int(11) NOT NULL,
  `ld_startpublishing` datetime DEFAULT NULL,
  `ld_stoppublishing` datetime DEFAULT NULL,
  `ld_transactionid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_extresid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_pages` int(11) NOT NULL,
  `ld_nature` int(11) NOT NULL,
  `ld_formid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ld_id`),
  UNIQUE KEY `AK_VERSION` (`ld_documentid`,`ld_version`),
  CONSTRAINT `FK9B3BD9118A053CE` FOREIGN KEY (`ld_documentid`) REFERENCES `ld_document` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_version`
--

LOCK TABLES `ld_version` WRITE;
/*!40000 ALTER TABLE `ld_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ld_version_ext`
--

DROP TABLE IF EXISTS `ld_version_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ld_version_ext` (
  `ld_versionid` bigint(20) NOT NULL,
  `ld_mandatory` int(11) NOT NULL,
  `ld_type` int(11) NOT NULL,
  `ld_editor` int(11) NOT NULL,
  `ld_position` int(11) NOT NULL,
  `ld_stringvalue` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_stringvalues` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ld_intvalue` bigint(20) DEFAULT NULL,
  `ld_doublevalue` float DEFAULT NULL,
  `ld_datevalue` datetime DEFAULT NULL,
  `ld_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ld_label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ld_setid` bigint(20) DEFAULT NULL,
  `ld_hidden` int(11) NOT NULL,
  `ld_multiple` int(11) NOT NULL,
  `ld_parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ld_versionid`,`ld_name`),
  CONSTRAINT `FK78C3A1F3B90495EE` FOREIGN KEY (`ld_versionid`) REFERENCES `ld_version` (`ld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ld_version_ext`
--

LOCK TABLES `ld_version_ext` WRITE;
/*!40000 ALTER TABLE `ld_version_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ld_version_ext` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 15:10:01
