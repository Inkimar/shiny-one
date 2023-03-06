-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: mgg2
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `accession`
--

DROP TABLE IF EXISTS `accession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accession` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'accession number 2005/1001 [...]',
  `project_id` int(11) unsigned DEFAULT NULL,
  `locality_id` int(10) unsigned DEFAULT NULL,
  `accdate` date DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `species_id` int(10) unsigned DEFAULT NULL,
  `discovery_id` int(2) DEFAULT NULL,
  `discovery_date_start` date DEFAULT NULL,
  `discovery_date_end` date DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL COMMENT 'person',
  `collector_id` int(10) unsigned DEFAULT NULL COMMENT 'person',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(11) unsigned DEFAULT NULL,
  `note` text,
  `complete` binary(1) DEFAULT '0',
  `latitude` double DEFAULT '0' COMMENT 'deg + dec',
  `longitude` double DEFAULT '0' COMMENT 'deg + dec',
  `findplace_note` text COMMENT 'Kommentar om fyndplatsen',
  `coordinate_precision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `oldnumber` varchar(255) DEFAULT NULL,
  `description` text,
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `created_by` (`created_by`),
  KEY `locality_id` (`locality_id`),
  KEY `species_id` (`species_id`),
  KEY `discoveryid` (`discovery_id`),
  KEY `sender_id` (`sender_id`),
  KEY `collector_id` (`collector_id`),
  KEY `project_id` (`project_id`),
  KEY `FK_accession_8` (`catalog_id`),
  KEY `coordinate_precision_index` (`coordinate_precision_id`),
  CONSTRAINT `FK_accession_8` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `accession_fk` FOREIGN KEY (`discovery_id`) REFERENCES `discovery` (`id`),
  CONSTRAINT `accession_fk1` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`),
  CONSTRAINT `accession_fk3` FOREIGN KEY (`sender_id`) REFERENCES `person` (`id`),
  CONSTRAINT `accession_fk4` FOREIGN KEY (`collector_id`) REFERENCES `person` (`id`),
  CONSTRAINT `accession_fk5` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `accession_fk6` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  CONSTRAINT `accession_ibfk_1` FOREIGN KEY (`coordinate_precision_id`) REFERENCES `coordinate_precision` (`id`),
  CONSTRAINT `accession_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age`
--

DROP TABLE IF EXISTS `age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL DEFAULT '',
  `swe_name` varchar(15) DEFAULT NULL,
  `eng_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_method`
--

DROP TABLE IF EXISTS `age_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_method` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT 'Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agerecord`
--

DROP TABLE IF EXISTS `agerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agerecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) unsigned NOT NULL DEFAULT '0',
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  `age_method_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(11) unsigned DEFAULT NULL,
  `note` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_agerecord_3` (`creator_id`),
  KEY `FK_agerecord_4` (`age_method_id`),
  KEY `FK_agerecord_6` (`created_by`),
  KEY `FK_agerecord_7` (`updated_by`),
  CONSTRAINT `FK_agerecord_3` FOREIGN KEY (`creator_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_agerecord_4` FOREIGN KEY (`age_method_id`) REFERENCES `age_method` (`id`),
  CONSTRAINT `FK_agerecord_6` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_agerecord_7` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agerecord_row`
--

DROP TABLE IF EXISTS `agerecord_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agerecord_row` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accession_id` int(11) unsigned NOT NULL DEFAULT '0',
  `agerecord_id` int(11) unsigned NOT NULL DEFAULT '0',
  `age_id` int(11) unsigned DEFAULT NULL,
  `note` text,
  `age_start` varchar(32) DEFAULT '',
  `age_end` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_accession` (`accession_id`),
  KEY `fk_age` (`age_id`),
  KEY `fk_agerecord` (`agerecord_id`),
  CONSTRAINT `agerecord_row_ibfk_1` FOREIGN KEY (`age_id`) REFERENCES `age` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_accession` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_agerecord` FOREIGN KEY (`agerecord_id`) REFERENCES `agerecord` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18395 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accession_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'The accession this is related with',
  `material_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'the material being anylysed\r\n',
  `analyser_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'the person doing the analysis',
  `analysis_type` varchar(42) DEFAULT NULL COMMENT 'Type of analysis',
  `date` date DEFAULT NULL,
  `amount` int(11) unsigned DEFAULT NULL COMMENT 'amount of material being tested, in grams.',
  `results` text NOT NULL COMMENT 'the results of the analysis.',
  `project_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `material_id` (`material_id`),
  KEY `analyser_id` (`analyser_id`),
  KEY `project_id` (`project_id`),
  KEY `accession_id` (`accession_id`),
  CONSTRAINT `analysis_fk` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `analysis_fk1` FOREIGN KEY (`analyser_id`) REFERENCES `person` (`id`),
  CONSTRAINT `analysis_fk2` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `analysis_fk3` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis_type`
--

DROP TABLE IF EXISTS `analysis_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT 'Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysisrecord`
--

