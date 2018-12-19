-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: team_13_basketball_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

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
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coaches` (
  `Coach_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Home_Town` varchar(45) NOT NULL,
  `Home_State` varchar(45) NOT NULL,
  `Coach_Position` varchar(45) NOT NULL,
  `Start_Year` year(4) NOT NULL,
  `Team_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Coach_ID`),
  KEY `fk_Coaches_Team_idx` (`Team_ID`),
  CONSTRAINT `fk_Coaches_Team` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Jay','Wright','Churchville','Pennsylvania','Head Coach',2001,33),(2,'Ashley','Howard','Philadelphia','Pennsylvania','Assistant Coach',2013,33),(3,'Kyle','Neptune','Brooklyn','New York','Assistant Coach',2008,33),(4,'George','Halcovage','Pottsville','Pennsylvania','Assistant Coach',2008,33),(5,'Mike','Nardi','Linden','New Jersey','Director of Basketball Operations',2014,33),(6,'Arleshia','Davidson','Eagleville','Pennsylvania','Director of Program Administration',2009,33),(7,'Mike','Clark','North Salem','Massachusetts','Video Coordinator',2017,33),(8,'Jeff','Pierce','Phoenixville','Pennsylvania','Head Athletic Trainer',1987,33),(9,'John','Shackleton','Newtown','Pennsylvania','Strength Coach',2012,33),(10,'John','Beilein','Burt','New York','Head Coach',2007,27),(11,'Saddi','Washington','Lansing','Michigan','Assistant Coach',2016,27),(12,'Luke','Yaklich','La Salle','Illinois','Assistant Coach',2017,27),(13,'DeAndre','Haynes','Detroit','Michigan','Assistant Coach',2017,27),(14,'Chris','Hunter','Gary','Indiana','Director of Basketball Operations',2017,27),(15,'Chinedu','Nwachukwu','Ypsilanti','Michigan','Director of Program Personnel',2017,27),(16,'Bryan','Smothers','Pontiac','Michigan','Video Analyst',2016,27),(17,'Devon','Mulry','Grand Rapids','Michigan','Graduate Manager',2016,27),(18,'Jon','Sanderson','Mansfield','Ohio','Head Strength and Conditioning Coach, Olympic',2009,27),(19,'Alex','Wong','Redmond','Washington','Associate Athletic Trainer',2015,27);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_rosters`
--

