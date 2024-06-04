-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: dainBramage
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `channel_id` int NOT NULL,
  `channel_number` varchar(255) NOT NULL,
  `chatrooms_chatroom_id` int NOT NULL,
  PRIMARY KEY (`channel_id`,`chatrooms_chatroom_id`),
  KEY `fk_channels_chatrooms1_idx` (`chatrooms_chatroom_id`),
  CONSTRAINT `fk_channels_chatrooms1` FOREIGN KEY (`chatrooms_chatroom_id`) REFERENCES `chatrooms` (`chatroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatrooms`
--

DROP TABLE IF EXISTS `chatrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatrooms` (
  `chatroom_id` int NOT NULL,
  `channel_id` varchar(255) NOT NULL,
  PRIMARY KEY (`chatroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatrooms`
--

LOCK TABLES `chatrooms` WRITE;
/*!40000 ALTER TABLE `chatrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL,
  `chatroom_id` varchar(255) NOT NULL,
  `message_content` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `chatrooms_chatroom_id` int NOT NULL,
  PRIMARY KEY (`message_id`,`chatrooms_chatroom_id`),
  KEY `fk_messages_chatrooms1_idx` (`chatrooms_chatroom_id`),
  CONSTRAINT `fk_messages_chatrooms1` FOREIGN KEY (`chatrooms_chatroom_id`) REFERENCES `chatrooms` (`chatroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `token` varchar(255) NOT NULL,
  `token_type` enum('BEARER') NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Token` (`token`),
  KEY `fk_token_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDIiLCJpYXQiOjE3MTQ1MTQwMDYsImV4cCI6MTcxNDUxNTQ0Nn0.X1WveyndBQmaoar5OWDeYKCSiR1nqGMtgj4xCj16G-8','BEARER',0,0,1,152),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDIiLCJpYXQiOjE3MTQ1MjQ1MjcsImV4cCI6MTcxNDUyNTk2N30.pZhec9ZOPMsyDnd6fm18fMDP_y2OLCfa8j6pImhuxrQ','BEARER',0,0,2,201),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDMiLCJpYXQiOjE3MTQ1MjQ2NzMsImV4cCI6MTcxNDUyNjExM30.bx61vsQUWa8XwBARr5OweHzauodd4U9lc-JswwTLDvE','BEARER',1,1,3,202),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTQ1ODY4MjksImV4cCI6MTcxNDU4ODI2OX0.jd6pBAQNOCvx0cFFMumJhrFS4QrhgPovI7NVqj-El7o','BEARER',1,1,52,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDMiLCJpYXQiOjE3MTQ1ODcwNTQsImV4cCI6MTcxNDU4ODQ5NH0.ax7572hLRjvpB-eyZb_TU95PPi4Dz5IeNAwE1D4DeOA','BEARER',0,0,102,202),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDUiLCJpYXQiOjE3MTQ2NzUxMDAsImV4cCI6MTcxNDY3NjU0MH0.VuL5F9x7ZIu76W-lAdF5aKsPKLd1syLt85Pla9OJTxI','BEARER',0,0,152,301),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTQ2NzYyMzAsImV4cCI6MTcxNDY3NzY3MH0.mM5s2d-Gr4LeEe5tuAJTO1_qbNq4fbO16rh9VJ4mmvg','BEARER',1,1,202,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTQ2NzY3NjgsImV4cCI6MTcxNDY3ODIwOH0.MzJlWBClGoNnFFLkCn5o5gcRVJakuXh0nUoBPYZ84f4','BEARER',1,1,203,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTQ2NzY5NDksImV4cCI6MTcxNDY3ODM4OX0.8W3Lfl62yFVm_glqEjGBzQ4xmNTn_loC0zN8bHxfbls','BEARER',1,1,204,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTQ2Nzk0NTUsImV4cCI6MTcxNDY4MDg5NX0.QJ_w3S6moug53_xWXK2Fa2cOh5p0z6qDVlZjWja8WmU','BEARER',1,1,205,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTQ2Nzk1ODEsImV4cCI6MTcxNDY4MTAyMX0.qBahlVpf1zgXSfhKL10Wl3Ttz-8PiOVnZj5Vt5qZmg8','BEARER',1,1,252,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTIzNTksImV4cCI6MTcxNTExMzc5OX0.1oc_ReJCg27o6ByUzqAL0_Rj_qtWqY6ebHcBREqjRGg','BEARER',1,1,302,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTI0NDAsImV4cCI6MTcxNTExMzg4MH0.2Rh3dzrvS80u3tl49jDUcVHYJgD7SXxBCK_MhOHqgK4','BEARER',1,1,303,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTQzMDMsImV4cCI6MTcxNTExNTc0M30.pfyJlDUt2re73BxRlfQmRMkmPkBk2zhsKXifwavUbro','BEARER',1,1,304,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTQ3NjgsImV4cCI6MTcxNTExNjIwOH0.97K8DoLk9VjUlnl91_GyMpLOWEMkyeno3A3NvVq0Mqs','BEARER',1,1,305,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxMTYxMDUsImV4cCI6MTcxNTExNzU0NX0.m_hniNOVP_hxxUmG-ePF-i2G7D98vLAW1fq7Di4seYw','BEARER',1,1,306,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTYxMTAsImV4cCI6MTcxNTExNzU1MH0.NcvEOSxKcV7TgFzfhmzWWQ7lAR5BS2-pHxiDFlJUKag','BEARER',1,1,307,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxMTYxMjAsImV4cCI6MTcxNTExNzU2MH0.rDBBaqqQr7k6w12hbHNiDTs5tp-hAp37f3ovGRFjQCc','BEARER',1,1,308,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxMTYxMjUsImV4cCI6MTcxNTExNzU2NX0.lC9HSBuhFVdjqv6tKLVOecnO8yp9yFjnA-Ccm6lf5MU','BEARER',1,1,309,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTYxMjksImV4cCI6MTcxNTExNzU2OX0.cgPfIN1U6JQkkGQmjq_mwuQVH1H4FJ2dtiOQM4fnAi4','BEARER',1,1,310,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTYxNDYsImV4cCI6MTcxNTExNzU4Nn0.EZnmslS4KTK5UgczOKbAfx0TX6uGRgIJobuUX1mXnic','BEARER',1,1,311,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxMTYxNjQsImV4cCI6MTcxNTExNzYwNH0.NcZRN98xp37bt93-rjTV3K0qoeD0avdfpybHw25Ff4s','BEARER',1,1,312,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTc2OTUsImV4cCI6MTcxNTExOTEzNX0.5pdhqyzMmlQ_637bzfo6BMQOmQJ_E4AeVqoy4vvULos','BEARER',1,1,313,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMTc5NTksImV4cCI6MTcxNTExOTM5OX0.NeTSZqF4kozzzzoPJnktb4hMZruLiEvUJpdy63hFs4Y','BEARER',1,1,314,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxMTgxMDYsImV4cCI6MTcxNTExOTU0Nn0.B8SjLtug7elkjbPucXUuFFfosDpsiqItXBKMqFa42VU','BEARER',1,1,315,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMjczNDAsImV4cCI6MTcxNTEyODc4MH0.-ar62fsmamXClPXFWpM9ssO_Fup1OEZ2FIUGPjy18zM','BEARER',1,1,352,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDciLCJpYXQiOjE3MTUxMjc1NjAsImV4cCI6MTcxNTEyOTAwMH0.DX8ZD0cZ29A9ikPsFuwzguaF2Ubn56UNZ74isJZqQpw','BEARER',0,0,353,401),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMjgyMzEsImV4cCI6MTcxNTEyOTY3MX0.L2oxkYrG0FAKnHvi95lvrVXDDbwE0JoXmAIdJSRg7dc','BEARER',1,1,354,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDgiLCJpYXQiOjE3MTUxMjk4ODUsImV4cCI6MTcxNTEzMTMyNX0.wkgMgHD2nwaPTLL1nSdk9HQcXArh_msXOVLVvDTWdQg','BEARER',1,1,355,402),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDgiLCJpYXQiOjE3MTUxMjk5MDYsImV4cCI6MTcxNTEzMTM0Nn0.3YXPFAxoZTweeHfVDadaT4E65NdvU4_uOg44_ymuyUw','BEARER',1,1,356,402),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMjk5NDEsImV4cCI6MTcxNTEzMTM4MX0.6KemK92Kx-O_OKUx4JYj9Fvnyy7HdamfINJP3l0K7Rc','BEARER',1,1,357,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMzAwMjgsImV4cCI6MTcxNTEzMTQ2OH0.dhCARG0JuhJdWd6ihf_0-5fo3Bnvhq1wf1V_-O6h4yM','BEARER',1,1,358,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxMzAyMjMsImV4cCI6MTcxNTEzMTY2M30.TkX59pZyMOMf9lwJeStognSbSGOvUDhrB2URYaR6M18','BEARER',1,1,402,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxODE3MzcsImV4cCI6MTcxNTE4MzE3N30.GfcxpQ12PCG7ZTGRsxUuVYY4YVp1cItM-xz4dh16_rA','BEARER',1,1,452,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxODIzNzgsImV4cCI6MTcxNTE4MzgxOH0.nu9mjsQQ_N4iJpLi0sW-Z_4cYnzKn89_-ONF7GC141s','BEARER',1,1,502,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxODI2MjEsImV4cCI6MTcxNTE4NDA2MX0.ELYK4DTplWxj9qwi-G6NBv7F1pLVWTGE9nUI2RHPLa8','BEARER',1,1,503,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxODM3NTEsImV4cCI6MTcxNTE4NTE5MX0.-1Kb2owzIbTlaOgg2GxiDBqNd9_i78dm75GKxxZvKZ8','BEARER',1,1,504,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUxOTMzMzgsImV4cCI6MTcxNTE5NDc3OH0.auZPgHG0lgHThBYV_TSLsABGV4RbTqQiPVh37evoKK0','BEARER',1,1,552,351),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxOTM5MDcsImV4cCI6MTcxNTE5NTM0N30.8bv--P2GkJkibjlVbVg3i0xITzClFqoYI9cm38WYx1I','BEARER',1,1,602,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDQiLCJpYXQiOjE3MTUxOTQyNTIsImV4cCI6MTcxNTE5NTY5Mn0.cF5UolqZq008uPb2alCLLSB5EmifnpVmbHAeoCVp0zQ','BEARER',0,0,652,251),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDgiLCJpYXQiOjE3MTUxOTY1NTUsImV4cCI6MTcxNTE5Nzk5NX0.j-xHXLSOJcRgf8gBzs9-gYCGBO6bQYdw7xTp_-xnRKk','BEARER',0,0,702,402),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXR0aGV3dGVzdDYiLCJpYXQiOjE3MTUyODY0MDAsImV4cCI6MTcxNTI4Nzg0MH0.nRpLmIBYmb8ZZ7EUw6jsCdG9nTKAvBKN4lMwaxvTRGg','BEARER',0,0,752,351);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_seq`
--

DROP TABLE IF EXISTS `token_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_seq` (
  `next_val` bigint NOT NULL,
  PRIMARY KEY (`next_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_seq`
--

LOCK TABLES `token_seq` WRITE;
/*!40000 ALTER TABLE `token_seq` DISABLE KEYS */;
INSERT INTO `token_seq` VALUES (851);
/*!40000 ALTER TABLE `token_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_registered` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `id` bigint NOT NULL,
  `role` enum('ADMIN','USER') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('johndavorentest','john@davorentest.com','1990-03-01 00:00:00','encrypted_password','1990-01-01',0,'ADMIN'),('matthewtest','Test@yahoo.com',NULL,'$2a$10$gQWwPWfBTw53T3jtzUiAfuELWCB7BThpq2qVFjrqvn2Lt5JTc98D2','2020-10-11',1,'USER'),('TestMatthew','testing@aol.com',NULL,'$2a$10$FUkVwai07A4TNskTKs/RguKDgd0SAeNF9aSZsMPzEVwLgpm7D5F9C','1990-02-06',51,'USER'),('dainbramagetest','matthewdavorenjunk@gmail.com',NULL,'$2a$10$G.sEoIkUH5jOakaalA6k3.u5XTzL0Y4oYSJb3rKgZq8SI7Mye4AuC','1989-02-06',53,'USER'),('matthewtest2','matthewdavorenjunk@gmail.com',NULL,'$2a$10$.ynPYD0HKksqt3EuX7Q/O.MS0jNl6Rq1o4jgya8MH/8yFttQkC0r.','1990-02-06',101,'USER'),('matthewtest2','Testing@yahoo.com',NULL,'$2a$10$KTBdDBCjlsvZlaMUdx8q.ew64ZExG2auDfJlPhtqybUyvvAxRtxb2','2020-10-11',151,'USER'),('matthewtest2','Testing@yahoo.com',NULL,'$2a$10$98HD5goPQ0O./ehGvkakzedwO5Pp576vf3e0aYbRUaBi2f1vhZGSK','2020-10-11',152,'USER'),('matthewtest2','Testing@yahoo.com',NULL,'$2a$10$t4Nsz.iiobRZMP/cXk0W9ejkmX7RNXlSaOd1FCpl.VJUgIRUJjXcy','2020-10-11',201,'USER'),('matthewtest3','Testing2@yahoo.com',NULL,'$2a$10$QZ3HTNhSIGKJJbRKl3Q./.aYzVJEWtbDVwQtCmkRe0CylnS6wisNq','2020-10-11',202,'USER'),('matthewtest4','Testing4@yahoo.com',NULL,'$2a$10$ze3/bxENH1PkitDfPTUB7.KW5FtlegHTqKnjPFaX4qHB6EooJXiDu','2020-10-11',251,'USER'),('matthewtest5','Testing5@yahoo.com',NULL,'$2a$10$kTPJpRS.iYe/c6a1cq7GPOxzGXJk0EwVxoKRlFPEz6tmN4LD46idO','2020-10-11',301,'USER'),('matthewtest6','Testing6@yahoo.com',NULL,'$2a$10$1e12uH.YP7dM197mQmUBoO2f.lIKXQCoK1/fI.SgVBezvj5.WtQaS','2020-10-11',351,'USER'),('matthewtest7','Testing6@yahoo.com',NULL,'$2a$10$OGbCHslmTegYnxy3LoVsweU1hP67tisEiMU/Knr5gdmpn997b5.Ze','2020-10-11',401,'USER'),('matthewtest8','matthewtest8@aol.com',NULL,'$2a$10$32JMwlDf96sQM7fveNmd8eHR4jD2qcnrQhILv7HXyJhRGgXH/w58q','1990-02-06',402,'USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_seq`
--

DROP TABLE IF EXISTS `users_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_seq` (
  `next_val` bigint NOT NULL,
  PRIMARY KEY (`next_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_seq`
--

LOCK TABLES `users_seq` WRITE;
/*!40000 ALTER TABLE `users_seq` DISABLE KEYS */;
INSERT INTO `users_seq` VALUES (500);
/*!40000 ALTER TABLE `users_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_tags`
--

DROP TABLE IF EXISTS `video_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_tags` (
  `video_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`video_id`,`tag_id`),
  KEY `fk_video_tags_tags1_idx` (`tag_id`),
  CONSTRAINT `fk_video_tags_tags1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_video_tags_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_tags`
--

LOCK TABLES `video_tags` WRITE;
/*!40000 ALTER TABLE `video_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `video_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-13 10:56:29