DROP TABLE IF EXISTS `analysisrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysisrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `species_id` int(10) unsigned NOT NULL DEFAULT '0',
  `creator_id` int(10) unsigned NOT NULL DEFAULT '0',
  `contact_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  `shippingdate` datetime DEFAULT '0000-00-00 00:00:00',
  `analysis_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `result` text NOT NULL,
  `analysis_type_note` text,
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_analysisrecord_2` (`species_id`),
  KEY `FK_analysisrecord_1` (`project_id`),
  KEY `FK_analysisrecord_3` (`creator_id`),
  KEY `FK_analysisrecord_4` (`analysis_type_id`),
  KEY `FK_analysisrecord_5` (`contact_id`),
  KEY `FK_analysisrecord_6` (`created_by`),
  KEY `FK_analysisrecord_7` (`updated_by`),
  CONSTRAINT `FK_analysisrecord_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_analysisrecord_2` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`),
  CONSTRAINT `FK_analysisrecord_3` FOREIGN KEY (`creator_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_analysisrecord_4` FOREIGN KEY (`analysis_type_id`) REFERENCES `analysis_type` (`id`),
  CONSTRAINT `FK_analysisrecord_5` FOREIGN KEY (`contact_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_analysisrecord_6` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_analysisrecord_7` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11022 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysisrecord_material_assn`
--

DROP TABLE IF EXISTS `analysisrecord_material_assn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysisrecord_material_assn` (
  `analysisrecordRow_id` int(10) unsigned NOT NULL DEFAULT '0',
  `material_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`analysisrecordRow_id`,`material_id`),
  KEY `FK_analysisrecord_material_assn_1` (`material_id`),
  CONSTRAINT `FK_analysisrecord_material_assn_1` FOREIGN KEY (`analysisrecordRow_id`) REFERENCES `analysisrecord_row` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_analysisrecord_material_assn_2` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; ("material_id") REFER "mgg2/material"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysisrecord_row`
--

DROP TABLE IF EXISTS `analysisrecord_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysisrecord_row` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(11,3) DEFAULT NULL,
  `homogenate_amount` decimal(11,3) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145531 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysisrecord_row_assn`
--

DROP TABLE IF EXISTS `analysisrecord_row_assn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysisrecord_row_assn` (
  `analysis_record_id` int(10) unsigned NOT NULL DEFAULT '0',
  `analysis_record_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`analysis_record_id`,`analysis_record_row_id`),
  KEY `FK_analysisrecord_row_assn_2` (`analysis_record_row_id`),
  CONSTRAINT `FK_analysisrecord_row_assn_1` FOREIGN KEY (`analysis_record_id`) REFERENCES `analysisrecord` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_analysisrecord_row_assn_2` FOREIGN KEY (`analysis_record_row_id`) REFERENCES `analysisrecord_row` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autopsy`
--