DROP TABLE IF EXISTS `game_rosters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_rosters` (
  `Game_ID` int(10) unsigned NOT NULL,
  `Player_ID` int(10) unsigned NOT NULL,
  `Points_Scored` int(10) unsigned NOT NULL,
  `Minutes_Played` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Game_ID`,`Player_ID`),
  KEY `fk_Games_has_Players_Players1_idx` (`Player_ID`),
  KEY `fk_Games_has_Players_Games1_idx` (`Game_ID`),
  CONSTRAINT `fk_Games_has_Players_Games1` FOREIGN KEY (`Game_ID`) REFERENCES `games` (`Game_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Games_has_Players_Players1` FOREIGN KEY (`Player_ID`) REFERENCES `players` (`Player_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_rosters`
--

LOCK TABLES `game_rosters` WRITE;
/*!40000 ALTER TABLE `game_rosters` DISABLE KEYS */;
INSERT INTO `game_rosters` VALUES (63,1,9,28),(63,2,4,16),(63,3,6,27),(63,4,2,23),(63,5,31,37),(63,6,8,29),(63,7,0,4),(63,8,0,0),(63,9,0,0),(63,10,0,0),(63,11,19,36),(63,12,0,0),(63,13,0,0),(63,14,0,0),(63,15,0,0),(63,16,0,0),(63,17,6,33),(63,18,3,10),(63,19,10,34),(63,20,0,20),(63,21,0,3),(63,22,0,0),(63,23,23,34),(63,24,16,33),(63,25,0,0),(63,26,2,7),(63,27,22,7),(63,28,2,1),(63,29,0,0),(63,30,0,0),(63,31,0,0),(63,32,0,3);
/*!40000 ALTER TABLE `game_rosters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `Game_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Game_Date` date NOT NULL,
  `Home_Team_ID` int(10) unsigned NOT NULL,
  `Away_Team_ID` int(10) unsigned NOT NULL,
  `Home_Team_Points` int(11) NOT NULL,
  `Away_Team_Points` int(11) NOT NULL,
  `Venue_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Game_ID`),
  KEY `fk_Games_Venue1_idx` (`Venue_ID`),
  KEY `fk_Games_Team1_idx` (`Home_Team_ID`),
  KEY `fk_Games_Team2_idx` (`Away_Team_ID`),
  CONSTRAINT `fk_Games_Team1` FOREIGN KEY (`Home_Team_ID`) REFERENCES `team` (`Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Games_Team2` FOREIGN KEY (`Away_Team_ID`) REFERENCES `team` (`Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Games_Venue1` FOREIGN KEY (`Venue_ID`) REFERENCES `venue` (`Venue_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (49,'2018-03-22',5,4,58,61,57),(50,'2018-03-22',13,10,68,69,57),(51,'2018-03-22',23,20,60,75,58),(52,'2018-03-22',27,29,99,72,58),(53,'2018-03-23',33,37,90,78,59),(54,'2018-03-23',47,43,65,78,59),(55,'2018-03-23',49,53,80,76,60),(56,'2018-03-23',63,58,69,65,60),(57,'2018-03-24',4,10,62,78,57),(58,'2018-03-24',27,20,58,54,58),(59,'2018-03-25',33,43,71,59,59),(60,'2018-03-25',49,63,85,81,60),(61,'2018-03-31',27,10,69,57,61),(62,'2018-03-31',33,49,95,79,61),(63,'2018-04-02',33,27,79,62,61);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `Player_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Player_Number` int(11) NOT NULL,
  `Player_Position` varchar(45) NOT NULL,
  `Player_Grade` varchar(45) NOT NULL,
  `Team_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Player_ID`),
  KEY `fk_Players_Team1_idx` (`Team_ID`),
  CONSTRAINT `fk_Players_Team1` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Jalen','Brunson','1996-08-31',1,'Guard','Junior',33),(2,'Collin','Gillespie',NULL,2,'Guard','Freshman',33),(3,'Eric','Paschall','1996-11-04',4,'Forward','Red Shirt Junior',33),(4,'Phil','Booth','1995-12-31',5,'Guard','Red Shirt Junior',33),(5,'Donte','DiVincenzo','1997-01-31',10,'Guard','Red Shirt Sophomore',33),(6,'Omari','Spellman',NULL,14,'Forward','Red Shirt Freshman',33),(7,'Dhamir','Cosby-Roundtree',NULL,21,'Forward','Freshman',33),(8,'Peyton','Heck','1996-11-01',22,'Guard','Junior',33),(9,'Jermaine','Samuels',NULL,23,'Forward','Freshman',33),(10,'Tom','Leibig',NULL,24,'Forward','Senior',33),(11,'Mikal','Bridges','1996-08-30',25,'Guard/Forward','Red Shirt Junior',33),(12,'Tim','Delaney','1997-03-05',34,'Forward','Red Shirt Sophomore',33),(13,'Matt','Kennedy',NULL,35,'Guard','Senior',33),(14,'Denny','Grace',NULL,40,'Guard','Graduate Student',33),(15,'Dylan','Painter',NULL,42,'Forward','Sophomore',33),(16,'Brent','Hibbitts',NULL,0,'Forward','Junior',27),(17,'Charles','Matthews',NULL,1,'Guard','Junior',27),(18,'Jordan','Poole',NULL,2,'Guard','Freshman',27),(19,'Zavier','Simpson',NULL,3,'Guard','Sophomore',27),(20,'Isaiah','Livers',NULL,4,'Forward','Freshman',27),(21,'Jaaron','Simmons',NULL,5,'Guard','Graduate Student',27),(22,'Luke','Wilson',NULL,11,'Guard','Freshman',27),(23,'Muhammad-Ali','Abdur-Rahkman',NULL,12,'Guard','Senior',27),(24,'Moritz','Wagner',NULL,13,'Forward','Junior',27),(25,'Rico','Ozuna-Harrison',NULL,14,'Guard','Freshman',27),(26,'Jon','Teske',NULL,15,'Center','Sophmore',27),(27,'Duncan','Robinson',NULL,22,'Guard/Forward','Graduate Student',27),(28,'Ibi','Watson',NULL,23,'Guard/Forward','Sophmore',27),(29,'C.J.','Baird',NULL,24,'Forward','Freshman',27),(30,'Naji','Ozeir',NULL,25,'Forward','Freshman',27),(31,'Austin','Davis',NULL,51,'Forward','Sophmore',27),(32,'Eli','Brooks',NULL,55,'Guard','Freshman',27);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `query_1`
--

DROP TABLE IF EXISTS `query_1`;
/*!50001 DROP VIEW IF EXISTS `query_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_1` AS SELECT 
 1 AS `Game_ID`,
 1 AS `Game_Date`,
 1 AS `Venue_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_2`
--

DROP TABLE IF EXISTS `query_2`;
/*!50001 DROP VIEW IF EXISTS `query_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_2` AS SELECT 
 1 AS `Venue_Name`,
 1 AS `Team_Name`,
 1 AS `Home_Team_Points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_3`
--

DROP TABLE IF EXISTS `query_3`;
/*!50001 DROP VIEW IF EXISTS `query_3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_3` AS SELECT 
 1 AS `Game_ID`,
 1 AS `Game_Date`,
 1 AS `Points_Scored`,
 1 AS `Home_Team`,
 1 AS `Away_Team`,
 1 AS `Venue_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_4`
--

DROP TABLE IF EXISTS `query_4`;
/*!50001 DROP VIEW IF EXISTS `query_4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_4` AS SELECT 
 1 AS `Player_Name`,
 1 AS `MAX(Minutes_Played)`,
 1 AS `Team_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_5`
--

DROP TABLE IF EXISTS `query_5`;
/*!50001 DROP VIEW IF EXISTS `query_5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_5` AS SELECT 
 1 AS `Player_Name`,
 1 AS `Points_Scored`,
 1 AS `Team_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `Team_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team_Name` varchar(45) NOT NULL,
  `University_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (4,'Wildcats','Kansas State University'),(5,'Wildcats','Kentucky University'),(10,'Ramblers','Loyola Chicago University'),(13,'Wolf Pack','University of Nevada, Reno'),(20,'Seminoles','Florida State University'),(23,'Bulldogs','Gonzaga University'),(27,'Wolverines','Michigan University'),(29,'Aggies','Texas A&M University'),(33,'Wildcats','Villanova University'),(37,'Mountaineers','West Virginia University'),(43,'Red Raiders','Texas Tech University'),(47,'Boilermakers','Purdue University'),(49,'Jayhawks','Kansas University'),(53,'Tigers','Clemson University'),(58,'Orange','Syracuse University'),(63,'Blue Devils','Duke University');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `Venue_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Venue_Name` varchar(45) NOT NULL,
  `State_Name` varchar(45) NOT NULL,
  `City_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Venue_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (57,'Philips Arena','Georgia','Atlanta'),(58,'Staples Center','California','Los Angeles'),(59,'TD Garden','Massachusetts','Boston'),(60,'CenturyLink Center Omaha','Nebraska','Omaha'),(61,'Alamodome','Texas','San Antonio');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `query_1`
--

/*!50001 DROP VIEW IF EXISTS `query_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_1` AS select `games`.`Game_ID` AS `Game_ID`,`games`.`Game_Date` AS `Game_Date`,`venue`.`Venue_Name` AS `Venue_Name` from (`games` join `venue` on((`games`.`Venue_ID` = `venue`.`Venue_ID`))) where (`venue`.`Venue_Name` = 'Alamodome') order by `games`.`Game_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_2`
--

/*!50001 DROP VIEW IF EXISTS `query_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_2` AS select `venue`.`Venue_Name` AS `Venue_Name`,`team`.`Team_Name` AS `Team_Name`,max(`games`.`Home_Team_Points`) AS `Home_Team_Points` from ((`games` join `venue` on((`games`.`Venue_ID` = `venue`.`Venue_ID`))) join `team` on((`games`.`Home_Team_ID` = `team`.`Team_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_3`
--

/*!50001 DROP VIEW IF EXISTS `query_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_3` AS select `games`.`Game_ID` AS `Game_ID`,`games`.`Game_Date` AS `Game_Date`,max((`games`.`Home_Team_Points` + `games`.`Away_Team_Points`)) AS `Points_Scored`,(select `team`.`Team_Name` from `team` where (`team`.`Team_ID` = `games`.`Home_Team_ID`)) AS `Home_Team`,(select `team`.`Team_Name` from `team` where (`team`.`Team_ID` = `games`.`Away_Team_ID`)) AS `Away_Team`,`venue`.`Venue_Name` AS `Venue_Name` from (`games` join `venue` on((`games`.`Venue_ID` = `venue`.`Venue_ID`))) group by `games`.`Game_Date` order by `games`.`Game_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_4`
--

/*!50001 DROP VIEW IF EXISTS `query_4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_4` AS select concat(`players`.`First_Name`,' ',`players`.`Last_Name`) AS `Player_Name`,max(`game_rosters`.`Minutes_Played`) AS `MAX(Minutes_Played)`,`team`.`Team_Name` AS `Team_Name` from ((`game_rosters` join `players` on((`game_rosters`.`Player_ID` = `players`.`Player_ID`))) join `team` on((`players`.`Team_ID` = `team`.`Team_ID`))) group by `players`.`Team_ID` order by `game_rosters`.`Minutes_Played` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_5`
--

/*!50001 DROP VIEW IF EXISTS `query_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_5` AS select concat(`players`.`First_Name`,' ',`players`.`Last_Name`) AS `Player_Name`,`game_rosters`.`Points_Scored` AS `Points_Scored`,`team`.`Team_Name` AS `Team_Name` from ((`game_rosters` join `players` on((`game_rosters`.`Player_ID` = `players`.`Player_ID`))) join `team` on((`players`.`Team_ID` = `team`.`Team_ID`))) where ((`game_rosters`.`Points_Scored` > (select avg(`game_rosters`.`Points_Scored`) from `game_rosters`)) and (`game_rosters`.`Minutes_Played` > 0)) order by `team`.`Team_Name`,`game_rosters`.`Points_Scored` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-12 23:46:53
