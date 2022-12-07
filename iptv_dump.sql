-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: xtream_iptvpro
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-1:10.5.18+maria~ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `xtream_iptvpro`
--

-- CREATE DATABASE /*!32312 IF NOT EXISTS*/ `xtream_iptvpro` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

-- USE `xtream_iptvpro`;

--
-- Table structure for table `access_output`
--

DROP TABLE IF EXISTS `access_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_output` (
  `access_output_id` int(11) NOT NULL AUTO_INCREMENT,
  `output_name` varchar(255) NOT NULL,
  `output_key` varchar(255) NOT NULL,
  `output_ext` varchar(255) NOT NULL,
  PRIMARY KEY (`access_output_id`),
  KEY `output_key` (`output_key`),
  KEY `output_ext` (`output_ext`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_output`
--

LOCK TABLES `access_output` WRITE;
/*!40000 ALTER TABLE `access_output` DISABLE KEYS */;
INSERT INTO `access_output` VALUES (1,'HLS','m3u8','m3u8'),(2,'MPEGTS','ts','ts'),(3,'RTMP','rtmp','');
/*!40000 ALTER TABLE `access_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_settings`
--

DROP TABLE IF EXISTS `admin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_settings` (
  `type` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(4096) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_settings`
--

LOCK TABLES `admin_settings` WRITE;
/*!40000 ALTER TABLE `admin_settings` DISABLE KEYS */;
INSERT INTO `admin_settings` VALUES ('auto_refresh','1'),('cc_time','1670076305'),('stats_pid','38602'),('tmdb_pid','38592'),('watch_pid','38607');
/*!40000 ALTER TABLE `admin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_ips`
--

DROP TABLE IF EXISTS `blocked_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) NOT NULL,
  `notes` mediumtext NOT NULL,
  `date` int(11) NOT NULL,
  `attempts_blocked` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_2` (`ip`),
  UNIQUE KEY `ip_3` (`ip`),
  KEY `ip` (`ip`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_ips`
--

LOCK TABLES `blocked_ips` WRITE;
/*!40000 ALTER TABLE `blocked_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocked_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_user_agents`
--

DROP TABLE IF EXISTS `blocked_user_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_user_agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `exact_match` int(11) NOT NULL DEFAULT 0,
  `attempts_blocked` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `exact_match` (`exact_match`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_user_agents`
--

LOCK TABLES `blocked_user_agents` WRITE;
/*!40000 ALTER TABLE `blocked_user_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocked_user_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bouquets`
--

DROP TABLE IF EXISTS `bouquets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bouquets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bouquet_name` mediumtext NOT NULL,
  `bouquet_channels` mediumtext NOT NULL,
  `bouquet_series` mediumtext NOT NULL,
  `bouquet_order` int(16) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bouquets`
--

LOCK TABLES `bouquets` WRITE;
/*!40000 ALTER TABLE `bouquets` DISABLE KEYS */;
/*!40000 ALTER TABLE `bouquets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_logs`
--

DROP TABLE IF EXISTS `client_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_status` varchar(255) NOT NULL,
  `query_string` mediumtext NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `extra_data` mediumtext NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_id` (`stream_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_logs`
--

LOCK TABLES `client_logs` WRITE;
/*!40000 ALTER TABLE `client_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `created`
--

DROP TABLE IF EXISTS `created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `created` (
  `id` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `stream_display_name` tinyint(4) NOT NULL,
  `stream_source` tinyint(4) NOT NULL,
  `stream_icon` tinyint(4) NOT NULL,
  `notes` tinyint(4) NOT NULL,
  `created_channel_location` tinyint(4) NOT NULL,
  `enable_transcode` tinyint(4) NOT NULL,
  `transcode_attributes` tinyint(4) NOT NULL,
  `custom_ffmpeg` tinyint(4) NOT NULL,
  `movie_propeties` tinyint(4) NOT NULL,
  `movie_subtitles` tinyint(4) NOT NULL,
  `read_native` tinyint(4) NOT NULL,
  `target_container` tinyint(4) NOT NULL,
  `stream_all` tinyint(4) NOT NULL,
  `remove_subtitles` tinyint(4) NOT NULL,
  `custom_sid` tinyint(4) NOT NULL,
  `epg_id` tinyint(4) NOT NULL,
  `channel_id` tinyint(4) NOT NULL,
  `epg_lang` tinyint(4) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `auto_restart` tinyint(4) NOT NULL,
  `transcode_profile_id` tinyint(4) NOT NULL,
  `pids_create_channel` tinyint(4) NOT NULL,
  `cchannel_rsources` tinyint(4) NOT NULL,
  `gen_timestamps` tinyint(4) NOT NULL,
  `added` tinyint(4) NOT NULL,
  `series_no` tinyint(4) NOT NULL,
  `direct_source` tinyint(4) NOT NULL,
  `tv_archive_duration` tinyint(4) NOT NULL,
  `tv_archive_server_id` tinyint(4) NOT NULL,
  `tv_archive_pid` tinyint(4) NOT NULL,
  `movie_symlink` tinyint(4) NOT NULL,
  `redirect_stream` tinyint(4) NOT NULL,
  `rtmp_output` tinyint(4) NOT NULL,
  `number` tinyint(4) NOT NULL,
  `allow_record` tinyint(4) NOT NULL,
  `probesize_ondemand` tinyint(4) NOT NULL,
  `custom_map` tinyint(4) NOT NULL,
  `external_push` tinyint(4) NOT NULL,
  `delay_minutes` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `created`
--

LOCK TABLES `created` WRITE;
/*!40000 ALTER TABLE `created` DISABLE KEYS */;
/*!40000 ALTER TABLE `created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits_log`
--

DROP TABLE IF EXISTS `credits_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` int(11) NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits_log`
--

LOCK TABLES `credits_log` WRITE;
/*!40000 ALTER TABLE `credits_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `credits_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronjobs`
--

DROP TABLE IF EXISTS `cronjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `filename` varchar(255) NOT NULL,
  `run_per_mins` int(11) NOT NULL DEFAULT 1,
  `run_per_hours` int(11) NOT NULL DEFAULT 0,
  `enabled` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronjobs`
--

LOCK TABLES `cronjobs` WRITE;
/*!40000 ALTER TABLE `cronjobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_statistics`
--

DROP TABLE IF EXISTS `dashboard_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL DEFAULT '',
  `time` int(16) NOT NULL DEFAULT 0,
  `count` int(16) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_statistics`
--

LOCK TABLES `dashboard_statistics` WRITE;
/*!40000 ALTER TABLE `dashboard_statistics` DISABLE KEYS */;
INSERT INTO `dashboard_statistics` VALUES (1,'conns',1670014951,0),(2,'users',1670014951,0);
/*!40000 ALTER TABLE `dashboard_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) NOT NULL,
  `device_key` varchar(255) NOT NULL,
  `device_filename` varchar(255) NOT NULL,
  `device_header` mediumtext NOT NULL,
  `device_conf` mediumtext NOT NULL,
  `device_footer` mediumtext NOT NULL,
  `default_output` int(11) NOT NULL DEFAULT 0,
  `copy_text` mediumtext DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  KEY `device_key` (`device_key`),
  KEY `default_output` (`default_output`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'GigaBlue','gigablue','userbouquet.favourites.tv','#NAME {BOUQUET_NAME}','#SERVICE 4097:0:1:0:0:0:0:0:0:0:{URL#:}\r\n#DESCRIPTION {CHANNEL_NAME}','',2,NULL),(2,'Enigma 2 OE 1.6','enigma16','userbouquet.favourites.tv','#NAME {BOUQUET_NAME}','#SERVICE 4097{SID}{URL#:}\r\n#DESCRIPTION {CHANNEL_NAME}','',2,NULL),(3,'DreamBox OE 2.0','dreambox','userbouquet.favourites.tv','#NAME {BOUQUET_NAME}','#SERVICE {ESR_ID}{SID}{URL#:}\r\n#DESCRIPTION {CHANNEL_NAME}','',2,NULL),(4,'m3u','m3u','tv_channels_{USERNAME}.m3u','#EXTM3U','#EXTINF:-1,{CHANNEL_NAME}\r\n{URL}','',2,NULL),(5,'Simple List','simple','simple_{USERNAME}.txt','','{URL} #Name: {CHANNEL_NAME}','',2,NULL),(6,'Octagon','octagon','internettv.feed','','[TITLE]\r\n{CHANNEL_NAME}\r\n[URL]\r\n{URL}\r\n[DESCRIPTION]\r\nIPTV\r\n[TYPE]\r\nLive','',2,NULL),(7,'Starlive v3/StarSat HD6060/AZclass','starlivev3','iptvlist.txt','','{CHANNEL_NAME},{URL}','',2,NULL),(8,'MediaStar / StarLive v4','mediastar','tvlist.txt','','{CHANNEL_NAME} {URL}','',2,NULL),(9,'Enigma 2 OE 1.6 Auto Script','enigma216_script','iptv.sh','USERNAME=\"{USERNAME}\";PASSWORD=\"{PASSWORD}\";bouquet=\"{BOUQUET_NAME}\";directory=\"/etc/enigma2/iptv.sh\";url=\"{SERVER_URL}get.php?username=$USERNAME&password=$PASSWORD&type=enigma16&output={OUTPUT_KEY}\";rm /etc/enigma2/userbouquet.\"$bouquet\"__tv_.tv;wget -O /etc/enigma2/userbouquet.\"$bouquet\"__tv_.tv $url;if ! cat /etc/enigma2/bouquets.tv | grep -v grep | grep -c $bouquet > /dev/null;then echo \"[+]Creating Folder for iptv and rehashing...\";cat /etc/enigma2/bouquets.tv | sed -n 1p > /etc/enigma2/new_bouquets.tv;echo \'#SERVICE 1:7:1:0:0:0:0:0:0:0:FROM BOUQUET \"userbouquet.\'$bouquet\'__tv_.tv\" ORDER BY bouquet\' >> /etc/enigma2/new_bouquets.tv; cat /etc/enigma2/bouquets.tv | sed -n \'2,$p\' >> /etc/enigma2/new_bouquets.tv;rm /etc/enigma2/bouquets.tv;mv /etc/enigma2/new_bouquets.tv /etc/enigma2/bouquets.tv;fi;rm /usr/bin/enigma2_pre_start.sh;echo \"writing to the file.. NO NEED FOR REBOOT\";echo \"/bin/sh \"$directory\" > /dev/null 2>&1 &\" > /usr/bin/enigma2_pre_start.sh;chmod 777 /usr/bin/enigma2_pre_start.sh;wget -qO - \"http://127.0.0.1/web/servicelistreload?mode=2\";wget -qO - \"http://127.0.0.1/web/servicelistreload?mode=2\";','','',2,'wget -O /etc/enigma2/iptv.sh {DEVICE_LINK} && chmod 777 /etc/enigma2/iptv.sh && /etc/enigma2/iptv.sh'),(10,'Enigma 2 OE 2.0 Auto Script','enigma22_script','iptv.sh','USERNAME=\"{USERNAME}\";PASSWORD=\"{PASSWORD}\";bouquet=\"{BOUQUET_NAME}\";directory=\"/etc/enigma2/iptv.sh\";url=\"{SERVER_URL}get.php?username=$USERNAME&password=$PASSWORD&type=dreambox&output={OUTPUT_KEY}\";rm /etc/enigma2/userbouquet.\"$bouquet\"__tv_.tv;wget -O /etc/enigma2/userbouquet.\"$bouquet\"__tv_.tv $url;if ! cat /etc/enigma2/bouquets.tv | grep -v grep | grep -c $bouquet > /dev/null;then echo \"[+]Creating Folder for iptv and rehashing...\";cat /etc/enigma2/bouquets.tv | sed -n 1p > /etc/enigma2/new_bouquets.tv;echo \'#SERVICE 1:7:1:0:0:0:0:0:0:0:FROM BOUQUET \"userbouquet.\'$bouquet\'__tv_.tv\" ORDER BY bouquet\' >> /etc/enigma2/new_bouquets.tv; cat /etc/enigma2/bouquets.tv | sed -n \'2,$p\' >> /etc/enigma2/new_bouquets.tv;rm /etc/enigma2/bouquets.tv;mv /etc/enigma2/new_bouquets.tv /etc/enigma2/bouquets.tv;fi;rm /usr/bin/enigma2_pre_start.sh;echo \"writing to the file.. NO NEED FOR REBOOT\";echo \"/bin/sh \"$directory\" > /dev/null 2>&1 &\" > /usr/bin/enigma2_pre_start.sh;chmod 777 /usr/bin/enigma2_pre_start.sh;wget -qO - \"http://127.0.0.1/web/servicelistreload?mode=2\";wget -qO - \"http://127.0.0.1/web/servicelistreload?mode=2\";','','',2,'wget -O /etc/enigma2/iptv.sh {DEVICE_LINK} && chmod 777 /etc/enigma2/iptv.sh && /etc/enigma2/iptv.sh'),(13,'m3u With Options','m3u_plus','tv_channels_{USERNAME}_plus.m3u','#EXTM3U','#EXTINF:-1 tvg-id=\"{CHANNEL_ID}\" tvg-name=\"{CHANNEL_NAME}\" tvg-logo=\"{CHANNEL_ICON}\" group-title=\"{CATEGORY}\",{CHANNEL_NAME}\r\n{URL}','',2,NULL),(14,'StarLive v5','starlivev5','channel.jason','','','',2,NULL),(15,'WebTV List','webtvlist','webtv list.txt','','Channel name:{CHANNEL_NAME}\r\nURL:{URL}','[Webtv channel END]',2,NULL),(16,'Octagon Auto Script','octagon_script','iptv','USERNAME=\"{USERNAME}\";PASSWORD=\"{PASSWORD}\";url=\"{SERVER_URL}get.php?username=$USERNAME&password=$PASSWORD&type=octagon&output={OUTPUT_KEY}\";rm /var/freetvplus/internettv.feed;wget -O /var/freetvplus/internettv.feed1 $url;chmod 777 /var/freetvplus/internettv.feed1;awk -v BINMODE=3 -v RS=\'(\\r\\n|\\n)\' -v ORS=\'\\n\' \'{ print }\' /var/freetvplus/internettv.feed1 > /var/freetvplus/internettv.feed;rm /var/freetvplus/internettv.feed1','','',2,'wget -qO /var/bin/iptv {DEVICE_LINK}'),(18,'Ariva','ariva','ariva_{USERNAME}.txt','','{CHANNEL_NAME},{URL}','',2,NULL),(19,'Spark','spark','webtv_usr.xml','<?xml version=\"1.0\"?>\r\n<webtvs>','<webtv title=\"{CHANNEL_NAME}\" urlkey=\"0\" url=\"{URL}\" description=\"\" iconsrc=\"{CHANNEL_ICON}\" iconsrc_b=\"\" group=\"0\" type=\"0\" />','</webtvs>',2,NULL),(20,'Geant/Starsat/Tiger/Qmax/Hyper/Royal','gst','{USERNAME}_list.txt','','I: {URL} {CHANNEL_NAME}','',2,NULL),(21,'Fortec999/Prifix9400/Starport','fps','Royal.cfg','','IPTV: { {CHANNEL_NAME} } { {URL} }','',2,NULL),(22,'Revolution 60/60 | Sunplus','revosun','network_iptv.cfg','','IPTV: { {CHANNEL_NAME} } { {URL} }','',2,NULL),(23,'Zorro','zorro','iptv.cfg','<NETDBS_TXT_VER_1>','IPTV: { {CHANNEL_NAME} } { {URL} } -HIDE_URL','',2,NULL);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enigma2_actions`
--

DROP TABLE IF EXISTS `enigma2_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enigma2_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `type` text NOT NULL,
  `key` text NOT NULL,
  `command` text NOT NULL,
  `command2` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enigma2_actions`
--

LOCK TABLES `enigma2_actions` WRITE;
/*!40000 ALTER TABLE `enigma2_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `enigma2_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enigma2_devices`
--

DROP TABLE IF EXISTS `enigma2_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enigma2_devices` (
  `device_id` int(12) NOT NULL AUTO_INCREMENT,
  `mac` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `modem_mac` varchar(255) NOT NULL,
  `local_ip` varchar(255) NOT NULL,
  `public_ip` varchar(255) NOT NULL,
  `key_auth` varchar(255) NOT NULL,
  `enigma_version` varchar(255) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `lversion` text NOT NULL,
  `token` varchar(32) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `watchdog_timeout` int(11) NOT NULL,
  `lock_device` tinyint(4) NOT NULL DEFAULT 0,
  `telnet_enable` tinyint(4) NOT NULL DEFAULT 1,
  `ftp_enable` tinyint(4) NOT NULL DEFAULT 1,
  `ssh_enable` tinyint(4) NOT NULL DEFAULT 1,
  `dns` varchar(255) NOT NULL,
  `original_mac` varchar(255) NOT NULL,
  `rc` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`device_id`),
  KEY `mac` (`mac`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enigma2_devices`
--

LOCK TABLES `enigma2_devices` WRITE;
/*!40000 ALTER TABLE `enigma2_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `enigma2_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enigma2_failed`
--

DROP TABLE IF EXISTS `enigma2_failed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enigma2_failed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_mac` varchar(255) NOT NULL,
  `virtual_mac` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `original_mac` (`original_mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enigma2_failed`
--

LOCK TABLES `enigma2_failed` WRITE;
/*!40000 ALTER TABLE `enigma2_failed` DISABLE KEYS */;
/*!40000 ALTER TABLE `enigma2_failed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epg`
--

DROP TABLE IF EXISTS `epg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epg_name` varchar(255) NOT NULL,
  `epg_file` varchar(300) NOT NULL,
  `integrity` varchar(255) DEFAULT NULL,
  `last_updated` int(11) DEFAULT NULL,
  `days_keep` int(11) NOT NULL DEFAULT 7,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epg`
--

LOCK TABLES `epg` WRITE;
/*!40000 ALTER TABLE `epg` DISABLE KEYS */;
/*!40000 ALTER TABLE `epg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epg_data`
--

DROP TABLE IF EXISTS `epg_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epg_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epg_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `epg_id` (`epg_id`),
  KEY `start` (`start`),
  KEY `end` (`end`),
  KEY `lang` (`lang`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epg_data`
--

LOCK TABLES `epg_data` WRITE;
/*!40000 ALTER TABLE `epg_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `epg_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isp_addon`
--

DROP TABLE IF EXISTS `isp_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isp_addon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isp` text NOT NULL,
  `blocked` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isp_addon`
--

LOCK TABLES `isp_addon` WRITE;
/*!40000 ALTER TABLE `isp_addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `isp_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licence`
--

DROP TABLE IF EXISTS `licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_key` varchar(29) NOT NULL,
  `show_message` tinyint(4) NOT NULL,
  `update_available` int(11) NOT NULL DEFAULT 0,
  `reshare_deny_addon` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence`
--

LOCK TABLES `licence` WRITE;
/*!40000 ALTER TABLE `licence` DISABLE KEYS */;
/*!40000 ALTER TABLE `licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_flood`
--

DROP TABLE IF EXISTS `login_flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_flood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL DEFAULT '',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `dateadded` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_flood`
--

LOCK TABLES `login_flood` WRITE;
/*!40000 ALTER TABLE `login_flood` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_flood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_logs`
--

LOCK TABLES `login_logs` WRITE;
/*!40000 ALTER TABLE `login_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mag_claims`
--

DROP TABLE IF EXISTS `mag_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mag_claims` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mag_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `real_type` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mag_id` (`mag_id`),
  KEY `stream_id` (`stream_id`),
  KEY `real_type` (`real_type`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mag_claims`
--

LOCK TABLES `mag_claims` WRITE;
/*!40000 ALTER TABLE `mag_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `mag_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mag_devices`
--

DROP TABLE IF EXISTS `mag_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mag_devices` (
  `mag_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bright` int(10) NOT NULL DEFAULT 200,
  `contrast` int(10) NOT NULL DEFAULT 127,
  `saturation` int(10) NOT NULL DEFAULT 127,
  `aspect` mediumtext NOT NULL,
  `video_out` varchar(20) NOT NULL DEFAULT 'rca',
  `volume` int(5) NOT NULL DEFAULT 50,
  `playback_buffer_bytes` int(50) NOT NULL DEFAULT 0,
  `playback_buffer_size` int(50) NOT NULL DEFAULT 0,
  `audio_out` int(5) NOT NULL DEFAULT 1,
  `mac` varchar(50) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `ls` varchar(20) DEFAULT NULL,
  `ver` varchar(300) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `locale` varchar(30) NOT NULL DEFAULT 'en_GB.utf8',
  `city_id` int(11) DEFAULT 0,
  `hd` int(10) NOT NULL DEFAULT 1,
  `main_notify` int(5) NOT NULL DEFAULT 1,
  `fav_itv_on` int(5) NOT NULL DEFAULT 0,
  `now_playing_start` int(50) DEFAULT NULL,
  `now_playing_type` int(11) NOT NULL DEFAULT 0,
  `now_playing_content` varchar(50) DEFAULT NULL,
  `time_last_play_tv` int(50) DEFAULT NULL,
  `time_last_play_video` int(50) DEFAULT NULL,
  `hd_content` int(11) NOT NULL DEFAULT 1,
  `image_version` varchar(350) DEFAULT NULL,
  `last_change_status` int(11) DEFAULT NULL,
  `last_start` int(11) DEFAULT NULL,
  `last_active` int(11) DEFAULT NULL,
  `keep_alive` int(11) DEFAULT NULL,
  `playback_limit` int(11) NOT NULL DEFAULT 3,
  `screensaver_delay` int(11) NOT NULL DEFAULT 10,
  `stb_type` varchar(20) NOT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `last_watchdog` int(50) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `country` varchar(5) DEFAULT NULL,
  `plasma_saving` int(11) NOT NULL DEFAULT 0,
  `ts_enabled` int(11) DEFAULT 0,
  `ts_enable_icon` int(11) NOT NULL DEFAULT 1,
  `ts_path` varchar(35) DEFAULT NULL,
  `ts_max_length` int(11) NOT NULL DEFAULT 3600,
  `ts_buffer_use` varchar(15) NOT NULL DEFAULT 'cyclic',
  `ts_action_on_exit` varchar(20) NOT NULL DEFAULT 'no_save',
  `ts_delay` varchar(20) NOT NULL DEFAULT 'on_pause',
  `video_clock` varchar(10) NOT NULL DEFAULT 'Off',
  `rtsp_type` int(11) NOT NULL DEFAULT 4,
  `rtsp_flags` int(11) NOT NULL DEFAULT 0,
  `stb_lang` varchar(15) NOT NULL DEFAULT 'en',
  `display_menu_after_loading` int(11) NOT NULL DEFAULT 1,
  `record_max_length` int(11) NOT NULL DEFAULT 180,
  `plasma_saving_timeout` int(11) NOT NULL DEFAULT 600,
  `now_playing_link_id` int(11) DEFAULT NULL,
  `now_playing_streamer_id` int(11) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `device_id2` varchar(255) DEFAULT NULL,
  `hw_version` varchar(255) DEFAULT NULL,
  `parent_password` varchar(20) NOT NULL DEFAULT '0000',
  `spdif_mode` int(11) NOT NULL DEFAULT 1,
  `show_after_loading` varchar(60) NOT NULL DEFAULT 'main_menu',
  `play_in_preview_by_ok` int(11) NOT NULL DEFAULT 1,
  `hdmi_event_reaction` int(11) NOT NULL DEFAULT 1,
  `mag_player` varchar(20) DEFAULT 'ffmpeg',
  `play_in_preview_only_by_ok` varchar(10) NOT NULL DEFAULT 'true',
  `watchdog_timeout` int(11) NOT NULL,
  `fav_channels` mediumtext NOT NULL,
  `tv_archive_continued` mediumtext NOT NULL,
  `tv_channel_default_aspect` varchar(255) NOT NULL DEFAULT 'fit',
  `last_itv_id` int(11) NOT NULL DEFAULT 0,
  `units` varchar(20) DEFAULT 'metric',
  `token` varchar(32) DEFAULT '',
  `lock_device` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mag_id`),
  KEY `user_id` (`user_id`),
  KEY `mac` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mag_devices`
--

LOCK TABLES `mag_devices` WRITE;
/*!40000 ALTER TABLE `mag_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mag_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mag_events`
--

DROP TABLE IF EXISTS `mag_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mag_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `mag_device_id` int(11) NOT NULL,
  `event` varchar(20) NOT NULL,
  `need_confirm` tinyint(3) NOT NULL DEFAULT 0,
  `msg` mediumtext NOT NULL,
  `reboot_after_ok` tinyint(3) NOT NULL DEFAULT 0,
  `auto_hide_timeout` tinyint(3) DEFAULT 0,
  `send_time` int(50) NOT NULL,
  `additional_services_on` tinyint(3) NOT NULL DEFAULT 1,
  `anec` tinyint(3) NOT NULL DEFAULT 0,
  `vclub` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `mag_device_id` (`mag_device_id`),
  KEY `event` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mag_events`
--

LOCK TABLES `mag_events` WRITE;
/*!40000 ALTER TABLE `mag_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mag_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mag_logs`
--

DROP TABLE IF EXISTS `mag_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mag_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mag_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mag_id` (`mag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mag_logs`
--

LOCK TABLES `mag_logs` WRITE;
/*!40000 ALTER TABLE `mag_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mag_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_groups`
--

DROP TABLE IF EXISTS `member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` mediumtext NOT NULL,
  `group_color` varchar(7) NOT NULL DEFAULT '#000000',
  `is_banned` tinyint(4) NOT NULL DEFAULT 0,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `is_reseller` tinyint(4) NOT NULL,
  `total_allowed_gen_trials` int(11) NOT NULL DEFAULT 0,
  `total_allowed_gen_in` varchar(255) NOT NULL,
  `delete_users` tinyint(4) NOT NULL DEFAULT 0,
  `allowed_pages` text NOT NULL,
  `can_delete` tinyint(4) NOT NULL DEFAULT 1,
  `reseller_force_server` tinyint(4) NOT NULL DEFAULT 0,
  `create_sub_resellers_price` float NOT NULL DEFAULT 0,
  `create_sub_resellers` tinyint(4) NOT NULL DEFAULT 0,
  `alter_packages_ids` tinyint(4) NOT NULL DEFAULT 0,
  `alter_packages_prices` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_client_connection_logs` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_assign_pass` tinyint(4) NOT NULL DEFAULT 0,
  `allow_change_pass` tinyint(4) NOT NULL DEFAULT 0,
  `allow_import` tinyint(4) NOT NULL DEFAULT 0,
  `allow_export` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_trial_credit_allow` int(11) NOT NULL DEFAULT 0,
  `edit_mac` tinyint(4) NOT NULL DEFAULT 0,
  `edit_isplock` tinyint(4) NOT NULL DEFAULT 0,
  `reset_stb_data` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_bonus_package_inc` tinyint(4) NOT NULL DEFAULT 0,
  `allow_download` tinyint(4) NOT NULL DEFAULT 1,
  `minimum_trial_credits` int(16) NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`),
  KEY `is_admin` (`is_admin`),
  KEY `is_banned` (`is_banned`),
  KEY `is_reseller` (`is_reseller`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_groups`
--

LOCK TABLES `member_groups` WRITE;
/*!40000 ALTER TABLE `member_groups` DISABLE KEYS */;
INSERT INTO `member_groups` VALUES (1,'Channel Admin','#FF0000',0,1,0,0,'day',0,'[\"add_stream\",\"edit_stream\",\"streams\",\"archive\",\"add_movie\",\"edit_movie\",\"import_movies\",\"filexplorer\",\"movies\",\"add_series\",\"series_list\",\"edit_series\",\"add_episode\",\"edit_episode\",\"import_episodes\",\"series\",\"add_radio\",\"edit_radio\",\"radio\",\"create_channel\",\"edit_cchannel\",\"manage_cchannels\",\"mass_sedits\",\"mass_sedits_vod\",\"epg\",\"epg_edit\",\"tprofiles\",\"categories\",\"edit_cat\",\"stream_tools\",\"add_bouquet\",\"edit_bouquet\",\"bouquets\"]',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),(2,'Registered Users','#66FF66',0,0,0,0,'',0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),(3,'Banned','#194775',1,0,0,0,'',0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),(4,'Resellers','#FF9933',0,0,1,100000,'month',0,'[]',0,0,0,1,1,0,1,1,1,1,0,1,1,1,1,0,1,0);
/*!40000 ALTER TABLE `member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_containers`
--

DROP TABLE IF EXISTS `movie_containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_containers` (
  `container_id` int(11) NOT NULL AUTO_INCREMENT,
  `container_extension` varchar(255) NOT NULL,
  `container_header` varchar(255) NOT NULL,
  PRIMARY KEY (`container_id`),
  KEY `container_extension` (`container_extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_containers`
--

LOCK TABLES `movie_containers` WRITE;
/*!40000 ALTER TABLE `movie_containers` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_containers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) NOT NULL,
  `is_trial` tinyint(4) NOT NULL,
  `is_official` tinyint(4) NOT NULL,
  `trial_credits` float NOT NULL,
  `official_credits` float NOT NULL,
  `trial_duration` int(11) NOT NULL,
  `trial_duration_in` varchar(255) NOT NULL,
  `official_duration` int(11) NOT NULL,
  `official_duration_in` varchar(255) NOT NULL,
  `groups` mediumtext NOT NULL,
  `bouquets` mediumtext NOT NULL,
  `can_gen_mag` tinyint(4) NOT NULL DEFAULT 0,
  `only_mag` tinyint(4) NOT NULL DEFAULT 0,
  `output_formats` mediumtext NOT NULL,
  `is_isplock` tinyint(4) NOT NULL DEFAULT 0,
  `max_connections` int(11) NOT NULL DEFAULT 1,
  `is_restreamer` tinyint(4) NOT NULL DEFAULT 0,
  `force_server_id` int(11) NOT NULL DEFAULT 0,
  `can_gen_e2` tinyint(4) NOT NULL DEFAULT 0,
  `only_e2` tinyint(4) NOT NULL DEFAULT 0,
  `forced_country` varchar(2) NOT NULL,
  `lock_device` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `is_trial` (`is_trial`),
  KEY `is_official` (`is_official`),
  KEY `can_gen_mag` (`can_gen_mag`),
  KEY `can_gen_e2` (`can_gen_e2`),
  KEY `only_e2` (`only_e2`),
  KEY `only_mag` (`only_mag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_logs`
--

DROP TABLE IF EXISTS `panel_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_message` longtext NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_logs`
--

LOCK TABLES `panel_logs` WRITE;
/*!40000 ALTER TABLE `panel_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_userlog`
--

DROP TABLE IF EXISTS `reg_userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `username` mediumtext NOT NULL,
  `password` mediumtext NOT NULL,
  `date` int(30) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_userlog`
--

LOCK TABLES `reg_userlog` WRITE;
/*!40000 ALTER TABLE `reg_userlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_userlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_users`
--

DROP TABLE IF EXISTS `reg_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `date_registered` int(11) NOT NULL,
  `verify_key` mediumtext DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `member_group_id` int(11) NOT NULL,
  `verified` int(11) NOT NULL DEFAULT 0,
  `credits` float NOT NULL DEFAULT 0,
  `notes` mediumtext DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `default_lang` mediumtext NOT NULL,
  `reseller_dns` text NOT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `override_packages` text DEFAULT NULL,
  `google_2fa_sec` varchar(50) NOT NULL,
  `dark_mode` int(1) NOT NULL DEFAULT 0,
  `sidebar` int(1) NOT NULL DEFAULT 0,
  `expanded_sidebar` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `member_group_id` (`member_group_id`),
  KEY `username` (`username`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_users`
--

LOCK TABLES `reg_users` WRITE;
/*!40000 ALTER TABLE `reg_users` DISABLE KEYS */;
INSERT INTO `reg_users` VALUES (1,'admin','$6$rounds=20000$xtreamcodes$XThC5OwfuS0YwS4ahiifzF14vkGbGsFF1w7ETL4sRRC5sOrAWCjWvQJDromZUQoQuwbAXAFdX3h3Cp3vqulpS0','admin@website.com','127.0.0.1',0,NULL,1670076946,1,1,0,NULL,1,'','',0,NULL,'',0,0,0);
/*!40000 ALTER TABLE `reg_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseller_imex`
--

DROP TABLE IF EXISTS `reseller_imex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseller_imex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_id` int(11) NOT NULL,
  `header` longtext NOT NULL,
  `data` longtext NOT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `finished` tinyint(4) NOT NULL DEFAULT 0,
  `bouquet_ids` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reg_id` (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_imex`
--

LOCK TABLES `reseller_imex` WRITE;
/*!40000 ALTER TABLE `reseller_imex` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_imex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rtmp_ips`
--

DROP TABLE IF EXISTS `rtmp_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rtmp_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rtmp_ips`
--

LOCK TABLES `rtmp_ips` WRITE;
/*!40000 ALTER TABLE `rtmp_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtmp_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `cover` varchar(255) NOT NULL,
  `cover_big` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `plot` text NOT NULL,
  `cast` text NOT NULL,
  `rating` int(11) NOT NULL,
  `director` varchar(255) NOT NULL,
  `releaseDate` varchar(255) NOT NULL,
  `last_modified` int(11) NOT NULL,
  `tmdb_id` int(11) NOT NULL,
  `seasons` mediumtext NOT NULL,
  `episode_run_time` int(11) NOT NULL DEFAULT 0,
  `backdrop_path` text NOT NULL,
  `youtube_trailer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `last_modified` (`last_modified`),
  KEY `tmdb_id` (`tmdb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_episodes`
--

DROP TABLE IF EXISTS `series_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_episodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_num` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `season_num` (`season_num`),
  KEY `series_id` (`series_id`),
  KEY `stream_id` (`stream_id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_episodes`
--

LOCK TABLES `series_episodes` WRITE;
/*!40000 ALTER TABLE `series_episodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_activity`
--

DROP TABLE IF EXISTS `server_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_server_id` int(11) NOT NULL,
  `dest_server_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `bandwidth` int(11) NOT NULL DEFAULT 0,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_server_id` (`source_server_id`),
  KEY `dest_server_id` (`dest_server_id`),
  KEY `stream_id` (`stream_id`),
  KEY `pid` (`pid`),
  KEY `date_end` (`date_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_activity`
--

LOCK TABLES `server_activity` WRITE;
/*!40000 ALTER TABLE `server_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `bouquet_name` mediumtext NOT NULL,
  `live_streaming_pass` mediumtext NOT NULL,
  `email_verify_sub` mediumtext NOT NULL,
  `email_verify_cont` mediumtext NOT NULL,
  `email_forgot_sub` mediumtext NOT NULL,
  `email_forgot_cont` mediumtext NOT NULL,
  `mail_from` mediumtext NOT NULL,
  `smtp_host` mediumtext NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `min_password` int(11) NOT NULL DEFAULT 5,
  `username_strlen` int(11) NOT NULL DEFAULT 15,
  `username_alpha` int(11) NOT NULL DEFAULT 1,
  `allow_multiple_accs` int(11) NOT NULL DEFAULT 0,
  `allow_registrations` int(11) NOT NULL DEFAULT 0,
  `server_name` mediumtext NOT NULL,
  `smtp_username` mediumtext NOT NULL,
  `smtp_password` mediumtext NOT NULL,
  `email_new_pass_sub` mediumtext NOT NULL,
  `logo_url` mediumtext NOT NULL,
  `email_new_pass_cont` mediumtext NOT NULL,
  `smtp_from_name` mediumtext NOT NULL,
  `confirmation_email` int(11) NOT NULL,
  `smtp_encryption` mediumtext NOT NULL,
  `unique_id` mediumtext NOT NULL,
  `copyrights_removed` tinyint(4) NOT NULL,
  `copyrights_text` mediumtext NOT NULL,
  `default_timezone` varchar(255) NOT NULL DEFAULT 'Europe/Athens',
  `default_locale` varchar(20) NOT NULL DEFAULT 'en_GB.utf8',
  `allowed_stb_types` text NOT NULL,
  `client_prebuffer` int(11) NOT NULL,
  `split_clients` varchar(255) NOT NULL,
  `stream_max_analyze` int(11) NOT NULL DEFAULT 30,
  `show_not_on_air_video` tinyint(4) NOT NULL,
  `not_on_air_video_path` mediumtext NOT NULL,
  `show_banned_video` tinyint(4) NOT NULL,
  `banned_video_path` mediumtext NOT NULL,
  `show_expired_video` tinyint(4) NOT NULL,
  `expired_video_path` mediumtext NOT NULL,
  `mag_container` varchar(255) NOT NULL,
  `probesize` int(11) NOT NULL DEFAULT 5000000,
  `allowed_ips_admin` mediumtext NOT NULL,
  `block_svp` tinyint(4) NOT NULL DEFAULT 0,
  `allow_countries` mediumtext NOT NULL,
  `user_auto_kick_hours` int(11) NOT NULL DEFAULT 0,
  `show_in_red_online` int(11) NOT NULL DEFAULT 0,
  `disallow_empty_user_agents` tinyint(4) DEFAULT 0,
  `show_all_category_mag` tinyint(4) NOT NULL DEFAULT 1,
  `default_lang` mediumtext DEFAULT NULL,
  `autobackup_status` int(11) NOT NULL DEFAULT 0,
  `autobackup_pass` mediumtext NOT NULL,
  `flood_limit` int(11) NOT NULL DEFAULT 0,
  `flood_ips_exclude` mediumtext NOT NULL,
  `reshare_deny_addon` tinyint(4) NOT NULL DEFAULT 0,
  `restart_http` tinyint(4) NOT NULL DEFAULT 0,
  `css_layout` varchar(255) NOT NULL,
  `flood_seconds` int(11) NOT NULL DEFAULT 5,
  `flood_max_attempts` int(11) NOT NULL DEFAULT 1,
  `flood_apply_clients` int(11) NOT NULL DEFAULT 1,
  `flood_apply_restreamers` int(11) NOT NULL DEFAULT 0,
  `backup_source_all` int(11) NOT NULL DEFAULT 0,
  `flood_get_block` int(11) NOT NULL DEFAULT 0,
  `portal_block` int(11) NOT NULL DEFAULT 0,
  `streaming_block` int(11) NOT NULL DEFAULT 0,
  `stream_start_delay` int(11) NOT NULL DEFAULT 20000,
  `hash_lb` tinyint(4) NOT NULL DEFAULT 1,
  `vod_bitrate_plus` int(11) NOT NULL DEFAULT 60,
  `read_buffer_size` int(11) NOT NULL DEFAULT 8192,
  `tv_channel_default_aspect` varchar(255) NOT NULL DEFAULT 'fit',
  `playback_limit` int(11) NOT NULL DEFAULT 3,
  `show_tv_channel_logo` tinyint(4) NOT NULL DEFAULT 1,
  `show_channel_logo_in_preview` tinyint(4) NOT NULL DEFAULT 1,
  `enable_connection_problem_indication` tinyint(4) NOT NULL DEFAULT 1,
  `enable_pseudo_hls` tinyint(4) NOT NULL DEFAULT 1,
  `vod_limit_at` int(11) NOT NULL DEFAULT 0,
  `client_area_plugin` varchar(255) NOT NULL DEFAULT 'flow',
  `persistent_connections` tinyint(4) NOT NULL DEFAULT 0,
  `record_max_length` int(11) NOT NULL DEFAULT 180,
  `total_records_length` int(11) NOT NULL DEFAULT 600,
  `max_local_recordings` int(11) NOT NULL DEFAULT 10,
  `allowed_stb_types_for_local_recording` text NOT NULL,
  `allowed_stb_types_rec` text NOT NULL,
  `show_captcha` int(11) NOT NULL DEFAULT 1,
  `dynamic_timezone` tinyint(4) NOT NULL DEFAULT 1,
  `stalker_theme` varchar(255) NOT NULL DEFAULT 'digital',
  `rtmp_random` tinyint(4) NOT NULL DEFAULT 1,
  `api_ips` text NOT NULL,
  `crypt_load_balancing` varchar(255) NOT NULL DEFAULT '',
  `use_buffer` tinyint(4) NOT NULL DEFAULT 0,
  `restreamer_prebuffer` tinyint(4) NOT NULL DEFAULT 0,
  `audio_restart_loss` tinyint(4) NOT NULL DEFAULT 0,
  `stalker_lock_images` mediumtext NOT NULL,
  `channel_number_type` varchar(25) NOT NULL DEFAULT 'bouquet',
  `stb_change_pass` tinyint(4) NOT NULL DEFAULT 0,
  `enable_debug_stalker` tinyint(4) NOT NULL DEFAULT 0,
  `online_capacity_interval` smallint(6) NOT NULL DEFAULT 10,
  `always_enabled_subtitles` tinyint(4) NOT NULL DEFAULT 1,
  `test_download_url` varchar(255) NOT NULL DEFAULT '',
  `xc_support_allow` tinyint(4) NOT NULL DEFAULT 1,
  `e2_arm7a` varchar(255) NOT NULL DEFAULT '',
  `e2_mipsel` varchar(255) NOT NULL DEFAULT '',
  `e2_mips32el` varchar(255) NOT NULL DEFAULT '',
  `e2_sh4` varchar(255) NOT NULL DEFAULT '',
  `e2_arm` varchar(255) NOT NULL DEFAULT '',
  `api_pass` varchar(255) NOT NULL,
  `message_of_day` text NOT NULL,
  `double_auth` tinyint(4) NOT NULL DEFAULT 0,
  `mysql_remote_sec` tinyint(4) NOT NULL DEFAULT 0,
  `enable_isp_lock` tinyint(4) NOT NULL DEFAULT 0,
  `show_isps` tinyint(4) NOT NULL DEFAULT 1,
  `userpanel_mainpage` longtext NOT NULL,
  `save_closed_connection` tinyint(4) NOT NULL DEFAULT 1,
  `client_logs_save` tinyint(4) NOT NULL DEFAULT 1,
  `get_real_ip_client` varchar(255) NOT NULL,
  `case_sensitive_line` tinyint(4) NOT NULL DEFAULT 1,
  `county_override_1st` tinyint(4) NOT NULL DEFAULT 0,
  `disallow_2nd_ip_con` tinyint(4) NOT NULL DEFAULT 0,
  `firewall` tinyint(4) NOT NULL DEFAULT 0,
  `new_sorting_bouquet` tinyint(4) NOT NULL DEFAULT 1,
  `split_by` varchar(255) NOT NULL DEFAULT 'con',
  `use_mdomain_in_lists` tinyint(4) NOT NULL DEFAULT 0,
  `use_https` text NOT NULL,
  `priority_backup` tinyint(4) NOT NULL DEFAULT 1,
  `use_buffer_table` tinyint(4) NOT NULL DEFAULT 0,
  `tmdb_api_key` text NOT NULL,
  `toggle_menu` tinyint(4) NOT NULL DEFAULT 0,
  `mobile_apps` tinyint(4) NOT NULL DEFAULT 0,
  `stalker_container_priority` text NOT NULL,
  `gen_container_priority` text NOT NULL,
  `tmdb_default` varchar(3) NOT NULL DEFAULT 'en',
  `series_custom_name` tinyint(4) NOT NULL DEFAULT 0,
  `mag_security` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Xtream Codes','g5KsEJeDjR20vP5iNkmU','Verify Registration @ {SERVER_NAME}','Hello,<p><br></p><p>Please Click at the following URL to activate your account {VERIFY_LINK}</p><p><br></p><p>{SERVER_NAME} Team</p><p>Thank you</p>','Forgot Password @ {SERVER_NAME}','Hello,<p><br></p><p>Someone requested new password @&nbsp;&nbsp;{SERVER_NAME} . To verify this request please click at the following link: {FORGOT_LINK}<br></p><p><br></p><p>{SERVER_NAME} Team</p><p>Thank you</p>','support@website.com','mail.website.com',0,5,15,0,1,0,'Xtream Codes','support@website.com','','Your New Password @ {SERVER_NAME}','','Hello,<p><br></p><p>Your New Password is: {NEW_PASSWORD}<br></p><p><br></p><p>{SERVER_NAME} Team</p><p>Thank you</p>','Support',0,'no','xQP1KKPtsc',0,'Xtream Codes','Europe/London','en_GB.utf8','[\"MAG200\",\"MAG322\",\"MAG323\",\"MAG324\",\"MAG325\",\"MAG349\",\"MAG350\",\"MAG351\",\"MAG352\",\"MAG245\",\"MAG245D\",\"MAG250\",\"MAG254\",\"MAG255\",\"MAG256\",\"MAG257\",\"MAG260\",\"MAG270\",\"MAG275\",\"AuraHD\",\"AuraHD2\",\"AuraHD3\",\"AuraHD4\",\"AuraHD5\",\"AuraHD6\",\"AuraHD7\",\"AuraHD8\",\"AuraHD9\",\"WR320\"]',30,'equal',5000000,0,'',0,'',0,'','ts',5000000,'',0,'[\"ALL\",\"A1\",\"A2\",\"O1\",\"AF\",\"AX\",\"AL\",\"DZ\",\"AS\",\"AD\",\"AO\",\"AI\",\"AQ\",\"AG\",\"AR\",\"AM\",\"AW\",\"AU\",\"AT\",\"AZ\",\"BS\",\"BH\",\"BD\",\"BB\",\"BY\",\"BE\",\"BZ\",\"BJ\",\"BM\",\"BT\",\"BO\",\"BA\",\"BW\",\"BV\",\"BQ\",\"BR\",\"IO\",\"BN\",\"BG\",\"BF\",\"BI\",\"KH\",\"CM\",\"CA\",\"CV\",\"KY\",\"CF\",\"TD\",\"CL\",\"CN\",\"CX\",\"CC\",\"CO\",\"KM\",\"CG\",\"CD\",\"CK\",\"CR\",\"CI\",\"HR\",\"CU\",\"CW\",\"CY\",\"CZ\",\"DK\",\"DJ\",\"DM\",\"DO\",\"EC\",\"EG\",\"SV\",\"GQ\",\"ER\",\"EE\",\"ET\",\"EU\",\"FK\",\"FO\",\"FJ\",\"FI\",\"FR\",\"GF\",\"PF\",\"TF\",\"MK\",\"GA\",\"GM\",\"GE\",\"DE\",\"GH\",\"GI\",\"GR\",\"GL\",\"GD\",\"GP\",\"GU\",\"GT\",\"GG\",\"GN\",\"GW\",\"GY\",\"HT\",\"HM\",\"VA\",\"HN\",\"HK\",\"HU\",\"IS\",\"IN\",\"ID\",\"IR\",\"IQ\",\"IE\",\"IM\",\"IL\",\"IT\",\"JM\",\"JP\",\"JE\",\"JO\",\"KZ\",\"KE\",\"KI\",\"KR\",\"KV\",\"KW\",\"KG\",\"LA\",\"LV\",\"LB\",\"LS\",\"LR\",\"LY\",\"LI\",\"LT\",\"LU\",\"MO\",\"MG\",\"MW\",\"MY\",\"MV\",\"ML\",\"MT\",\"MH\",\"MQ\",\"MR\",\"MU\",\"YT\",\"MX\",\"FM\",\"MD\",\"MC\",\"MN\",\"ME\",\"MS\",\"MA\",\"MZ\",\"MM\",\"NA\",\"NR\",\"NP\",\"NL\",\"AN\",\"NC\",\"NZ\",\"NI\",\"NE\",\"NG\",\"NU\",\"NF\",\"MP\",\"NO\",\"OM\",\"PK\",\"PW\",\"PS\",\"PA\",\"PG\",\"PY\",\"PE\",\"PH\",\"PN\",\"PL\",\"PT\",\"PR\",\"QA\",\"RE\",\"RO\",\"RU\",\"RW\",\"BL\",\"SH\",\"KN\",\"LC\",\"MF\",\"PM\",\"VC\",\"WS\",\"SM\",\"ST\",\"SA\",\"SN\",\"RS\",\"SC\",\"SL\",\"SG\",\"SK\",\"SI\",\"SB\",\"SO\",\"ZA\",\"GS\",\"ES\",\"LK\",\"SD\",\"SR\",\"SJ\",\"SZ\",\"SE\",\"SX\",\"CH\",\"SY\",\"TW\",\"TJ\",\"TZ\",\"TH\",\"TL\",\"TG\",\"TK\",\"TO\",\"TT\",\"TN\",\"TR\",\"TM\",\"TC\",\"TV\",\"UG\",\"UA\",\"AE\",\"GB\",\"US\",\"UM\",\"UY\",\"UZ\",\"VU\",\"VE\",\"VN\",\"VG\",\"VI\",\"WF\",\"EH\",\"YE\",\"ZM\",\"ZW\"]',3,2,0,1,'English',0,'',40,'',0,0,'light',2,3,0,0,0,0,0,0,0,0,200,8192,'fit',3,1,1,1,1,0,'flow',1,180,600,10,'[\"MAG255\",\"MAG256\",\"MAG257\"]','null',1,1,'default',1,'','P1S6cMS6gqdKiS5MoaL0',0,0,0,'null','bouquet',1,0,10,0,'',0,'','','','','','','Welcome to Xtream Codes Reborn',1,0,0,1,'[]',1,1,'HTTP_CF_CONNECTING_IP',1,0,0,1,1,'con',0,'null',0,0,'',0,0,'[\"mp4\",\"mkv\",\"avi\"]','[\"mp4\",\"mkv\",\"avi\"]','en',0,1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signals`
--

DROP TABLE IF EXISTS `signals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signals` (
  `signal_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `rtmp` tinyint(4) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`signal_id`),
  KEY `server_id` (`server_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signals`
--

LOCK TABLES `signals` WRITE;
/*!40000 ALTER TABLE `signals` DISABLE KEYS */;
/*!40000 ALTER TABLE `signals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_categories`
--

DROP TABLE IF EXISTS `stream_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_type` varchar(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `cat_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `category_type` (`category_type`),
  KEY `cat_order` (`cat_order`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_categories`
--

LOCK TABLES `stream_categories` WRITE;
/*!40000 ALTER TABLE `stream_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_logs`
--

DROP TABLE IF EXISTS `stream_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `error` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_id` (`stream_id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_logs`
--

LOCK TABLES `stream_logs` WRITE;
/*!40000 ALTER TABLE `stream_logs` DISABLE KEYS */;
INSERT INTO `stream_logs` VALUES (1,309255,16,1570285389,'[tcp @ 0x520c540] Connection to tcp://127.0.0.1:83 failed: Connection refused'),(2,309255,16,1570285389,'Failed to open progress URL \"http://127.0.0.1:83/progress.php?stream_id=309255\": Connection refused'),(3,309255,16,1570285389,'[tcp @ 0x5212600] Connection to tcp://127.0.0.1:83 failed: Connection refused'),(4,309255,16,1570285389,'[tcp @ 0x522b2c0] Connection to tcp://127.0.0.1:83 failed: Connection refused'),(5,21112,16,1570285389,'[tcp @ 0x554a940] Connection to tcp://127.0.0.1:83 failed: Connection refused'),(6,21112,16,1570285389,'Failed to open progress URL \"http://127.0.0.1:83/progress.php?stream_id=21112\": Connection refused'),(7,21112,16,1570285389,'[http @ 0x55162c0] HTTP error 403 Forbidden'),(8,21112,16,1570285389,'[hls,applehttp @ 0x5510c00] keepalive request failed for \'http://50.7.198.106:80/uk_bbc_2_hd/tracks-v1a1/mono.m3u8?token=djIubG9jYWwuQzJlS2o5ck0xcEJaTF8tOGhHcnJqbkV3RWZsS28tSm9vSWt5V1g4bkJSSGMwYU5hLUR5SThCZ0twbDhnbXZYNlZ0S1gwLVc3NWFfc2I5RkNTYnpQR1RmZHI4QW1xN3VNZDlEaF9xenFUQlVLRG5wOVhmZ0JVc0c0YnUyamktbHVSaWM%3D\', retrying with new connection: Server returned 403 Forbidden (access denied)'),(9,21112,16,1570285389,'[http @ 0x567a300] HTTP error 403 Forbidden'),(10,21112,16,1570285389,'[hls,applehttp @ 0x5510c00] Failed to reload playlist 0'),(11,21112,16,1570285389,'[http @ 0x5679bc0] HTTP error 403 Forbidden'),(12,321974,16,1570285389,'[tcp @ 0x429a7c0] Connection to tcp://127.0.0.1:83 failed: Connection refused'),(13,321974,16,1570285389,'Failed to open progress URL \"http://127.0.0.1:83/progress.php?stream_id=321974\": Connection refused'),(14,321974,16,1570285389,'[http @ 0x4282080] HTTP error 403 Forbidden'),(15,321974,16,1570285389,'[hls,applehttp @ 0x427cb40] keepalive request failed for \'http://50.7.198.106:80/uk_virgin_media_1_hd/tracks-v1a1/mono.m3u8?token=djIubG9jYWwub3FDYktRRFo0Zzl3TjBtZFFzTmNqdDBxNEhnSzlEa2N3M0EycDN4ZFNEeUplSVJwU2FJaWw2c3VOMWtBcFBtb2VNWXVmSWVGY1VXNmd3THlVQXZVa2FRaVBkbzV6d1cwVFVKNWh6VGhYVFlIRnktUnpuaGwwSUlWalR4Zk94ZEZ6U2c%3D\', retrying with new connection: Server returned 403 Forbidden (access denied)'),(16,321974,16,1570285390,'[http @ 0x44cf880] HTTP error 403 Forbidden'),(17,321974,16,1570285390,'[hls,applehttp @ 0x427cb40] Failed to reload playlist 0'),(18,321974,16,1570285390,'[http @ 0x42fed40] HTTP error 403 Forbidden');
/*!40000 ALTER TABLE `stream_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_subcategories`
--

DROP TABLE IF EXISTS `stream_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_subcategories` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_subcategories`
--

LOCK TABLES `stream_subcategories` WRITE;
/*!40000 ALTER TABLE `stream_subcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streaming_servers`
--

DROP TABLE IF EXISTS `streaming_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streaming_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(255) NOT NULL,
  `domain_name` varchar(255) NOT NULL,
  `server_ip` varchar(255) DEFAULT NULL,
  `vpn_ip` varchar(255) NOT NULL,
  `ssh_password` mediumtext DEFAULT NULL,
  `ssh_port` int(11) DEFAULT NULL,
  `diff_time_main` int(11) NOT NULL DEFAULT 0,
  `http_broadcast_port` int(11) NOT NULL,
  `total_clients` int(11) NOT NULL DEFAULT 0,
  `system_os` varchar(255) DEFAULT NULL,
  `network_interface` varchar(255) NOT NULL,
  `latency` float NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT -1,
  `enable_geoip` int(11) NOT NULL DEFAULT 0,
  `geoip_countries` mediumtext NOT NULL,
  `last_check_ago` int(11) NOT NULL DEFAULT 0,
  `can_delete` tinyint(4) NOT NULL DEFAULT 1,
  `server_hardware` text NOT NULL,
  `total_services` int(11) NOT NULL DEFAULT 3,
  `persistent_connections` tinyint(4) NOT NULL DEFAULT 0,
  `rtmp_port` int(11) NOT NULL DEFAULT 8001,
  `geoip_type` varchar(13) NOT NULL DEFAULT 'low_priority',
  `isp_names` mediumtext NOT NULL,
  `isp_type` varchar(13) NOT NULL DEFAULT 'low_priority',
  `enable_isp` tinyint(4) NOT NULL DEFAULT 0,
  `boost_fpm` tinyint(4) NOT NULL DEFAULT 0,
  `http_ports_add` text NOT NULL,
  `network_guaranteed_speed` int(11) NOT NULL DEFAULT 0,
  `https_broadcast_port` int(11) NOT NULL DEFAULT 25463,
  `https_ports_add` text NOT NULL,
  `whitelist_ips` text NOT NULL,
  `watchdog_data` mediumtext NOT NULL,
  `timeshift_only` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_ip` (`server_ip`,`http_broadcast_port`),
  KEY `total_clients` (`total_clients`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streaming_servers`
--

LOCK TABLES `streaming_servers` WRITE;
/*!40000 ALTER TABLE `streaming_servers` DISABLE KEYS */;
INSERT INTO `streaming_servers` VALUES (1,'Main Server','','103.134.3.70','',NULL,NULL,0,25461,1000,'Ubuntu 20.04.5 LTS','eth0',0,1,0,'',0,0,'{\"total_ram\":4637996,\"total_used\":2344100,\"cores\":0,\"threads\":1,\"kernel\":\"5.15.0-56-generic\",\"total_running_streams\":\"0\\n\",\"cpu_name\":\"Intel(R) Core(TM) i7-4810MQ CPU @ 2.80GHz\",\"cpu_usage\":28,\"network_speed\":false,\"bytes_sent\":0,\"bytes_received\":0}',3,0,25462,'low_priority','','low_priority',0,1,'',1000,25463,'','[\"127.0.0.1\",\"10.0.2.15\",\"\"]','{\"cpu\":26,\"cpu_cores\":1,\"cpu_avg\":100,\"total_mem\":4637996,\"total_mem_free\":2313476,\"total_mem_used\":2324520,\"total_mem_used_percent\":50.11906004231138,\"total_disk_space\":25710301184,\"uptime\":\"38m 36s\",\"total_running_streams\":\"0\\n\",\"bytes_sent\":0,\"bytes_received\":0,\"cpu_load_average\":2.05}',0);
/*!40000 ALTER TABLE `streaming_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stream_display_name` mediumtext NOT NULL,
  `stream_source` mediumtext DEFAULT NULL,
  `stream_icon` mediumtext NOT NULL,
  `notes` mediumtext DEFAULT NULL,
  `created_channel_location` int(11) DEFAULT NULL,
  `enable_transcode` tinyint(4) NOT NULL DEFAULT 0,
  `transcode_attributes` mediumtext NOT NULL,
  `custom_ffmpeg` mediumtext NOT NULL,
  `movie_propeties` mediumtext DEFAULT NULL,
  `movie_subtitles` mediumtext NOT NULL,
  `read_native` tinyint(4) NOT NULL DEFAULT 1,
  `target_container` text DEFAULT NULL,
  `stream_all` tinyint(4) NOT NULL DEFAULT 0,
  `remove_subtitles` tinyint(4) NOT NULL DEFAULT 0,
  `custom_sid` varchar(150) DEFAULT NULL,
  `epg_id` int(11) DEFAULT NULL,
  `channel_id` varchar(255) DEFAULT NULL,
  `epg_lang` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `auto_restart` text NOT NULL,
  `transcode_profile_id` int(11) NOT NULL DEFAULT 0,
  `pids_create_channel` mediumtext NOT NULL,
  `cchannel_rsources` mediumtext NOT NULL,
  `gen_timestamps` tinyint(4) NOT NULL DEFAULT 1,
  `added` int(11) NOT NULL,
  `series_no` int(11) NOT NULL DEFAULT 0,
  `direct_source` tinyint(4) NOT NULL DEFAULT 0,
  `tv_archive_duration` int(11) NOT NULL DEFAULT 0,
  `tv_archive_server_id` int(11) NOT NULL DEFAULT 0,
  `tv_archive_pid` int(11) NOT NULL DEFAULT 0,
  `movie_symlink` tinyint(4) NOT NULL DEFAULT 0,
  `redirect_stream` tinyint(4) NOT NULL DEFAULT 0,
  `rtmp_output` tinyint(4) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL,
  `allow_record` tinyint(4) NOT NULL DEFAULT 0,
  `probesize_ondemand` int(11) NOT NULL DEFAULT 128000,
  `custom_map` text NOT NULL,
  `external_push` mediumtext NOT NULL,
  `delay_minutes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `category_id` (`category_id`),
  KEY `created_channel_location` (`created_channel_location`),
  KEY `enable_transcode` (`enable_transcode`),
  KEY `read_native` (`read_native`),
  KEY `epg_id` (`epg_id`),
  KEY `channel_id` (`channel_id`),
  KEY `transcode_profile_id` (`transcode_profile_id`),
  KEY `order` (`order`),
  KEY `direct_source` (`direct_source`),
  KEY `rtmp_output` (`rtmp_output`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams`
--

LOCK TABLES `streams` WRITE;
/*!40000 ALTER TABLE `streams` DISABLE KEYS */;
/*!40000 ALTER TABLE `streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams_arguments`
--

DROP TABLE IF EXISTS `streams_arguments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams_arguments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `argument_cat` varchar(255) NOT NULL,
  `argument_name` varchar(255) NOT NULL,
  `argument_description` mediumtext NOT NULL,
  `argument_wprotocol` varchar(255) DEFAULT NULL,
  `argument_key` varchar(255) NOT NULL,
  `argument_cmd` varchar(255) DEFAULT NULL,
  `argument_type` varchar(255) NOT NULL,
  `argument_default_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams_arguments`
--

LOCK TABLES `streams_arguments` WRITE;
/*!40000 ALTER TABLE `streams_arguments` DISABLE KEYS */;
INSERT INTO `streams_arguments` VALUES (1,'fetch','User Agent','Set a Custom User Agent','http','user_agent','-user-agent \"%s\"','text','xui-22f'),(2,'fetch','HTTP Proxy','Set an HTTP Proxy in this format: ip:port','http','proxy','-http_proxy \"%s\"','text',NULL),(3,'transcode','Average Video Bit Rate','With this you can change the bitrate of the target video. It is very useful in case you want your video to be playable on slow internet connections',NULL,'bitrate','-b:v %dk','text',NULL),(4,'transcode','Average Audio Bitrate','Change Audio Bitrate',NULL,'audio_bitrate','-b:a %dk','text',NULL),(5,'transcode','Minimum Bitrate Tolerance','-minrate FFmpeg argument. Specify the minimum bitrate tolerance here. Specify in kbps. Enter INT number.',NULL,'minimum_bitrate','-minrate %dk','text',NULL),(6,'transcode','Maximum Bitrate Tolerance','-maxrate FFmpeg argument. Specify the maximum bitrate tolerance here.Specify in kbps. Enter INT number. ',NULL,'maximum_bitrate','-maxrate %dk','text',NULL),(7,'transcode','Buffer Size','-bufsize is the rate control buffer. Basically it is assumed that the receiver/end player will buffer that much data so its ok to fluctuate within that much. Specify in kbps. Enter INT number.',NULL,'bufsize','-bufsize %dk','text',NULL),(8,'transcode','CRF Value','The range of the quantizer scale is 0-51: where 0 is lossless, 23 is default, and 51 is worst possible. A lower value is a higher quality and a subjectively sane range is 18-28. Consider 18 to be visually lossless or nearly so: it should look the same or ',NULL,'crf','-crf %d','text',NULL),(9,'transcode','Scaling','Change the Width & Height of the target Video. (Eg. 320:240 ) .  If we\'d like to keep the aspect ratio, we need to specify only one component, either width or height, and set the other component to -1. (eg 320:-1)',NULL,'scaling','-filter_complex \"scale=%s\"','text',NULL),(10,'transcode','Aspect','Change the target Video Aspect. (eg 16:9)',NULL,'aspect','-aspect %s','text',NULL),(11,'transcode','Target Video FrameRate','Set the frame rate',NULL,'video_frame_rate','-r %d','text',NULL),(12,'transcode','Audio Sample Rate','Set the Audio Sample rate in Hz',NULL,'audio_sample_rate','-ar %d','text',NULL),(13,'transcode','Audio Channels','Specify Audio Channels',NULL,'audio_channels','-ac %d','text',NULL),(14,'transcode','Remove Sensitive Parts (delogo filter)','With this filter you can remove sensitive parts in your video. You will just specifiy the x & y pixels where there is a sensitive area and the width and height that will be removed. Example Use: x=0:y=0:w=100:h=77:band=10 ',NULL,'delogo','-filter_complex \"delogo=%s\"','text',NULL),(15,'transcode','Threads','Specify the number of threads you want to use for the transcoding process. Entering 0 as value will make FFmpeg to choose the most optimal settings',NULL,'threads','-threads %d','text',NULL),(16,'transcode','Logo Path','Add your Own Logo to the stream. The logo will be placed in the upper left. Please be sure that you have selected H.264 as codec otherwise this option won\'t work. Note that adding your own logo will consume A LOT of cpu power',NULL,'logo','-i \"%s\" -filter_complex \"overlay\"','text',NULL),(17,'fetch','Cookie','Set an HTTP Cookie that might be useful to fetch your INPUT Source.','http','cookie','-cookies \'%s\'','text',NULL),(18,'transcode','DeInterlacing Filter','It check pixels of previous, current and next frames to re-create the missed field by some local adaptive method (edge-directed interpolation) and uses spatial check to prevent most artifacts. ',NULL,'','-filter_complex \"yadif\"','radio','0'),(19,'fetch','Headers','Set Custom Headers','http','headers','-headers \"%s\"','text',NULL);
/*!40000 ALTER TABLE `streams_arguments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams_options`
--

DROP TABLE IF EXISTS `streams_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) NOT NULL,
  `argument_id` int(11) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_id` (`stream_id`),
  KEY `argument_id` (`argument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams_options`
--

LOCK TABLES `streams_options` WRITE;
/*!40000 ALTER TABLE `streams_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `streams_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams_seasons`
--

DROP TABLE IF EXISTS `streams_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams_seasons` (
  `season_id` int(11) NOT NULL AUTO_INCREMENT,
  `season_name` varchar(255) NOT NULL,
  `stream_id` int(11) NOT NULL,
  PRIMARY KEY (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams_seasons`
--

LOCK TABLES `streams_seasons` WRITE;
/*!40000 ALTER TABLE `streams_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `streams_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams_sys`
--

DROP TABLE IF EXISTS `streams_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams_sys` (
  `server_stream_id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `to_analyze` tinyint(4) NOT NULL DEFAULT 0,
  `stream_status` int(11) NOT NULL DEFAULT 0,
  `stream_started` int(11) DEFAULT NULL,
  `stream_info` mediumtext NOT NULL,
  `monitor_pid` int(11) DEFAULT NULL,
  `current_source` mediumtext DEFAULT NULL,
  `bitrate` int(11) DEFAULT NULL,
  `progress_info` text NOT NULL,
  `on_demand` tinyint(4) NOT NULL DEFAULT 0,
  `delay_pid` int(11) DEFAULT NULL,
  `delay_available_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`server_stream_id`),
  UNIQUE KEY `stream_id_2` (`stream_id`,`server_id`),
  KEY `stream_id` (`stream_id`),
  KEY `pid` (`pid`),
  KEY `server_id` (`server_id`),
  KEY `stream_status` (`stream_status`),
  KEY `stream_started` (`stream_started`),
  KEY `parent_id` (`parent_id`),
  KEY `to_analyze` (`to_analyze`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams_sys`
--

LOCK TABLES `streams_sys` WRITE;
/*!40000 ALTER TABLE `streams_sys` DISABLE KEYS */;
/*!40000 ALTER TABLE `streams_sys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams_types`
--

DROP TABLE IF EXISTS `streams_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `type_key` varchar(255) NOT NULL,
  `type_output` varchar(255) NOT NULL,
  `live` tinyint(4) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `type_key` (`type_key`),
  KEY `type_output` (`type_output`),
  KEY `live` (`live`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams_types`
--

LOCK TABLES `streams_types` WRITE;
/*!40000 ALTER TABLE `streams_types` DISABLE KEYS */;
INSERT INTO `streams_types` VALUES (1,'Live Streams','live','live',1),(2,'Movies','movie','movie',0),(3,'Created Live Channels','created_live','live',1),(4,'Radio','radio_streams','live',1),(5,'TV Series','series','series',0);
/*!40000 ALTER TABLE `streams_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subreseller_setup`
--

DROP TABLE IF EXISTS `subreseller_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subreseller_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reseller` int(8) NOT NULL DEFAULT 0,
  `subreseller` int(8) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `dateadded` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subreseller_setup`
--

LOCK TABLES `subreseller_setup` WRITE;
/*!40000 ALTER TABLE `subreseller_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `subreseller_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspicious_logs`
--

DROP TABLE IF EXISTS `suspicious_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspicious_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` mediumtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspicious_logs`
--

LOCK TABLES `suspicious_logs` WRITE;
/*!40000 ALTER TABLE `suspicious_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `suspicious_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `admin_read` tinyint(4) NOT NULL,
  `user_read` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `status` (`status`),
  KEY `admin_read` (`admin_read`),
  KEY `user_read` (`user_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_replies`
--

DROP TABLE IF EXISTS `tickets_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `admin_reply` tinyint(4) NOT NULL,
  `message` mediumtext NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_replies`
--

LOCK TABLES `tickets_replies` WRITE;
/*!40000 ALTER TABLE `tickets_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmdb_async`
--

DROP TABLE IF EXISTS `tmdb_async`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmdb_async` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT 0,
  `stream_id` int(16) NOT NULL DEFAULT 0,
  `status` int(8) NOT NULL DEFAULT 0,
  `dateadded` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmdb_async`
--

LOCK TABLES `tmdb_async` WRITE;
/*!40000 ALTER TABLE `tmdb_async` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmdb_async` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcoding_profiles`
--

DROP TABLE IF EXISTS `transcoding_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcoding_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL,
  `profile_options` mediumtext NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcoding_profiles`
--

LOCK TABLES `transcoding_profiles` WRITE;
/*!40000 ALTER TABLE `transcoding_profiles` DISABLE KEYS */;
INSERT INTO `transcoding_profiles` VALUES (1,'Standard H264 AAC','{\"-vcodec\":\"h264\",\"-acodec\":\"aac\"}');
/*!40000 ALTER TABLE `transcoding_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_ip` varchar(39) NOT NULL,
  `container` varchar(50) NOT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) DEFAULT NULL,
  `geoip_country_code` varchar(22) NOT NULL,
  `isp` varchar(255) NOT NULL,
  `external_device` varchar(255) NOT NULL,
  `divergence` int(11) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `user_id` (`user_id`),
  KEY `stream_id` (`stream_id`),
  KEY `server_id` (`server_id`),
  KEY `date_end` (`date_end`),
  KEY `container` (`container`),
  KEY `geoip_country_code` (`geoip_country_code`),
  KEY `date_start` (`date_start`),
  KEY `date_start_2` (`date_start`,`date_end`),
  KEY `user_ip` (`user_ip`),
  KEY `user_agent` (`user_agent`),
  KEY `isp` (`isp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity`
--

LOCK TABLES `user_activity` WRITE;
/*!40000 ALTER TABLE `user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_now`
--

DROP TABLE IF EXISTS `user_activity_now`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity_now` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_ip` varchar(39) NOT NULL,
  `container` varchar(50) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) DEFAULT NULL,
  `geoip_country_code` varchar(22) NOT NULL,
  `isp` varchar(255) NOT NULL,
  `external_device` varchar(255) NOT NULL,
  `divergence` int(11) DEFAULT NULL,
  `hls_last_read` int(11) DEFAULT NULL,
  `hls_end` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `user_agent` (`user_agent`),
  KEY `user_ip` (`user_ip`),
  KEY `container` (`container`),
  KEY `pid` (`pid`),
  KEY `geoip_country_code` (`geoip_country_code`),
  KEY `user_id` (`user_id`),
  KEY `stream_id` (`stream_id`),
  KEY `server_id` (`server_id`),
  KEY `date_start` (`date_start`),
  KEY `date_end` (`date_end`),
  KEY `hls_end` (`hls_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_now`
--

LOCK TABLES `user_activity_now` WRITE;
/*!40000 ALTER TABLE `user_activity_now` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activity_now` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_output`
--

DROP TABLE IF EXISTS `user_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `access_output_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `access_output_id` (`access_output_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_output`
--

LOCK TABLES `user_output` WRITE;
/*!40000 ALTER TABLE `user_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `exp_date` int(11) DEFAULT NULL,
  `admin_enabled` int(11) NOT NULL DEFAULT 1,
  `enabled` int(11) NOT NULL DEFAULT 1,
  `admin_notes` mediumtext NOT NULL,
  `reseller_notes` mediumtext NOT NULL,
  `bouquet` mediumtext NOT NULL,
  `max_connections` int(11) NOT NULL DEFAULT 1,
  `is_restreamer` tinyint(4) NOT NULL DEFAULT 0,
  `allowed_ips` mediumtext NOT NULL,
  `allowed_ua` mediumtext NOT NULL,
  `is_trial` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `pair_id` int(11) DEFAULT NULL,
  `is_mag` tinyint(4) NOT NULL DEFAULT 0,
  `is_e2` tinyint(4) NOT NULL DEFAULT 0,
  `force_server_id` int(11) NOT NULL DEFAULT 0,
  `is_isplock` tinyint(4) NOT NULL DEFAULT 0,
  `as_number` varchar(30) DEFAULT NULL,
  `isp_desc` mediumtext DEFAULT NULL,
  `forced_country` varchar(3) NOT NULL,
  `is_stalker` tinyint(4) NOT NULL DEFAULT 0,
  `bypass_ua` tinyint(4) NOT NULL DEFAULT 0,
  `play_token` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `exp_date` (`exp_date`),
  KEY `is_restreamer` (`is_restreamer`),
  KEY `admin_enabled` (`admin_enabled`),
  KEY `enabled` (`enabled`),
  KEY `is_trial` (`is_trial`),
  KEY `created_at` (`created_at`),
  KEY `created_by` (`created_by`),
  KEY `pair_id` (`pair_id`),
  KEY `is_mag` (`is_mag`),
  KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `is_e2` (`is_e2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_categories`
--

DROP TABLE IF EXISTS `watch_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT 0,
  `genre_id` int(8) NOT NULL DEFAULT 0,
  `genre` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(8) NOT NULL DEFAULT 0,
  `bouquets` varchar(4096) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_categories`
--

LOCK TABLES `watch_categories` WRITE;
/*!40000 ALTER TABLE `watch_categories` DISABLE KEYS */;
INSERT INTO `watch_categories` VALUES (1,1,28,'Action',0,'[]'),(2,1,12,'Adventure',0,'[]'),(3,1,16,'Animation',0,'[]'),(4,1,35,'Comedy',0,'[]'),(5,1,80,'Crime',0,'[]'),(6,1,99,'Documentary',0,'[]'),(7,1,18,'Drama',0,'[]'),(8,1,10751,'Family',0,'[]'),(9,1,14,'Fantasy',0,'[]'),(10,1,36,'History',0,'[]'),(11,1,27,'Horror',0,'[]'),(12,1,10402,'Music',0,'[]'),(13,1,9648,'Mystery',0,'[]'),(14,1,10749,'Romance',0,'[]'),(15,1,878,'Science Fiction',0,'[]'),(16,1,10770,'TV Movie',0,'[]'),(17,1,53,'Thriller',0,'[]'),(18,1,10752,'War',0,'[]'),(19,1,37,'Western',0,'[]');
/*!40000 ALTER TABLE `watch_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_folders`
--

DROP TABLE IF EXISTS `watch_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT '',
  `directory` varchar(2048) NOT NULL DEFAULT '',
  `server_id` int(8) NOT NULL DEFAULT 0,
  `category_id` int(8) NOT NULL DEFAULT 0,
  `bouquets` varchar(4096) NOT NULL DEFAULT '[]',
  `last_run` int(32) NOT NULL DEFAULT 0,
  `active` int(1) NOT NULL DEFAULT 1,
  `disable_tmdb` int(1) NOT NULL DEFAULT 0,
  `ignore_no_match` int(1) NOT NULL DEFAULT 0,
  `auto_subtitles` int(1) NOT NULL DEFAULT 0,
  `fb_bouquets` varchar(4096) NOT NULL DEFAULT '[]',
  `fb_category_id` int(8) NOT NULL DEFAULT 0,
  `allowed_extensions` varchar(4096) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_folders`
--

LOCK TABLES `watch_folders` WRITE;
/*!40000 ALTER TABLE `watch_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_output`
--

DROP TABLE IF EXISTS `watch_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT 0,
  `server_id` int(8) NOT NULL DEFAULT 0,
  `filename` varchar(4096) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 0,
  `stream_id` int(8) NOT NULL DEFAULT 0,
  `dateadded` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_output`
--

LOCK TABLES `watch_output` WRITE;
/*!40000 ALTER TABLE `watch_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_settings`
--

DROP TABLE IF EXISTS `watch_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_settings` (
  `read_native` int(1) NOT NULL DEFAULT 1,
  `movie_symlink` int(1) NOT NULL DEFAULT 1,
  `auto_encode` int(1) NOT NULL DEFAULT 0,
  `transcode_profile_id` int(8) NOT NULL DEFAULT 0,
  `scan_seconds` int(8) NOT NULL DEFAULT 3600,
  `percentage_match` int(3) NOT NULL DEFAULT 80,
  `ffprobe_input` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_settings`
--

LOCK TABLES `watch_settings` WRITE;
/*!40000 ALTER TABLE `watch_settings` DISABLE KEYS */;
INSERT INTO `watch_settings` VALUES (1,1,0,0,3600,80,0);
/*!40000 ALTER TABLE `watch_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xtream_main`
--

DROP TABLE IF EXISTS `xtream_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtream_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_available` int(11) NOT NULL DEFAULT 0,
  `root_ip` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xtream_main`
--

LOCK TABLES `xtream_main` WRITE;
/*!40000 ALTER TABLE `xtream_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `xtream_main` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03 19:43:19