DROP TABLE IF EXISTS `autopsy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autopsy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `creator_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cause_of_death_id` int(10) unsigned NOT NULL DEFAULT '0',
  `disease_id` int(10) unsigned NOT NULL DEFAULT '0',
  `diagnosis` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `accession_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(10) unsigned NOT NULL DEFAULT '0',
  `observations` text,
  `attending_notes` text,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `place` varchar(60) DEFAULT NULL,
  `old_number` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_autopsy_1` (`accession_id`),
  KEY `FK_autopsy_2` (`created_by`),
  KEY `FK_autopsy_3` (`disease_id`),
  KEY `FK_autopsy_4` (`cause_of_death_id`),
  KEY `creator_index` (`creator_id`),
  CONSTRAINT `FK_autopsy_1` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `FK_autopsy_2` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_autopsy_3` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK_autopsy_4` FOREIGN KEY (`cause_of_death_id`) REFERENCES `cause_of_death` (`id`),
  CONSTRAINT `autopsy_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; (`created_by`) REFER `mgg2/person`(`i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autopsy_autopsyrow_assn`
--

DROP TABLE IF EXISTS `autopsy_autopsyrow_assn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autopsy_autopsyrow_assn` (
  `autopsy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autopsyRow_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`autopsy_id`,`autopsyRow_id`),
  KEY `FK_autopsy_autopsyrow_assn_2` (`autopsyRow_id`),
  CONSTRAINT `autopsy_autopsyrow_assn_ibfk_1` FOREIGN KEY (`autopsy_id`) REFERENCES `autopsy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `autopsy_autopsyrow_assn_ibfk_2` FOREIGN KEY (`autopsyRow_id`) REFERENCES `autopsy_row` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autopsy_note`
--

DROP TABLE IF EXISTS `autopsy_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autopsy_note` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autopsy_part`
--

DROP TABLE IF EXISTS `autopsy_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autopsy_part` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autopsy_person_assn`
--

DROP TABLE IF EXISTS `autopsy_person_assn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autopsy_person_assn` (
  `autopsy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `person_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`autopsy_id`,`person_id`),
  KEY `FK_autopsy_person_assn_1` (`person_id`),
  CONSTRAINT `autopsy_person_assn_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `autopsy_person_assn_ibfk_2` FOREIGN KEY (`autopsy_id`) REFERENCES `autopsy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autopsy_row`
--

DROP TABLE IF EXISTS `autopsy_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autopsy_row` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `autopsy_note_id` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` decimal(10,3) DEFAULT NULL,
  `length` decimal(10,3) DEFAULT NULL,
  `width` decimal(10,3) DEFAULT NULL,
  `height` decimal(10,3) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `autopsy_part_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `severity` text,
  PRIMARY KEY (`id`),
  KEY `FK_autopsy_row_1` (`autopsy_note_id`),
  KEY `Index_4` (`type`),
  KEY `macromicro_rows` (`autopsy_part_id`,`type`),
  KEY `part_index` (`autopsy_part_id`),
  CONSTRAINT `FK_autopsy_row_1` FOREIGN KEY (`autopsy_note_id`) REFERENCES `autopsy_note` (`id`),
  CONSTRAINT `FK_autopsy_row_2` FOREIGN KEY (`autopsy_part_id`) REFERENCES `autopsy_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=906 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; (`autopsy_part_id`) REFER `mgg2/autop';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bird`
--

DROP TABLE IF EXISTS `bird`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bird` (
  `accession_id` int(11) unsigned NOT NULL DEFAULT '0',
  `nourishment_id` int(11) unsigned DEFAULT NULL,
  `gender_id` int(11) unsigned DEFAULT NULL,
  `liverweight` decimal(11,3) DEFAULT NULL COMMENT 'grams',
  `totallength` decimal(10,3) DEFAULT NULL,
  `xrays` date DEFAULT NULL,
  `svanumber` varchar(50) DEFAULT NULL,
  `ringnumber` varchar(50) DEFAULT NULL COMMENT 'integer?',
  `fieldnumber` varchar(50) DEFAULT NULL,
  `othernumber` varchar(50) DEFAULT NULL,
  `autopsy_date` date DEFAULT NULL,
  `autopsy` int(1) DEFAULT NULL,
  `xray` int(1) DEFAULT NULL,
  `decay_id` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accession_id`),
  KEY `biracc_idx` (`accession_id`),
  KEY `birnrsh_idx` (`nourishment_id`),
  KEY `birgender_idx` (`gender_id`),
  KEY `bird_decay_id` (`decay_id`),
  KEY `autopsy_index` (`autopsy`),
  CONSTRAINT `bird_decay_fk` FOREIGN KEY (`decay_id`) REFERENCES `decay` (`id`),
  CONSTRAINT `bird_fk` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bird_fk1` FOREIGN KEY (`nourishment_id`) REFERENCES `nourishment` (`id`),
  CONSTRAINT `bird_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cause_of_death`
--

DROP TABLE IF EXISTS `cause_of_death`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cause_of_death` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clam`
--

DROP TABLE IF EXISTS `clam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clam` (
  `accession_id` int(10) unsigned NOT NULL DEFAULT '0',
  `length` decimal(10,3) DEFAULT '0.000',
  `width` decimal(10,3) DEFAULT '0.000',
  `wet_weight` decimal(10,3) DEFAULT '0.000',
  `dry_weight` decimal(10,3) DEFAULT '0.000',
  `shell_weight` decimal(10,3) DEFAULT '0.000',
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accession_id`),
  KEY `Index_2` (`length`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coast`
--

DROP TABLE IF EXISTS `coast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coast` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) DEFAULT NULL,
  `swe_name` varchar(30) DEFAULT NULL,
  `eng_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coordinate_precision`
--

DROP TABLE IF EXISTS `coordinate_precision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinate_precision` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(3) DEFAULT NULL,
  `swe_name` varchar(255) DEFAULT NULL,
  `eng_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(11) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`swe_name`),
  KEY `FK_country_1` (`created_by`),
  KEY `FK_country_2` (`updated_by`),
  CONSTRAINT `FK_country_1` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_country_2` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=735 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `county` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) DEFAULT NULL,
  `swe_name` varchar(30) DEFAULT NULL,
  `eng_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decay`
--

DROP TABLE IF EXISTS `decay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decay` (
  `id` char(1) NOT NULL DEFAULT '',
  `swe_name` varchar(20) DEFAULT NULL,
  `eng_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_id` (`id`),
  UNIQUE KEY `swename_idx` (`swe_name`),
  KEY `Index_2` (`swe_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discovery`
--

DROP TABLE IF EXISTS `discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discovery` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `code` char(1) NOT NULL DEFAULT '',
  `swe_name` varchar(35) DEFAULT NULL,
  `eng_name` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disease` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `egg`
