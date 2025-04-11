-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: youtube_layer
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Latest trends and updates in technology','Technology'),(2,'Tips and insights on maintaining a healthy lifestyle','Health & Wellness'),(3,'Guides and experiences from around the world','Travel'),(4,'Recipes, reviews, and culinary tips','Food'),(5,'Insights on entrepreneurship and corporate strategies','Business'),(6,'Personal finance, investing, and economic trends','Finance'),(7,'Learning resources and educational advancements','Education'),(8,'Movies, music, and celebrity news','Entertainment'),(9,'News and analysis on various sports','Sports'),(10,'Discoveries and advancements in science','Science'),(11,'Fashion, beauty, and daily living tips','Lifestyle'),(12,'Advice and experiences on raising children','Parenting'),(13,'Creative projects and how-to guides','DIY & Crafts'),(14,'Techniques, gear, and inspiration for photographers','Photography'),(15,'Reviews, news, and updates on video games','Gaming'),(16,'Car reviews, industry news, and driving tips','Automobiles'),(17,'Book reviews, recommendations, and discussions','Books'),(18,'Strategies and trends in digital and traditional marketing','Marketing'),(19,'Exploring historical events and figures','History'),(20,'Analysis and discussions on global and local politics','Politics');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `com_id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  `c_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  KEY `FK_POST_COMMENT` (`pid`),
  KEY `FK_USER_COMMENT` (`uid`),
  CONSTRAINT `FK_POST_COMMENT` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`),
  CONSTRAINT `FK_USER_COMMENT` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,2,'Great Blog!'),(2,3,2,'\"Although my body is very limited, my mind is free to explore the universe.\"  -Stephen Hawking (1942-2018)'),(3,3,1,'theres a universe where stephen hawking is still alive, and that makes me smile (through tears). rip'),(4,3,3,'Brilliant and funny.'),(6,5,2,'jgugug'),(7,14,2,'89u9h');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `FK_POST_LIKE` (`pid`),
  KEY `FK_USER_LIKE` (`uid`),
  CONSTRAINT `FK_POST_LIKE` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`),
  CONSTRAINT `FK_USER_LIKE` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1),(2,1,2),(4,2,2),(5,3,2),(6,3,1),(7,3,3),(8,2,3),(9,1,3),(11,5,1),(13,2,1),(15,5,2),(16,14,2);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `cid` int NOT NULL,
  `pid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `p_date` datetime(6) DEFAULT NULL,
  `p_code` varchar(255) DEFAULT NULL,
  `p_pic` varchar(255) DEFAULT NULL,
  `p_title` varchar(255) DEFAULT NULL,
  `p_video` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `p_content` text,
  PRIMARY KEY (`pid`),
  KEY `FK_CATEGORY_POST` (`cid`),
  KEY `FK_USER_POST` (`uid`),
  CONSTRAINT `FK_CATEGORY_POST` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`),
  CONSTRAINT `FK_USER_POST` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,1,'2025-03-26 21:13:55.663494','','lifestyle1.jpg','How has technology changed your job?','','','[image]\r\n\r\nFour of my sisters work in the field. Our fourth sister is a preacher, and our eldest sister does a little livestock. I’m doing so differently compared to them, and that’s okay.\r\n\r\nWhen my three sisters talk about the department they are in, the ins and outs—it sounds foreign to me. Likewise, they can’t relate to mine.\r\n\r\nI explored work on the Internet right after my graduation; hence, I have no experience in any physical workplace. I work online from scratch. The Internet and my devices gave me work. Without it, I am unemployed (or I think I still belong to that category in terms of society’s standard since my work isn’t financially stable), but I’m grateful for it, as my mind is occupied daily. I can share my (beautiful) thoughts.\r\n\r\nI love working remotely with flexibility. I can stop and reschedule whenever I want. One time, my high school classmate asked me about my work and the earnings of it. I said, My work is only for a single person who doesn’t think about family needs overall. (I’m still dependent on my parents and sisters for many matters.). I help sometimes a little bit, and they understand my capability.\r\n\r\nTechnology helps me in many ways, and we all know what those things are.\r\n\r\nFor all my supporters here, you always help me in everything I do online. Thank you so much for your love, kindness, and generosity. I couldn’t have done it without you. You make a difference and make the world more beautiful. Hence, you’re beautiful just the way you are!\r\n\r\nHugs and gratitude to all of you, my amazing readers! Stay blessed.\r\n\r\nPeace and love,\r\n\r\nHazel \r\n\r\n'),(15,2,2,'2025-03-26 21:27:56.947062','','','Top 10 Gaming Consoles of All Time','','https://youtu.be/rCCPVDawF4c?si=dAqhv7Xqp8_eB4HJ','Gaming consoles have transformed the way we experience interactive entertainment. From retro classics to modern powerhouses, here’s a list of the top 10 gaming consoles that have shaped the industry.\r\n\r\n[youtube]\r\n\r\n1. PlayStation 5\r\nThe PlayStation 5 (PS5) is a powerhouse of performance, offering lightning-fast load times with its custom SSD, ray tracing, and 4K gaming at 120Hz. Exclusive titles like Demon’s Souls and Spider-Man: Miles Morales make it a must-have for gamers.\r\n\r\n2. Xbox Series X\r\nDubbed the \"most powerful console\", the Xbox Series X boasts 12 teraflops of power, Quick Resume for instant game-switching, and Game Pass, which offers a vast library of games.\r\n\r\n3. Nintendo Switch OLED\r\nNintendo’s hybrid console allows seamless switching between handheld and docked mode. The OLED screen enhances visuals, making games like Breath of the Wild look even more stunning.\r\n\r\n4. Steam Deck\r\nValve’s portable PC gaming console brings AAA gaming on the go with access to your full Steam library. It’s a dream come true for PC gamers who want flexibility.\r\n\r\n5. PlayStation 4 Pro\r\nBefore the PS5, the PlayStation 4 Pro was Sony’s most successful console, bringing 4K gaming, a vast library of exclusives, and VR support.\r\n\r\n6. Xbox One X\r\nThe Xbox One X was the first console to truly deliver native 4K gaming and backward compatibility with older Xbox titles, making it a fan favorite.\r\n\r\n7. Nintendo Wii\r\nThe Nintendo Wii changed gaming with its motion controls, making it a hit among casual and hardcore gamers alike. Games like Wii Sports became cultural phenomena.\r\n\r\n8. PlayStation 3\r\nWith Blu-ray support, online gaming, and iconic titles like The Last of Us, the PlayStation 3 paved the way for modern consoles.\r\n\r\n9. Sega Genesis\r\nThe Sega Genesis brought 16-bit gaming to the masses, introducing beloved franchises like Sonic the Hedgehog and Streets of Rage.\r\n\r\n10. Super Nintendo Entertainment System (SNES)\r\nThe SNES was home to some of the greatest games ever made, from Super Mario World to The Legend of Zelda: A Link to the Past.'),(10,3,2,'2025-03-26 21:34:23.963372','','','Stephen Hawking: A Brilliant Mind Beyond Boundaries','Stephen Hawking - Most Funny Moments.mp4','','Stephen Hawking was one of the most influential scientists of all time, known for his groundbreaking work in theoretical physics, cosmology, and black hole research. Despite being diagnosed with a rare motor neuron disease, he defied the odds and reshaped our understanding of the universe.\r\n\r\n[video]\r\n\r\nEarly Life and Education\r\nBorn on January 8, 1942, in Oxford, England, Stephen William Hawking was an inquisitive child with a deep interest in science. He studied physics at the University of Oxford and later pursued a PhD in cosmology at the University of Cambridge. It was during his time at Cambridge that he was diagnosed with amyotrophic lateral sclerosis (ALS), a condition that gradually paralyzed him. Doctors gave him only a few years to live, but Hawking went on to defy expectations and continued his research for over 50 years.\r\n\r\nGroundbreaking Scientific Contributions\r\n1. Black Hole Theory and Hawking Radiation\r\nHawking’s most famous discovery was Hawking radiation, which proposed that black holes are not entirely black but instead emit radiation and can eventually evaporate. This idea challenged the long-standing belief that nothing could escape from a black hole.\r\n\r\n2. The Big Bang and Cosmology\r\nHawking worked extensively on the origins of the universe, supporting the Big Bang theory and exploring concepts of singularities in space-time. His collaboration with Roger Penrose on gravitational singularities remains one of the most important works in cosmology.\r\n\r\n3. A Brief History of Time\r\nIn 1988, Hawking published A Brief History of Time, a book that simplified complex scientific theories for the general public. The book became a bestseller, selling over 25 million copies worldwide and making Hawking a household name.\r\n\r\nLife with ALS and Overcoming Challenges\r\nDespite his physical limitations, Hawking continued his research using a computer-based speech system. His resilience and sense of humor made him an inspiration worldwide. He once said,\r\n\"However difficult life may seem, there is always something you can do and succeed at.\"\r\n\r\nPublic Appearances and Pop Culture Influence\r\nHawking was not just a scientist but also a pop culture icon. He appeared on shows like The Simpsons, Star Trek: The Next Generation, and The Big Bang Theory. His distinctive voice, generated by his speech synthesizer, became instantly recognizable.\r\n\r\nLegacy and Passing\r\nStephen Hawking passed away on March 14, 2018, at the age of 76. His contributions to science remain invaluable, and his legacy continues to inspire future generations of scientists, thinkers, and dreamers.\r\n\r\nConclusion\r\nStephen Hawking’s life was a testament to human perseverance, intelligence, and curiosity. His work not only expanded our understanding of the universe but also showed the world that the mind has no limits—even when the body does.\r\n\r\n“Look up at the stars and not down at your feet.” – Stephen Hawking'),(9,5,1,'2025-03-28 12:25:38.490183','','food1.jpg','r4yruyryu','','https://youtu.be/0CR9fNB9fds?si=MiJ9Tu2DqEVl1_3h','yhjtryutr\r\n[image]\r\n[youtube]'),(4,14,2,'2025-04-11 12:00:30.224388','','food2.jpg','uhbub','Girl walking Alone - Sunset - Girl Cinematic - No Copyright Video - Free Stock Footage.mp4','https://youtu.be/-GzScdP6OyU?si=3Jx_a6GR42CWXQJ8','dfdsg\r\n[image]\r\n[video]\r\n[youtube]');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_seq`
--

DROP TABLE IF EXISTS `post_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_seq`
--

LOCK TABLES `post_seq` WRITE;
/*!40000 ALTER TABLE `post_seq` DISABLE KEYS */;
INSERT INTO `post_seq` VALUES (351);
/*!40000 ALTER TABLE `post_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_blocked` bit(1) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `is_sys_admin` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '\0','2025-03-26 15:51:24.298554','Hey! I am a user.','radhe@gmail.com','male','Radhe Mohan','$2a$10$90ueKwog2vS.NFT5s9DAMu3Y22hUQGhUnMQP1HQ3ZBy.cj/NxhJKu','default_pic.jpeg','admin',_binary '\0'),(2,_binary '\0','2025-03-26 21:21:20.260134','Hey! I am a user.','Aditya@gmail.com','male','Aditya Singh','$2a$10$YEWWtlSmuJ9Iep2hEcvb.OrRz27sacSGtZ8XtnDRx8Ip1KMkp6GC2','default_pic.jpeg','user',_binary '\0'),(3,_binary '\0','2025-03-26 21:39:21.960715','Hey! I am a user.','nikitatiwari@gmail.com','female','Nikita Tiwari','$2a$10$CE0WTkEMDEIuOZfpbdeuIO.zC.1aCVzkp.L7yX8/Xbj7X.AkIVcGS','default_pic.jpeg','user',_binary '\0'),(4,_binary '\0','2025-04-10 19:08:33.891304','Hey! I am a user.','sysadmin@gmail.com','male','Sytem Administrator','$2a$10$dmhFO3pBo9b3Khuh5Mgkn.4XDBB0B1CIW75gNH6QGETlNYhsODoji','default_pic.jpeg','admin',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (101);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-11 14:47:43
