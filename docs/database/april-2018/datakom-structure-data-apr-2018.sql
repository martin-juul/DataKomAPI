/*
 Source Server         : Docker
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:4306
 Source Schema         : DataKomNew

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 07/04/2018 12:28:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dk_adm_users
-- ----------------------------
DROP TABLE IF EXISTS `dk_adm_users`;
CREATE TABLE `dk_adm_users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(64) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_danish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `is_activated` tinyint(1) unsigned DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Administration/Content_Management Users';

-- ----------------------------
-- Records of dk_adm_users
-- ----------------------------
BEGIN;
INSERT INTO `dk_adm_users` VALUES (3, 'Martin', 'Juul', 'martin@juul.xyz', '$2y$10$A8BO2cvgPIG43JsP02OQ7.0DNqHD9S7sWroWaokF3HZYrKTeXQ0lu', 1, '2018-04-03 06:35:12', '2018-03-31 17:50:46', '2018-04-03 06:35:12');
COMMIT;

-- ----------------------------
-- Table structure for dk_cards
-- ----------------------------
DROP TABLE IF EXISTS `dk_cards`;
CREATE TABLE `dk_cards` (
  `card_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_danish_ci,
  `color` varchar(20) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_id`),
  KEY `card_color_id_to_color` (`color`),
  KEY `cards_to_collection` (`collection_id`),
  CONSTRAINT `cards_to_collection` FOREIGN KEY (`collection_id`) REFERENCES `dk_collections` (`collection_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Site Content';

-- ----------------------------
-- Records of dk_cards
-- ----------------------------
BEGIN;
INSERT INTO `dk_cards` VALUES (1, 1, 'EUD', 'En elev under 25 år', '##### Varighed\n\nIt supporter 2 år + grundforløbet 25 ugers skoleundervisning fordelt på 3 skoleperioder.\n \nInfrastruktur 4,5 år + grundforløbet 55 ugers skoleundervisning fordelt på 6-7 skoleperioder.\n  \nProgrammering 4,5 år 0 grundforløbet 55 ugers skoleundervisning fordelt på 6 skoleperioder.', 'lightblue', '2018-03-09 18:35:55', '2018-03-09 19:50:45');
INSERT INTO `dk_cards` VALUES (2, 1, 'EUX', 'Alle elever uanset alder.', 'En kombination af en gymnasial uddannelse og en datatekniker (kan ikke tages som it-supporter).\n\n5 år + grundforløb - skoleophold 88,7 uger fordelt på 5 skoleperioder.', 'orange', '2018-03-09 18:36:48', '2018-03-09 19:51:37');
INSERT INTO `dk_cards` VALUES (3, 1, 'EUV 1', 'Elev over 25 år med to års relevant erhverserfaring.', 'Ingen grundforløb.\n\nIngen praktikperioder.\n\n##### Skoleophold \n\nIt-supporter 22,5 uger så vidt muligt i et forløb.\n\nInfrastruktur 49,5 uger så vidt muligt i et forløb.\n\nProgrammering 49,5 uger så vidt muligt i et forløb.\n\nHvis eleven er anset på en virksomhed - kan man aftale ophold mellem skoleperioderne.\n\nElever uden virksomhed kan få SU.', 'red', '2018-03-09 18:37:35', '2018-03-09 19:52:07');
INSERT INTO `dk_cards` VALUES (4, 1, 'EUV 3', 'En elev over 25 år uden tidligere uddannelse', '##### Varighed\n\n\nDen samme som EUD.', 'blue', '2018-03-09 18:37:45', '2018-03-09 19:52:20');
INSERT INTO `dk_cards` VALUES (5, 1, 'EUV 2', 'Elev over 25 år med tidligere uddannelse.', '##### Varighed\n\nIt-supporter 1 år og 11 mdr. + grundforløb - 22,5 ugers skoleundervisning fordelt på 3 hovedforløb.\n\nInfrastruktur 2 år og 11 mdr. + grundforløb - 49,5 ugers skoleundervisning fordelt på 6-7 hovedforløb.\n\nProgrammering 2 år og 11 mdr. + grundforløb 49,5 ugers skoleundervisning fordelt på 6 skoleophold.', 'green', '2018-03-09 18:38:29', '2018-03-09 19:52:40');
COMMIT;

-- ----------------------------
-- Table structure for dk_collections
-- ----------------------------
DROP TABLE IF EXISTS `dk_collections`;
CREATE TABLE `dk_collections` (
  `collection_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- ----------------------------
-- Records of dk_collections
-- ----------------------------
BEGIN;
INSERT INTO `dk_collections` VALUES (1, 'StudentTypes', '2018-03-09 18:44:30', '2018-03-09 19:16:24');
INSERT INTO `dk_collections` VALUES (2, 'Educations', '2018-03-09 18:51:51', NULL);
COMMIT;

-- ----------------------------
-- Table structure for dk_colors
-- ----------------------------
DROP TABLE IF EXISTS `dk_colors`;
CREATE TABLE `dk_colors` (
  `color_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `hex` varchar(6) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Site Content - Predefined colour scheme. Included in a table for api usage.';

-- ----------------------------
-- Records of dk_colors
-- ----------------------------
BEGIN;
INSERT INTO `dk_colors` VALUES (1, 'Light Blue', '9acee0', '2018-03-09 18:30:44', '2018-03-09 18:31:31');
INSERT INTO `dk_colors` VALUES (2, 'Blue', '006c80', '2018-03-09 18:31:52', NULL);
INSERT INTO `dk_colors` VALUES (3, 'Green', '8bb625', '2018-03-09 18:32:06', NULL);
INSERT INTO `dk_colors` VALUES (4, 'Red', 'F44336', '2018-03-09 18:32:45', NULL);
INSERT INTO `dk_colors` VALUES (5, 'Orange', 'f6831e', '2018-03-09 18:33:00', NULL);
COMMIT;

-- ----------------------------
-- Table structure for dk_content
-- ----------------------------
DROP TABLE IF EXISTS `dk_content`;
CREATE TABLE `dk_content` (
  `content_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `header_title` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `header_image` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_danish_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Page content. The content column is markdown formatted.';

-- ----------------------------
-- Records of dk_content
-- ----------------------------
BEGIN;
INSERT INTO `dk_content` VALUES (1, 'it-supporter', 'IT Supporter', 'assets/images/headers/it-supporter-header.jpg', '## Sørg for den bedste IT-faglige hjælp til maskiner – og mennesker\n\n#### Der findes stort set ikke virksomheder, der ikke er afhængige af it på den ene eller anden måde. Og det betyder samtidig, at stort set alle virksomheder har behov for nogle, der kan sikre, at systemerne virker optimalt – og en, der kan hjælpe, hvis de ikke gør.\n\nSom it-supporter skal du ikke alene kunne finde og fikse it-relaterede problemer - du skal også kunne forklare og få folk til at forstå problemet. Eller i det mindste for dem til ikke at lave den samme fejl igen – eller i så fald kunne løse problemet selv.\n\nPå uddannelsen opnår du en bred viden om it, der gør dig i stand til at finde fejl og se sammenhænge mellem forskellige systemer. Du bliver også klædt på til at foretage rutinetjek i it-afdelingen.\n\nDesuden lærer du at opbygge og vedligeholde samt optimere netværksløsninger.\n\nSom uddannet it-supporter vil dine primære opgaver være at:\n\n+ drifte og vedligeholdelse af it-systemet\n+ finde og fikse it-relaterede fejl og brugerfejl\n+ installere og konfigurere computere, programmer og øvrige it-installationer\n+ vejlede brugerne og sikre hjælp-til-selvhjælp\n+ tilslutte monitorer, printere, routere, servere mv.', '2018-03-09 19:13:26', '2018-03-09 21:02:26');
INSERT INTO `dk_content` VALUES (2, 'datatekniker-infrastruktur', 'Datatekniker / Infrastruktur', 'assets/images/headers/datatekniker-infrastruktur-header.jpg', '## Opbyg brugbare og brugervenlige IT-Systemer og Netværk\n\n#### De kan være simple eller avancerede. Statiske eller dynamiske. Til brugere eller superbrugere. Som datetekniker med speciale i infrastruktur er det din opgave, at netværket eller it-systemet fungerer optimalt i forhold til målgruppen.\n\nSelv de nyeste og hurtigste maskiner arbejder ikke hurtigere end it-infrastrukturen giver plads til. Det er derfor dit job at sikre lynhurtige forbindelser internt og eksternt. Derfor har de fleste virksomheder brug for datateknikere med speciale i it-infrastruktur til at opbygge netværk, server- og storage-systemer.\n\nI løbet af uddannelsen får du viden om, hvordan du opbygger og vedligeholder datasystemer med forskellige formål og funktioner. Du lærer også om installation og konfiguration af forskellige former for dataanlæg – og koble styresystemer og net sammen.\n\nSom uddannet datatekniker med speciale i infrastruktur vil dine primære opgaver være at:\n\n+ Opbygge og optimere samt installere og implementere it-infrastrukturer\n+ Sikre det bedst mulige sammenspil mellem bruger og brugerdesign\n+ Vedligeholde og sikre optimal drift af it-systemer\n+ Give support og vejledning til brugerne af systemet\n+ Følge de nyeste teknogier tæt og anvende dem', '2018-03-09 19:14:00', '2018-03-09 21:09:21');
INSERT INTO `dk_content` VALUES (3, 'datatekniker-programmering', 'Datatekniker / Programmering', 'assets/images/headers/datatekniker-programmering-header.jpg', '## Skab fremtidens digitale løsninger - og skab fremtiden!\n\n#### Java, SML. Python, SQL, C# … tænker du, at det er total volapyk? Så kan vi garantere dig, at det synes du ikke, når du er færdig med dit speciale. Koder og programmering hænger nemlig uløseligt sammen – men det ved du nok allerede.\n\nVi lever i en digital verden, hvor apps, websites og andre it-systemer er helt naturlige – ja, faktisk uundværlige redskaber i hverdagen. Mange har ideer til nye digitale løsninger, men de færreste kan i dag finde ud af at programmere og reelt udvikle dem. Datateknikere med speciale i programmeringer er derfor en eftertragtet ressource både nu, men bestemt også i fremtiden.\n\nI løbet af uddannelsen lærer du ikke bare at skrive en masse koder slavisk ned i en editor. Du lærer derimod at tænke kreativt, løsningsorienteret og systematisk. Herudover får du selvfølgelig kendskab til de mest anvendte og fremtidssikrede programmeringssprog  - og lærer at vurdere, hvilken type kode, der vil være mest egnet til formålet.\n\nSom uddannet datatekniker med speciale i programmering vil dine primære opgaver være at:\n\n+ Udvikle idéer til it-systemers funktionalitet, design og struktur\n+ Opbygge og vedligeholde forskellige typer it-systemer\n+ Give support og vejledning til brugerne af systemet\n+ Løbende fejlsøgning, vedligeholdelse og support\n+ Følge de nyeste teknogier tæt og anvende dem', '2018-03-09 19:14:36', '2018-03-09 21:10:15');
COMMIT;

-- ----------------------------
-- Table structure for dk_content_cards
-- ----------------------------
DROP TABLE IF EXISTS `dk_content_cards`;
CREATE TABLE `dk_content_cards` (
  `content_card_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned DEFAULT NULL,
  `content_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_danish_ci,
  `image` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `internalLink` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`content_card_id`),
  UNIQUE KEY `content_id` (`content_id`) USING BTREE,
  KEY `content_cards_to_collection` (`collection_id`),
  CONSTRAINT `content_card_to_content` FOREIGN KEY (`content_id`) REFERENCES `dk_content` (`content_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `content_cards_to_collection` FOREIGN KEY (`collection_id`) REFERENCES `dk_collections` (`collection_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Page content';

-- ----------------------------
-- Records of dk_content_cards
-- ----------------------------
BEGIN;
INSERT INTO `dk_content_cards` VALUES (1, 2, 1, 'IT-Supporter', 'it-supporter', 'Sørg for den bedste IT-faglige hjælp til maskiner – og mennesker', 'Der findes stort set ikke virksomheder, der ikke er afhængige af it på den ene eller anden måde. Og det betyder samtidig, at stort set alle virksomheder har behov for nogle, der kan sikre, at systemerne virker optimalt – og en, der kan hjælpe, hvis de ikke gør.', 'assets/images/cards/it-supporter-card.jpg', '/uddannelser/it-supporter', '2018-03-09 18:52:08', '2018-03-09 20:21:54');
INSERT INTO `dk_content_cards` VALUES (2, 2, 2, 'Datatekniker / Infrastruktur', 'datatekniker-infrastruktur', 'Opbyg brugbare og brugervenlige IT-systemer og netværk', 'De kan være simple eller avancerede. Statiske eller dynamiske. Til brugere eller superbrugere. Som datetekniker med speciale i infrastruktur er det din opgave, at netværket eller it-systemet fungerer optimalt i forhold til målgruppen.', 'assets/images/cards/datatekniker-card.jpg', '/uddannelser/datatekniker-infrastruktur', '2018-03-09 18:53:21', '2018-03-09 20:22:23');
INSERT INTO `dk_content_cards` VALUES (3, 2, 3, 'Datatekniker / Programmering', 'datatekniker-programmering', 'Skab fremtidens digitale løsninger - og skab fremtiden!', 'Java, SML. Python, SQL, C# … tænker du, at det er total volapyk? Så kan vi garantere dig, at det synes du ikke, når du er færdig med dit speciale. Koder og programmering hænger nemlig uløseligt sammen – men det ved du nok allerede.', 'assets/images/cards/datatekniker-card.jpg', '/uddannelser/datatekniker-programmering', '2018-03-09 18:54:04', '2018-03-09 20:22:28');
COMMIT;

-- ----------------------------
-- Table structure for dk_course_length
-- ----------------------------
DROP TABLE IF EXISTS `dk_course_length`;
CREATE TABLE `dk_course_length` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) unsigned NOT NULL,
  `student_group_id` int(11) unsigned NOT NULL,
  `semester_id` int(11) unsigned DEFAULT NULL,
  `course_length` varchar(6) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dk_courses_length_id_index` (`id`) USING BTREE,
  KEY `dk_courses_fk_ids` (`course_id`,`student_group_id`) USING BTREE,
  KEY `student_group_id_to_student_groups` (`student_group_id`),
  KEY `course_length_semester_to_semester` (`semester_id`),
  CONSTRAINT `course_length_semester_to_semester` FOREIGN KEY (`semester_id`) REFERENCES `dk_semesters` (`semester_id`) ON DELETE CASCADE,
  CONSTRAINT `courses_length_course_id_to_courses_courses_id` FOREIGN KEY (`course_id`) REFERENCES `dk_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_group_id_to_student_groups` FOREIGN KEY (`student_group_id`) REFERENCES `dk_student_type_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Links Student type groups, semesters and courses together with a defined course length.';

-- ----------------------------
-- Records of dk_course_length
-- ----------------------------
BEGIN;
INSERT INTO `dk_course_length` VALUES (22, 9, 1, 3, '2', '2018-03-22 17:55:41', '2018-03-22 18:52:50');
INSERT INTO `dk_course_length` VALUES (23, 10, 1, 3, '1', '2018-03-22 17:55:47', '2018-03-22 18:53:58');
INSERT INTO `dk_course_length` VALUES (24, 11, 1, 3, '1', '2018-03-22 17:55:54', '2018-03-22 18:54:05');
INSERT INTO `dk_course_length` VALUES (25, 12, 1, 3, '1', '2018-03-22 17:56:03', '2018-03-22 18:54:15');
INSERT INTO `dk_course_length` VALUES (26, 13, 1, 3, '0,5', '2018-03-22 17:56:17', '2018-03-22 18:54:16');
INSERT INTO `dk_course_length` VALUES (27, 14, 1, 3, '1,5', '2018-03-22 17:56:27', '2018-03-22 18:54:19');
INSERT INTO `dk_course_length` VALUES (28, 15, 1, 3, '1', '2018-03-22 17:56:35', '2018-03-22 18:54:21');
INSERT INTO `dk_course_length` VALUES (29, 16, 1, 3, '1', '2018-03-22 17:57:29', '2018-03-22 18:54:25');
INSERT INTO `dk_course_length` VALUES (30, 18, 1, 3, '1', '2018-03-22 17:57:35', '2018-03-22 18:54:34');
INSERT INTO `dk_course_length` VALUES (31, 20, 1, 4, '1', '2018-03-22 18:03:14', '2018-03-22 19:02:39');
INSERT INTO `dk_course_length` VALUES (32, 17, 1, 4, '1', '2018-03-22 18:03:37', '2018-03-22 19:02:28');
INSERT INTO `dk_course_length` VALUES (33, 21, 1, 4, '1,5', '2018-03-22 18:03:58', '2018-03-22 19:02:58');
INSERT INTO `dk_course_length` VALUES (34, 22, 1, 4, '1', '2018-03-22 18:04:08', '2018-03-22 19:03:07');
INSERT INTO `dk_course_length` VALUES (35, 23, 1, 5, '2', '2018-03-22 18:09:41', '2018-03-22 19:04:48');
INSERT INTO `dk_course_length` VALUES (36, 24, 1, 5, '0,5', '2018-03-22 18:10:05', '2018-03-22 19:05:06');
INSERT INTO `dk_course_length` VALUES (37, 25, 1, 5, '1', '2018-03-22 18:10:19', '2018-03-22 19:05:34');
INSERT INTO `dk_course_length` VALUES (38, 26, 1, 5, '2', '2018-03-22 18:10:26', '2018-03-22 19:06:00');
INSERT INTO `dk_course_length` VALUES (39, 27, 1, 5, '2', '2018-03-22 18:11:16', '2018-03-22 19:06:14');
INSERT INTO `dk_course_length` VALUES (40, 28, 1, 6, '1', '2018-03-22 18:12:56', '2018-03-22 19:06:32');
INSERT INTO `dk_course_length` VALUES (41, 29, 1, 6, '1', '2018-03-22 18:14:08', '2018-03-22 19:06:47');
INSERT INTO `dk_course_length` VALUES (42, 30, 1, 6, '1', '2018-03-22 18:14:13', '2018-03-22 19:06:48');
INSERT INTO `dk_course_length` VALUES (43, 31, 1, 6, '1', '2018-03-22 18:15:05', '2018-03-22 19:06:57');
INSERT INTO `dk_course_length` VALUES (44, 32, 1, 6, '1', '2018-03-22 18:15:40', '2018-03-22 19:07:04');
INSERT INTO `dk_course_length` VALUES (45, 33, 1, 6, '2', '2018-03-22 18:16:16', '2018-03-22 19:07:09');
INSERT INTO `dk_course_length` VALUES (46, 34, 1, 7, '1', '2018-03-22 18:20:09', '2018-03-22 19:07:38');
INSERT INTO `dk_course_length` VALUES (47, 35, 1, 7, '1', '2018-03-22 18:21:02', '2018-03-22 19:07:46');
INSERT INTO `dk_course_length` VALUES (48, 36, 1, 7, '1', '2018-03-22 18:21:41', '2018-03-22 19:07:56');
INSERT INTO `dk_course_length` VALUES (49, 37, 1, 7, '2', '2018-03-22 18:22:26', '2018-03-22 19:08:15');
INSERT INTO `dk_course_length` VALUES (50, 38, 1, 7, '1', '2018-03-22 18:22:58', '2018-03-22 19:08:32');
INSERT INTO `dk_course_length` VALUES (51, 39, 1, 7, '2', '2018-03-22 18:23:43', '2018-03-22 19:08:38');
INSERT INTO `dk_course_length` VALUES (52, 40, 1, 8, '1', '2018-03-22 18:25:34', '2018-03-22 19:08:45');
INSERT INTO `dk_course_length` VALUES (53, 41, 1, 8, '4', '2018-03-22 18:26:34', '2018-03-22 19:08:46');
INSERT INTO `dk_course_length` VALUES (54, 10, 1, 4, '2', '2018-03-23 22:55:00', NULL);
INSERT INTO `dk_course_length` VALUES (55, 11, 1, 4, '1,5', '2018-03-23 22:55:18', NULL);
INSERT INTO `dk_course_length` VALUES (56, 19, 1, 4, '1', '2018-03-23 22:55:34', NULL);
INSERT INTO `dk_course_length` VALUES (57, 12, 1, 4, '1', '2018-03-23 22:59:24', NULL);
INSERT INTO `dk_course_length` VALUES (58, 12, 1, 5, '1', '2018-03-23 23:01:04', NULL);
INSERT INTO `dk_course_length` VALUES (59, 19, 1, 5, '1,5', '2018-03-23 23:01:30', NULL);
INSERT INTO `dk_course_length` VALUES (60, 24, 1, 6, '1', '2018-03-23 23:04:46', NULL);
INSERT INTO `dk_course_length` VALUES (61, 27, 1, 6, '2', '2018-03-23 23:05:08', NULL);
INSERT INTO `dk_course_length` VALUES (62, 23, 1, 7, '1', '2018-03-23 23:12:57', NULL);
INSERT INTO `dk_course_length` VALUES (63, 27, 1, 7, '1', '2018-03-23 23:13:13', NULL);
INSERT INTO `dk_course_length` VALUES (64, 9, 2, 9, '2', '2018-03-24 19:34:11', '2018-03-24 19:35:15');
INSERT INTO `dk_course_length` VALUES (65, 10, 2, 9, '1', '2018-03-24 19:34:11', '2018-03-24 19:35:14');
INSERT INTO `dk_course_length` VALUES (66, 11, 2, 9, '1', '2018-03-24 19:34:11', '2018-03-24 19:35:12');
INSERT INTO `dk_course_length` VALUES (67, 12, 2, 9, '1', '2018-03-24 19:34:11', '2018-03-24 19:35:10');
INSERT INTO `dk_course_length` VALUES (68, 13, 2, 9, '0,5', '2018-03-24 19:34:11', '2018-03-24 19:35:11');
INSERT INTO `dk_course_length` VALUES (69, 14, 2, 9, '1,5', '2018-03-24 19:34:11', '2018-03-24 19:35:09');
INSERT INTO `dk_course_length` VALUES (70, 15, 2, 9, '1', '2018-03-24 19:34:11', '2018-03-24 19:35:08');
INSERT INTO `dk_course_length` VALUES (71, 16, 2, 9, '1', '2018-03-24 19:34:11', '2018-03-24 19:35:08');
INSERT INTO `dk_course_length` VALUES (72, 18, 2, 9, '1', '2018-03-24 19:34:11', '2018-03-24 19:35:05');
INSERT INTO `dk_course_length` VALUES (73, 19, 2, 10, '1', '2018-03-24 19:40:31', '2018-03-24 19:43:35');
INSERT INTO `dk_course_length` VALUES (74, 11, 2, 10, '1,5', '2018-03-24 19:40:31', '2018-03-24 19:43:43');
INSERT INTO `dk_course_length` VALUES (75, 10, 2, 10, '2', '2018-03-24 19:40:31', '2018-03-24 19:43:45');
INSERT INTO `dk_course_length` VALUES (76, 12, 2, 10, '1', '2018-03-24 19:40:31', '2018-03-24 19:43:46');
INSERT INTO `dk_course_length` VALUES (77, 17, 2, 10, '1', '2018-03-24 19:40:31', '2018-03-24 19:43:47');
INSERT INTO `dk_course_length` VALUES (78, 21, 2, 10, '1,5', '2018-03-24 19:40:31', '2018-03-24 19:43:48');
INSERT INTO `dk_course_length` VALUES (79, 20, 2, 10, '1', '2018-03-24 19:40:31', '2018-03-24 19:43:49');
INSERT INTO `dk_course_length` VALUES (80, 22, 2, 10, '1', '2018-03-24 19:40:31', '2018-03-24 19:43:49');
INSERT INTO `dk_course_length` VALUES (81, 24, 2, 11, '0,5', '2018-03-24 19:53:11', NULL);
INSERT INTO `dk_course_length` VALUES (82, 12, 2, 11, '1', '2018-03-24 19:53:11', NULL);
INSERT INTO `dk_course_length` VALUES (83, 19, 2, 11, '1,5', '2018-03-24 19:53:11', NULL);
INSERT INTO `dk_course_length` VALUES (84, 23, 2, 11, '2', '2018-03-24 19:53:11', NULL);
INSERT INTO `dk_course_length` VALUES (85, 26, 2, 11, '2', '2018-03-24 19:53:11', NULL);
INSERT INTO `dk_course_length` VALUES (86, 25, 2, 11, '1', '2018-03-24 19:53:11', NULL);
INSERT INTO `dk_course_length` VALUES (87, 31, 2, 12, '1', '2018-03-24 20:00:38', NULL);
INSERT INTO `dk_course_length` VALUES (88, 32, 2, 12, '1', '2018-03-24 20:00:38', NULL);
INSERT INTO `dk_course_length` VALUES (89, 30, 2, 12, '1', '2018-03-24 20:00:38', NULL);
INSERT INTO `dk_course_length` VALUES (90, 29, 2, 12, '1', '2018-03-24 20:00:38', NULL);
INSERT INTO `dk_course_length` VALUES (91, 24, 2, 12, '1', '2018-03-24 20:00:38', NULL);
INSERT INTO `dk_course_length` VALUES (92, 28, 2, 12, '1', '2018-03-24 20:00:38', NULL);
INSERT INTO `dk_course_length` VALUES (93, 27, 2, 12, '1,5', '2018-03-24 20:00:38', NULL);
INSERT INTO `dk_course_length` VALUES (94, 37, 2, 13, '2', '2018-03-24 20:04:53', NULL);
INSERT INTO `dk_course_length` VALUES (95, 36, 2, 13, '1', '2018-03-24 20:04:53', NULL);
INSERT INTO `dk_course_length` VALUES (96, 23, 2, 13, '1', '2018-03-24 20:04:53', NULL);
INSERT INTO `dk_course_length` VALUES (97, 34, 2, 13, '1', '2018-03-24 20:04:53', NULL);
INSERT INTO `dk_course_length` VALUES (98, 35, 2, 13, '1', '2018-03-24 20:04:53', NULL);
INSERT INTO `dk_course_length` VALUES (99, 39, 2, 13, '2', '2018-03-24 20:04:53', NULL);
INSERT INTO `dk_course_length` VALUES (100, 38, 2, 13, '1', '2018-03-24 20:04:53', NULL);
INSERT INTO `dk_course_length` VALUES (101, 41, 2, 14, '4', '2018-03-24 20:07:44', NULL);
INSERT INTO `dk_course_length` VALUES (102, 40, 2, 14, '1', '2018-03-24 20:07:44', NULL);
INSERT INTO `dk_course_length` VALUES (103, 10, 3, 15, '1', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (104, 11, 3, 15, '1', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (105, 12, 3, 15, '1', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (106, 13, 3, 15, '0,5', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (107, 14, 3, 15, '1,5', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (108, 15, 3, 15, '1', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (109, 16, 3, 15, '1', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (110, 18, 3, 15, '1', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (111, 17, 3, 15, '1', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (112, 9, 3, 15, '2', '2018-03-24 20:16:38', NULL);
INSERT INTO `dk_course_length` VALUES (113, 10, 3, 16, '2', '2018-03-24 20:24:16', NULL);
INSERT INTO `dk_course_length` VALUES (114, 12, 3, 16, '1', '2018-03-24 20:24:16', NULL);
INSERT INTO `dk_course_length` VALUES (115, 19, 3, 16, '1', '2018-03-24 20:24:16', NULL);
INSERT INTO `dk_course_length` VALUES (116, 11, 3, 16, '1,5', '2018-03-24 20:24:16', NULL);
INSERT INTO `dk_course_length` VALUES (117, 20, 3, 16, '1', '2018-03-24 20:24:16', NULL);
INSERT INTO `dk_course_length` VALUES (118, 21, 3, 16, '1,5', '2018-03-24 20:24:16', NULL);
INSERT INTO `dk_course_length` VALUES (119, 22, 3, 16, '1', '2018-03-24 20:24:16', NULL);
INSERT INTO `dk_course_length` VALUES (120, 23, 3, 17, '2', '2018-03-25 01:45:41', NULL);
INSERT INTO `dk_course_length` VALUES (121, 24, 3, 17, '0,5', '2018-03-25 01:45:41', NULL);
INSERT INTO `dk_course_length` VALUES (122, 25, 3, 17, '1', '2018-03-25 01:45:41', NULL);
INSERT INTO `dk_course_length` VALUES (123, 26, 3, 17, '2', '2018-03-25 01:45:41', NULL);
INSERT INTO `dk_course_length` VALUES (124, 27, 3, 17, '1', '2018-03-25 01:45:41', NULL);
INSERT INTO `dk_course_length` VALUES (125, 19, 3, 17, '1,5', '2018-03-25 01:45:41', NULL);
INSERT INTO `dk_course_length` VALUES (126, 12, 3, 17, '1', '2018-03-25 01:45:41', NULL);
INSERT INTO `dk_course_length` VALUES (127, 27, 3, 18, '2', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (128, 24, 3, 18, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (129, 28, 3, 18, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (130, 29, 3, 18, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (131, 30, 3, 18, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (132, 31, 3, 18, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (133, 32, 3, 18, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (134, 23, 3, 19, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (135, 34, 3, 19, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (136, 35, 3, 19, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (137, 36, 3, 19, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (138, 37, 3, 19, '2', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (139, 38, 3, 19, '1', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (140, 39, 3, 19, '2', '2018-03-25 02:01:09', NULL);
INSERT INTO `dk_course_length` VALUES (141, 40, 3, 20, '1', '2018-03-25 02:03:58', NULL);
INSERT INTO `dk_course_length` VALUES (142, 41, 3, 20, '4', '2018-03-25 02:03:58', NULL);
INSERT INTO `dk_course_length` VALUES (143, 27, 3, 20, '2', '2018-03-25 02:03:58', NULL);
INSERT INTO `dk_course_length` VALUES (144, 28, 1, 21, '1', '2018-03-30 22:08:03', NULL);
INSERT INTO `dk_course_length` VALUES (145, 20, 1, 21, '1', '2018-03-30 23:13:46', NULL);
INSERT INTO `dk_course_length` VALUES (146, 14, 1, 21, '1,5', '2018-03-30 23:19:04', '2018-03-30 23:20:23');
INSERT INTO `dk_course_length` VALUES (147, 15, 1, 21, '1', '2018-03-30 23:34:21', NULL);
INSERT INTO `dk_course_length` VALUES (148, 16, 1, 21, '1', '2018-03-30 23:35:44', NULL);
INSERT INTO `dk_course_length` VALUES (149, 17, 1, 21, '1', '2018-03-30 23:36:22', NULL);
INSERT INTO `dk_course_length` VALUES (150, 18, 1, 21, '1', '2018-03-30 23:37:06', NULL);
INSERT INTO `dk_course_length` VALUES (151, 42, 1, 21, '1,5', '2018-03-30 23:38:43', NULL);
INSERT INTO `dk_course_length` VALUES (152, 43, 1, 21, '1', '2018-03-30 23:43:45', NULL);
INSERT INTO `dk_course_length` VALUES (153, 44, 1, 23, '1', '2018-03-31 11:38:51', '2018-03-31 11:39:42');
INSERT INTO `dk_course_length` VALUES (154, 36, 1, 23, '1', '2018-03-31 11:54:17', NULL);
INSERT INTO `dk_course_length` VALUES (155, 45, 1, 23, '1,5', '2018-03-31 11:55:21', NULL);
INSERT INTO `dk_course_length` VALUES (156, 46, 1, 23, '1,5', '2018-03-31 12:02:15', NULL);
INSERT INTO `dk_course_length` VALUES (157, 22, 1, 23, '1', '2018-03-31 12:03:37', NULL);
INSERT INTO `dk_course_length` VALUES (158, 47, 1, 23, '1', '2018-03-31 12:07:45', NULL);
INSERT INTO `dk_course_length` VALUES (159, 21, 1, 23, '1,5', '2018-03-31 12:10:30', NULL);
INSERT INTO `dk_course_length` VALUES (160, 33, 1, 23, '1,5', '2018-03-31 12:21:54', NULL);
INSERT INTO `dk_course_length` VALUES (161, 39, 1, 24, '2', '2018-03-31 14:23:07', NULL);
INSERT INTO `dk_course_length` VALUES (162, 52, 1, 30, '1', '2018-03-31 14:28:47', NULL);
INSERT INTO `dk_course_length` VALUES (163, 33, 1, 24, '0,5', '2018-03-31 14:39:06', NULL);
INSERT INTO `dk_course_length` VALUES (164, 54, 1, 24, '2,5', '2018-03-31 14:40:06', NULL);
INSERT INTO `dk_course_length` VALUES (165, 55, 1, 24, '2,5', '2018-03-31 14:40:14', NULL);
INSERT INTO `dk_course_length` VALUES (166, 56, 1, 30, '1', '2018-03-31 14:40:57', NULL);
INSERT INTO `dk_course_length` VALUES (167, 57, 1, 30, '2,5', '2018-03-31 14:41:08', NULL);
INSERT INTO `dk_course_length` VALUES (168, 58, 1, 30, '2', '2018-03-31 14:41:18', NULL);
INSERT INTO `dk_course_length` VALUES (169, 60, 1, 30, '1', '2018-03-31 14:41:31', NULL);
INSERT INTO `dk_course_length` VALUES (170, 61, 1, 30, '2,5', '2018-03-31 14:41:40', NULL);
INSERT INTO `dk_course_length` VALUES (171, 51, 1, 31, '1,5', '2018-03-31 14:42:26', NULL);
INSERT INTO `dk_course_length` VALUES (172, 49, 1, 31, '0,5', '2018-03-31 14:42:45', NULL);
INSERT INTO `dk_course_length` VALUES (173, 50, 1, 31, '1', '2018-03-31 14:42:55', NULL);
INSERT INTO `dk_course_length` VALUES (174, 59, 1, 31, '1', '2018-03-31 14:43:12', NULL);
INSERT INTO `dk_course_length` VALUES (175, 48, 1, 31, '1', '2018-03-31 14:43:29', NULL);
INSERT INTO `dk_course_length` VALUES (176, 32, 1, 31, '1', '2018-03-31 14:44:14', NULL);
INSERT INTO `dk_course_length` VALUES (177, 62, 1, 31, '1', '2018-03-31 14:44:27', NULL);
INSERT INTO `dk_course_length` VALUES (178, 63, 1, 31, '1', '2018-03-31 14:44:41', NULL);
INSERT INTO `dk_course_length` VALUES (179, 27, 1, 31, '2', '2018-03-31 14:44:46', NULL);
INSERT INTO `dk_course_length` VALUES (180, 40, 1, 32, '1', '2018-03-31 14:45:12', NULL);
INSERT INTO `dk_course_length` VALUES (181, 64, 1, 32, '4', '2018-03-31 14:45:22', NULL);
INSERT INTO `dk_course_length` VALUES (182, 28, 2, 33, '1', '2018-03-31 14:46:32', NULL);
INSERT INTO `dk_course_length` VALUES (186, 20, 2, 33, '1', '2018-03-31 15:00:03', NULL);
INSERT INTO `dk_course_length` VALUES (187, 14, 2, 33, '1,5', '2018-03-31 15:18:56', NULL);
INSERT INTO `dk_course_length` VALUES (188, 15, 2, 33, '1', '2018-03-31 15:19:20', NULL);
INSERT INTO `dk_course_length` VALUES (189, 16, 2, 33, '1', '2018-03-31 15:19:43', NULL);
INSERT INTO `dk_course_length` VALUES (190, 17, 2, 33, '1', '2018-03-31 15:19:56', NULL);
INSERT INTO `dk_course_length` VALUES (191, 18, 2, 33, '1', '2018-03-31 15:20:07', NULL);
INSERT INTO `dk_course_length` VALUES (192, 42, 2, 33, '1,5', '2018-03-31 15:20:25', NULL);
INSERT INTO `dk_course_length` VALUES (193, 43, 2, 33, '1', '2018-03-31 15:20:35', NULL);
INSERT INTO `dk_course_length` VALUES (194, 44, 2, 34, '1', '2018-03-31 15:21:38', NULL);
INSERT INTO `dk_course_length` VALUES (195, 36, 2, 34, '1', '2018-03-31 15:21:50', NULL);
INSERT INTO `dk_course_length` VALUES (196, 45, 2, 34, '1,5', '2018-03-31 15:24:31', NULL);
INSERT INTO `dk_course_length` VALUES (197, 46, 2, 34, '1,5', '2018-03-31 15:24:43', NULL);
INSERT INTO `dk_course_length` VALUES (198, 22, 2, 34, '1', '2018-03-31 15:24:52', NULL);
INSERT INTO `dk_course_length` VALUES (199, 47, 2, 34, '1', '2018-03-31 15:25:04', NULL);
INSERT INTO `dk_course_length` VALUES (200, 21, 2, 34, '1,5', '2018-03-31 15:25:17', NULL);
INSERT INTO `dk_course_length` VALUES (201, 39, 2, 35, '2', '2018-03-31 15:26:02', NULL);
INSERT INTO `dk_course_length` VALUES (202, 52, 2, 35, '2,5', '2018-03-31 15:26:26', NULL);
INSERT INTO `dk_course_length` VALUES (203, 54, 2, 35, '2,5', '2018-03-31 15:26:43', NULL);
INSERT INTO `dk_course_length` VALUES (204, 55, 2, 35, '2,5', '2018-03-31 15:26:52', NULL);
INSERT INTO `dk_course_length` VALUES (205, 56, 2, 36, '1', '2018-03-31 15:27:41', NULL);
INSERT INTO `dk_course_length` VALUES (206, 57, 2, 36, '2,5', '2018-03-31 15:28:00', NULL);
INSERT INTO `dk_course_length` VALUES (207, 58, 2, 36, '2', '2018-03-31 15:28:11', NULL);
INSERT INTO `dk_course_length` VALUES (208, 60, 2, 36, '1', '2018-03-31 15:28:23', NULL);
INSERT INTO `dk_course_length` VALUES (209, 61, 2, 36, '2,5', '2018-03-31 15:28:33', NULL);
INSERT INTO `dk_course_length` VALUES (210, 51, 2, 37, '1,5', '2018-03-31 15:29:12', NULL);
INSERT INTO `dk_course_length` VALUES (211, 50, 2, 37, '1', '2018-03-31 15:29:37', NULL);
INSERT INTO `dk_course_length` VALUES (212, 59, 2, 37, '1', '2018-03-31 15:29:47', NULL);
INSERT INTO `dk_course_length` VALUES (213, 48, 2, 37, '1', '2018-03-31 15:29:55', NULL);
INSERT INTO `dk_course_length` VALUES (214, 32, 2, 37, '1', '2018-03-31 15:30:07', NULL);
INSERT INTO `dk_course_length` VALUES (215, 62, 2, 37, '1', '2018-03-31 15:30:22', NULL);
INSERT INTO `dk_course_length` VALUES (216, 63, 2, 37, '1', '2018-03-31 15:30:36', NULL);
INSERT INTO `dk_course_length` VALUES (217, 40, 2, 38, '1', '2018-03-31 15:30:58', NULL);
INSERT INTO `dk_course_length` VALUES (218, 64, 2, 38, '4', '2018-03-31 15:31:08', NULL);
INSERT INTO `dk_course_length` VALUES (219, 28, 3, 39, '1', '2018-03-31 15:32:05', NULL);
INSERT INTO `dk_course_length` VALUES (220, 20, 3, 39, '1', '2018-03-31 15:32:43', NULL);
INSERT INTO `dk_course_length` VALUES (221, 14, 3, 39, '1,5', '2018-03-31 15:32:52', NULL);
INSERT INTO `dk_course_length` VALUES (222, 15, 3, 39, '1', '2018-03-31 15:33:01', NULL);
INSERT INTO `dk_course_length` VALUES (223, 16, 3, 39, '1', '2018-03-31 15:33:10', NULL);
INSERT INTO `dk_course_length` VALUES (224, 17, 3, 39, '1', '2018-03-31 15:33:18', NULL);
INSERT INTO `dk_course_length` VALUES (225, 18, 3, 39, '1', '2018-03-31 15:33:28', NULL);
INSERT INTO `dk_course_length` VALUES (226, 42, 3, 39, '1,5', '2018-03-31 15:33:37', NULL);
INSERT INTO `dk_course_length` VALUES (227, 43, 3, 39, '1', '2018-03-31 15:33:47', NULL);
INSERT INTO `dk_course_length` VALUES (228, 47, 3, 39, '1', '2018-03-31 15:33:55', NULL);
INSERT INTO `dk_course_length` VALUES (229, 44, 3, 40, '1', '2018-03-31 15:34:42', NULL);
INSERT INTO `dk_course_length` VALUES (230, 36, 3, 40, '1', '2018-03-31 15:34:57', NULL);
INSERT INTO `dk_course_length` VALUES (231, 45, 3, 40, '1,5', '2018-03-31 15:35:05', NULL);
INSERT INTO `dk_course_length` VALUES (232, 46, 3, 40, '1,5', '2018-03-31 15:35:21', NULL);
INSERT INTO `dk_course_length` VALUES (233, 22, 3, 40, '1', '2018-03-31 15:35:32', NULL);
INSERT INTO `dk_course_length` VALUES (234, 47, 3, 40, '0,5', '2018-03-31 15:35:42', NULL);
INSERT INTO `dk_course_length` VALUES (235, 48, 3, 40, '1', '2018-03-31 15:35:52', NULL);
INSERT INTO `dk_course_length` VALUES (236, 21, 3, 40, '1,5', '2018-03-31 15:36:08', NULL);
INSERT INTO `dk_course_length` VALUES (237, 49, 3, 41, '0,5', '2018-03-31 15:36:39', NULL);
INSERT INTO `dk_course_length` VALUES (238, 50, 3, 41, '1', '2018-03-31 15:36:54', NULL);
INSERT INTO `dk_course_length` VALUES (239, 51, 3, 41, '1,5', '2018-03-31 15:37:04', NULL);
INSERT INTO `dk_course_length` VALUES (240, 52, 3, 41, '1', '2018-03-31 15:37:26', NULL);
INSERT INTO `dk_course_length` VALUES (241, 54, 3, 41, '2,5', '2018-03-31 15:37:42', NULL);
INSERT INTO `dk_course_length` VALUES (242, 55, 3, 41, '2,5', '2018-03-31 15:37:50', NULL);
INSERT INTO `dk_course_length` VALUES (243, 32, 3, 42, '1', '2018-03-31 15:38:10', NULL);
INSERT INTO `dk_course_length` VALUES (244, 52, 3, 42, '2', '2018-03-31 15:38:24', NULL);
INSERT INTO `dk_course_length` VALUES (245, 39, 3, 42, '2', '2018-03-31 15:38:34', NULL);
INSERT INTO `dk_course_length` VALUES (246, 56, 3, 42, '1', '2018-03-31 15:38:51', NULL);
INSERT INTO `dk_course_length` VALUES (247, 57, 3, 42, '2,5', '2018-03-31 15:39:00', NULL);
INSERT INTO `dk_course_length` VALUES (248, 58, 3, 42, '2', '2018-03-31 15:39:16', NULL);
INSERT INTO `dk_course_length` VALUES (249, 59, 3, 42, '1', '2018-03-31 15:39:24', NULL);
INSERT INTO `dk_course_length` VALUES (250, 60, 3, 42, '1', '2018-03-31 15:39:34', NULL);
INSERT INTO `dk_course_length` VALUES (251, 61, 3, 42, '2,5', '2018-03-31 15:39:44', NULL);
INSERT INTO `dk_course_length` VALUES (252, 62, 3, 42, '1', '2018-03-31 15:39:53', NULL);
INSERT INTO `dk_course_length` VALUES (253, 63, 3, 42, '1', '2018-03-31 15:40:00', NULL);
INSERT INTO `dk_course_length` VALUES (254, 40, 3, 43, '1', '2018-03-31 15:40:25', NULL);
INSERT INTO `dk_course_length` VALUES (255, 27, 3, 43, '2', '2018-03-31 15:40:38', NULL);
INSERT INTO `dk_course_length` VALUES (256, 64, 3, 43, '4', '2018-03-31 15:40:49', NULL);
INSERT INTO `dk_course_length` VALUES (257, 28, 1, 44, '1', '2018-03-31 15:50:44', NULL);
INSERT INTO `dk_course_length` VALUES (258, 20, 1, 44, '1', '2018-03-31 15:51:30', NULL);
INSERT INTO `dk_course_length` VALUES (259, 14, 1, 44, '1,5', '2018-03-31 15:52:53', NULL);
INSERT INTO `dk_course_length` VALUES (260, 15, 1, 44, '1', '2018-03-31 15:54:33', NULL);
INSERT INTO `dk_course_length` VALUES (261, 16, 1, 44, '1', '2018-03-31 15:54:43', NULL);
INSERT INTO `dk_course_length` VALUES (262, 17, 1, 44, '1', '2018-03-31 15:54:57', NULL);
INSERT INTO `dk_course_length` VALUES (263, 18, 1, 44, '1', '2018-03-31 15:55:07', NULL);
INSERT INTO `dk_course_length` VALUES (264, 42, 1, 44, '1,5', '2018-03-31 15:55:18', NULL);
INSERT INTO `dk_course_length` VALUES (265, 43, 1, 44, '1', '2018-03-31 15:55:27', NULL);
INSERT INTO `dk_course_length` VALUES (266, 44, 1, 45, '1', '2018-03-31 15:56:03', NULL);
INSERT INTO `dk_course_length` VALUES (267, 36, 1, 45, '1', '2018-03-31 15:56:13', NULL);
INSERT INTO `dk_course_length` VALUES (268, 45, 1, 45, '1,5', '2018-03-31 15:56:34', NULL);
INSERT INTO `dk_course_length` VALUES (269, 46, 1, 45, '1,5', '2018-03-31 15:56:45', NULL);
INSERT INTO `dk_course_length` VALUES (270, 22, 1, 45, '1', '2018-03-31 15:57:00', NULL);
INSERT INTO `dk_course_length` VALUES (271, 47, 1, 45, '1', '2018-03-31 15:57:14', NULL);
INSERT INTO `dk_course_length` VALUES (272, 21, 1, 45, '1,5', '2018-03-31 15:57:26', NULL);
INSERT INTO `dk_course_length` VALUES (273, 33, 1, 45, '1,5', '2018-03-31 15:57:36', NULL);
INSERT INTO `dk_course_length` VALUES (274, 33, 1, 46, '0,5', '2018-03-31 15:58:12', NULL);
INSERT INTO `dk_course_length` VALUES (275, 52, 1, 46, '2,5', '2018-03-31 15:58:31', NULL);
INSERT INTO `dk_course_length` VALUES (276, 53, 1, 46, '2', '2018-03-31 15:58:45', NULL);
INSERT INTO `dk_course_length` VALUES (277, 28, 2, 47, '1', '2018-03-31 15:59:09', NULL);
INSERT INTO `dk_course_length` VALUES (278, 20, 2, 47, '1', '2018-03-31 15:59:18', NULL);
INSERT INTO `dk_course_length` VALUES (279, 14, 2, 47, '1,5', '2018-03-31 15:59:35', NULL);
INSERT INTO `dk_course_length` VALUES (280, 15, 2, 47, '1', '2018-03-31 15:59:45', NULL);
INSERT INTO `dk_course_length` VALUES (281, 16, 2, 47, '1', '2018-03-31 15:59:53', NULL);
INSERT INTO `dk_course_length` VALUES (282, 17, 2, 47, '1', '2018-03-31 16:00:03', NULL);
INSERT INTO `dk_course_length` VALUES (283, 18, 2, 47, '1', '2018-03-31 16:00:14', NULL);
INSERT INTO `dk_course_length` VALUES (284, 42, 2, 47, '1,5', '2018-03-31 16:00:23', NULL);
INSERT INTO `dk_course_length` VALUES (285, 43, 2, 47, '1', '2018-03-31 16:00:35', NULL);
INSERT INTO `dk_course_length` VALUES (286, 44, 2, 48, '1', '2018-03-31 16:00:49', NULL);
INSERT INTO `dk_course_length` VALUES (287, 36, 2, 48, '1', '2018-03-31 16:01:00', NULL);
INSERT INTO `dk_course_length` VALUES (288, 45, 2, 48, '1,5', '2018-03-31 16:01:08', NULL);
INSERT INTO `dk_course_length` VALUES (289, 46, 2, 48, '1,5', '2018-03-31 16:01:19', NULL);
INSERT INTO `dk_course_length` VALUES (290, 22, 2, 48, '1', '2018-03-31 16:01:29', NULL);
INSERT INTO `dk_course_length` VALUES (291, 47, 2, 48, '1', '2018-03-31 16:01:42', NULL);
INSERT INTO `dk_course_length` VALUES (292, 21, 2, 48, '1,5', '2018-03-31 16:01:52', NULL);
INSERT INTO `dk_course_length` VALUES (293, 52, 2, 49, '2,5', '2018-03-31 16:02:13', NULL);
INSERT INTO `dk_course_length` VALUES (294, 53, 2, 49, '2', '2018-03-31 16:02:28', NULL);
COMMIT;

-- ----------------------------
-- Table structure for dk_courses
-- ----------------------------
DROP TABLE IF EXISTS `dk_courses`;
CREATE TABLE `dk_courses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_no` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `school_attendance_desc` text COLLATE utf8mb4_danish_ci,
  `internship_desc` text COLLATE utf8mb4_danish_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id_index` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='All the courses';

-- ----------------------------
-- Records of dk_courses
-- ----------------------------
BEGIN;
INSERT INTO `dk_courses` VALUES (9, 16471, 'Grundlæggende programmering', 'Faget introducerer eleven for de grundlæggende principper i programmering.\rDer arbejdes med konsolapplikations-opgaver i med programmeringssproget\rC#, dog er selve sproget sekundært og der lægges vægt\rpå metodikker, fagtermer og grundlæggende forståelse. Faget kommer\romkring emnerne: kodekonventioner, navnekonventioner, syntax, udviklingsmijø,\rCompiled og Interpreted software, Framework, datatyper,\rvariable, array, konstanter, funktioner (metoder), operatorer, betingelser\rog kontrolstruktur, løkker og forgreninger.\rYderligere arbejdes der med fejlhåndtering med debugging, exception\rhandling. Eleven bliver introduceret til begrebet om Unit testing og vi dokumenterer\rmed almindelige flowcharts.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med programmeringsopgaver,\rvil dette være en fordel for elevens mulighed for at fordybe\rsig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver med\rprogrammering på praktikpladsen vil være en fordel for elevens konceptforståelse\rgenerelt og kan ligeledes være medvirkende til at eleven opnår\rmere læring under fagets afholdelse.', '2018-03-22 17:50:21', '2018-03-23 22:17:55');
INSERT INTO `dk_courses` VALUES (10, 16472, 'Objektorienteret programmering', 'Faget falder naturligt i forlængelse af faget Grundlæggende programmering.\rFaget introducerer eleven til konceptet Objektorienteret programmering\rog med inddragelse af faget Versionering og dokumentation,\rarbejder vi med design af egne klasser via UML dokumentation. Der\rarbejdes objektorienteret med konsolapplikationer i sproget C#, sproget\rer sekundært i forhold til fagets mål. Eleven lærer om klassens bestanddele,\rherunder: Constructors/Destructors, Fields, Properties, Methods, Access\rmodifiers.\rEleven vil blive indført i begreberne om indkapsling, polymorfi, nedarvning\rog objekters relationer og hierarki. Interfaces, abstrakte klasser,\rintroduceres og eleven arbejder med en større opgave, hvor alle principper overholdes.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med programmeringsopgaver\rvil dette være en fordel for elevens mulighed for at fordybe\rsig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver med\rprogrammering på praktikpladsen vil være en fordel for elevens konceptforståelse\rgenerelt og kan ligeledes være medvirkende til at eleven opnår\rmere læring under fagets afholdelse.\rDesuden vil det være en fordel hvis eleven kender til praktikvirksomhedens\rfremgangsmetoder ved programmeringsopgaver, f.eks. hvis UML\rnotation anvendes til design af klasser og praktikpladsen benytter en\robjektorienteret tilgang til programmeringsopgaver kan det være en fordel\rat eleven har fået indsigt i dette før fagets afholdelse.', '2018-03-22 17:50:43', '2018-03-23 22:18:39');
INSERT INTO `dk_courses` VALUES (11, 16476, 'Clientside programmering', 'Faget introducerer eleven for grundlæggende webprogrammering med\rHTLM og CSS, samt JavaScript.\rDer arbejdes med opbygningen af en hjemmeside, og dette fag bliver\rbundet sammen med både faget Databaseprogrammering og Serversideprogrammering.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med webprogrammeringsopgaver\rvil dette være en fordel for elevens mulighed for at\rfordybe sig i emnet på skolen. Kendskab til webprogrammering på praktikpladsen\rvil være en fordel for elevens konceptforståelse generelt og kan\rligeledes være medvirkende til at eleven opnår mere læring under fagets\rafholdelse.', '2018-03-22 17:50:59', '2018-03-23 22:18:54');
INSERT INTO `dk_courses` VALUES (12, 16474, 'Database programmering', 'I dette fag skal eleven udarbejde et avanceret databasedesign, hvor vi\rinden implementeringen af databasen kommer ind omkring normalisering,\rog SQL sproget. Eleven får kendskab til hvordan man opretter, indsætter\rog redigere i en database, samt bruger stored procedure og views.\rEleven skal lære at administrere indexes for at opnå optimal performance,\rsamt kigge på SQL injekction, så de rette forholdsregler kan tages.\rEleven skal oprette en domain-model og lade ORM (Object Relationel\rMapping) genere denne.\rEleven får en generel viden om mulige sikkerhedsproblematikker omkring\rdatabaser, og kan tage højde for dem i forbindelse med opbyggelsen\raf en database, her f.eks. krypteringen af data og password-beskyttelse\raf adgangen til databasen.', 'Har eleven haft mulighed for at arbejde med databasedesign, herunder\rnormalisering, E/R-diagram og SQL sproget, samt ovenstående punkter,\rvil dette helt klart være en fordel, og kan være medvirkende til at eleven\ropnår mere læring under fagets afholdelse.', '2018-03-22 17:51:15', '2018-03-23 22:19:15');
INSERT INTO `dk_courses` VALUES (13, 16483, 'Versionering og dokumentation', 'Fagets mål om dokumentation inddrages i faget Objektorienteret programmering\rog emnet versionering introduceres. Som versionsstyringsværktøj\rarbejder eleven med GIT via kommandoer i konsollen/terminalen. Eleven\rvil anvende GIT baserede cloud-tjenester som GitHub eller lign. Eleven\rindføres i formålet med udarbejdelse af dokumentation og fordelene ved\rat versionsstyre sine projektor.', 'Det vil være en fordel hvis eleven kender til praktikvirksomhedens fremgangsmetoder\rved programmeringsopgaver, f.eks. hvis UML notation anvendes\rtil design af klasser og praktikpladsen benytter en objektorienteret\rtilgang til programmeringsopgaver kan det være en fordel at eleven har\rfået indsigt i dette før fagets afholdelse.\rHvis eleven har mulighed for at versionere udviklingsprojektor i praktikvirksomheden\rog gerne med værktøjer inden for Distributed eller Centralized\rVersion Control Systems (GIT, SVN, CVS eller lign.).', '2018-03-22 17:51:30', '2018-03-23 22:19:32');
INSERT INTO `dk_courses` VALUES (14, 6223, 'Netværk I', 'Faget har fokus på teori og praksis af netværk med både routere og switche.\rPå switche lærer eleven at konfigurere VLAN og opsætte inter-VLAN\rrouting på routere, samt opsætning af Single-Area OSPF på Cisco baserede\rnetværk.\rDesuden lærer eleven at opsætte filtre på Cisco udstyr (ACL.) Fagets\rindhold svarer til indholdet af CCNA Routing and Switching: Routing and\rSwitching Essentials.', 'Det er en forudsætning at have kendskab til Cisco Netværksteori svarende\rtil modul 1 af CCNA og eller praktisk erfaring med opsætning af Cisco\rnetværksudstyr via Kommando linje interface (CLI.)\rDer er meget læsestof i Netværksfagene. Har eleven brug for ekstra tid\rtil at læse op/fordybelse i faget, foreslår vi at eleven tager kontakt med\rskolen (virksomhedskontaktlæreren) og udtrykker ønske om at få åbnet for\rmodulet før tid, så eleven har tid til at læse op inden skoleperioden starter.', '2018-03-22 17:51:40', '2018-03-23 22:19:47');
INSERT INTO `dk_courses` VALUES (15, 6222, 'Operativsystemer I', 'Disse fag ligger sig op af fagindholdet til Microsoft server certificeringer.\rOperativsystemer I har fokus på arbejde med Active Directory (Group Policy,\rusers and Groups, Trust, Sites, Global Catalog, Backup, CA server.)\rMens Serverteknologi I har fokus på infrastrukturen (DHCP, DNS, DFS,\rWSUS, RRAS, IP Sec og VPN.)', 'Det vil være en god ide hvis eleven som minimum får indblik i praktikpladsens\rbrug/konstellation af servere. Så eleven har en forståelse af hvordan\r”setuppet” er på praktikpladsen.\rHvis virksomheden benytter en database i retning af Active Directory\rville det være en fordel hvis eleven har kendskab til hvordan arbejdet med\rdatabasen foregår/hvad består arbejdet af, som f.eks. administration af\rbrugerkonti og ressourcetilgang baseret på gruppepolitikker.\rDet ville specielt være fint hvis eleven har haft mulighed for at øve sig i\rbrugen af active directory og i særdeleshed oprettelse af brugere og grupper,\rOrganizational Units, samt gruppe politikker.', '2018-03-22 17:51:51', '2018-03-23 22:20:03');
INSERT INTO `dk_courses` VALUES (16, 6225, 'Computerteknologi', 'I dette fag arbejder eleverne med opsætning af et system (server med raid\ropsætning samt server-software.) Under arbejdet med opsætning fører eleverne\rdokumentation for arbejdet (UML orienteret.) Eleverne skal designe\rog benytte: User Story, arbejdslog, fejlformular, konfigurationsdokumentation,\rog Accept test. Faget omhandler i dette henseende træning i forståelse\rog benyttelse af brugbar dokumentation i arbejdssituationen.', 'Kendskab til benyttelse af og forståelse for hvad brugbar dokumentation er\rpå arbejdspladsen, vil give eleven en fordel i faget.', '2018-03-22 17:52:02', '2018-03-23 22:20:21');
INSERT INTO `dk_courses` VALUES (17, 6226, 'Serverteknologi I', 'Disse fag ligger sig op af fagindholdet til Microsoft server certificeringer.\rOperativsystemer I har fokus på arbejde med Active Directory (Group Policy,\rusers and Groups, Trust, Sites, Global Catalog, Backup, CA server.)\rMens Serverteknologi I har fokus på infrastrukturen (DHCP, DNS, DFS,\rWSUS, RRAS, IP Sec og VPN.)', 'Det vil være en god ide hvis eleven som minimum får indblik i praktikpladsens\rbrug/konstellation af servere. Så eleven har en forståelse af hvordan\r”setuppet” er på praktikpladsen.\rHvis virksomheden benytter en database i retning af Active Directory\rville det være en fordel hvis eleven har kendskab til hvordan arbejdet med\rdatabasen foregår/hvad består arbejdet af, som f.eks. administration af\rbrugerkonti og ressourcetilgang baseret på gruppepolitikker.\rDet ville specielt være fint hvis eleven har haft mulighed for at øve sig i\rbrugen af active directory og i særdeleshed oprettelse af brugere og grupper,\rOrganizational Units, samt gruppe politikker.', '2018-03-22 17:52:12', '2018-03-23 22:20:39');
INSERT INTO `dk_courses` VALUES (18, 6230, 'Database server', 'Eleverne installerer en Microsoft SQL Server. På serveren arbejder eleverne\rmed oprettelse og administration af databaser (både via GUI og\rSQL scripts.) Udarbejdelse af scripts til at fylde data i tabeller, opretning\rog fejlfinding vha. stored procedures. Brugeropretning til databaserne\rindeholdende flere authentication modes, login, og brugerrettigheder.\rPlanlægning af backup strategi. Sletning og gendannelse af en database.\rOvervågning af performance og eventuel optimering via indeksering.\rFlytte data til og fra SQL serveren via Server Integration Services.', 'Kendskab til praktikpladsens udnyttelse af database servere og/eller erfaring\rmed brug og administration af database servere og databaser generelt\rpå praktikpladsen, vil hjælpe eleven med forståelse af fagets indhold.', '2018-03-22 17:52:24', '2018-03-23 22:20:52');
INSERT INTO `dk_courses` VALUES (19, 16475, 'GUI programmering', 'Der arbejdes i faget med grafiske brugergrænseflader (GUI). Eleven skal\rudvikle op mod både klientside-applikationer, og webbaserede applikationer,\rder bygger på en enkeltsidet webapplikation (SPA). I løbet af faget\rarbejder eleven blandt andet med brugergrænseflade design mønstre (UI\rDesign patterns), håndtering af events, udvikle en flertrådet applikation og\rat anvende en simpel anvendeligheds-test.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med GUI-programmeringsopgaver\rvil dette være en fordel for elevens mulighed for at fordybe\rsig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver\rmed GUI-programmering på praktikpladsen vil være en fordel for elevens\rkonceptforståelse generelt og kan ligeledes være medvirkende til at eleven\ropnår mere læring under fagets afholdelse.\rDesuden vil det være en fordel, men ikke et decideret krav, hvis praktikvirksomheden\ranvender GUI-programmering rettet mod både klientside-applikationer\rog webbaserede applikationer, der bygger på SPA.', '2018-03-22 17:59:44', '2018-03-23 22:56:19');
INSERT INTO `dk_courses` VALUES (20, 14170, 'IT Servicemanagement I', 'Faget har et fagligt niveau svarende til ITIL Foundation version 3. Eleverne\rarbejder med at beskrive hvad der kræves for at kunne opbygge en optimal\rdrift og service i en IT virksomhed, (Management-procedurer.) På et\rniveau og med et indhold svarende til ITIL Foundation version 3. Eleverne\rskal bl.a. lave en eller flere SLA (Service-Level Agreement), og eventuelt\rOLA (Operational-Level Agreement.)', 'Har praktikpladsen indført ITIL eller en lignende metode til at beskrive\rstruktur og fremgangsmåder af firmaets drift og service, vil det være en\rfordel at eleven får indblik i hvordan virksomheden har valgt at sætte dette\ri system.', '2018-03-22 18:00:30', '2018-03-23 22:57:21');
INSERT INTO `dk_courses` VALUES (21, 6234, 'Serverteknologi webserver', 'I faget lærer eleven at installere LAMP/WAMP på en server (Windows/Linux,\rApache, MySQL, PHP), og foretage nødvendige justeringer. Eleven lærer at konfigurere\rsikkerhed og brugerspecifikke rettigheder samt at installere supplerende\rplugins på Apache Web server. Eleven lærer at opsætte http og SHTTP, samt opnår\rviden til at kunne redegøre for og opsætte, Forward, Master og Slave DNS.\rEleven lærer også at installere og konfigurere værktøjer til administration af\rhostede løsninger, samt at kunne redegøre for aktiv og passiv FTP, samt at kunne\ropsætte en FTP server med bruger login og anonym login.', 'Viden omkring installation, opsætning og/eller administration af web-servere\rsom f.eks. FTP servere vil gøre fagets indhold nemmere for eleven at\rfordybe sig i, ligeledes kan det hjælpe eleven i faget med viden om hvilke\rhostede løsninger og teknologier praktikpladsen benytter.', '2018-03-22 18:01:51', '2018-03-23 22:58:08');
INSERT INTO `dk_courses` VALUES (22, 6544, 'Sikkerhed II', 'Eleven installerer og konfigurerer Windows servere samt Windows klienter\rmed henblik på at opbygge et godt kendskab til sikkerhed i både arbejdsgrupper\rog domæner. Du lærer om sikkerhed i generelle termer, så du\rkender til de mest almindelige sikkerhedstrusler mod dit netværk og dine\rcomputere.', 'Har eleven haft mulighed for at få indsigt i praktikpladsens serverbaserede\rIT sikkerhed og gerne administrationen af denne, kan eleven benytte sin\rbaggrundsviden til at danne sig en bedre forståelse af serverbaseret IT\rSikkerhed som igen kan give eleven en bedre fordybelse i fagets teori og\rpraktiske opgaver.', '2018-03-22 18:02:13', '2018-03-23 22:58:19');
INSERT INTO `dk_courses` VALUES (23, 16477, 'Serverside programmering', 'Eleven indføres i forskellen på Serverside og Clientside programmering.\rEleven skal arbejde med serverside programmering til levering af Clientside\rweb indhold som HTML og til udarbejdelse af en Web-Api til levering\raf XML og/eller JSON. Eleven indføres i begrebet REST og skal arbejde\rmed routing af RESTful URI’er. Eleven introduceres til serverside validering\raf indhold, samt teknikker til at sikre adgangskontrol af web indhold.\rHerunder arbejdes med Hashing og kryptering af data. I faget undervises\ri PHP, som serverside programmeringssprog.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med programmeringsopgaver\rog webteknologier, vil dette være en fordel for elevens mulighed\rfor at fordybe sig i emnet på skolen. Kendskab til omfanget af og\rarbejdsopgaver med programmering på praktikpladsen vil være en fordel\rfor elevens konceptforståelse generelt og kan ligeledes være medvirkende\rtil at eleven opnår mere læring under fagets afholdelse.\rDesuden vil det være en fordel hvis eleven kender til praktikvirksomhedens\rfremgangsmetoder ved programmeringsopgaver, f.eks. hvis UML\rnotation anvendes til design af klasser og praktikpladsen benytter en\robjektorienteret tilgang til programmeringsopgaver kan det være en fordel\rat eleven har fået indsigt i dette før fagets afholdelse.', '2018-03-22 18:05:51', '2018-03-23 23:02:29');
INSERT INTO `dk_courses` VALUES (24, 16484, 'Softwaretest og sikkerhed', 'Der arbejdes i faget med planlægning, implementering og dokumentation\raf softwaretest. Eleven skal have fokus på funktionalitet, ydelse og sikkerhed.\rI løbet af faget arbejder eleven blandt andet med softwaresikkerhedsstandarder,\rdata-kryptering, kendskab til kendte sikkerhedshuller og værktøjer\rtil softwaretest. Der arbejdes i grupper, som ud fra agile metoder,\reksempelvis Scrum, udarbejder en daglig præsentation, som fremlægges\rfor klassen undervejs.', 'Har praktikpladsen implementeret softwaretest og –sikkerhed som en naturlig\rdel af agile metoder, eksempelvis Scrum, i testarbejdet, vil det være\ren fordel for eleven at kende til disse og meget gerne at have deltaget i\rudviklingsarbejdet. Desuden vil det være en klar fordel, men ikke et decideret\rkrav, at eleven har erfaring, svarende til indholdet af faget Programmeringsmetodik.', '2018-03-22 18:08:05', '2018-03-23 23:02:39');
INSERT INTO `dk_courses` VALUES (25, 6272, 'Embedded controller I', 'Eleven får et fundamentalt indblik i Embedded Controllers og får erfaring\rmed brug af en debugger og grundlæggende funktioner som delay, interrupt,\rtimer, løkker, porte, samt udskrivning til LCD display.', 'Benytter praktikpladsen Embedded Controller systemer, vil det være en\rfordel at eleven har kendskab til hvilke systemer og hvilke opgaver systemerne\rløser.', '2018-03-22 18:08:34', '2018-03-23 23:03:00');
INSERT INTO `dk_courses` VALUES (26, 6273, 'Embedded controller II', 'Eleven udvikler et program som afvikles på et embedded system vha. de\rfærdige moduler som udviklingssystemet (f.eks. Keil.) har indbygget. Eleven\rskal i forbindelse med udviklingen af programmet kunne beskrive de\roverordnede principper som har med analog/digital signalkonvertering\rsamt sampling af data at gøre. Desuden skal eleven kunne programmere\ren controller til kommunikation med perifere enheder og udfærdige struktureret\rprogramdokumentation.', 'Benytter praktikpladsen embedded controller systemer, vil det være en\rfordel at eleven har kendskab til hvilke systemer og hvilke opgaver systemerne\rløser.', '2018-03-22 18:09:03', '2018-03-23 23:03:12');
INSERT INTO `dk_courses` VALUES (27, 1, 'Valgfri specialefag', 'Skolen planlægger hvilke fag der afholdes i hvilket kvartal.\r Forhør Jer gerne hos kontaktlæreren.', NULL, '2018-03-22 18:10:48', '2018-03-31 12:20:59');
INSERT INTO `dk_courses` VALUES (28, 11189, 'Faglig kommunikation', 'Faget har til formål at forbedre elevernes skrevne og talte tekniske engelsk.\rVi afholder primært faget i sammenhæng med faget Netværk I, da dette\rfag har den største mængde fagtekst på engelsk på H1. Eleverne bliver\rbedt om at vælge et emne fra fagets fagindhold, som eleven skal sætte sig\rind i og undervejs udarbejde og afholde en præsentation samt aflevere en\rrapport om emnet, som begge indeholder korrekte og relevante tekniske\rudtryk.', 'Vi ser en fordel ved at eleven via sit daglige arbejde i organisationen får\rlært og benyttet teknisk relevante udtryk på engelsk i skrift og tale.', '2018-03-22 18:12:27', '2018-03-23 23:05:26');
INSERT INTO `dk_courses` VALUES (29, 16478, 'App programmering I', 'Der arbejdes i faget med en simpel app løsning til en mobil enhed. Eleven\rskal udvikle på en cross platform med Xamarin, hvor kun brugergrænsefladen\rer native. Faget er dog ikke låst til et bestemt udviklingsværktøj eller\rsprog, såsom Visual Studio og Xamarin. Man kan således også kode i\rXcode og Swift på Mac eller eksempelvis MonoDevelop og C# på Linux.\rDet er dog et valg, der kræver at man fortrinsvis kan arbejde selvstændigt.\rI løbet af faget arbejder eleven blandt andet med brugergrænseflade,\revents samt online og offline scenarier.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med mobile app\rprogrammeringsopgaver vil dette være en fordel for elevens mulighed for\rat fordybe sig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver\rmed app programmering på praktikpladsen vil være en fordel for\relevens konceptforståelse generelt og kan ligeledes være medvirkende til\rat eleven opnår mere læring under fagets afholdelse.\rDesuden vil det være en fordel, men ikke et decideret krav, hvis praktikvirksomheden\ranvender app-programmering rettet mod flere platforme.', '2018-03-22 18:13:26', '2018-03-23 23:05:52');
INSERT INTO `dk_courses` VALUES (30, 16479, 'App programmering II', 'Der arbejdes i faget med en app løsning til en mobil enhed. Eleven skal\rudvikle på en cross platform med Xamarin, hvor kun brugergrænsefladen\rer native. App løsningen skal omfatte enhedens sensorer, eksempelvis\rgyroskopet, en responsiv brugerflade, asynkrone kald og web API. Faget\rer dog ikke låst til et bestemt udviklingsværktøj eller sprog, såsom Visual\rStudio og Xamarin. Man kan således også kode i Xcode og Swift på Mac\reller eksempelvis MonoDevelop og C# på Linux. Det er dog et valg, der\rkræver at man fortrinsvis kan arbejde selvstændigt. Eleven kommer til at\rarbejde med Repository Pattern og Dependency Injection.', 'Har eleven i sin praktiktid haft mulighed for at arbejde mobile app programmeringsopgaver\rvil dette være en fordel for elevens mulighed for at\rfordybe sig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver\rmed app programmering på praktikpladsen vil være en fordel for\relevens konceptforståelse generelt og kan ligeledes være medvirkende til\rat eleven opnår mere læring under fagets afholdelse.\rDesuden vil det være en fordel, men ikke et decideret krav, hvis praktikvirksomheden\ranvender app-programmering rettet mod flere platforme.', '2018-03-22 18:13:40', '2018-03-23 23:06:03');
INSERT INTO `dk_courses` VALUES (31, 6278, 'Programmerings metodik', 'Faget omhandler Agile metoder og principper samt Scrum værktøjer og\rExtreme Programming. Eleven lærer om indholdet af Agile, Scrum og XP\rved at skulle beskrive et udviklingsscenarie som gør brug af de nævnte\rmetoder og principper.', 'Kendskab til hvilke metoder og principper arbejdspladsen benytter til\rudviklingsopgaver, og gerne erfaring med udviklingsopgaver indenfor\rprogrammering kan hjælpe eleven til en dybere læring i faget på skolen.', '2018-03-22 18:14:52', '2018-03-23 23:06:20');
INSERT INTO `dk_courses` VALUES (32, 6239, 'IT-kravspecifikation', 'I dette fag benyttes UML notation til at lære eleven at omsætte en ide’\rsom skal leve op til virksomheden, brugerne og kundens krav til design og\rprodukt via en iterativ proces. Under opgavearbejdet kommer eleven til at\rarbejde med udvikling og design af Use Case, Prototyping, Kravsspecifikation,\raccepttest.', 'Benytter praktikpladsen UML, eller tilsvarende, til beskrivelse af udviklingsopgaver,\rkan viden om dette være medvirkende til en bedre konceptforståelse\rhos eleven ved fagets gennemførelse.', '2018-03-22 18:15:27', '2018-03-23 23:06:33');
INSERT INTO `dk_courses` VALUES (33, 2, 'Valgfag', 'Skolen planlægger hvilke fag der afholdes i hvilket kvartal. Forhør Jer\rgerne hos kontaktlæreren.', NULL, '2018-03-22 18:15:47', '2018-03-31 12:21:00');
INSERT INTO `dk_courses` VALUES (34, 16480, 'App programmering III', 'Der arbejdes i faget med en kompleks app løsning til en mobil enhed. Eleven\rskal udvikle på en cross platform med Xamarin, hvor kun brugergrænsefladen\rer native. App løsningen skal omfatte manipulering af eksterne\rdata, fjernstyring af enheder over netværk/Internettet og appen skal huske\ropsætninger imellem flere udførsler af den pågældende app.\rFaget er dog ikke låst til et bestemt udviklingsværktøj eller sprog, såsom\rVisual Studio og Xamarin. Man kan således også kode i Xcode og Swift\rpå Mac eller eksempelvis MonoDevelop og C# på Linux. Det er dog et\rvalg, der kræver at man fortrinsvis kan arbejde selvstændigt.\rI faget indgår flertrådede løsninger, kommunikation med eksterne datakilder,\rweb API, kommunikation med andre apps på enheden, kryptering,\ranvendelse af GPS data og optimering af kode.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med mobile app\rprogrammeringsopgaver vil dette være en fordel for elevens mulighed for\rat fordybe sig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver\rmed app programmering på praktikpladsen vil være en fordel for\relevens konceptforståelse generelt og kan ligeledes være medvirkende til\rat eleven opnår mere læring under fagets afholdelse.\rDesuden vil det være en fordel, men ikke et decideret krav, hvis praktikvirksomheden\ranvender app-programmering rettet mod flere platforme.', '2018-03-22 18:19:48', '2018-03-23 23:13:46');
INSERT INTO `dk_courses` VALUES (35, 16481, 'Linux rettet mod server og embedded', 'Der arbejdes i faget med Linux shell, kommandoer, distributioner og open\rsource miljøet.\rEleven skal kunne opbygge og dokumentere en Linux baseret løsning. I\rfaget arbejder eleven med Linux programmeringsmiljøet og skal kunne\ranvende værktøjer og programmeringsmodellen til forskellige Linux varianter,\rherunder Linux server og embedded Linux. Eleven skal kunne opnå en\rgrundlæggende viden om Linux opbygning og Linux kernen med fokus på\rskalerbarhed, sikkerhed, ydelse, stabilitet og open source miljø.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med Linux programmeringsmiljøet\rvil dette være en fordel for elevens mulighed for at fordybe\rsig i emnet på skolen. Kendskab til Linux i arbejdsopgaver på praktikpladsen\rvil være en fordel for elevens konceptforståelse generelt og kan\rligeledes være medvirkende til at eleven opnår mere læring under fagets\rafholdelse.\rDet vil være en fordel, men ikke et decideret krav, hvis praktikvirksomheden\rallerede anvender Linux.', '2018-03-22 18:20:42', '2018-03-23 23:14:04');
INSERT INTO `dk_courses` VALUES (36, 8606, 'Service', 'Eleven får indsigt i tilrettelæggelse af service og i vurdering af servicekvalitet.\rEleven får indsigt i at strukturere service. Eleven får indsigt i at finde\rinformationer om god service og lærer at dokumentere og lave kvalitetsvurdering\raf service. Faget Service køres primært sammen med faget\rTeknisk Innovation som omhandler øvelse i den innovative proces med\rfokus på at udvikle nye eller forbedre bestående serviceydelser.', 'Elevens arbejde med service i praktiktiden kan være medvirkende til at\releven kan bruge sin erfaring i faget, som er planlagt som gruppearbejde.', '2018-03-22 18:21:13', '2018-03-23 23:14:15');
INSERT INTO `dk_courses` VALUES (37, 6275, 'Embedded controller III', 'Deltagelse i faget kræver erfaring med embedded systems svarende til\rindholdet af Embedded Controller I og II. I faget arbejder eleven med opsætning\rog fejlfinding af en embedded controller med fokus på netværkskommunikation\rtil en server og perifere enheder vha. TCP/IP protokollen,\rog får i den forbindelse erfaring med at udføre modulstruktureret programdokumentation.', 'Benytter praktikpladsen embedded controller systemer, vil det være en fordel\rat eleven har kendskab til hvilke systemer og hvilke opgaver systemerne\rløser, og meget gerne praktisk erfaring med opsætning og fejlfinding.', '2018-03-22 18:21:58', '2018-03-23 23:14:29');
INSERT INTO `dk_courses` VALUES (38, 6277, 'Projektstyring', 'Eleven skal i faget arbejde med projektstyringsmetoden PRINCE2 og gennemføre\ret projekt som bygger på dele af PRINCE2 metoden. I forbindelse\rmed evalueringen skal eleven beskrive det overordnede formål med metoden,\rsamt formål og hovedindhold af alle roller, de 8 komponenter samt\rhovedindholdet af de 8 processor og underprocessor. Eleven skal endvidere\rkunne beskrive formål og hovedindhold af projektstyringsteknikkerne\rog hvilke ledelsesprodukter der er input/output fra i de 8 processor og\rendeligt skal eleven kunne beskrive forholdene mellem processor, leverancer,\rroller og ledelsesaspekter ved et projekt.', 'Har praktikpladsen indført en systematisk tilgang til projektarbejde og\rkender eleven til disse arbejdsmetoder kan dette være medvirkende til at\rskabe bedre mulighed for fordybelse og læring i skoleperioden.', '2018-03-22 18:22:39', '2018-03-23 23:14:42');
INSERT INTO `dk_courses` VALUES (39, 6243, 'Systemudvikling og projektstyring', 'I faget arbejder eleverne med planlægning, opbygning, og idriftsættelse\raf et IT-System ud fra en Kravsspecifikation. I faget arbejdes der i små\rgrupper og faget omhandler en præsentationsdel hvor IT-Systemet præsenteres\rfor klassen. I faget er der under arbejdet med IT-Systemet fokus på\rprojektstyring med opstilling af hoved og delmål, tidsestimering, udledning\raf ressourceforbrug, samt afrapporteringer undervejs.', 'Har praktikpladsen implementeret fremgangsmetoder ved projektarbejde,\rvil det være en fordel for eleven at kende til disse, og meget gerne have\rdeltaget i udviklingsarbejde. Desuden vil det være en klar fordel men ikke\ret decideret krav at eleven har erfaring svarende til indholdet af faget\rProjektstyring.', '2018-03-22 18:23:26', '2018-03-23 23:14:56');
INSERT INTO `dk_courses` VALUES (40, 8607, 'Udvikling', 'I faget lærer eleven at redegøre for teknologiske udviklingstrends indenfor\rIT-området, samt at anvende strukturerede teknikker til at planlægge og\rgennemføre udvikling og opbygning af IT-systemer, og lærer at vurdere\rslutresultatets kvalitet i forhold til gældende krav, standarder og normer.\rEleven får endvidere erfaring med at anvende IT-systemer til planlægning,\rgennemførelse og dokumentation af udviklings og opbygningsopgaver\ri fagets afholdelse.', 'Kendskab til hvilke IT-systemer praktikpladsen benytter til at løse virksomhedens\rbehov, og gerne kendskab til hvordan virksomhedens behov kan\rpåregnes at ændre sig, i forhold til nuværende løsninger, kan være med til\rat eleven har bedre forståelse for fagets indhold og kan lede til at eleven\rer med til at udvikle bedre løsninger under fagets afholdelse.', '2018-03-22 18:25:00', '2018-03-23 23:16:12');
INSERT INTO `dk_courses` VALUES (41, 6279, 'Svendeprøveprojekt', 'Faget er det afsluttende fag for Datatekniker Programmering og det er et\rkrav for deltagelse at der er opnået karakter eller merit i alle øvrige fag i\ruddannelsen. I faget skal eleven i samarbejde med andre elever udarbejde\ren problemformulering med tilhørende kravsspecifikation baseret på en\rcase beskrivelse og et projektoplæg. Dette skaber basis for arbejdet med\rplanlægning, opbygning, og idriftsættelse af et avanceret produkt.\rEleverne skal også udarbejde en produkt -og procesrapport som\rbeskriver system og proces. En del af fagets fokus er i gruppearbejdet at\rudvise konstruktiv kommunikation i gruppearbejdet. Faget afsluttes med en\rpræsentation af produktet.', 'Har eleven i løbet af sin praktiktid haft mulighed for at deltage i projektarbejde,\rgerne i forbindelse med udviklingen af programmeringsrelaterede\rprodukter, vil det være en fordel for elevens præsentation.', '2018-03-22 18:26:15', '2018-03-23 23:16:18');
INSERT INTO `dk_courses` VALUES (42, 6229, 'Serverteknologi Linux', 'Eleverne arbejder med installation og opsætning af en Linux Fedora Server\nmed RAID 5 samt en klient maskine med Ubuntu. På Serveren opsættes\nen Linux Firewall samt Netværksservices som NAT, DHCP, SSH med Telnet,\nWeb/FTP Server. Eleverne opsætter også en proxy server (Squid), samt arbejder\nmed IPTables (Firewall filtrering.), samt lærer at benytte Shell scripts\ntil oprettelse af brugere.', 'Opsætning af Linux servere samt arbejde med Linux terminalen og øve sig\nmed basic kommandoer før deltagelse i faget vil hjælpe til med at gøre det\nnemmere for eleven at dygtiggøre sig på skolen under fagets afholdelse.', '2018-03-30 12:14:35', NULL);
INSERT INTO `dk_courses` VALUES (43, 6231, 'Script programmering', 'Eleverne arbejder med forståelse og benyttelse af scripts til administration\npå en windows-baseret PC. Eleverne kommer også ind på en grundlæggende\nforståelse af databasehåndtering, tabeller og data. Eleverne\narbejder med scriptsprogets muligheder: variabler, løkker, forgreninger,\nI/O til skærm og filer. Samt scriptsprogets tilknyttede objekter, funktioner,\nkonstanter, subrutiner og egne fremstillede funktioner. Arbejdet foregår\nhovedsageligt i WMI og SQL.', 'Benytter praktikpladsen allerede scripts til nogle arbejdsopgaver, og har\neleven kendskab til hvorfor/hvordan de bruges, vil det være en fordel for\neleven ved gennemførelse af faget.', '2018-03-30 12:15:09', NULL);
INSERT INTO `dk_courses` VALUES (44, 9592, 'Teknisk innovation', 'Teknisk innovation indebærer idégenerering og idéudvælgelse, omverdens\nanalyse, samt arbejde med planlægning og udvælgelse af rentable indsatsområder.\nFaget handler om at få erfaring med detaljeret planlægning\nog gennemførsel af en innovationsproces, eventuelt med flere iterationer\nog om udvikling af en prototype (en service/teknisk løsning) og om at\nkunne formidle innovative ideer.\nFaget afholdes i forbindelse med servicefaget hvor eleverne lærer at udvikle\nnye serviceydelser, forbedre, eller opfinde helt nye tekniske løsninger.', 'Har eleven kendskab til omfanget af praktikpladsens projektorienterede\nudviklingsarbejde og/eller koncepter for service kan det være en fordel for\nelevens udbytte af fagene Service og Teknisk Innovation.', '2018-03-30 12:19:48', NULL);
INSERT INTO `dk_courses` VALUES (45, 6227, 'Netværk II', 'Indholdet svarer til CCNA Routing & Switching: Scaling Networks. Modulets\nindhold har fokus på teori om og opsætning af mindre netværk (både\nswitchede og routede netværk.) Modulet kommer blandt andet omkring\nSpanning-Tree, Etherchannel, trådløst LAN, Single –og Multi-area OSPF,\nEIGRP og IOS.', 'Der er meget læsestof i Netværksfagene. Har eleven ønske om fordybelse/\nbrug for ekstra tid til at læse op foreslår vi at eleven tager kontakt med\nskolen (virksomhedskontaktlæreren) og efterspørger at få åbnet for modulet\nfør tid. Har eleven kendskab opbygningen af praktikpladsens netværk og/\neller kendskab til arbejdsopgaver med driften af netværket kan dette være\nmed til at skabe bedre forståelse for ibrugtagning af de forskellige netværksteknologier\nsom der læres om i modulet.', '2018-03-30 12:20:11', NULL);
INSERT INTO `dk_courses` VALUES (46, 2734, 'Netværk III', 'Indholdet svarer til CCNA Routing & Switching: Connecting Networks.\nModulets indhold har focus på teori om og opsætning af WAN netværk.\nModulet kommer omkring WAN teknologier som PPP, Frame-Relay, ATM,\nMPLS, Ethernet WAN, ISDN, DSL o.l. Samt VPN, GRE-tunnel, IP sec, Syslog,\nSNMP, Netflow og systematisk tilgang til fejlfinding.', 'Der er meget læsestof i Netværksfagene. Har eleven ønske om fordybelse/\nbrug for ekstra tid til at læse op foreslår vi at eleven tager kontakt med\nskolen (virksomhedskontaktlæreren) og efterspørger at få åbnet for modulet\nfør tid. Har eleven kendskab opbygningen af praktikpladsens netværk og/\neller kendskab til arbejdsopgaver med driften af netværket, og ikke mindst\nhvis virksomheden benytter sig af WAN teknologier? -det kunne være viden\nom hvilken type forbindelse firmaet har til internettet/andre branches.\nDette kan være med til at skabe bedre forståelse for ibrugtagning af de\nforskellige WAN teknologier som der læres om i modulet.', '2018-03-30 12:20:34', NULL);
INSERT INTO `dk_courses` VALUES (47, 6238, 'Databaser', 'I faget installeres en Microsoft SQL server hvorpå eleven skal løse en række\nscriptbaserede opgaver som igennem faget lærer eleven at anvende\nSQL sproget til at udvikle databaser og anvende avancerede SQL kommandoer,\nforespørgsler og datamanipulation. I faget arbejder eleven med\nat oprette, modificere og slette tabeller, at oprette unikke IDs og Views\nsamt forskellige typer af indexes.\nEleven lærer at udføre enkle SQL dataforespørgsler og at indsætte, opdatere\nog slette data med SQL kommandoer. Med forespørgsler benytter\neleven Single Row Functions og Group Functions. Eleven får endvidere\nerfaring i at anvende Triggers og Stored Procedures samt at oprette Constraints\ni tabeller. Eleven opnår igennem faget en generel indsigt i Database\nManagement Systems og i at foretage SQL kommando optimering\nmed eksempelvis Join Algoritmer. Eleven lærer at definere integritetsregler\nved brug af Domain, Triggere og Stored Procedures samt opnår viden om\nAlgebra mulighederne i SQL.', 'Det vil være en fordel for eleven at kende til praktikpladsens brug af Databasemiljø\nog hvilke opgaver virksomheden løser med scripts.', '2018-03-30 12:20:59', NULL);
INSERT INTO `dk_courses` VALUES (48, 6240, 'Mobile og trådløse systemer', 'Eleven lærer om mobile og trådløse systemer i både teori og praksis.\nEleven konfigurerer trådløse enheder, og programmerer applikationer til\nbrug på nettet. Faget afholdes som gruppearbejde og indeholder både en\nteoretisk og en praktisk del.', 'Har praktikpladsen arbejde som indebærer programmering og brug af\nmobil-apps vil det være en fordel for elevens forståelse af fagets teori og\nikke mindst det praktiske arbejde med udvikling af en mobil-app og kan\nvære medvirkende til at eleven bedre kan fordybe sig i fagets indhold.', '2018-03-30 12:21:24', NULL);
INSERT INTO `dk_courses` VALUES (49, 1578, 'Backupteknologi I', 'I faget installerer eleven et virtuelt miljø med Windows servere og klienter\nhvorpå der skal foretages normal daglig backup og planlagt trinvis\nbackup samt almindelig og disaster recovery. Eleven skal endvidere\nredegøre for en fornuftig backupstrategi (f.eks. med udgangspunkt i\npraktikpladsen.) med overvejelser indenfor dataværdisætning, ændringshyppighed,\nmediekapacitet og medieperformance, samt portability og\navailability.', 'Kender eleven til hvordan, hvor ofte og på hvilke medier praktikpladsen\nkører backup kan det hjælpe eleven til bedre at fordybe sig i faget på\nskolen.', '2018-03-30 12:21:48', NULL);
INSERT INTO `dk_courses` VALUES (50, 1588, 'Backupteknologi II', 'I dette fag får eleven erfaring med server-klient backup og arbejder med\niSCSI teknologien. Eleven skal vha. et andet backup program end det\nindbyggede Windows Server Backup foretage backup af alle data på en\niSCSI Server (adgangskontrol til denne server skal styres via en windows\nserver med MS iSCSI-Initiator. Der skal også installeres en klient maskine\nsom får sine klient data på serveren backet up (opgaven må gerne udbygges\nyderligere.). Via et valgfrit backup program skal der således planlægges\n1 ugentlig full backup og 1 daglig incremental backup. Backuppen\nskal placeres på et separat iSCSI-LUN.\nDesuden skal eleven aflevere en kort rapport som beskriver hvordan\niSCSI fungerer og er opbygget, samt lave en Total Cost of Ownership\nberegning opsætningen af serverne fra indkøb til bortskaffelse.', 'Erfaring med backupteknologi svarende til indholdet af Backupteknologi\nI er en fordel, desuden vil viden om hvordan, og gerne erfaring med,\nbackupløsningen fra praktikpladsen være medvirkende til at skabe dybere\nlæring hos eleven.', '2018-03-30 12:22:16', NULL);
INSERT INTO `dk_courses` VALUES (51, 6289, 'Sikkerhed III', 'Fagets fokus er indholdet af CCNA Security og omhandler en teoretisk\nog en praktisk del. Erfaring med Cisco netværksudstyr og netværksteori\nsvarende til Netværk I, II og III er en forudsætning for at deltage i faget.\nI faget skal eleven arbejde med opsætning og indstilling af sikkerheden:\nAuthentication, Authorization og Accounting, IPSec med VPN, samt indstilling\naf et Network-Based Intrusion Prevention System og grundlæggende\nnetværkssikkerhed via Firewall på et firmanetværk.\nI den teoretiske del skal eleven tage en teoretisk eksamen i fagets praktiske\nog teoretiske indhold, som også omhandler offentlige sikkerhedsregler\nog standarder for IT-Sikkerhed.', 'Har eleven indblik, og gerne erfaring med Netværkssikkerheden på\npraktikpladsen, herunder viden om hvilke systemer der benyttes til at skabe\nsikkerhed, vil eleven være bedre rustet til at fordybe sig i faget og kan relatere\nCiscos netværkssikkerhedsløsninger/teori til de løsninger som praktikpladsen\nhar etableret.', '2018-03-30 12:22:39', NULL);
INSERT INTO `dk_courses` VALUES (52, 3, 'Specialefag', NULL, 'Skolen planlægger hvilke fag der afholdes i hvilket kvartal. Forhør Jer\ngerne hos kontaktlæreren.', '2018-03-30 12:22:56', '2018-03-31 12:21:01');
INSERT INTO `dk_courses` VALUES (53, 6233, 'IT-Supporter Svendeprøveprojekt', 'Eleverne arbejder med forståelse og benyttelse af scripts til administration\npå en windows-baseret PC. Eleverne kommer også ind på en grundlæggende\nforståelse af databasehåndtering, tabeller og data. Eleverne\narbejder med scriptsprogets muligheder: variabler, løkker, forgreninger,\nI/O til skærm og filer. Samt scriptsprogets tilknyttede objekter, funktioner,\nkonstanter, subrutiner og egne fremstillede funktioner. Arbejdet foregår\nhovedsageligt i WMI og SQL.', 'Benytter praktikpladsen allerede scripts til nogle arbejdsopgaver, og har\neleven kendskab til hvorfor/hvordan de bruges, vil det være en fordel for\neleven ved gennemførelse af faget.', '2018-03-30 12:23:19', NULL);
INSERT INTO `dk_courses` VALUES (54, 6244, 'Netværksteknologi I', 'Dette fag er en overbygning til den viden eleven har tilegnet sig i løbet af\nNetværk I, II og III. I dette fag lærer eleven at benytte statisk og dynamisk\nrouting med OSPF, EIGRP og BGP routingsprotokollerne til at konfigurere\nog implementere routing i komplekse Enterprise netværk bestående af\nflere lokationer og får erfaring med at optimere routingsopdateringer og\nanvende distribueringslister.\nEleven får endvidere erfaring med at konfigurere IPv6 adressering,\nrouting, tunneller og IP Multicasting, samt opnår indsigt i IPv6 således at\neleven kan redegøre for fordele og ulemper. Eleven får endvidere erfaring\nmed at udarbejde en implementeringsplan for router services og\nimplementering af Path Control, samt anvende Offsets-lists, IP SLA og PBR.\nEleven lærer at kunne redegøre for grundlæggende udstyrs –og opsætningsbehov\nfor implementeringen af WAN og mobile lokationer.', 'Indsigt i praktikpladsens netværksopsætning, herunder udstyr, protokoller\nog netværk services der er i brug, gerne for fjernforbindelser også, kan\nhjælpe til med at eleven nemmere kan fordybe sig i faget på skolen som\nbåde indeholder en teoretisk og en praktisk del.', '2018-03-30 12:23:44', NULL);
INSERT INTO `dk_courses` VALUES (55, 6248, 'Netværksteknologi II', 'Faget kræver viden svarende til Netværk I, II og III. I dette fag fordyber\neleven sig i Cisco baserede switchede netværk. Indholdet har fokus på opsætning\naf multiplayerswitche og i løbet af faget får eleven erfaring med\nat installere, konfigurere, administrere og opdatere multiplayerswitche i et\nnetværk. Eleven lærer endvidere at kunne redegøre for den overordnede\narkitektur i et Campus netværksdesign, hvor multiplayerswitche indgår i.\nI faget kommer eleven omkring VLAN, VTP, DTP, Link Aggregation\n(Etherchannel), DHCP, CEF. Eleven lærer at optimere netværkstrafikken\nog implementere QoS på et switchet netværk. Eleven får erfaring med at\nopsætte et multilayer switched netværk som leverer høj tilgængelighed\nog redundans. I faget kommer eleven også omkring sikkerhedsaspektet i\net switchet netværk, herunder forskellige trusler og angreb, samt mulige\nsikkerhedsløsninger til beskyttelse imod disse, eleven lærer endvidere at\ninstallere og konfigurere sikkerhedsløsninger/netværksovervågning.\nEleven får erfaring med at implementere IOS Server Load Balancing. Endeligt\nlærer eleven at planlægge og klargøre til integration af avancerede\nservies i et Campus netværk, som Converged Traffic, IP-multicast, Wireless\nAccess, Voice og Video (QoS).', 'Det være en fordel at eleven har kendskab til i hvilket omfang praktikpladsen\nhar implementeret multilayerswitche i firmanetværket, samt viden\nom i hvilket omfang firmaet har implementeret QoS, og hvilke sikkerhedsforanstaltninger\npraktikpladsen benytter til beskyttelse og overvågning af\nnetværket. En forhåndsviden om dette kan give eleven en bedre forståelse\nfor indholdet af faget, og gøre det nemmere for eleven at fordybe sig\nunder fagets afholdelse.', '2018-03-30 12:24:13', NULL);
INSERT INTO `dk_courses` VALUES (56, 6256, 'IT Service-Management II', 'Faget kræver viden svarende til IT Service-Management I og omhandler arbejde\nmed metoder for levering af IT-Service ud fra strukturerede metoder\nsvarende til ITIL Foundation V3, Operational Support and Analysis. I faget\nfor eleven erfaring med at beskrive aktiviteter, metoder og funktioner som\nindgår i de enkelte support og analyseprocesser. Eleven opnår erfaring\nmed at beskrive hvordan drift kan optimeres igennem anvendelsen af operationel\nsupport og analyse, samt hvordan denne optimering kan måles.\nEndvidere lærer eleven om vigtigheden af IT-Sikkerhed og hvordan\ndenne kan understøtte operationel support og analyse. Eleven lærer at\nbeskrive hvilke krav (tekniske og implementeringsmæssige) der kan være\ni forbindelse med implementering af ITIL og hvilke udfordringer, kritiske\nsucces faktorer og risici forbundet med implementering.', 'Kendskab til praktikpladsens strukturerede metoder for levering af IT-Service\nog analyse vil give eleven en forståelse af hvordan disse opgaver\nløses på arbejdspladsen og kan være med til at eleven bedre kan relatere\nfagets indhold til den virkelige verden og kan igen hjælpe til med at eleven\nkan udarbejde bedre løsningsforslag og beskrivelser i fagets afholdelse.', '2018-03-30 12:24:37', NULL);
INSERT INTO `dk_courses` VALUES (57, 6250, 'Netværksteknologi III', 'Faget kræver viden svarende til fagene Netværksteknologi I og II. Fagets\nindhold er overordnet Troubleshooting på et Enterprise netværk. Eleven får\ni faget erfaring med at kunne planlægge og beskrive procedurer for drift\nog vedligeholdelse, samt implementering af procedurer for fejlfinding og\nretning af disse, i et komplekst Enterprise netværk. Herunder at udvælge\nværktøjer, fremgangsmåder til fejlfinding/retning/netværksdiagnosticering.\nDette kan være protokolanalysatorer, administrationsværktøj,\nnetværksapplikationer og dokumentationsværktøj.', 'Som i de øvrige Netværksfag vil det være en fordel at kende til opsætningen\naf firmanetværket. Specielt for dette fag vil erfaring med, eller\nkendskab til, arbejde med netværksdiagnosticering, fejlfinding/retning\nfra praktikpladsen kunne give eleven bedre forståelse for de teknologier\nsom er indeholdt i faget, og kan lede til at eleven lærer mere under fagets\nafholdelse.', '2018-03-30 12:25:04', NULL);
INSERT INTO `dk_courses` VALUES (58, 6252, 'Netværksdesign I', 'Fagets indhold kræver viden svarende til Netværk I, II og III. I dette fag får\neleven erfaring med at kunne analysere et bestående firmanetværk og ud\nfra nuværende og fremtidige behov for performance, sikkerhed, kapacitet\nog skalerbarhed at kunne producere en netværksløsning som kan fremlægges\ntil virksomhedens ledelse. Eleven lærer at designe et firmanetværk\nbestående af både LAN og WAN ud fra en hierarkisk netværksmodel som\nindeholder implementering af netværksservicer som DHCP, NAT, DNS,\nPROXY, Remote access/Remote authentication, Dial-in User Service, valg\naf routingsprotokol, Voice.\nEleven lærer at udarbejde dokumentation af netværket til brug for fremvisning\ntil beslutningstagere, som indeholder en Network Management\nstrategi.', 'Viden om praktikpladsens netværksopbygning og nuværende/fremtidige\nbehov kan gøre det nemmere for eleven at relatere fagets indhold til den\nvirkelige verden. Viden som hvilke netværksenheder virksomheden har\nimplementeret og om virksomhedsnetværkets performance kan give eleven\nen forståelse for netværksdesign, hvor det handler om at løse opgaverne\npå netværket mest optimalt i forhold til nuværende og fremtidige behov.\nDet økonomiske aspekt som altid vil kunne begrænse mulighederne i\nden virkelige verden, spiller ikke en større rolle i faget end at eleven får\ntildelt et fiktivt budget som den mest optimale netværksløsning skal udarbejdes\nindenfor.', '2018-03-30 12:25:34', '2018-03-30 12:26:01');
INSERT INTO `dk_courses` VALUES (59, 6228, 'IP Telefoni', 'Du kommer til at arbejde med opsætning af Cisco udstyr, bl.a. Cisco IP telefoner\nog Cisco CCME Router opsætning, samt Softphones. Faget veksler\nimellem teori og lærerstyrede opgaver, og projektarbejde i små grupper.\nTeorien tages hovedsageligt på klassen, styret af læreren, medens gruppen\nfår tid til at løse en problemorienteret opgave i løbet af faget. Det er\nogså muligt at løse opgaven i et andet miljø som f.eks. Microsoft Lync og\nlignende, dette skal dog godkendes af lærerne for at sikre at løsningen\nlever op til fagets målpinde.', 'Hvis eleven under praktiktiden har haft mulighed for at stifte bekendtskab\nmed den løsning virksomheden har valgt til telefoni og hvis muligt opsætning,\nadministration og brug af PBX/Softphones/Hardphones vil eleven\nvære godt klædt på til løsning af den praktiske opgave i faget.', '2018-03-30 12:26:31', NULL);
INSERT INTO `dk_courses` VALUES (60, 6236, 'Programming I (Java/C#)', 'Faget giver en grundlæggende indføring i programmeringssproget C#\ngennem programmeringsmiljøet Microsoft Visual Studio. Eleven introduceres\ntil de grundlæggende elementer i sproget. Der stiftes bekendtskab med\nvariabler, datatyper, operatorer, løkker og forgreninger. Eleven introduceres\nendvidere til objektorienteret programmering og lærer at fremstille\negne klasser og metoder samt at håndtere Access Control til disse, derudover\nlærer eleven om nedarvning af klasser.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med programmeringsopgaver\nvil dette være en fordel for elevens mulighed for at fordybe\nsig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver med\nprogrammering på praktikpladsen vil være en fordel for elevens konceptforståelse\ngenerelt og kan ligeledes være medvirkende til at eleven opnår\nmere læring under fagets afholdelse.', '2018-03-30 12:27:01', NULL);
INSERT INTO `dk_courses` VALUES (61, 6237, 'Programmering II (C#)', 'Eleven arbejder på et fagligt niveau svarende til MCP Programmering\nwith C# samt MCP developing and implementing Web applications with\nMicrosoft Visual C# og MCP Programming with Microsoft ADO.NET .NET\nmed udvikling af en struktureret software opgave. Det er en forudsætning\nat eleven har grundlæggende programmeringserfaring svarende til\nindholdet af opgaverne i faget Programmering I da der i faget arbejdes\nvidere med den grundlæggende viden og erfaring eleven tilegnede sig\nmed programmeringssprogets datatyper, operatorer og kontrolstrukturer\nsamt den strukturerede tilgang fra Programmering I. Der arbejdes i faget\nendvidere med nedarvning, undtagelser og eleven skal kunne definere og\nanvende delegater, Event specifikationer, Properties, Indexers, præ-definerede\nattributter. Eleven lærer at konstruere komponenter i C# samt arbejde\nmed ASP.NET og lærer at tilføje brugere og server controls til en ASP.NET\nwebform, samt fremstille og befolke en ASP.NET webform.\nEleven lærer at bruge udviklingsmiljøets trace og debug objekter samt\nat validere brugerinput. Eleven lærer at anvende Microsoft ADO.NET til at\ntilgå data i en ASP.NET applikation. Eleven arbejder endvidere med XML,\nherunder indlæsning og kald til XML Web services fra en ASP.NET applikation,\ndatasets og table mapping, samt udarbejdelse af XSD skemaer.', 'Har eleven i sin praktiktid haft mulighed for at arbejde med programmeringsopgaver\nvil dette være en fordel for elevens mulighed for at fordybe\nsig i emnet på skolen. Kendskab til omfanget af og arbejdsopgaver med\nprogrammering på praktikpladsen vil være en fordel for elevens konceptforståelse\ngenerelt og kan ligeledes være medvirkende til at eleven opnår\nmere læring under fagets afholdelse.\nDesuden vil det være en fordel hvis eleven kender til praktikvirksomhedens\nfremgangsmetoder ved programmeringsopgaver, f.eks. hvis UML\nnotation anvendes til design af klasser og praktikpladsen benytter en\nobjektorienteret tilgang til programmeringsopgaver kan det være en fordel\nat eleven har fået indsigt i dette før fagets afholdelse.', '2018-03-30 12:27:29', NULL);
INSERT INTO `dk_courses` VALUES (62, 1586, 'Serverteknologi II, Clusterteknologi', 'I dette fag får eleven erfaring med at planlægge, installere, vedligeholde\nog troubleshoote server clustre. Eleven kommer i faget til at arbejde med\nopsætning af både Linux og Windows baserede servere, herunder webapplikations\nog beregnings clustre, Network Load Balancing cluster, samt\nforetage oprettelse af cluster ressourcer.', 'Har virksomheden implementeret server clustre, vil eleven kunne drage\nnytte af at kende til hvilke typer clustre der er sat op og hvilke formål de\ntjener.', '2018-03-30 12:28:03', NULL);
INSERT INTO `dk_courses` VALUES (63, 1587, 'Serverteknologi II, Blandede miljøer', 'I faget arbejder eleven med at opsætte en Samba filserver i et Microsoft\nnetværk. På serveren lærer eleven at opsætte en printer, og opnår erfaring\nmed at konfigurere en Samba server i et multibruger miljø bestående af\nMicrosoft Windows operativsystemer kombineret med en UNIX baseret\nserver.', 'Erfaring med UNIX vil gøre det nemmere for eleven at fordybe sig i faget,\nligeledes vil viden om og gerne erfaring med de blandede servermiljøer\npraktikpladsen eventuelt benytter kunne hjælpe til med at eleven opnår\nmere indsigt i fagets indhold.', '2018-03-30 12:28:32', NULL);
INSERT INTO `dk_courses` VALUES (64, 6259, 'Svendeprøveprojekt', 'Faget er det afsluttende fag for Datatekniker Infrastruktur og det er et\nkrav for deltagelse at der er opnået karakter eller merit i alle øvrige fag i\nuddannelsen. I faget skal eleven i samarbejde med andre elever udarbejde\nen problemformulering med tilhørende kravspecifikation baseret på en\ncase beskrivelse og et projektoplæg. Dette skaber basis for arbejdet med\nplanlægning, opbygning, og idriftsættelse af et avanceret system. Eleverne\nskal også udarbejde en produkt- og procesrapport som beskriver system\nog proces. En del af fagets fokus er i gruppearbejdet at udvise konstruktiv\nkommunikation i gruppearbejdet. Faget afsluttes med en præsentation af\nsystemet.', 'Har eleven i løbet af sin praktiktid haft mulighed for at deltage i projektarbejde,\ngerne i forbindelse med opsætning af et firmanetværk med\ntilhørende servere, sikkerhed og backup vil det være en fordel for elevens\nfordybelse i faget.', '2018-03-30 12:28:57', NULL);
COMMIT;

-- ----------------------------
-- Table structure for dk_courses_to_semesters
-- ----------------------------
DROP TABLE IF EXISTS `dk_courses_to_semesters`;
CREATE TABLE `dk_courses_to_semesters` (
  `semester_id` int(11) unsigned NOT NULL,
  `course_id` int(11) unsigned NOT NULL,
  KEY `dkcts_semester_id` (`semester_id`),
  KEY `dkcts_course_id` (`course_id`),
  CONSTRAINT `dkcts_course_id` FOREIGN KEY (`course_id`) REFERENCES `dk_courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dkcts_semester_id` FOREIGN KEY (`semester_id`) REFERENCES `dk_semesters` (`semester_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Many to many linking table between course IDs and semester IDs';

-- ----------------------------
-- Records of dk_courses_to_semesters
-- ----------------------------
BEGIN;
INSERT INTO `dk_courses_to_semesters` VALUES (3, 9);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 10);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 11);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 13);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (3, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 10);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 11);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 19);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (4, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (5, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (5, 19);
INSERT INTO `dk_courses_to_semesters` VALUES (5, 23);
INSERT INTO `dk_courses_to_semesters` VALUES (5, 24);
INSERT INTO `dk_courses_to_semesters` VALUES (5, 25);
INSERT INTO `dk_courses_to_semesters` VALUES (5, 26);
INSERT INTO `dk_courses_to_semesters` VALUES (5, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 24);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 29);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 30);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 31);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 32);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 33);
INSERT INTO `dk_courses_to_semesters` VALUES (6, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 23);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 34);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 35);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 37);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 38);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 39);
INSERT INTO `dk_courses_to_semesters` VALUES (7, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (8, 40);
INSERT INTO `dk_courses_to_semesters` VALUES (8, 41);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 9);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 10);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 11);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 13);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (9, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 10);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 11);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 19);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (10, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (11, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (11, 19);
INSERT INTO `dk_courses_to_semesters` VALUES (11, 23);
INSERT INTO `dk_courses_to_semesters` VALUES (11, 24);
INSERT INTO `dk_courses_to_semesters` VALUES (11, 25);
INSERT INTO `dk_courses_to_semesters` VALUES (11, 26);
INSERT INTO `dk_courses_to_semesters` VALUES (12, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (12, 24);
INSERT INTO `dk_courses_to_semesters` VALUES (12, 29);
INSERT INTO `dk_courses_to_semesters` VALUES (12, 30);
INSERT INTO `dk_courses_to_semesters` VALUES (12, 31);
INSERT INTO `dk_courses_to_semesters` VALUES (12, 32);
INSERT INTO `dk_courses_to_semesters` VALUES (12, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (13, 39);
INSERT INTO `dk_courses_to_semesters` VALUES (13, 38);
INSERT INTO `dk_courses_to_semesters` VALUES (13, 37);
INSERT INTO `dk_courses_to_semesters` VALUES (13, 35);
INSERT INTO `dk_courses_to_semesters` VALUES (13, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (13, 23);
INSERT INTO `dk_courses_to_semesters` VALUES (13, 34);
INSERT INTO `dk_courses_to_semesters` VALUES (14, 40);
INSERT INTO `dk_courses_to_semesters` VALUES (14, 41);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 10);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 9);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 13);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 11);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (15, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (16, 10);
INSERT INTO `dk_courses_to_semesters` VALUES (16, 11);
INSERT INTO `dk_courses_to_semesters` VALUES (16, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (16, 19);
INSERT INTO `dk_courses_to_semesters` VALUES (16, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (16, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (16, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (17, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (17, 26);
INSERT INTO `dk_courses_to_semesters` VALUES (17, 25);
INSERT INTO `dk_courses_to_semesters` VALUES (17, 23);
INSERT INTO `dk_courses_to_semesters` VALUES (17, 19);
INSERT INTO `dk_courses_to_semesters` VALUES (17, 12);
INSERT INTO `dk_courses_to_semesters` VALUES (17, 24);
INSERT INTO `dk_courses_to_semesters` VALUES (18, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (18, 24);
INSERT INTO `dk_courses_to_semesters` VALUES (18, 29);
INSERT INTO `dk_courses_to_semesters` VALUES (19, 34);
INSERT INTO `dk_courses_to_semesters` VALUES (18, 30);
INSERT INTO `dk_courses_to_semesters` VALUES (18, 31);
INSERT INTO `dk_courses_to_semesters` VALUES (18, 32);
INSERT INTO `dk_courses_to_semesters` VALUES (18, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (19, 23);
INSERT INTO `dk_courses_to_semesters` VALUES (19, 35);
INSERT INTO `dk_courses_to_semesters` VALUES (19, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (19, 37);
INSERT INTO `dk_courses_to_semesters` VALUES (19, 38);
INSERT INTO `dk_courses_to_semesters` VALUES (19, 39);
INSERT INTO `dk_courses_to_semesters` VALUES (20, 40);
INSERT INTO `dk_courses_to_semesters` VALUES (20, 41);
INSERT INTO `dk_courses_to_semesters` VALUES (20, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 42);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 43);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 44);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 45);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 46);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 47);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (23, 33);
INSERT INTO `dk_courses_to_semesters` VALUES (24, 39);
INSERT INTO `dk_courses_to_semesters` VALUES (30, 52);
INSERT INTO `dk_courses_to_semesters` VALUES (24, 33);
INSERT INTO `dk_courses_to_semesters` VALUES (24, 54);
INSERT INTO `dk_courses_to_semesters` VALUES (24, 55);
INSERT INTO `dk_courses_to_semesters` VALUES (30, 56);
INSERT INTO `dk_courses_to_semesters` VALUES (30, 57);
INSERT INTO `dk_courses_to_semesters` VALUES (30, 58);
INSERT INTO `dk_courses_to_semesters` VALUES (30, 60);
INSERT INTO `dk_courses_to_semesters` VALUES (30, 61);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 51);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 49);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 50);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 59);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 48);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 32);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 62);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 63);
INSERT INTO `dk_courses_to_semesters` VALUES (31, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (32, 40);
INSERT INTO `dk_courses_to_semesters` VALUES (32, 64);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (21, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 42);
INSERT INTO `dk_courses_to_semesters` VALUES (33, 43);
INSERT INTO `dk_courses_to_semesters` VALUES (34, 44);
INSERT INTO `dk_courses_to_semesters` VALUES (34, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (34, 45);
INSERT INTO `dk_courses_to_semesters` VALUES (34, 46);
INSERT INTO `dk_courses_to_semesters` VALUES (34, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (34, 47);
INSERT INTO `dk_courses_to_semesters` VALUES (34, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (35, 39);
INSERT INTO `dk_courses_to_semesters` VALUES (35, 52);
INSERT INTO `dk_courses_to_semesters` VALUES (35, 54);
INSERT INTO `dk_courses_to_semesters` VALUES (35, 55);
INSERT INTO `dk_courses_to_semesters` VALUES (36, 56);
INSERT INTO `dk_courses_to_semesters` VALUES (36, 57);
INSERT INTO `dk_courses_to_semesters` VALUES (36, 58);
INSERT INTO `dk_courses_to_semesters` VALUES (36, 60);
INSERT INTO `dk_courses_to_semesters` VALUES (36, 61);
INSERT INTO `dk_courses_to_semesters` VALUES (37, 51);
INSERT INTO `dk_courses_to_semesters` VALUES (37, 50);
INSERT INTO `dk_courses_to_semesters` VALUES (37, 59);
INSERT INTO `dk_courses_to_semesters` VALUES (37, 48);
INSERT INTO `dk_courses_to_semesters` VALUES (37, 32);
INSERT INTO `dk_courses_to_semesters` VALUES (37, 62);
INSERT INTO `dk_courses_to_semesters` VALUES (37, 63);
INSERT INTO `dk_courses_to_semesters` VALUES (38, 40);
INSERT INTO `dk_courses_to_semesters` VALUES (38, 64);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 42);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 43);
INSERT INTO `dk_courses_to_semesters` VALUES (39, 47);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 44);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 45);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 46);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 47);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 48);
INSERT INTO `dk_courses_to_semesters` VALUES (40, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (41, 49);
INSERT INTO `dk_courses_to_semesters` VALUES (41, 50);
INSERT INTO `dk_courses_to_semesters` VALUES (41, 51);
INSERT INTO `dk_courses_to_semesters` VALUES (41, 52);
INSERT INTO `dk_courses_to_semesters` VALUES (41, 54);
INSERT INTO `dk_courses_to_semesters` VALUES (41, 55);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 32);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 52);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 39);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 56);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 57);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 58);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 59);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 60);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 61);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 62);
INSERT INTO `dk_courses_to_semesters` VALUES (42, 63);
INSERT INTO `dk_courses_to_semesters` VALUES (43, 40);
INSERT INTO `dk_courses_to_semesters` VALUES (43, 27);
INSERT INTO `dk_courses_to_semesters` VALUES (43, 64);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 42);
INSERT INTO `dk_courses_to_semesters` VALUES (44, 43);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 44);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 45);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 46);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 47);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (45, 33);
INSERT INTO `dk_courses_to_semesters` VALUES (46, 33);
INSERT INTO `dk_courses_to_semesters` VALUES (46, 52);
INSERT INTO `dk_courses_to_semesters` VALUES (46, 53);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 28);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 20);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 14);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 15);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 16);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 17);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 18);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 42);
INSERT INTO `dk_courses_to_semesters` VALUES (47, 43);
INSERT INTO `dk_courses_to_semesters` VALUES (48, 44);
INSERT INTO `dk_courses_to_semesters` VALUES (48, 36);
INSERT INTO `dk_courses_to_semesters` VALUES (48, 45);
INSERT INTO `dk_courses_to_semesters` VALUES (48, 46);
INSERT INTO `dk_courses_to_semesters` VALUES (48, 22);
INSERT INTO `dk_courses_to_semesters` VALUES (48, 47);
INSERT INTO `dk_courses_to_semesters` VALUES (48, 21);
INSERT INTO `dk_courses_to_semesters` VALUES (49, 52);
INSERT INTO `dk_courses_to_semesters` VALUES (49, 53);
COMMIT;

-- ----------------------------
-- Table structure for dk_educations
-- ----------------------------
DROP TABLE IF EXISTS `dk_educations`;
CREATE TABLE `dk_educations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_danish_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `education_name_index` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='The educations';

-- ----------------------------
-- Records of dk_educations
-- ----------------------------
BEGIN;
INSERT INTO `dk_educations` VALUES (1, 'Datatekniker med speciale i Programmering', 'Datatekniker / Programmering', NULL, '2018-02-12 20:41:12', '2018-03-15 12:09:14');
INSERT INTO `dk_educations` VALUES (2, 'Datatekniker med speciale i Infrastruktur', 'Datatekniker / Infrastruktur', NULL, '2018-02-12 20:41:14', '2018-03-15 12:09:23');
INSERT INTO `dk_educations` VALUES (3, 'IT-Supporter', 'IT-Supporter', NULL, '2018-02-12 20:41:09', '2018-03-15 15:13:40');
COMMIT;

-- ----------------------------
-- Table structure for dk_educations_to_student_types
-- ----------------------------
DROP TABLE IF EXISTS `dk_educations_to_student_types`;
CREATE TABLE `dk_educations_to_student_types` (
  `education_id` int(11) unsigned NOT NULL,
  `student_type_id` int(11) unsigned NOT NULL,
  KEY `education_to_student_type` (`education_id`),
  KEY `student_type_to_education` (`student_type_id`),
  CONSTRAINT `education_to_student_type` FOREIGN KEY (`education_id`) REFERENCES `dk_educations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_type_to_education` FOREIGN KEY (`student_type_id`) REFERENCES `dk_student_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- ----------------------------
-- Records of dk_educations_to_student_types
-- ----------------------------
BEGIN;
INSERT INTO `dk_educations_to_student_types` VALUES (1, 1);
INSERT INTO `dk_educations_to_student_types` VALUES (1, 2);
INSERT INTO `dk_educations_to_student_types` VALUES (1, 3);
INSERT INTO `dk_educations_to_student_types` VALUES (1, 4);
INSERT INTO `dk_educations_to_student_types` VALUES (1, 5);
INSERT INTO `dk_educations_to_student_types` VALUES (2, 1);
INSERT INTO `dk_educations_to_student_types` VALUES (2, 2);
INSERT INTO `dk_educations_to_student_types` VALUES (2, 3);
INSERT INTO `dk_educations_to_student_types` VALUES (2, 4);
INSERT INTO `dk_educations_to_student_types` VALUES (2, 5);
INSERT INTO `dk_educations_to_student_types` VALUES (3, 1);
INSERT INTO `dk_educations_to_student_types` VALUES (3, 3);
INSERT INTO `dk_educations_to_student_types` VALUES (3, 4);
INSERT INTO `dk_educations_to_student_types` VALUES (3, 5);
COMMIT;

-- ----------------------------
-- Table structure for dk_semesters
-- ----------------------------
DROP TABLE IF EXISTS `dk_semesters`;
CREATE TABLE `dk_semesters` (
  `semester_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_type_group_id` int(11) unsigned NOT NULL,
  `education_id` int(11) unsigned NOT NULL,
  `semester` int(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`semester_id`),
  KEY `semesters_to_student_type_groups` (`student_type_group_id`),
  KEY `semesters_to_education` (`education_id`),
  CONSTRAINT `semesters_to_education` FOREIGN KEY (`education_id`) REFERENCES `dk_educations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `semesters_to_student_type_groups` FOREIGN KEY (`student_type_group_id`) REFERENCES `dk_student_type_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Links an education id to a student type group id and defines a semester.';

-- ----------------------------
-- Records of dk_semesters
-- ----------------------------
BEGIN;
INSERT INTO `dk_semesters` VALUES (3, 1, 1, 1, '2018-03-22 17:53:56', NULL);
INSERT INTO `dk_semesters` VALUES (4, 1, 1, 2, '2018-03-22 17:58:36', NULL);
INSERT INTO `dk_semesters` VALUES (5, 1, 1, 3, '2018-03-22 18:04:49', NULL);
INSERT INTO `dk_semesters` VALUES (6, 1, 1, 4, '2018-03-22 18:12:11', NULL);
INSERT INTO `dk_semesters` VALUES (7, 1, 1, 5, '2018-03-22 18:19:01', NULL);
INSERT INTO `dk_semesters` VALUES (8, 1, 1, 6, '2018-03-22 18:25:05', NULL);
INSERT INTO `dk_semesters` VALUES (9, 2, 1, 1, '2018-03-23 23:19:39', NULL);
INSERT INTO `dk_semesters` VALUES (10, 2, 1, 2, '2018-03-24 19:36:38', NULL);
INSERT INTO `dk_semesters` VALUES (11, 2, 1, 3, '2018-03-24 19:47:36', NULL);
INSERT INTO `dk_semesters` VALUES (12, 2, 1, 4, '2018-03-24 19:54:12', NULL);
INSERT INTO `dk_semesters` VALUES (13, 2, 1, 5, '2018-03-24 20:01:35', NULL);
INSERT INTO `dk_semesters` VALUES (14, 2, 1, 6, '2018-03-24 20:05:26', NULL);
INSERT INTO `dk_semesters` VALUES (15, 3, 1, 1, '2018-03-24 20:09:44', NULL);
INSERT INTO `dk_semesters` VALUES (16, 3, 1, 2, '2018-03-24 20:19:43', NULL);
INSERT INTO `dk_semesters` VALUES (17, 3, 1, 3, '2018-03-25 01:42:42', NULL);
INSERT INTO `dk_semesters` VALUES (18, 3, 1, 4, '2018-03-25 01:46:07', NULL);
INSERT INTO `dk_semesters` VALUES (19, 3, 1, 5, '2018-03-25 01:59:20', NULL);
INSERT INTO `dk_semesters` VALUES (20, 3, 1, 6, '2018-03-25 02:02:02', NULL);
INSERT INTO `dk_semesters` VALUES (21, 1, 2, 1, '2018-03-30 22:05:14', NULL);
INSERT INTO `dk_semesters` VALUES (23, 1, 2, 2, '2018-03-31 11:23:38', '2018-03-31 11:23:38');
INSERT INTO `dk_semesters` VALUES (24, 1, 2, 3, '2018-03-31 14:15:04', '2018-03-31 14:15:04');
INSERT INTO `dk_semesters` VALUES (30, 1, 2, 4, '2018-03-31 14:28:46', '2018-03-31 14:28:46');
INSERT INTO `dk_semesters` VALUES (31, 1, 2, 5, '2018-03-31 14:42:24', '2018-03-31 14:42:24');
INSERT INTO `dk_semesters` VALUES (32, 1, 2, 6, '2018-03-31 14:45:10', '2018-03-31 14:45:10');
INSERT INTO `dk_semesters` VALUES (33, 2, 2, 1, '2018-03-31 14:46:30', '2018-03-31 14:46:30');
INSERT INTO `dk_semesters` VALUES (34, 2, 2, 2, '2018-03-31 15:21:34', '2018-03-31 15:21:34');
INSERT INTO `dk_semesters` VALUES (35, 2, 2, 3, '2018-03-31 15:25:58', '2018-03-31 15:25:58');
INSERT INTO `dk_semesters` VALUES (36, 2, 2, 4, '2018-03-31 15:27:37', '2018-03-31 15:27:37');
INSERT INTO `dk_semesters` VALUES (37, 2, 2, 5, '2018-03-31 15:29:08', '2018-03-31 15:29:08');
INSERT INTO `dk_semesters` VALUES (38, 2, 2, 6, '2018-03-31 15:30:54', '2018-03-31 15:30:54');
INSERT INTO `dk_semesters` VALUES (39, 3, 2, 1, '2018-03-31 15:32:01', '2018-03-31 15:32:01');
INSERT INTO `dk_semesters` VALUES (40, 3, 2, 2, '2018-03-31 15:34:38', '2018-03-31 15:34:38');
INSERT INTO `dk_semesters` VALUES (41, 3, 2, 3, '2018-03-31 15:36:35', '2018-03-31 15:36:35');
INSERT INTO `dk_semesters` VALUES (42, 3, 2, 4, '2018-03-31 15:38:06', '2018-03-31 15:38:06');
INSERT INTO `dk_semesters` VALUES (43, 3, 2, 5, '2018-03-31 15:40:20', '2018-03-31 15:40:20');
INSERT INTO `dk_semesters` VALUES (44, 1, 3, 1, '2018-03-31 15:50:39', '2018-03-31 15:50:39');
INSERT INTO `dk_semesters` VALUES (45, 1, 3, 2, '2018-03-31 15:55:58', '2018-03-31 15:55:58');
INSERT INTO `dk_semesters` VALUES (46, 1, 3, 3, '2018-03-31 15:58:06', '2018-03-31 15:58:06');
INSERT INTO `dk_semesters` VALUES (47, 2, 3, 1, '2018-03-31 15:59:04', '2018-03-31 15:59:04');
INSERT INTO `dk_semesters` VALUES (48, 2, 3, 2, '2018-03-31 16:00:43', '2018-03-31 16:00:43');
INSERT INTO `dk_semesters` VALUES (49, 2, 3, 3, '2018-03-31 16:02:08', '2018-03-31 16:02:08');
COMMIT;

-- ----------------------------
-- Table structure for dk_student_type_groups
-- ----------------------------
DROP TABLE IF EXISTS `dk_student_type_groups`;
CREATE TABLE `dk_student_type_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Defines student type groups e.g EUD & EUV 3 belongs to the same group course and course length wise. (at the time of 22-may-18)';

-- ----------------------------
-- Records of dk_student_type_groups
-- ----------------------------
BEGIN;
INSERT INTO `dk_student_type_groups` VALUES (1, 'EUD & EUV 3', '2018-02-12 21:09:36', NULL);
INSERT INTO `dk_student_type_groups` VALUES (2, 'EUV 1 & EUV 2', '2018-02-12 21:09:36', NULL);
INSERT INTO `dk_student_type_groups` VALUES (3, 'EUX', '2018-02-12 21:18:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for dk_student_types
-- ----------------------------
DROP TABLE IF EXISTS `dk_student_types`;
CREATE TABLE `dk_student_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_type_group_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_danish_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_danish_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_type_id_index` (`id`) USING BTREE,
  KEY `student_type_name_index` (`name`) USING BTREE,
  KEY `fk_student_type_to_student_type_group` (`student_type_group_id`),
  CONSTRAINT `fk_student_type_to_student_type_group` FOREIGN KEY (`student_type_group_id`) REFERENCES `dk_student_type_groups` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='Defines the student types and links to a student type group ID';

-- ----------------------------
-- Records of dk_student_types
-- ----------------------------
BEGIN;
INSERT INTO `dk_student_types` VALUES (1, 1, 'EUD', 'En elev under 25 år', '## Varighed\n\nIt supporter 2 år + grundforløbet 25 ugers skoleundervisning fordelt på 3 skoleperioder.\n\nInfrastruktur 4,5 år + grundforløbet 55 ugers skoleundervisning fordelt på 6-7 skoleperioder.\n\nProgrammering 4,5 år 0 grundforløbet 55 ugers skoleundervisning fordelt på 6 skoleperioder.', '2018-02-12 20:27:25', '2018-02-13 21:59:02');
INSERT INTO `dk_student_types` VALUES (2, 3, 'EUX', 'Alle elever uanset alder.', 'En kombination af en gymnasial uddannelse og en datatekniker (kan ikke tages som it-supporter).\n\n\n5 år + grundforløb - skoleophold 88,7 uger fordelt på 5 skoleperioder.', '2018-02-12 20:36:59', '2018-02-13 21:59:19');
INSERT INTO `dk_student_types` VALUES (3, 2, 'EUV 1', 'Elev over 25 år med to års relevant erhverserfaring.\n\nIngen grundforløb.\n\nIngen praktikperioder.', '## Skoleophold\n\nIt-supporter 22,5 uger så vidt muligt i et forløb.\n\nInfrastruktur 49,5 uger så vidt muligt i et forløb.\n\nProgrammering 49,5 uger så vidt muligt i et forløb.\n\nHvis eleven er anset på en virksomhed - kan man aftale ophold mellem skoleperioderne.\n\nElever uden virksomhed kan få SU.', '2018-02-12 20:36:59', '2018-02-13 21:59:20');
INSERT INTO `dk_student_types` VALUES (4, 2, 'EUV 2', 'Elev over 25 år med tidligere uddannelse.', '## Varighed\n\nIt-supporter 1 år og 11 mdr. + grundforløb - 22,5 ugers skoleundervisning fordelt på 3 hovedforløb.\n\nInfrastruktur 2 år og 11 mdr. + grundforløb - 49,5 ugers skoleundervisning fordelt på 6-7 hovedforløb.\n\nProgrammering 2 år og 11 mdr. + grundforløb 49,5 ugers skoleundervisning fordelt på 6 skoleophold.', '2018-02-12 20:36:59', '2018-02-13 21:59:21');
INSERT INTO `dk_student_types` VALUES (5, 1, 'EUV 3', 'En elev over 25 år uden tidligere uddannelse', '## Varighed\n\nDen samme som EUD.', '2018-02-12 20:36:59', '2018-02-13 21:59:09');
COMMIT;

-- ----------------------------
-- Table structure for dk_widget_attributes
-- ----------------------------
DROP TABLE IF EXISTS `dk_widget_attributes`;
CREATE TABLE `dk_widget_attributes` (
  `widget_id` int(11) unsigned NOT NULL,
  `attributes` json NOT NULL,
  KEY `widget_attr_to_widget` (`widget_id`),
  CONSTRAINT `widget_attr_to_widget` FOREIGN KEY (`widget_id`) REFERENCES `dk_widgets` (`widget_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='NOT IN USE. Was meant for holding configs for widgets. The attributes column is JSON formatted, so one is free to define a structure, for a widget. The reason for the structure is that, config validation should be done on the client-side. It would probably be a good idea to have a standardised structure, so as to not wreak havoc on the front-end dev.';

-- ----------------------------
-- Table structure for dk_widgets
-- ----------------------------
DROP TABLE IF EXISTS `dk_widgets`;
CREATE TABLE `dk_widgets` (
  `widget_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_danish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`widget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci COMMENT='NOT IN USE. Was meant to be the first layer in a widget, holding the widget name for use in e.g. the admin dashboard.';

-- ----------------------------
-- Records of dk_widgets
-- ----------------------------
BEGIN;
INSERT INTO `dk_widgets` VALUES (1, 'EduPicker', '2018-03-15 16:11:46', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