--

DROP TABLE IF EXISTS `egg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egg` (
  `accession_id` int(10) unsigned NOT NULL DEFAULT '0',
  `length` decimal(10,3) DEFAULT NULL,
  `width` decimal(10,3) DEFAULT NULL,
  `weight` decimal(10,3) DEFAULT NULL,
  `field_number` varchar(45) DEFAULT NULL,
  `shell_thickness1` decimal(10,3) DEFAULT NULL,
  `shell_thickness2` decimal(10,3) DEFAULT NULL,
  `shell_thickness3` decimal(10,3) DEFAULT NULL,
  `shell_index` decimal(10,3) DEFAULT NULL,
  `embryo_weight` decimal(10,3) DEFAULT NULL,
  `embryo_length` decimal(10,3) DEFAULT NULL,
  `embryo` int(1) unsigned DEFAULT NULL,
  `hatch_egg_count` int(10) unsigned DEFAULT NULL,
  `hatch_chick_count` int(10) unsigned DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `hatch_note` varchar(50) DEFAULT NULL,
  `egg_sent_material` int(10) unsigned DEFAULT NULL,
  `hinna` decimal(10,3) DEFAULT NULL,
  `content` text,
  `decay_id` char(1) DEFAULT NULL,
  PRIMARY KEY (`accession_id`),
  KEY `FK_egg_2` (`egg_sent_material`),
  KEY `decay_index` (`decay_id`),
  CONSTRAINT `FK_egg_1` FOREIGN KEY (`egg_sent_material`) REFERENCES `sent_material_egg` (`id`),
  CONSTRAINT `egg_ibfk_1` FOREIGN KEY (`decay_id`) REFERENCES `decay` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fish`
--

DROP TABLE IF EXISTS `fish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fish` (
  `accession_id` int(11) unsigned NOT NULL DEFAULT '0',
  `nourishment_id` int(11) unsigned DEFAULT NULL,
  `gender_id` int(11) unsigned DEFAULT NULL,
  `liverweight` decimal(11,3) DEFAULT NULL COMMENT 'grams',
  `totallength` decimal(10,3) DEFAULT NULL,
  `decay_id` char(1) NOT NULL DEFAULT '0',
  `reproduction_phase_id` int(10) unsigned NOT NULL DEFAULT '1',
  `othernumber` varchar(45) DEFAULT '',
  `bodylength` decimal(11,3) DEFAULT NULL,
  `gonadweight` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`accession_id`),
  KEY `fbiracc_idx` (`accession_id`),
  KEY `fbirnrsh_idx` (`nourishment_id`),
  KEY `fbirgender_idx` (`gender_id`),
  KEY `fbird_decay_id` (`decay_id`),
  KEY `fish_repro_fk` (`reproduction_phase_id`),
  CONSTRAINT `fish_decay_fk` FOREIGN KEY (`decay_id`) REFERENCES `decay` (`id`),
  CONSTRAINT `fish_fk` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fish_fk1` FOREIGN KEY (`nourishment_id`) REFERENCES `nourishment` (`id`),
  CONSTRAINT `fish_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fish_repro_fk` FOREIGN KEY (`reproduction_phase_id`) REFERENCES `reproduction_phase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL DEFAULT '',
  `swe_name` varchar(15) DEFAULT NULL,
  `eng_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Index_3` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accession_id` int(10) unsigned DEFAULT NULL,
  `age_protocoll_id` int(10) unsigned DEFAULT NULL,
  `autopsy_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL DEFAULT '',
  `comments` varchar(128) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `thumbnail` blob,
  `img_type_id` int(10) unsigned DEFAULT NULL,
  `data` longblob,
  `img_assoc_id` int(11) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `photographer` varchar(60) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`name`),
  KEY `Index_4` (`comments`),
  KEY `FK__1` (`accession_id`),
  KEY `FK__2` (`age_protocoll_id`),
  KEY `FK_image_3` (`img_type_id`),
  KEY `FK_image_5` (`img_assoc_id`),
  KEY `associated` (`img_assoc_id`,`accession_id`),
  KEY `creator_index` (`created_by`),
  KEY `updater_index` (`updated_by`),
  KEY `autopsy_index` (`autopsy_id`),
  KEY `photographer_index` (`photographer`),
  KEY `descr_index` (`description`),
  CONSTRAINT `FK__1` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `FK__2` FOREIGN KEY (`age_protocoll_id`) REFERENCES `agerecord` (`id`),
  CONSTRAINT `FK_image_3` FOREIGN KEY (`img_type_id`) REFERENCES `img_type` (`id`),
  CONSTRAINT `FK_image_5` FOREIGN KEY (`img_assoc_id`) REFERENCES `img_assoc` (`id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`) ON DELETE SET NULL,
  CONSTRAINT `image_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`) ON DELETE SET NULL,
  CONSTRAINT `image_ibfk_3` FOREIGN KEY (`autopsy_id`) REFERENCES `autopsy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `img_assoc`
--

DROP TABLE IF EXISTS `img_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_assoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `img_type`
--

DROP TABLE IF EXISTS `img_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locality` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `county_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province_id` smallint(5) unsigned NOT NULL DEFAULT '999',
  `coast_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `country_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `closecity` varchar(255) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '4',
  `updated_by` int(10) unsigned DEFAULT NULL,
  `note` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `import_idx` (`county_id`,`province_id`,`coast_id`,`country_id`,`name`,`closecity`),
  KEY `FK_locality_1` (`county_id`),
  KEY `FK_locality_2` (`province_id`),
  KEY `FK_locality_3` (`coast_id`),
  KEY `FK_locality_4` (`created_by`),
  KEY `FK_locality_5` (`updated_by`),
  KEY `FK_locality_6` (`country_id`),
  CONSTRAINT `FK_locality_3` FOREIGN KEY (`coast_id`) REFERENCES `coast` (`id`),
  CONSTRAINT `FK_locality_4` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_locality_5` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_locality_6` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `locality_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `locality_ibfk_2` FOREIGN KEY (`county_id`) REFERENCES `county` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2925 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 3072 kB; ("countyid") REFER "mgg2/county"("id")';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mammal`
--

DROP TABLE IF EXISTS `mammal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mammal` (
  `accession_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked to accession.id',
  `nourishment_id` int(10) unsigned DEFAULT NULL,
  `gender_id` int(10) unsigned DEFAULT NULL,
  `rearfoot_length` decimal(10,3) DEFAULT NULL,
  `tail_length` decimal(10,3) DEFAULT NULL,
  `fat_neck_ventral` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) hals, ventralt:',
  `fat_breast_ventral` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) bröst, ventralt:',
  `fat_abdomen_ventral` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) buk, ventralt:',
  `fat_hip_ventral` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) höft, ventralt:',
  `fat_neck_right` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) hals, H sida:',
  `fat_breast_right` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) bröst, H sida:',
  `fat_abdomen_right` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) buk, H sida:',
  `fat_hip_right` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) höft, H sida:',
  `fat_neck_back` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) hals, rygg:',
  `fat_breast_back` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) bröst, rygg:',
  `fat_abdomen_back` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) buk, rygg:',
  `fat_hip_back` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) höft, rygg:',
  `fat` decimal(10,3) DEFAULT NULL COMMENT 'Späcktjocklek (cm) ej sp.',
  `circumference_neck` decimal(10,3) DEFAULT NULL COMMENT 'Omkrets (cm) hals:',
  `circumference_breast` decimal(10,3) DEFAULT NULL COMMENT 'Omkrets (cm) bröst:',
  `circumference_abdomen` decimal(10,3) DEFAULT NULL COMMENT 'Omkrets (cm) buk:',
  `circumference_hip` decimal(10,3) DEFAULT NULL COMMENT 'Omkrets (cm) höft:',
  `autopsy_date` date DEFAULT NULL,
  `autopsy_journal` varchar(255) DEFAULT NULL,
  `autopsy_journal_old` varchar(255) DEFAULT NULL,
  `autopsy` int(1) unsigned DEFAULT '0',
  `birth_year` int(10) unsigned DEFAULT NULL,
  `svanumber` varchar(255) DEFAULT NULL,
  `decay_id` char(1) DEFAULT '0',
  `xrays` date DEFAULT NULL,
  `xray` int(1) unsigned DEFAULT NULL,
  `fieldnumber` varchar(255) DEFAULT NULL,
  `othernumber` varchar(255) DEFAULT NULL,
  `sent_material_id` int(10) unsigned DEFAULT '0',
  `liverweight` decimal(10,3) DEFAULT NULL,
  `totallength` decimal(10,3) DEFAULT NULL,
  `anus` decimal(10,3) DEFAULT NULL COMMENT 'Anus/genit. öppning (cm)',
  PRIMARY KEY (`accession_id`),
  KEY `mammal_nourishment` (`nourishment_id`),
  KEY `mammal_gender` (`gender_id`),
  KEY `mammal_decay` (`decay_id`),
  KEY `mammal_sent_material` (`sent_material_id`),
  KEY `autopsy_index` (`autopsy`),
  CONSTRAINT `mammal_decay` FOREIGN KEY (`decay_id`) REFERENCES `decay` (`id`),
  CONSTRAINT `mammal_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `mammal_nourishment` FOREIGN KEY (`nourishment_id`) REFERENCES `nourishment` (`id`),
  CONSTRAINT `mammal_sent_material` FOREIGN KEY (`sent_material_id`) REFERENCES `sent_material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for the mammal specific data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accession_id` int(11) unsigned NOT NULL DEFAULT '0',
  `material_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `amount_original` decimal(11,3) DEFAULT '0.000',
  `amount_left` decimal(11,3) DEFAULT '0.000',
  `storage_id` int(10) unsigned DEFAULT '0',
  `storage_type_id` int(11) unsigned DEFAULT NULL,
  `storage_note` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(11) unsigned DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `accession_id` (`accession_id`),
  KEY `material_type_id` (`material_type_id`),
  KEY `storage_type_id` (`storage_type_id`),
  KEY `FK_material_3` (`created_by`),
  KEY `FK_material_4` (`updated_by`),
  KEY `Index_8` (`accession_id`,`material_type_id`,`amount_original`,`storage_id`,`storage_type_id`),
  KEY `acc_store` (`accession_id`,`storage_id`),
  CONSTRAINT `FK_material_3` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_material_4` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`),
  CONSTRAINT `material_fk` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `material_fk1` FOREIGN KEY (`material_type_id`) REFERENCES `material_type` (`id`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`storage_type_id`) REFERENCES `material_storage` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=433029 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material_storage`
--

DROP TABLE IF EXISTS `material_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_storage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '""',
  `sortbyme` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sortby_index` (`sortbyme`),
  KEY `Index_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material_type`
--

DROP TABLE IF EXISTS `material_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_type` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `code` char(3) DEFAULT NULL,
  `swe_name` varchar(25) DEFAULT NULL,
  `eng_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Index_3` (`swe_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nourishment`
--

DROP TABLE IF EXISTS `nourishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nourishment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(1) NOT NULL DEFAULT '',
  `swe_name` varchar(255) DEFAULT NULL,
  `eng_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Index_3` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organs`
--

DROP TABLE IF EXISTS `organs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organs` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `swe_name` varchar(15) DEFAULT NULL,
  `eng_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postnumber` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `note` text,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `rights` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(11) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `import_idx` (`firstname`,`lastname`,`address`,`postnumber`,`town`,`institution`),
  KEY `username_password` (`username`,`password`),
  KEY `firstname_lastname` (`firstname`,`lastname`),
  KEY `FK_person_1` (`created_by`),
  KEY `FK_person_2` (`updated_by`),
  KEY `Index_6` (`firstname`,`lastname`,`address`,`postnumber`,`town`),
  KEY `Index_7` (`institution`,`town`),
  CONSTRAINT `FK_person_1` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_person_2` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4160 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; ("detail_id") REFER "mgg2/person_deta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '""',
  `number` varchar(255) DEFAULT NULL,
  `contact_id` int(11) unsigned NOT NULL DEFAULT '0',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `finished` int(1) DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(11) unsigned DEFAULT NULL,
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `analysis_project` int(1) NOT NULL DEFAULT '0' COMMENT 'Om 1, visa projektet i provberedningsprotokollet',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `import_idx` (`name`,`number`),
  KEY `contact_id` (`contact_id`),
  KEY `FK_project_2` (`created_by`),
  KEY `FK_project_3` (`updated_by`),
  KEY `FK_project_4` (`catalog_id`),
  KEY `idx_analysis_project` (`analysis_project`,`catalog_id`) USING BTREE,
  KEY `analysis_project_index` (`analysis_project`),
  KEY `finished_index` (`finished`),
  KEY `idx_finished` (`finished`,`catalog_id`) USING BTREE,
  CONSTRAINT `FK_project_2` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_project_3` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_project_4` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `project_fk` FOREIGN KEY (`contact_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) DEFAULT NULL,
  `swe_name` varchar(30) DEFAULT NULL,
  `eng_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_querys_person` (`person_id`),
  CONSTRAINT `FK_querys_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reproduction_phase`
--

DROP TABLE IF EXISTS `reproduction_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reproduction_phase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `swe_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_swe_name` (`swe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sent_material`
--

DROP TABLE IF EXISTS `sent_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sent_material` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sent_material_egg`
--

DROP TABLE IF EXISTS `sent_material_egg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sent_material_egg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`),
  UNIQUE KEY `id_idx` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `swe_name` varchar(40) DEFAULT NULL,
  `eng_name` varchar(40) DEFAULT NULL,
  `type` char(2) DEFAULT NULL,
  `lat_name` varchar(40) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT '4',
  `updated_by` int(10) unsigned DEFAULT NULL,
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`swe_name`),
  KEY `FK_species_1` (`created_by`),
  KEY `FK_species_2` (`updated_by`),
  KEY `FK_species_3` (`catalog_id`),
  CONSTRAINT `FK_species_1` FOREIGN KEY (`created_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_species_2` FOREIGN KEY (`updated_by`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_species_3` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=838 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specimen`
--

DROP TABLE IF EXISTS `specimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specimen` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `note` text,
  `storagenote` text,
  `deathdate_start` date DEFAULT NULL,
  `deathdate_end` date DEFAULT NULL,
  `age_type_id` int(11) unsigned DEFAULT NULL,
  `age_start` int(11) DEFAULT NULL,
  `age_end` int(11) DEFAULT NULL,
  `weight` decimal(11,3) DEFAULT '0.000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `age_id` (`age_type_id`),
  CONSTRAINT `FK_specimen_acc` FOREIGN KEY (`id`) REFERENCES `accession` (`id`),
  CONSTRAINT `specimen_ibfk_1` FOREIGN KEY (`age_type_id`) REFERENCES `age` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02 10:20:00
