-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: messagebase
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `messages`
--
CREATE DATABASE IF NOT EXISTS `messagebase`;

USE `messagebase`;

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `homepage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `text` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `browser` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'AMELIA','amelia@asd.asd','https://www.deutschland.de/en','Adel liegt (sitzt) im Gemüte, nicht im Geblüte.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-21 23:29:29','2020-06-21 23:29:29');
INSERT INTO `messages` VALUES (2,'OLIVER','oliver@ger.man',NULL,'All Ding währt seine Zeit.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:02','2020-06-22 00:03:02');
INSERT INTO `messages` VALUES (3,'OLIVIA','olivia@ger.man',NULL,'Allen Leuten recht getan ist eine Kunst, die niemand kann','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (4,'JACK','jack@ger.man',NULL,'Aller Anfang ist schwer.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (5,'EMILY','emily@ger.man',NULL,'Alles hat seinMass.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (6,'HARRY','harry@ger.man',NULL,'Besser Ehre ohne Leben, als Leben ohne Ehre.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (7,'AVA','ava@ger.man',NULL,'Besser ein kleiner Fisch als gar nichts auf dem Tisch.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (8,'JACOB','jacob@ger.man',NULL,'Ist der Kopf abgeschlagen, wird niemand nach dem Hute fragen.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (9,'ISLA','isla@ger.man',NULL,'Der Mensch denkt, Gott lenkt.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (10,'CHARLIE','charlie@ger.man',NULL,'Gezwungene Ehe, des Herzens Wehe','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (11,'JESSICA','jessica@ger.man',NULL,'Ein Wort, das dir entflogen ist, fängst du nicht mehr ein.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (12,'THOMAS','thomas@ger.man',NULL,'Fremdes Leid ist bald vergessen.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (13,'POPPY','poppy@ger.man',NULL,'Heute zechen, morgen nichts zu brechen.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (14,'OSCAR','oscar@ger.man',NULL,'Das schlechteste Rad knarrt am meisten.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (15,'ISABELLA','isabella@ger.man',NULL,'Eigene Last ist nicht schwer.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (16,'WILLIAM','william@ger.man',NULL,'Klein Ding freut Kind.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (17,'SOPHIE','sophie@ger.man',NULL,'Junges Blut hat Mut.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (18,'JAMES','james@ger.man',NULL,'Dem Mutigen gehört die Welt.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (19,'MIA','mia@ger.man',NULL,'Man muss das Eisen schmieden solange es heiss ist.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (20,'GEORGE','george@ger.man',NULL,'Jedem Narren gefällt seine Kappe','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (21,'RUBY','ruby@ger.man',NULL,'Lügen haben kurze Beine.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (22,'ALFIE','alfie@ger.man',NULL,'Die Hechte im Teich lassen, die Fische nicht faul werden.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (23,'LILY','lily@ger.man',NULL,'Lachen ist die beste Medizin.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (24,'JOSHUA','joshua@ger.man',NULL,'Mässigkeit ist die beste Arznei.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (25,'GRACE','grace@ger.man',NULL,'Müssiggang verzehrt den Leib, wie Rost das Eisen.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (26,'NOAH','noah@ger.man',NULL,'Not lehrt den Affen geigen, alte Weiber springen.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (27,'EVIE','evie@ger.man',NULL,'Rufe nicht «Hase», bis du ihn im Sacke hast.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (28,'ETHAN','ethan@ger.man',NULL,'Übermut tut selten gut.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (29,'MUHAMMAD','muhammad@ger.man',NULL,'Sei es wie es sei. ','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (30,'SOPHIA','sophia@ger.man',NULL,'Was man nicht gesehen hat, kann man nicht malen.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (31,'ELLA','ella@ger.man',NULL,'Vertrau auf Jesus in allen Dingen, dann wir dir alles wohlgelingen!','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:03:07','2020-06-22 00:03:07');
INSERT INTO `messages` VALUES (32,'ARCHIE','archie@eng.com',NULL,'Live not to eat, but eat to live','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:23:15','2020-06-22 00:23:15');
INSERT INTO `messages` VALUES (33,'SCARLETT','scarlett@eng.com',NULL,'Nothing is impossible to a willing heart','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:23:27','2020-06-22 00:23:27');
INSERT INTO `messages` VALUES (34,'LEO','leo@eng.com',NULL,'We never know the value of water till the well is dry','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:23:37','2020-06-22 00:23:37');
INSERT INTO `messages` VALUES (36,'CHLOE','chloe@eng.com',NULL,'Early to bed and early to rise makes a man healthy, wealthy and wise','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:29:22','2020-06-22 00:29:22');
INSERT INTO `messages` VALUES (38,'HENRY','henry@eng.com',NULL,'Wait for the cat to jump','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:29:45','2020-06-22 00:29:45');
INSERT INTO `messages` VALUES (40,'ISABELLE','isabelle@eng.com',NULL,'A black hen lays a white egg','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:29:58','2020-06-22 00:29:58');
INSERT INTO `messages` VALUES (41,'FREYA','freya@eng.com',NULL,'No man loves his fetters, be they made of gold','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:31:38','2020-06-22 00:31:38');
INSERT INTO `messages` VALUES (42,'CHARLOTTE','charlotte@eng.com',NULL,'Every ass loves to hear himself bray','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:31:53','2020-06-22 00:31:53');
INSERT INTO `messages` VALUES (43,'SAMUEL','samuel@eng.com',NULL,'A friend to all is a friend to none','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:32:13','2020-06-22 00:32:13');
INSERT INTO `messages` VALUES (44,'JOSEPH','joseph@eng.com',NULL,'Everybody\'s business is nobody\'s business','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:32:34','2020-06-22 00:32:34');
INSERT INTO `messages` VALUES (45,'RILEY','riley@eng.com',NULL,'Eat at pleasure, drink with measure','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:32:55','2020-06-22 00:32:55');
INSERT INTO `messages` VALUES (46,'SIENNA','sienna@eng.com',NULL,'All cats are grey in the dark (in the night)','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:33:16','2020-06-22 00:33:16');
INSERT INTO `messages` VALUES (47,'DANIEL','daniel@eng.com',NULL,'Every dog is a lion at home','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:33:31','2020-06-22 00:33:31');
INSERT INTO `messages` VALUES (48,'DAISY','daisy@eng.com',NULL,'Still waters run deep','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:33:48','2020-06-22 00:33:48');
INSERT INTO `messages` VALUES (49,'PHOEBE','phoebe@eng.com',NULL,'When at Rome, do as the Romans do','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:34:04','2020-06-22 00:34:04');
INSERT INTO `messages` VALUES (50,'MASON','mason@eng.com',NULL,'After rain comes fair weather','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:34:22','2020-06-22 00:34:22');
INSERT INTO `messages` VALUES (51,'MAX','max@eng.com',NULL,'A great ship asks deep waters','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:34:44','2020-06-22 00:34:44');
INSERT INTO `messages` VALUES (52,'LUKAS','lukas@eng.com',NULL,'So many countries, so many customs','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:35:09','2020-06-22 00:35:09');
INSERT INTO `messages` VALUES (53,'EDWARD','edward@eng.com',NULL,'It is never too late to learn','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:35:20','2020-06-22 00:35:20');
INSERT INTO `messages` VALUES (54,'SEBASTIAN','sebastian@eng.com',NULL,'Good health is above wealth','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:35:39','2020-06-22 00:35:39');
INSERT INTO `messages` VALUES (55,'MATTHEW','matthew@eng.com',NULL,'Beware of a silent dog and still water','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:35:56','2020-06-22 00:35:56');
INSERT INTO `messages` VALUES (56,'LEXI','lexi@eng.com',NULL,'Don\'t trouble trouble until trouble troubles you','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:36:12','2020-06-22 00:36:12');
INSERT INTO `messages` VALUES (58,'Ah Cy','ahsy@cn.com','https://metanit.com/sharp/aspnet5/1.2.php','万里追随你，从不迷路。不怕冷，不怕火，不吃又不喝。太阳西下，我便消失。','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 00:47:03','2020-06-22 00:47:03');
INSERT INTO `messages` VALUES (60,'Ah Kum','ahkum@cn.com',NULL,'欲速则不达','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:04:53','2020-06-22 01:04:53');
INSERT INTO `messages` VALUES (61,'Baozhai','baozhai@cn.com',NULL,'爱不是占有，是欣赏','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:05:23','2020-06-22 01:05:23');
INSERT INTO `messages` VALUES (62,'Chao','chao@cn.com',NULL,'\"您先请\"是礼貌','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:05:54','2020-06-22 01:05:54');
INSERT INTO `messages` VALUES (63,'Chaoxiang','chaoxiang@cn.com',NULL,'萝卜青菜，各有所爱','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:06:24','2020-06-22 01:06:24');
INSERT INTO `messages` VALUES (64,'Chen','chen@cn.com',NULL,'广交友，无深交','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:06:55','2020-06-22 01:06:55');
INSERT INTO `messages` VALUES (65,'Dandan','dandan@cn.com',NULL,'山雨欲来风满楼','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:07:25','2020-06-22 01:07:25');
INSERT INTO `messages` VALUES (66,'Fang','fang@cn.com',NULL,'一见钟情','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:07:55','2020-06-22 01:07:55');
INSERT INTO `messages` VALUES (67,'Guowei','guowei@cn.com',NULL,'不作死就不会死','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:08:26','2020-06-22 01:08:26');
INSERT INTO `messages` VALUES (68,'Hongqi','hongqi@cn.com',NULL,'书是随时携带的花园','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:08:56','2020-06-22 01:08:56');
INSERT INTO `messages` VALUES (70,'Huifang','huifang@cn.com',NULL,'万事开头难','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:09:27','2020-06-22 01:09:27');
INSERT INTO `messages` VALUES (71,'Jin','jin@cn.com',NULL,'活到老，学到老','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:09:57','2020-06-22 01:09:57');
INSERT INTO `messages` VALUES (72,'Lihua','lihua@cn.com',NULL,'身正不怕影子斜','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:10:28','2020-06-22 01:10:28');
INSERT INTO `messages` VALUES (73,'Meifeng','meifeng@cn.com',NULL,'爱屋及乌','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:10:58','2020-06-22 01:10:58');
INSERT INTO `messages` VALUES (74,'Ninghong','ninghong@cn.com',NULL,'一寸光阴一寸金，寸金难买寸光阴','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:11:29','2020-06-22 01:11:29');
INSERT INTO `messages` VALUES (75,'Ruomei','ruomei@cn.com',NULL,'好书如挚友','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:11:59','2020-06-22 01:11:59');
INSERT INTO `messages` VALUES (76,'Shen','shen@cn.com',NULL,'机不可失，时不再来','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:12:30','2020-06-22 01:12:30');
INSERT INTO `messages` VALUES (77,'Song','song@cn.com',NULL,'一言既出，驷马难追','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:13:00','2020-06-22 01:13:00');
INSERT INTO `messages` VALUES (78,'Xiaobo','xiaobo@cn.com',NULL,'好记性不如烂笔头','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:13:31','2020-06-22 01:13:31');
INSERT INTO `messages` VALUES (79,'Yaozu','yaozu@cn.com',NULL,'近水知鱼性，近山识鸟音','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:14:01','2020-06-22 01:14:01');
INSERT INTO `messages` VALUES (80,'Yuming','yuming@cn.com',NULL,'愿得一人心，白首不相离','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:14:32','2020-06-22 01:14:32');
INSERT INTO `messages` VALUES (81,'Zixin','zixin@cn.com',NULL,'明人不用细说，响鼓不用重捶 人无完人，金无足赤','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:15:02','2020-06-22 01:15:02');
INSERT INTO `messages` VALUES (82,'Arkasha','arkasha@mail.ru',NULL,'Лучше один раз увидеть, чем сто раз услышать','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:30:11','2020-06-22 01:30:11');
INSERT INTO `messages` VALUES (83,'Vasya','vasya@mail.ru',NULL,'Одна голова хорошо, а две лучше.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:30:41','2020-06-22 01:30:41');
INSERT INTO `messages` VALUES (84,'Dima','dima@mail.ru',NULL,'Ни себе ни людям','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:31:12','2020-06-22 01:31:12');
INSERT INTO `messages` VALUES (85,'Grisha','grisha@mail.ru',NULL,'Цыплят по осени считают. ','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:31:42','2020-06-22 01:31:42');
INSERT INTO `messages` VALUES (86,'Kesha','kesha@mail.ru',NULL,'И волки сыты, и овцы целы.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:32:13','2020-06-22 01:32:13');
INSERT INTO `messages` VALUES (87,'Kostya','kostya@mail.ru',NULL,'Петух думал, да в суп попал.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:32:43','2020-06-22 01:32:43');
INSERT INTO `messages` VALUES (88,'Stas','stas@mail.ru',NULL,'В тихом омуте черти водятся.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:33:14','2020-06-22 01:33:14');
INSERT INTO `messages` VALUES (89,'Lera','lera@mail.ru',NULL,'Нет дыма без огня','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:33:44','2020-06-22 01:33:44');
INSERT INTO `messages` VALUES (90,'Dasha','dasha@mail.ru',NULL,'Не откладывай на завтра, что можешь сделать сегодня.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:34:15','2020-06-22 01:34:15');
INSERT INTO `messages` VALUES (91,'Lena','lena@mail.ru',NULL,'Тише едешь, дальше будешь.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:34:45','2020-06-22 01:34:45');
INSERT INTO `messages` VALUES (92,'Avelin','avelin@fra.com','','Qui ne dit mot consent','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:35:02','2020-06-22 01:35:02');
INSERT INTO `messages` VALUES (93,'Ira','ira@mail.ru',NULL,'Не все то золото, что блестит.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:35:16','2020-06-22 01:35:16');
INSERT INTO `messages` VALUES (94,'Rita','rita@mail.ru',NULL,'Лучше синица в руке, чем журавль в небе.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:35:46','2020-06-22 01:35:46');
INSERT INTO `messages` VALUES (95,'Dzhozef','dzhozef@fra.com','','Qui aime bien chatie bien','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:35:50','2020-06-22 01:35:50');
INSERT INTO `messages` VALUES (96,'Masha','masha@mail.ru',NULL,'Не хлебом единым сыт человек.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:36:17','2020-06-22 01:36:17');
INSERT INTO `messages` VALUES (97,'Raya','raya@mail.ru',NULL,'От добра добра не ищут.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:36:47','2020-06-22 01:36:47');
INSERT INTO `messages` VALUES (98,'Yulya','yulya@mail.ru',NULL,'Не имей сто рублей, а имей сто друзей.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','2020-06-22 01:37:18','2020-06-22 01:37:18');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22  1:43:27
