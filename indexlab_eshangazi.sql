-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 29, 2018 at 01:49 AM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `indexlab_eshangazi`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(10) unsigned NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `correct` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `created_at`, `updated_at`, `correct`) VALUES
(1, 1, 'Hapana', '2017-08-08 04:02:46', '2017-08-08 04:03:14', 0),
(2, 1, 'Ndio', '2017-08-08 04:02:46', '2017-08-08 04:02:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `centres`
--

CREATE TABLE IF NOT EXISTS `centres` (
  `id` int(10) unsigned NOT NULL,
  `centre_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `centres`
--

INSERT INTO `centres` (`id`, `centre_id`, `image`, `created_at`, `updated_at`) VALUES
(1, '107696-7', 'centres/August2017/NsrfjJ1R8nW9x7RVoXcM.jpg', '2017-08-08 03:19:31', '2017-08-08 03:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `centre_services`
--

CREATE TABLE IF NOT EXISTS `centre_services` (
  `id` int(10) unsigned NOT NULL,
  `centre_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `centre_services`
--

INSERT INTO `centre_services` (`id`, `centre_id`, `service`, `created_at`, `updated_at`) VALUES
(1, '107696-7', 'Huduma ya Afya ya Uzazi', '2017-08-08 03:04:24', '2017-08-08 03:04:24'),
(2, '107696-7', 'Uelimishaji rika', '2017-08-08 03:04:50', '2017-08-08 03:04:50'),
(3, '107696-7', 'Elimu ya habari sahihi zinazohusu Afya ya Jinsia kwa vijana', '2017-08-08 03:05:40', '2017-08-08 03:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `contraceptives`
--

CREATE TABLE IF NOT EXISTS `contraceptives` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_contraceptive_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `contraceptives`
--

INSERT INTO `contraceptives` (`id`, `name`, `gender`, `type_contraceptive_id`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Kondomu ya Kiume', 'MALE', 2, 'Kondomu ya kiume ni mpira laini ulio kama mfuko, ambao huvishwa kwenye uume uliosimama kabla ya kujamiiana ili kuzuia ujauzito na uambukizo utokanao na kujamiiana ikiwemo VVU. \r\n\r\nTumia kondomu mpya ili kupunguza uambukizo utokanao na kujamiiana, virusi vya UKIMWI na mimba katika umri mdogo.', 'contraceptives/August2017/JTLgw7CF4fT80oYJ2p4O.jpg', '2017-07-02 16:29:51', '2017-08-06 16:13:34'),
(2, 'Kondomu ya Kike', 'FEMALE', 2, 'Kondomu ya kike ni mpira laini unaoingizwa ukeni na kuushikisha kwenye shingo ya kizazi ili kuzuia ujauzito na uambukizo utokanao na kujamiiana ikiwemo VVU.\r\n\r\nTumia kondomu mpya kwa kila tendo la kujamiiana kisha itupe kwa usalama katika choo cha shimo au ichome moto. \r\n\r\nKondomu pia hutumika pamoja na njia nyingine za uzazi wa mpango.\r\n\r\nTumia kondomu kwa usahihi na ukamilifu kila mara moja unapohitaji kujamiiana.', 'contraceptives/August2017/fc3KrrV8wiUSYbaFzxmN.jpg', '2017-07-08 16:57:31', '2017-08-05 17:54:52'),
(3, 'Sindano za Uzazi wa Mpango', 'FEMALE', 2, 'Ni njia ya uzazi wa mpango yenye kichocheo kimoja ambacho hufanana na kichocheo cha asilia katika mwili wa mwanamke.   \r\n\r\nNjia hii inatolewa na mtaalamu wa afya kwa sindano kwenye msuli kila baada ya miezi mitatu. \r\n\r\nMwanamke anayenyonyesha  anaweza kutumia njia hii kwani haipunguzi kiasi wala ubora wa maziwa.', 'contraceptives/August2017/LsqJamZ8G9SRAQkWm4SH.jpg', '2017-07-25 15:19:58', '2017-08-06 16:03:54'),
(4, 'Kitanzi', 'FEMALE', 3, 'Kitanzi ni kifaa kidogo cha plastiki chenye madini ya shaba. Huwekwa kwenye mji wa mimba ili kuzuia ujauzito. \r\n\r\nHii ni mojawapo ya njia za muda mrefu za uzazi wa mpango. Kitanzi huwekwa na kutolewa na mtaalamu wa afya. \r\n\r\nHuzuia ujauzito kwa kipindi cha miaka 12 na kinaweza kutolewa wakati wowote mwanamke anapohitaji kupata ujauzito, anapotaka kubadilisha njia nyingine ya uzazi wa mpango au ukiwa na matatizo.', 'contraceptives/August2017/NbC66l29uPhpG1wZJfMC.jpg', '2017-07-25 15:21:07', '2017-08-05 18:11:35'),
(5, 'Vipandikizi au Kipandikizi', 'FEMALE', 3, 'Vipandikizi ni vifaa vidogo vya plastiki mfano wa njiti za kiberiti, ambavyo vina kichocheo/vichocheo ambavyo vinafanana na vichocheo vya asili vya mwilli wa mwanamke. \r\n\r\nNi njia mojawapo ya muda mrefu ya uzazi wa mpango unayoweza kutumia mwanamke ili asipate ujauzito. \r\n\r\nHuzuia asipate ujauzito kwa muda kati ya miaka miwili hadi mitano. Vipandikizi huwekwa na kutolewa na mtaalamu wa afya.\r\n\r\nKuna vipandikizi vya aina mbili:\r\ni. Kipandikizi kimoja\r\nii. Vipandikizi sita.', 'contraceptives/August2017/AjpyILuBCl0GPXV4THqj.jpg', '2017-07-25 15:26:03', '2017-08-05 18:09:18'),
(6, 'Vidonge vya Uzazi wa Mpango', 'FEMALE', 2, 'Ni vidonge vyenye kiwango kidogo cha kichocheo(kimoja au viwili) ambavyo vinafanana na vichocheo asili vya mwili wa mwanamke. \r\n\r\nHivi ni vidonge ambavyo mwanamke anameza kidonge kimoja kila siku ili kuzuia ujauzito. Hupatikana katika pakiti yenye vidonge 28 na yenye vidonge 35.\r\n\r\nVidonge hivi pia husaidia kurekebisha matatizo wakati wa siku za hedhi. Pia hutumika kama njia ya dharura ya kuzuia ujauzito iwapo mwanamke amejamiiana bila kinga, kama vile kubakwa. \r\n\r\nVipo vidonge ambavyo vinaweza kutumiwa na mama anayenyonyesha kwa sababu havipunguzi kiasi na ubora wa maziwa yake.', 'contraceptives/August2017/r6Lkjm0DGrD7Di2hSSnD.jpg', '2017-07-25 15:30:05', '2017-08-06 15:58:48'),
(7, 'Kutopata Hedhi Wakati wa Kunyonyesha', 'FEMALE', 2, 'Mwanamke anaweza kuzuia asipate ujauzito iwapo atamnyonyesha mtoto maziwa yake pekee kikamilifu, muda wa kunyonyesha usipite masaa manne mchana na usiku masaa sita. \r\n\r\nNjia hii ni ya uhakika katika kipindi cha miezi sita ya mwanzo baada ya kujifungua.\r\n\r\nKinachotakiwa:\r\nMama awe hajapata hedhi tangu kujifungua na mtoto awe chini ya miezi sita.', 'contraceptives/August2017/VcrK5USjQjUoY3TvZo8r.jpg', '2017-07-25 16:30:39', '2017-08-06 15:49:28'),
(8, 'Kuchunguza Ute wa Ukeni', 'FEMALE', 2, 'Ni njia mojawapo ya uzazi wa mpango ambayo mwanamke anachunguza mabadiliko ya ute ndani ya uke wake kwa kutumia vidole.\r\n\r\nKipindi cha ute mzito unaoteleza ni wakati wa rutuba ya kupevuka yai, hivyo mume na mke/mwenzi wanaweza kuzuia ujauzito kwa kuepuka kujamiiana kwa siku mbili. Baada ya hapo wanaweza kuendelea kujamiiana bila kinga katika siku za ukavu.', 'contraceptives/August2017/OJKsRsy3B7SipskEkSwX.PNG', '2017-07-25 16:32:47', '2017-08-05 18:02:01'),
(9, 'Kuahirisha Kujamiiana', 'BOTH', 2, 'Kuacha/kuahirisha kujamiiana (Kugunga) ni njia ya uzazi wa mpango ambayo kijana, mke na mume/mwenzi mnaamua kuacha kabisa au kuahirisha kujamiana. \r\n\r\nWenzi na hasa vijana mnaweza kuzuia mimba iwapo hamtajamiana kabisa. \r\n\r\nKuahirisha kuanza kwa kiasi kikubwa huchangia kupunguza uambukizo utukanao na kujamiiana, virusi vya UKIMWI na mimba katika umri mdogo.\r\n\r\nKumbuka: Njia hizi za asili zina ufanisi mdogo katika kuzuia mimba.', 'contraceptives/August2017/T7Gk6Ysj09tB6Iz9o6J1.jpg', '2017-07-25 17:20:43', '2017-08-06 15:58:34'),
(10, 'Kufunga Kizazi kwa Mwanamke', 'BOTH', 4, 'Ni njia ya kudumu ya uzazi wa mpango inayofanywa na mtaalamu wa afya kwa kufunga na kukata mirija ya kizazi cha mwanamke ambapo dawa ya ganzi hutumika. \r\n\r\nNjia hii hufanywa kwa hiari na mume na mke/mwenzi walioridhika na idadi ya watoto walionao.\r\n\r\nUfungaji huu hufanywa kwa muda mfupi tu, pia mteja hahitaji kulazwa hospitalini.\r\n\r\nKufunga kizazi kwa mwanamke hakuathiri hamu ya kujamiiana na mwanamke ataendelea kupata siku za hedhi kama kawaida.', 'contraceptives/August2017/2aesj3DEqOiXMxD8BdTI.png', '2017-08-04 13:07:39', '2017-08-05 18:16:58'),
(11, 'Kufunga Kizazi kwa Mwanaume', 'BOTH', 4, 'Ni njia ya kudumu ya uzazi wa mpango inayofanywa na mtaalamu wa afya kwa kufunga na kukata mirija ya kizazi cha mwanaume ambapo dawa ya ganzi hutumika. \r\n\r\nNjia hii hufanywa kwa hiari na mume na mke/mwenzi walioridhika na idadi ya watoto walionao.\r\n\r\nUfungaji huu hufanywa kwa muda mfupi tu, pia mteja hahitaji kulazwa hospitalini.\r\n\r\nKufunga kizazi kwa mwanaume hakuathiri hamu ya kujamiiana wala uwezo (nguvu za kiume).', 'contraceptives/August2017/ArbsSv11ZtjbLfKt5l9V.png', '2017-08-04 13:08:08', '2017-08-05 18:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
(3, 1, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
(5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 5),
(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '\n{\n    "resize": {\n        "width": "1000",\n        "height": "null"\n    },\n    "quality": "70%",\n    "upsize": true,\n    "thumbnails": [\n        {\n            "name": "medium",\n            "scale": "50%"\n        },\n        {\n            "name": "small",\n            "scale": "25%"\n        },\n        {\n            "name": "cropped",\n            "crop": {\n                "width": "300",\n                "height": "250"\n            }\n        }\n    ]\n}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '\n{\n    "slugify": {\n        "origin": "title",\n        "forceUpdate": true\n    }\n}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '', 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '\n{\n    "default": "DRAFT",\n    "options": {\n        "PUBLISHED": "published",\n        "DRAFT": "draft",\n        "PENDING": "pending"\n    }\n}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"}}', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '', 3),
(29, 3, 'password', 'password', 'password', 1, 0, 0, 1, 1, 0, '', 4),
(30, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '', 5),
(31, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 6),
(32, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(33, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '', 8),
(34, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(35, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(36, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(37, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(38, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(39, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
(40, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
(41, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 4),
(42, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '', 5),
(43, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, '', 6),
(44, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(45, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(46, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(47, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(48, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(49, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(50, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, '', 14),
(51, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, '', 15),
(52, 3, 'role_id', 'text', 'role_id', 1, 1, 1, 1, 1, 1, '', 9),
(53, 7, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(54, 7, 'right', 'text', 'Right', 1, 1, 1, 1, 1, 1, NULL, 2),
(56, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(57, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(58, 8, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(59, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(60, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(61, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(62, 9, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(63, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(64, 9, 'region_id', 'select_dropdown', 'Region', 0, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 3),
(65, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(66, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(67, 11, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(68, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(70, 11, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, NULL, 3),
(71, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(72, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(73, 12, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(74, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(75, 12, 'type_center_id', 'select_dropdown', 'Category', 1, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 3),
(76, 12, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, NULL, 4),
(77, 12, 'district_id', 'select_dropdown', 'District', 1, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 5),
(78, 12, 'latitude', 'text', 'Latitude', 0, 0, 1, 1, 1, 1, NULL, 6),
(79, 12, 'longitude', 'text', 'Longitude', 0, 0, 1, 1, 1, 1, NULL, 7),
(80, 12, 'address', 'text', 'Address', 0, 0, 1, 1, 1, 1, NULL, 8),
(81, 12, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, NULL, 9),
(82, 12, 'owner_id', 'select_dropdown', 'Owner', 0, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 10),
(83, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 11),
(84, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 12),
(85, 13, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(86, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(87, 13, 'address', 'text', 'Address', 0, 0, 1, 1, 1, 1, NULL, 4),
(88, 13, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, NULL, 5),
(89, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(90, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(91, 13, 'category', 'select_dropdown', 'Category', 1, 1, 1, 1, 1, 1, '{"default":"GOVERNMENT","options":{"GOVERNMENT":"Government","PRIVATE":"Private","NGO":"NGO"}}', 3),
(92, 14, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(93, 14, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(95, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(96, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(97, 15, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(98, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(99, 15, 'gender', 'select_dropdown', 'Gender', 1, 1, 1, 1, 1, 1, '{"default":"BOTH","options":{"MALE":"Male","FEMALE":"Female","BOTH":"Both"}}', 4),
(101, 15, 'type_contraceptive_id', 'select_dropdown', 'Category', 0, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 3),
(102, 15, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, NULL, 5),
(103, 15, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 6),
(104, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 7),
(105, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(112, 17, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(113, 17, 'effect', 'text', 'Effect', 1, 1, 1, 1, 1, 1, NULL, 2),
(114, 17, 'contraceptive_id', 'select_dropdown', 'Contraceptive Id', 1, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 3),
(115, 17, 'gender', 'select_dropdown', 'Gender', 1, 1, 1, 1, 1, 1, '{"default":"BOTH","options":{"MALE":"Male","FEMALE":"Female","BOTH":"Both"}}', 4),
(116, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(117, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(118, 18, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(119, 18, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(120, 18, 'description', 'select_dropdown', 'Description', 0, 0, 1, 1, 1, 1, NULL, 3),
(121, 18, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(122, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(123, 19, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(124, 19, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(125, 19, 'type_disease_id', 'select_dropdown', 'Type Disease Id', 1, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 3),
(126, 19, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, NULL, 5),
(127, 19, 'image', 'text', 'Image', 0, 1, 1, 1, 1, 1, NULL, 6),
(128, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 7),
(129, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(130, 19, 'gender', 'select_dropdown', 'Gender', 0, 1, 1, 1, 1, 1, '{"default":"BOTH","options":{"MALE":"Male","FEMALE":"Female","BOTH":"Both"}}', 4),
(131, 20, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(132, 20, 'symptom', 'text', 'Symptom', 1, 1, 1, 1, 1, 1, NULL, 2),
(133, 20, 'gender', 'select_dropdown', 'Gender', 0, 1, 1, 1, 1, 1, '{"default":"BOTH","options":{"MALE":"Male","FEMALE":"Female","BOTH":"Both"}}', 4),
(134, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(135, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(136, 20, 'disease_id', 'select_dropdown', 'Disease Id', 1, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 3),
(137, 7, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, NULL, 5),
(138, 21, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(139, 21, 'advantage', 'text', 'Advantage', 0, 1, 1, 1, 1, 1, NULL, 2),
(140, 21, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(141, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(146, 22, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(147, 22, 'contraceptive_id', 'select_dropdown', 'Contraceptive', 1, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 2),
(148, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(149, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(150, 22, 'use', 'rich_text_box', 'Use', 0, 1, 1, 1, 1, 1, NULL, 3),
(151, 23, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(152, 23, 'contraceptive_id', 'select_dropdown', 'Contraceptive', 1, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 2),
(153, 23, 'importance', 'rich_text_box', 'Importance', 1, 1, 1, 1, 1, 1, NULL, 3),
(154, 23, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(155, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(156, 24, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(157, 24, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(158, 24, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, NULL, 3),
(159, 24, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(160, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(161, 25, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(162, 25, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(163, 25, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, NULL, 4),
(164, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(165, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(166, 26, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(167, 26, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, NULL, 2),
(168, 26, 'description', 'text', 'Description', 0, 0, 1, 1, 1, 1, NULL, 3),
(169, 26, 'url', 'text', 'URL', 0, 0, 1, 1, 1, 1, NULL, 4),
(170, 26, 'provider_id', 'select_dropdown', 'Provider', 0, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"name"}}', 5),
(171, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(172, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(173, 24, 'more_details', 'rich_text_box', 'More Details', 0, 0, 1, 1, 1, 1, NULL, 4),
(174, 25, 'logo', 'image', 'Logo', 0, 1, 1, 1, 1, 1, NULL, 3),
(175, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, NULL, 6),
(176, 27, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(177, 27, 'category', 'text', 'Category', 1, 1, 1, 1, 1, 1, NULL, 2),
(178, 27, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, NULL, 4),
(179, 27, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(180, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(181, 27, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, NULL, 3),
(182, 31, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(183, 31, 'effect', 'text', 'Effect', 0, 1, 1, 1, 1, 1, NULL, 2),
(184, 31, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, NULL, 3),
(185, 31, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, NULL, 4),
(186, 31, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(187, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(188, 32, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(189, 32, 'centre_id', 'text', 'Centre', 1, 1, 1, 1, 1, 1, NULL, 2),
(190, 32, 'service', 'text', 'Service', 0, 1, 1, 1, 1, 1, NULL, 3),
(191, 32, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(192, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(193, 33, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(194, 33, 'centre_id', 'text', 'Centre', 1, 1, 1, 1, 1, 1, NULL, 2),
(195, 33, 'days_type', 'text', 'Days Type', 0, 1, 1, 1, 1, 1, NULL, 3),
(196, 33, 'service_time', 'text', 'Service Time', 0, 1, 1, 1, 1, 1, NULL, 4),
(197, 33, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(198, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(199, 34, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(200, 34, 'centre_id', 'text', 'Centre', 1, 1, 1, 1, 1, 1, NULL, 2),
(201, 34, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, NULL, 3),
(202, 34, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(203, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(204, 35, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(205, 35, 'feedback', 'text_area', 'Feedback', 0, 1, 1, 1, 1, 1, NULL, 2),
(206, 35, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(207, 35, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(208, 35, 'facebook_id', 'text', 'Facebook ID', 0, 1, 1, 1, 1, 1, NULL, 3),
(209, 36, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(210, 36, 'question', 'text', 'Question', 1, 1, 1, 1, 1, 1, NULL, 2),
(211, 36, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(212, 36, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(213, 37, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(214, 37, 'question_id', 'select_dropdown', 'Question', 0, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"question"}}', 2),
(215, 37, 'answer', 'text', 'Answer', 0, 1, 1, 1, 1, 1, NULL, 3),
(216, 37, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(217, 37, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(218, 37, 'correct', 'select_dropdown', 'Correct Answer?', 0, 1, 1, 1, 1, 1, '{"default":"No","options":{"0":"No","1":"Yes"}}', 4),
(219, 25, 'url', 'text', 'Website', 0, 1, 1, 1, 1, 1, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', '', '', 1, 0, '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', '', '', 1, 0, '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', '', '', 1, 0, '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', '', '', 1, 0, '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', '', '', 1, 0, '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', '', '', 1, 0, '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(7, 'srh_rights', 'rights', 'Right', 'Rights', 'voyager-milestone', 'App\\SrhRight', NULL, 'SRH Rights BREAD', 1, 1, '2017-06-27 18:22:34', '2017-06-27 18:36:07'),
(8, 'regions', 'regions', 'Region', 'Regions', 'voyager-location', 'App\\Region', NULL, 'Tanzania''s regions', 1, 1, '2017-06-27 18:44:54', '2017-06-27 18:44:54'),
(9, 'districts', 'districts', 'District', 'Districts', 'voyager-location', 'App\\District', NULL, NULL, 1, 1, '2017-06-27 18:47:05', '2017-06-27 18:47:05'),
(14, 'type_contraceptives', 'contraceptive-categories', 'Contraceptive Category', 'Contraceptive Categories', 'voyager-activity', 'App\\TypeContraceptive', NULL, NULL, 1, 1, '2017-06-28 23:32:34', '2017-06-28 23:32:34'),
(15, 'contraceptives', 'contraceptives', 'Contraceptive', 'Contraceptives', 'voyager-activity', 'App\\Contraceptive', NULL, NULL, 1, 1, '2017-06-28 23:39:07', '2017-06-28 23:39:07'),
(17, 'effect_contraceptives', 'contraceptive-effects', 'Contraceptive Effect', 'Contraceptive Effects', 'voyager-activity', 'App\\EffectContraceptive', NULL, NULL, 1, 1, '2017-06-28 23:48:46', '2017-06-28 23:48:46'),
(18, 'type_diseases', 'disease-categories', 'Disease Category', 'Disease Categories', 'voyager-bomb', 'App\\TypeDisease', NULL, NULL, 1, 1, '2017-06-28 23:51:21', '2017-06-28 23:51:21'),
(19, 'diseases', 'diseases', 'Disease', 'Diseases', 'voyager-bomb', 'App\\Disease', NULL, NULL, 1, 1, '2017-06-28 23:55:08', '2017-06-28 23:55:08'),
(20, 'symptom_diseases', 'symptom-diseases', 'Disease Symptom', 'Disease Symptoms', 'voyager-bomb', 'App\\SymptomDisease', NULL, NULL, 1, 1, '2017-06-28 23:59:35', '2017-06-28 23:59:35'),
(22, 'use_contraceptives', 'contraceptive-uses', 'Use Contraceptive', 'Use Contraceptives', NULL, 'App\\UseContraceptive', NULL, NULL, 1, 1, '2017-07-02 17:37:07', '2017-07-02 17:37:38'),
(23, 'importance_contraceptives', 'importance-contraceptives', 'Contraceptive Importance', 'Contraceptives Importance', 'voyager-ticket', 'App\\ImportanceContraceptive', NULL, NULL, 1, 1, '2017-07-08 09:26:02', '2017-07-08 09:26:02'),
(24, 'terminologies', 'terminologies', 'Terminology', 'Terminologies', 'voyager-lightbulb', 'App\\Terminology', NULL, NULL, 1, 1, '2017-07-11 23:39:37', '2017-07-11 23:39:37'),
(25, 'partners', 'partners', 'Partner', 'Partners', 'voyager-people', 'App\\Partner', NULL, NULL, 1, 1, '2017-07-19 17:31:41', '2017-07-19 17:31:41'),
(26, 'services', 'services', 'Service', 'Services', 'voyager-people', 'App\\Service', NULL, NULL, 1, 1, '2017-07-19 17:34:37', '2017-07-19 17:34:37'),
(27, 'family_planning_importances', 'family-planning-importances', 'Family Planning Importance', 'Family Planning Importances', 'voyager-group', 'App\\FamilyPlanningImportance', NULL, NULL, 1, 1, '2017-07-30 13:07:54', '2017-07-30 13:07:54'),
(31, 'effects_teenage_pregnancies', 'effects-teenage-pregnancies', 'Effects Teenage Pregnancy', 'Effects Teenage Pregnancies', 'voyager-barbeque', 'App\\EffectsTeenagePregnancy', NULL, NULL, 1, 0, '2017-08-03 14:41:00', '2017-08-03 14:41:00'),
(32, 'centre_services', 'centre-services', 'Centre Service', 'Centre Services', NULL, 'App\\CentreService', NULL, NULL, 1, 1, '2017-08-08 02:50:56', '2017-08-08 02:50:56'),
(33, 'working_hours', 'working-hours', 'Working Hour', 'Working Hours', NULL, 'App\\WorkingHour', NULL, NULL, 1, 1, '2017-08-08 02:55:11', '2017-08-08 02:55:11'),
(34, 'centres', 'centres', 'Centre', 'Centres', NULL, 'App\\Centre', NULL, NULL, 1, 1, '2017-08-08 03:14:55', '2017-08-08 03:14:55'),
(35, 'feedback', 'feedback', 'Feedback', 'Feedback', 'voyager-paper-plane', 'App\\Feedback', NULL, NULL, 1, 1, '2017-08-08 03:32:44', '2017-08-08 03:32:44'),
(36, 'questions', 'questions', 'Question', 'Questions', 'voyager-edit', 'App\\Question', NULL, NULL, 1, 1, '2017-08-08 03:43:54', '2017-08-08 03:43:54'),
(37, 'answers', 'answers', 'Answer', 'Answers', 'voyager-edit', 'App\\Answer', NULL, NULL, 1, 1, '2017-08-08 03:46:19', '2017-08-08 03:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE IF NOT EXISTS `diseases` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_disease_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `region_id`, `created_at`, `updated_at`) VALUES
(1, 'Mwanza Mjini', 1, '2017-06-27 19:33:13', '2017-06-27 19:33:13'),
(2, 'Ubungo', 2, '2017-07-02 15:03:30', '2017-07-02 15:03:30'),
(3, 'Kigamboni', 2, '2017-07-02 15:03:51', '2017-07-02 15:03:51'),
(4, 'Ilala', 2, '2017-07-02 15:04:06', '2017-07-02 15:04:06'),
(5, 'Temeke', 2, '2017-07-02 15:04:21', '2017-07-02 15:04:27'),
(6, 'Kinondoni', 2, '2017-07-02 15:04:51', '2017-07-02 15:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `effects_teenage_pregnancies`
--

CREATE TABLE IF NOT EXISTS `effects_teenage_pregnancies` (
  `id` int(10) unsigned NOT NULL,
  `effect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `effects_teenage_pregnancies`
--

INSERT INTO `effects_teenage_pregnancies` (`id`, `effect`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Wakati wa Ujauzito', 'i.	Kuharibika kwa mimba\r\n\r\nii.	Kupatwa na uchungu wa mapema na kujifungua kabla ya wakati wake \r\n\r\niii.   Kupatwa na kifafa cha mimba (pre eclampsia)\r\n\r\niv.	Upungufu wa dama hasa katika miezi ya mwisho ya ujauzito kutokana na lishe duni\r\n\r\nv.	Kuongezeka uwezekano wa maambukizi ya virusi vya ukimwi toka kwa mama kwenda kwa mtoto.', 'effects-teenage-pregnancies/August2017/vN4fIsvjCuc85ZwbdZvL.jpg', '2017-08-03 14:51:51', '2017-08-06 16:22:53'),
(2, 'Wakati wa Uchungu au Muda wa Kujifungua', 'i.	Kushindwa kujifungua kwa njia ya kawaida hasa kwa wale wa umri chini ya miaka 16\r\n\r\nii.	Kuchanika vibaya viungo vya uzazi wakati wa kujifungua\r\n\r\niii.	Uchungu wa muda mrefu\r\n\r\niv.	Kifo', 'effects-teenage-pregnancies/August2017/ZA7AnkNwJet6d0AP7XIQ.jpg', '2017-08-03 14:53:08', '2017-08-06 16:22:24'),
(3, 'Baada ya Kujifungua', 'i.	Kutokwa damu kwa wingi ambako husababisha upungufu wa damu.\r\n\r\nii.	Matatizo ya lishe duni wakati wa mimba huweza kuendelea hata baada ya kujifungua.\r\n\r\niii.	Kutoweza kunyonyesha vizuri.\r\n\r\niv.	Sonona baada ya kujifungua na matatizo mengine ya afya ya akili.\r\n\r\nv.	Hatari kwa mtoto kuzaliwa na uzito chini ya gramu 2500.\r\n\r\nvi.	Kuzaliwa kabla ya muda (njiti).', 'effects-teenage-pregnancies/August2017/VdZOgOTB4YgMbvOkEnss.jpg', '2017-08-03 14:53:29', '2017-08-06 16:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `effect_contraceptives`
--

CREATE TABLE IF NOT EXISTS `effect_contraceptives` (
  `id` int(10) unsigned NOT NULL,
  `effect` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contraceptive_id` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `family_planning_importances`
--

CREATE TABLE IF NOT EXISTS `family_planning_importances` (
  `id` int(10) unsigned NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `family_planning_importances`
--

INSERT INTO `family_planning_importances` (`id`, `category`, `description`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Umuhimu wa Uzazi wa Mpango KWA MAMA', 'Atapona vizuri baada ya kujifungua hivyo atakuwa na afya njema pasipokuwa na hofu ya kupata mimba.\r\n\r\nAtawahudumia vizuri watoto pamoja na familia.\r\n\r\nAtapata muda wa kufanya shughuli za kujiingizia kipato na chakula.\r\n\r\nAtafurahia tendo la kujamiiana katika hali ya utulivu.\r\n\r\nAtapata muda wa kushiriki shughuli za maendeleo.', '2017-07-30 13:16:28', '2017-08-05 17:30:16', 'family-planning-importances/August2017/PRmA5OrdRCmVjhDO5l1k.jpg'),
(2, 'Umuhimu wa Uzazi wa Mpango KWA BABA', 'Atafanya kazi kwa amani\r\n\r\nAtakuwa na uhakika wa kipato na vitu vya kurithisha watoto wake.\r\n\r\nAtakuwa na uwezo wa kuwapatia watoto mahitaji ya lazima kama shule, chakula, nyumba, mavazi na huduma za matibabu.\r\n\r\nAtaweza kushiriki kwenye shughuli za kijamii\r\n\r\nAtajiwekea akiba', '2017-07-30 13:18:14', '2017-08-05 17:25:38', 'family-planning-importances/August2017/xT2uAspq6m2e0LyLU3Je.jpg'),
(3, 'Umuhimu wa Uzazi wa Mpango KWA MTOTO', 'Atapata muda mrefu wa kunyonya na hivyo kutopata utapiamlo na magonjwa, na mtoto hukua vizuri na afya njema.\r\n\r\nAtapata upendo mkubwa kutoka kwa wazazi na familia.\r\n\r\nAtapata huduma zote muhimu kama mavazi, shule, huduma za matibabu na kuwekewa mipango mizuri ya baadaye.', '2017-07-30 13:19:31', '2017-08-05 17:31:39', 'family-planning-importances/August2017/s447Y5pTBNOJAEHqhxQP.jpg'),
(4, 'Umuhimu wa Uzazi wa Mpango KWA JAMII au TAIFA', 'Kuboreshwa kwa huduma za shule kwa kuweko kwa idadi ndogo ya wanafunzi katika darasa.\r\n\r\nKutokuwepo msongamano katika kliniki.\r\n\r\nHuduma za kijamii zitaboreshwa.\r\n\r\nRaslimali zitaendana na idadi ya watu.\r\n\r\nKupungua kwa watoto yatima.', '2017-07-30 13:20:41', '2017-08-05 17:33:03', 'family-planning-importances/August2017/xs26otFwIeROkiWDM6hg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(10) unsigned NOT NULL,
  `feedback` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `importance_contraceptives`
--

CREATE TABLE IF NOT EXISTS `importance_contraceptives` (
  `id` int(10) unsigned NOT NULL,
  `contraceptive_id` int(11) NOT NULL,
  `importance` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(2, 'SRH Expert', '2017-07-02 14:18:05', '2017-07-02 14:18:05');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '/admin', '_self', 'voyager-boat', NULL, NULL, 1, '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL, NULL),
(2, 1, 'Media', '/admin/media', '_self', 'voyager-images', NULL, NULL, 14, '2017-06-25 23:15:41', '2017-08-08 03:53:50', NULL, NULL),
(4, 1, 'Users', '/admin/users', '_self', 'voyager-person', NULL, NULL, 13, '2017-06-25 23:15:41', '2017-08-08 03:53:50', NULL, NULL),
(5, 1, 'Categories', '/admin/categories', '_self', 'voyager-categories', NULL, NULL, 16, '2017-06-25 23:15:41', '2017-08-08 03:53:44', NULL, NULL),
(6, 1, 'Pages', '/admin/pages', '_self', 'voyager-file-text', NULL, NULL, 15, '2017-06-25 23:15:41', '2017-08-08 03:53:50', NULL, NULL),
(7, 1, 'Roles', '/admin/roles', '_self', 'voyager-lock', NULL, NULL, 12, '2017-06-25 23:15:41', '2017-08-08 03:53:50', NULL, NULL),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 17, '2017-06-25 23:15:41', '2017-08-08 03:53:44', NULL, NULL),
(9, 1, 'Menu Builder', '/admin/menus', '_self', 'voyager-list', NULL, 8, 1, '2017-06-25 23:15:41', '2017-06-27 13:44:18', NULL, NULL),
(10, 1, 'Database', '/admin/database', '_self', 'voyager-data', NULL, 8, 2, '2017-06-25 23:15:41', '2017-06-27 13:44:18', NULL, NULL),
(11, 1, 'Settings', '/admin/settings', '_self', 'voyager-settings', NULL, NULL, 18, '2017-06-25 23:15:41', '2017-08-08 03:53:44', NULL, NULL),
(12, 1, 'Rights', '/admin/rights', '_self', 'voyager-milestone', '#000000', NULL, 2, '2017-06-27 18:26:27', '2017-07-02 14:19:45', NULL, ''),
(14, 1, 'Locations', '/admin/regions', '_self', 'voyager-location', '#000000', NULL, 8, '2017-06-27 18:48:55', '2017-08-08 03:16:44', NULL, ''),
(15, 1, 'Regions', '/admin/regions', '_self', NULL, '#000000', 14, 1, '2017-06-27 18:49:21', '2017-07-02 14:20:33', NULL, ''),
(16, 1, 'Districts', '/admin/districts', '_self', NULL, '#000000', 14, 2, '2017-06-27 18:49:55', '2017-06-27 18:50:40', NULL, ''),
(18, 1, 'Centers', '/admin/centres', '_self', 'voyager-home', '#000000', NULL, 6, '2017-06-27 20:17:13', '2017-08-08 03:16:57', NULL, ''),
(22, 1, 'Contraceptives', '/admin/contraceptives', '_self', 'voyager-activity', '#000000', NULL, 3, '2017-07-02 15:06:58', '2017-07-02 15:09:51', NULL, ''),
(23, 1, 'Categories', '/admin/contraceptive-categories', '_self', NULL, '#000000', 22, 5, '2017-07-02 15:07:49', '2017-07-08 09:48:09', NULL, ''),
(24, 1, 'Contraceptives', '/admin/contraceptives', '_self', NULL, '#000000', 22, 1, '2017-07-02 15:08:25', '2017-07-02 15:08:32', NULL, ''),
(25, 1, 'Uses', '/admin/contraceptive-uses', '_self', NULL, '#000000', 22, 2, '2017-07-02 15:11:21', '2017-07-02 15:12:17', NULL, ''),
(26, 1, 'Side Effects', '/admin/contraceptive-effects', '_self', NULL, '#000000', 22, 4, '2017-07-02 15:11:58', '2017-07-08 09:48:09', NULL, ''),
(27, 1, 'Family Planning', '/admin/family-planning-importances', '_self', 'voyager-group', '#000000', NULL, 4, '2017-07-02 16:48:49', '2017-07-30 13:09:57', NULL, ''),
(28, 1, 'Importance', '/admin/family-planning-importances', '_self', NULL, '#000000', 27, 1, '2017-07-02 16:49:14', '2017-07-30 13:10:19', NULL, ''),
(29, 1, 'Importance', '/admin/importance-contraceptives', '_self', NULL, '#000000', 22, 3, '2017-07-08 09:46:42', '2017-07-08 09:48:09', NULL, ''),
(30, 1, 'Terminologies', '/admin/terminologies', '_self', 'voyager-lightbulb', '#000000', NULL, 7, '2017-07-11 23:43:20', '2017-08-03 14:43:54', NULL, ''),
(31, 1, 'Partners', '/admin/partners', '_self', 'voyager-people', '#000000', NULL, 9, '2017-07-20 13:46:29', '2017-08-08 03:16:44', NULL, ''),
(32, 1, 'Partners', '/admin/partners', '_self', NULL, '#000000', 31, 1, '2017-07-20 13:46:48', '2017-07-20 13:49:48', NULL, ''),
(33, 1, 'Services', '/admin/services', '_self', NULL, '#000000', 31, 2, '2017-07-20 13:47:23', '2017-07-20 13:49:19', NULL, ''),
(34, 1, 'Effects of teenage Pregnancies', '/admin/effects-teenage-pregnancies', '_self', 'voyager-barbeque', '#000000', NULL, 5, '2017-08-03 14:43:15', '2017-08-03 14:43:54', NULL, ''),
(35, 1, 'Services', '/admin/centre-services', '_self', NULL, '#000000', 18, 2, '2017-08-08 02:51:42', '2017-08-08 03:16:44', NULL, ''),
(36, 1, 'Working Hours', '/admin/working-hours', '_self', NULL, '#000000', 18, 3, '2017-08-08 02:52:07', '2017-08-08 03:16:44', NULL, ''),
(37, 1, 'Centers', '/admin/centres', '_self', NULL, '#000000', 18, 1, '2017-08-08 03:15:48', '2017-08-08 03:16:44', NULL, ''),
(38, 1, 'Feedbacks', '/admin/feedbacks', '_self', 'voyager-paper-plane', '#000000', NULL, 11, '2017-08-08 03:35:45', '2017-08-08 03:53:50', NULL, ''),
(39, 1, 'Questions & Answers', '/admin/questions', '_self', 'voyager-receipt', '#000000', NULL, 10, '2017-08-08 03:51:38', '2017-08-08 03:53:50', NULL, ''),
(40, 1, 'Questions', '/admin/questions', '_self', NULL, '#000000', 39, 1, '2017-08-08 03:53:11', '2017-08-08 03:53:36', NULL, ''),
(41, 1, 'Answers', '/admin/answers', '_self', NULL, '#000000', 39, 2, '2017-08-08 03:53:30', '2017-08-08 03:53:40', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(17, '2017_01_15_000000_create_permission_groups_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(21, '2017_06_26_052543_create_jobs_table', 2),
(22, '2017_06_26_052801_create_failed_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `description`, `created_at`, `updated_at`, `logo`, `url`) VALUES
(1, 'Harakati za Lucy', 'Harakati ya Lucy ni mfululizo wa uhuishaji wa wavuti wa 3D na kitabu cha comic ambao lengo lake kuu ni kukuza usawa wa kijinsia na kuongeza uelewa wa wajibu wa jamii kuwekeza katika vijana na ikijikita katika kuwajali zaidi vijana balehe wa kike katika shule zisizo na ufanisi wa kutosha juu ya masuala ya Afya ya Uzazi na Ujinsia.', '2017-07-20 21:40:32', '2017-08-08 19:05:32', 'partners/July2017/TEsru1rlfLMn3J0sEG2r.JPG', 'https://web.facebook.com/Harakati-za-Lucy-738973432957689/'),
(3, 'Maisha Package', 'MaishaPackage ni bidhaa inayokuja na kitita cha elimu ya Afya ya Uzazi na Ujinsia pamoja na vifaa maalumu vya hedhi salama.\r\n\r\nLengo letu moja ni kutoa taarifa sahihi na katika mazingira rafiki ili kupunguza tatizo la mimba za utotoni... #Be inspired, Be cool, Be clean...', '2017-07-20 21:41:26', '2017-08-08 19:03:19', 'partners/July2017/QHBASREulbagRcB8V0Sh.jpg', 'https://web.facebook.com/MaishaPackageTz/');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(2, 'browse_database', NULL, '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(3, 'browse_media', NULL, '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(4, 'browse_settings', NULL, '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(5, 'browse_menus', 'menus', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(6, 'read_menus', 'menus', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(7, 'edit_menus', 'menus', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(8, 'add_menus', 'menus', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(9, 'delete_menus', 'menus', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(10, 'browse_pages', 'pages', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(11, 'read_pages', 'pages', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(12, 'edit_pages', 'pages', '2017-06-25 23:15:41', '2017-06-25 23:15:41', NULL),
(13, 'add_pages', 'pages', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(14, 'delete_pages', 'pages', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(15, 'browse_roles', 'roles', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(16, 'read_roles', 'roles', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(17, 'edit_roles', 'roles', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(18, 'add_roles', 'roles', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(19, 'delete_roles', 'roles', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(20, 'browse_users', 'users', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(21, 'read_users', 'users', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(22, 'edit_users', 'users', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(23, 'add_users', 'users', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(24, 'delete_users', 'users', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(25, 'browse_posts', 'posts', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(26, 'read_posts', 'posts', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(27, 'edit_posts', 'posts', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(28, 'add_posts', 'posts', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(29, 'delete_posts', 'posts', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(30, 'browse_categories', 'categories', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(31, 'read_categories', 'categories', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(32, 'edit_categories', 'categories', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(33, 'add_categories', 'categories', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(34, 'delete_categories', 'categories', '2017-06-25 23:15:42', '2017-06-25 23:15:42', NULL),
(35, 'browse_srh_rights', 'srh_rights', '2017-06-27 18:22:34', '2017-06-27 18:22:34', NULL),
(36, 'read_srh_rights', 'srh_rights', '2017-06-27 18:22:34', '2017-06-27 18:22:34', NULL),
(37, 'edit_srh_rights', 'srh_rights', '2017-06-27 18:22:34', '2017-06-27 18:22:34', NULL),
(38, 'add_srh_rights', 'srh_rights', '2017-06-27 18:22:34', '2017-06-27 18:22:34', NULL),
(39, 'delete_srh_rights', 'srh_rights', '2017-06-27 18:22:34', '2017-06-27 18:22:34', NULL),
(40, 'browse_regions', 'regions', '2017-06-27 18:44:55', '2017-06-27 18:44:55', NULL),
(41, 'read_regions', 'regions', '2017-06-27 18:44:55', '2017-06-27 18:44:55', NULL),
(42, 'edit_regions', 'regions', '2017-06-27 18:44:55', '2017-06-27 18:44:55', NULL),
(43, 'add_regions', 'regions', '2017-06-27 18:44:55', '2017-06-27 18:44:55', NULL),
(44, 'delete_regions', 'regions', '2017-06-27 18:44:55', '2017-06-27 18:44:55', NULL),
(45, 'browse_districts', 'districts', '2017-06-27 18:47:06', '2017-06-27 18:47:06', NULL),
(46, 'read_districts', 'districts', '2017-06-27 18:47:06', '2017-06-27 18:47:06', NULL),
(47, 'edit_districts', 'districts', '2017-06-27 18:47:06', '2017-06-27 18:47:06', NULL),
(48, 'add_districts', 'districts', '2017-06-27 18:47:06', '2017-06-27 18:47:06', NULL),
(49, 'delete_districts', 'districts', '2017-06-27 18:47:06', '2017-06-27 18:47:06', NULL),
(65, 'browse_type_contraceptives', 'type_contraceptives', '2017-06-28 23:32:34', '2017-06-28 23:32:34', NULL),
(66, 'read_type_contraceptives', 'type_contraceptives', '2017-06-28 23:32:34', '2017-06-28 23:32:34', NULL),
(67, 'edit_type_contraceptives', 'type_contraceptives', '2017-06-28 23:32:34', '2017-06-28 23:32:34', NULL),
(68, 'add_type_contraceptives', 'type_contraceptives', '2017-06-28 23:32:34', '2017-06-28 23:32:34', NULL),
(69, 'delete_type_contraceptives', 'type_contraceptives', '2017-06-28 23:32:34', '2017-06-28 23:32:34', NULL),
(70, 'browse_contraceptives', 'contraceptives', '2017-06-28 23:39:07', '2017-06-28 23:39:07', NULL),
(71, 'read_contraceptives', 'contraceptives', '2017-06-28 23:39:07', '2017-06-28 23:39:07', NULL),
(72, 'edit_contraceptives', 'contraceptives', '2017-06-28 23:39:07', '2017-06-28 23:39:07', NULL),
(73, 'add_contraceptives', 'contraceptives', '2017-06-28 23:39:07', '2017-06-28 23:39:07', NULL),
(74, 'delete_contraceptives', 'contraceptives', '2017-06-28 23:39:07', '2017-06-28 23:39:07', NULL),
(80, 'browse_effect_contraceptives', 'effect_contraceptives', '2017-06-28 23:48:46', '2017-06-28 23:48:46', NULL),
(81, 'read_effect_contraceptives', 'effect_contraceptives', '2017-06-28 23:48:46', '2017-06-28 23:48:46', NULL),
(82, 'edit_effect_contraceptives', 'effect_contraceptives', '2017-06-28 23:48:46', '2017-06-28 23:48:46', NULL),
(83, 'add_effect_contraceptives', 'effect_contraceptives', '2017-06-28 23:48:46', '2017-06-28 23:48:46', NULL),
(84, 'delete_effect_contraceptives', 'effect_contraceptives', '2017-06-28 23:48:46', '2017-06-28 23:48:46', NULL),
(85, 'browse_type_diseases', 'type_diseases', '2017-06-28 23:51:21', '2017-06-28 23:51:21', NULL),
(86, 'read_type_diseases', 'type_diseases', '2017-06-28 23:51:21', '2017-06-28 23:51:21', NULL),
(87, 'edit_type_diseases', 'type_diseases', '2017-06-28 23:51:21', '2017-06-28 23:51:21', NULL),
(88, 'add_type_diseases', 'type_diseases', '2017-06-28 23:51:21', '2017-06-28 23:51:21', NULL),
(89, 'delete_type_diseases', 'type_diseases', '2017-06-28 23:51:21', '2017-06-28 23:51:21', NULL),
(90, 'browse_diseases', 'diseases', '2017-06-28 23:55:08', '2017-06-28 23:55:08', NULL),
(91, 'read_diseases', 'diseases', '2017-06-28 23:55:08', '2017-06-28 23:55:08', NULL),
(92, 'edit_diseases', 'diseases', '2017-06-28 23:55:08', '2017-06-28 23:55:08', NULL),
(93, 'add_diseases', 'diseases', '2017-06-28 23:55:08', '2017-06-28 23:55:08', NULL),
(94, 'delete_diseases', 'diseases', '2017-06-28 23:55:08', '2017-06-28 23:55:08', NULL),
(95, 'browse_symptom_diseases', 'symptom_diseases', '2017-06-28 23:59:35', '2017-06-28 23:59:35', NULL),
(96, 'read_symptom_diseases', 'symptom_diseases', '2017-06-28 23:59:35', '2017-06-28 23:59:35', NULL),
(97, 'edit_symptom_diseases', 'symptom_diseases', '2017-06-28 23:59:35', '2017-06-28 23:59:35', NULL),
(98, 'add_symptom_diseases', 'symptom_diseases', '2017-06-28 23:59:35', '2017-06-28 23:59:35', NULL),
(99, 'delete_symptom_diseases', 'symptom_diseases', '2017-06-28 23:59:35', '2017-06-28 23:59:35', NULL),
(105, 'browse_use_contraceptives', 'use_contraceptives', '2017-07-02 17:37:07', '2017-07-02 17:37:07', NULL),
(106, 'read_use_contraceptives', 'use_contraceptives', '2017-07-02 17:37:07', '2017-07-02 17:37:07', NULL),
(107, 'edit_use_contraceptives', 'use_contraceptives', '2017-07-02 17:37:07', '2017-07-02 17:37:07', NULL),
(108, 'add_use_contraceptives', 'use_contraceptives', '2017-07-02 17:37:07', '2017-07-02 17:37:07', NULL),
(109, 'delete_use_contraceptives', 'use_contraceptives', '2017-07-02 17:37:07', '2017-07-02 17:37:07', NULL),
(110, 'browse_importance_contraceptives', 'importance_contraceptives', '2017-07-08 09:26:02', '2017-07-08 09:26:02', NULL),
(111, 'read_importance_contraceptives', 'importance_contraceptives', '2017-07-08 09:26:02', '2017-07-08 09:26:02', NULL),
(112, 'edit_importance_contraceptives', 'importance_contraceptives', '2017-07-08 09:26:02', '2017-07-08 09:26:02', NULL),
(113, 'add_importance_contraceptives', 'importance_contraceptives', '2017-07-08 09:26:02', '2017-07-08 09:26:02', NULL),
(114, 'delete_importance_contraceptives', 'importance_contraceptives', '2017-07-08 09:26:02', '2017-07-08 09:26:02', NULL),
(115, 'browse_terminologies', 'terminologies', '2017-07-11 23:39:37', '2017-07-11 23:39:37', NULL),
(116, 'read_terminologies', 'terminologies', '2017-07-11 23:39:37', '2017-07-11 23:39:37', NULL),
(117, 'edit_terminologies', 'terminologies', '2017-07-11 23:39:37', '2017-07-11 23:39:37', NULL),
(118, 'add_terminologies', 'terminologies', '2017-07-11 23:39:37', '2017-07-11 23:39:37', NULL),
(119, 'delete_terminologies', 'terminologies', '2017-07-11 23:39:37', '2017-07-11 23:39:37', NULL),
(120, 'browse_partners', 'partners', '2017-07-19 17:31:41', '2017-07-19 17:31:41', NULL),
(121, 'read_partners', 'partners', '2017-07-19 17:31:41', '2017-07-19 17:31:41', NULL),
(122, 'edit_partners', 'partners', '2017-07-19 17:31:41', '2017-07-19 17:31:41', NULL),
(123, 'add_partners', 'partners', '2017-07-19 17:31:41', '2017-07-19 17:31:41', NULL),
(124, 'delete_partners', 'partners', '2017-07-19 17:31:41', '2017-07-19 17:31:41', NULL),
(125, 'browse_services', 'services', '2017-07-19 17:34:37', '2017-07-19 17:34:37', NULL),
(126, 'read_services', 'services', '2017-07-19 17:34:37', '2017-07-19 17:34:37', NULL),
(127, 'edit_services', 'services', '2017-07-19 17:34:37', '2017-07-19 17:34:37', NULL),
(128, 'add_services', 'services', '2017-07-19 17:34:37', '2017-07-19 17:34:37', NULL),
(129, 'delete_services', 'services', '2017-07-19 17:34:37', '2017-07-19 17:34:37', NULL),
(130, 'browse_family_planning_importances', 'family_planning_importances', '2017-07-30 13:07:54', '2017-07-30 13:07:54', NULL),
(131, 'read_family_planning_importances', 'family_planning_importances', '2017-07-30 13:07:54', '2017-07-30 13:07:54', NULL),
(132, 'edit_family_planning_importances', 'family_planning_importances', '2017-07-30 13:07:54', '2017-07-30 13:07:54', NULL),
(133, 'add_family_planning_importances', 'family_planning_importances', '2017-07-30 13:07:54', '2017-07-30 13:07:54', NULL),
(134, 'delete_family_planning_importances', 'family_planning_importances', '2017-07-30 13:07:54', '2017-07-30 13:07:54', NULL),
(135, 'browse_effects_teenage_pregnancies', 'effects_teenage_pregnancies', '2017-08-03 14:41:00', '2017-08-03 14:41:00', NULL),
(136, 'read_effects_teenage_pregnancies', 'effects_teenage_pregnancies', '2017-08-03 14:41:00', '2017-08-03 14:41:00', NULL),
(137, 'edit_effects_teenage_pregnancies', 'effects_teenage_pregnancies', '2017-08-03 14:41:00', '2017-08-03 14:41:00', NULL),
(138, 'add_effects_teenage_pregnancies', 'effects_teenage_pregnancies', '2017-08-03 14:41:00', '2017-08-03 14:41:00', NULL),
(139, 'delete_effects_teenage_pregnancies', 'effects_teenage_pregnancies', '2017-08-03 14:41:00', '2017-08-03 14:41:00', NULL),
(140, 'browse_centre_services', 'centre_services', '2017-08-08 02:50:56', '2017-08-08 02:50:56', NULL),
(141, 'read_centre_services', 'centre_services', '2017-08-08 02:50:56', '2017-08-08 02:50:56', NULL),
(142, 'edit_centre_services', 'centre_services', '2017-08-08 02:50:56', '2017-08-08 02:50:56', NULL),
(143, 'add_centre_services', 'centre_services', '2017-08-08 02:50:56', '2017-08-08 02:50:56', NULL),
(144, 'delete_centre_services', 'centre_services', '2017-08-08 02:50:56', '2017-08-08 02:50:56', NULL),
(145, 'browse_working_hours', 'working_hours', '2017-08-08 02:55:11', '2017-08-08 02:55:11', NULL),
(146, 'read_working_hours', 'working_hours', '2017-08-08 02:55:11', '2017-08-08 02:55:11', NULL),
(147, 'edit_working_hours', 'working_hours', '2017-08-08 02:55:11', '2017-08-08 02:55:11', NULL),
(148, 'add_working_hours', 'working_hours', '2017-08-08 02:55:11', '2017-08-08 02:55:11', NULL),
(149, 'delete_working_hours', 'working_hours', '2017-08-08 02:55:11', '2017-08-08 02:55:11', NULL),
(150, 'browse_centres', 'centres', '2017-08-08 03:14:56', '2017-08-08 03:14:56', NULL),
(151, 'read_centres', 'centres', '2017-08-08 03:14:56', '2017-08-08 03:14:56', NULL),
(152, 'edit_centres', 'centres', '2017-08-08 03:14:56', '2017-08-08 03:14:56', NULL),
(153, 'add_centres', 'centres', '2017-08-08 03:14:56', '2017-08-08 03:14:56', NULL),
(154, 'delete_centres', 'centres', '2017-08-08 03:14:56', '2017-08-08 03:14:56', NULL),
(155, 'browse_feedback', 'feedback', '2017-08-08 03:32:44', '2017-08-08 03:32:44', NULL),
(156, 'read_feedback', 'feedback', '2017-08-08 03:32:44', '2017-08-08 03:32:44', NULL),
(157, 'edit_feedback', 'feedback', '2017-08-08 03:32:44', '2017-08-08 03:32:44', NULL),
(158, 'add_feedback', 'feedback', '2017-08-08 03:32:44', '2017-08-08 03:32:44', NULL),
(159, 'delete_feedback', 'feedback', '2017-08-08 03:32:44', '2017-08-08 03:32:44', NULL),
(160, 'browse_questions', 'questions', '2017-08-08 03:43:54', '2017-08-08 03:43:54', NULL),
(161, 'read_questions', 'questions', '2017-08-08 03:43:54', '2017-08-08 03:43:54', NULL),
(162, 'edit_questions', 'questions', '2017-08-08 03:43:54', '2017-08-08 03:43:54', NULL),
(163, 'add_questions', 'questions', '2017-08-08 03:43:54', '2017-08-08 03:43:54', NULL),
(164, 'delete_questions', 'questions', '2017-08-08 03:43:54', '2017-08-08 03:43:54', NULL),
(165, 'browse_answers', 'answers', '2017-08-08 03:46:19', '2017-08-08 03:46:19', NULL),
(166, 'read_answers', 'answers', '2017-08-08 03:46:19', '2017-08-08 03:46:19', NULL),
(167, 'edit_answers', 'answers', '2017-08-08 03:46:19', '2017-08-08 03:46:19', NULL),
(168, 'add_answers', 'answers', '2017-08-08 03:46:19', '2017-08-08 03:46:19', NULL),
(169, 'delete_answers', 'answers', '2017-08-08 03:46:19', '2017-08-08 03:46:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) unsigned NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `created_at`, `updated_at`) VALUES
(1, 'Je, mwanamke anaweza kupata mimba akiwa kwenye hedhi?', '2017-08-08 03:58:01', '2017-08-08 03:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mwanza', '2017-06-27 18:52:11', '2017-06-27 18:52:11'),
(2, 'Dar es Salaam', '2017-07-02 15:03:08', '2017-07-02 15:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2017-06-25 23:15:41', '2017-06-25 23:15:41'),
(2, 'user', 'Normal User', '2017-06-25 23:15:41', '2017-06-25 23:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`) VALUES
(1, 'logo', 'Site Logo', 'settings/July2017/771vAnBEm65UXZ4JxQEc.png', NULL, 'image', 0),
(2, 'admin_title', 'Admin Title', 'eShangazi', NULL, 'text', 1),
(3, 'admin_description', 'Admin Description', 'Mfumo maarifa wa TEHAMA unaowezeshwa na wataalamu wa Afya ya Uzazi na Ujinsia kukupatia habari, elimu na ushauri kuhusu Afya ya Uzazi na Ujinsia kupitia Facebook Messenger.', NULL, 'text', 2),
(4, 'admin_icon_image', 'Admin Icon Image', 'settings/July2017/L82Pre7RtRCwB80LVnms.png', NULL, 'image', 3),
(5, 'admin_bg_image', 'Admin Background Image', 'settings/June2017/Q9YKqbnKDc3SQv3m05jD.jpg', NULL, 'image', 4);

-- --------------------------------------------------------

--
-- Table structure for table `srh_rights`
--

CREATE TABLE IF NOT EXISTS `srh_rights` (
  `id` int(10) unsigned NOT NULL,
  `right` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `srh_rights`
--

INSERT INTO `srh_rights` (`id`, `right`, `description`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Haki ya kuishi', 'Maisha ya mwanamke mjamzito hayapaswi kuwekwa hatarini kwa sababu za  zinazoweza kuzuilika; mfano mimba katika umri mdogo au mkubwa na uzazi wa mara kwa mara.\r\n\r\nMaisha ya mtoto yoyote yasiwekwe hatarini hasa kwa sababu yaa jinsi yake.\r\n\r\nMaisha ya mtu yoyote yasiwekwe hatarini kwa sababu ya kukosa huduma ya afya au taarifa zinazohusiana na afya ya uzazi na kujamiiana.\r\n\r\nMaisha ya watoto wachanga wa kike yasiwekwe hatarini kutokana na “female infanticide”.', '2017-07-01 00:33:07', '2017-08-05 15:59:45', 'rights/August2017/eDRzOX0tLF4Om1PFxDad.jpg'),
(2, 'Haki ya Uhuru na Usalama', 'Una haki ya kufurahia na kujiamulia mambo ya kimaisha yahusuyo uzazi na kujamiiana huku ukifahamu kuwa haki hiyo ni ya kila mtu.\r\n\r\nLakini pia, una haki ya kuamua kutumia huduma zote za kitabibu  zinazohusu afya ya uzazi na kujamiiana.\r\n\r\nUna haki ya kuwa huru na aina yoyote ya unyanyasaji wa kijinsia.\r\n\r\nKwa upande wa wanawake, wana haki ya kutolazimishwa yafuatayo: kushika ujauzito, kufanywa usiweze kupata watoto na kutoa mimba.\r\n\r\nNa hivyo, wanawake wote wana haki ya kuchagua huduma waitakayo ya afya ya uzazi.', '2017-07-01 00:34:16', '2017-08-05 15:55:13', 'rights/August2017/FmqEu7mtF1vvpsesZsDs.jpg'),
(3, 'Haki ya Usawa na Kuwa Huru na Aina Yoyote ya Ubaguzi', 'Hakuna binadamu atabaguliwa kupata huduma za afya kwa misingi ya rangi, taifa, umri, lugha, dini, hadhi yake ya ndoa, nafasi yake katika familia, itikadi au hadhi nyingine yoyote ile.', '2017-07-01 00:35:49', '2017-08-05 15:49:57', 'rights/August2017/XyDpIyhWKd7YNmUEM6SX.jpg'),
(4, 'Haki ya Faragha', 'Huduma zote za afya ya uzazi na ushauri nasaha zitatolewa kwa kuzingatia faragha na kusisitiza kuwa taarifa binafsi zilizotolewa zitaendelea kuwa za siri.\r\n\r\nWanawake wote wana haki ya kuchagua huduma waitakayo ya afya ya uzazi.\r\n\r\nBinadamu wote wana haki ya kueleza mahitaji/hisia zao ili kuwa na maisha ya furaha katika suala zima la unyumba bila ya kujali kushtakiwa au kukataliwa.\r\n\r\nHuduma zote za afya ya uzazi na kujamiiana zikiwemo taarifa na ushauri nasaha viwekwe wazi kwa watu wote hasa vijana katika hali inayojali na kuheshimu haki yao ya faragha na usiri.', '2017-07-01 00:36:47', '2017-08-05 15:53:44', 'rights/August2017/weUFArfyUVx56lFQIIaE.jpg'),
(5, 'Haki ya Uhuru wa Mawazo', 'Una uhuru wa kutoa mawazo/maoni kwa ajili ya afya yako.\r\n\r\nPia una haki ya kulindwa na aina yoyote ya kizuizi katika kutoa taarifa/habari zinazohusu afya ya uzazi na kujamiiana.\r\n\r\nWatoa huduma za afya wana haki ya kusitisha kutoa huduma za uzazi wa mpango iwapo wanaweza kukupatia rufaa kwa wataalamu wa afya walio tayari kutoa huduma hiyo. \r\n\r\nHaki hii husitishwa iwapo maisha yako yapo hatarini.', '2017-07-01 00:37:26', '2017-08-05 15:37:33', 'rights/August2017/X53SBnLMZKCnAZm54y8r.jpg'),
(6, 'Haki ya Habari na Elimu', 'Unayo haki ya kupata elimu na taarifa sahihi inayohusiana na afya ya uzazi na kujamiiana, haki na majukumu yako ambayo yana mtazamo wa kijinsia na hazina aina yoyote ya ubaguzi.\r\n\r\nUna haki ya elimu na habari/taarifa inayokidhi haja yako ya kufanya  maamuzi ili kila uamuzi utakaufanya, uufanye katika misingi ya taarifa sahihi na hiari yako.\r\n\r\nBinadamu wote wana haki ya taarifa sahihi kwa niaba ya maslahi ya usalama wa mtu mwingine.', '2017-07-01 00:37:47', '2017-08-05 15:29:09', 'rights/August2017/59kr0MQjgX6UOyYCe4Wh.jpg'),
(7, 'Haki ya Kuamua au Kutoamua Kuoa au Kuolewa na Lini Kuanzisha Familia', 'Una haki ya kulindwa na ulazimishwaji wa kuoa/kuolewa bila ridhaa yako.\r\n\r\nAidha, unayo haki ya kupata huduma za afya ya uzazi hata kama ni mgumba au  uzazi wako umeathiriwa na magonjwa ya zinaa.', '2017-07-01 00:38:43', '2017-08-05 15:27:53', 'rights/August2017/C6rD0oGtE3DDIjZJ1RFX.jpg'),
(8, 'Haki ya Kuamua Kupata Watoto', 'Una haki ya kupata kwa kadri inavyowezekana huduma salama, za uhakika na zinazokubalika katika kupanga uzazi.\r\n\r\nHali kadhalika, una haki ya kuwa huru kuchagua na kutumia njia yoyote ya kupanga uzazi ambayo ni salama na inakubalika.\r\n\r\nWanawake wote wana haki ya kupata taarifa, elimu na huduma muhimu kwa kulinda afya zao za uzazi, na kwamba huduma hizo zinapatikana katika gharama nafuu kwa watumiaji wote.', '2017-07-01 00:39:06', '2017-08-05 15:10:44', 'rights/August2017/7emdrdbFKFADftT2CWr5.jpg'),
(9, 'Haki ya Huduma za Afya na Usalama wa Afya', 'Una haki ya kupata huduma mbalimbali zinazohusu uzazi wa mpango, uchunguzi na matibabu ya ugumba, magonjwa ya zinaa na UKIMWI.\r\n\r\nVilevile una haki ya kulindwa afya yako katika mazingira ya kazi ikiwa ni pamoja na kulinda mfumo mzima wa uzazi.\r\n\r\nBinadamu wote na hasa wanawake na watoto wa kike wana haki ya kulindwa na kutokana na mila na desturi zinazoathiri afya zao.\r\n\r\nWanawake wote wanaofanya kazi za kuajiriwa wana haki ya kulipwa wawapo katika likizo ya uzazi pamoja na mafao mengine yatolewayo na mfuko wa hifadhi ya jamii.', '2017-07-01 00:39:52', '2017-08-05 15:06:19', 'rights/August2017/bytog3Nj4XY2QptleZAn.jpg'),
(10, 'Haki ya Matokeo ya Kisayansi', 'Kama binadamu, una haki ya kufaidi huduma zitokanazo na utaalamu wa masuala ya afya ya uzazi isipokuwa tu pale itakapothibitika kuwa huduma hizo zina madhara kwa watumiaji.\r\n\r\nHaki hii itakulinda na taarifa au huduma yoyote ya afya ya uzazi na kujamiiana ambayo itaonekana kuwa na madhara kwako. \r\n\r\nKwa maana hiyo, una haki ya kupata huduma  ya afya ya uzazi na kujamiiana iliyo salama na inayokubalika.', '2017-07-01 00:40:26', '2017-08-05 15:04:38', 'rights/August2017/36wO4CYSEmLiO2zkl8vx.jpg'),
(11, 'Haki ya Uhuru wa Kukusanyika na Ushiriki wa Kisiasa', 'Kama kijana, una haki ya kukutana na kufanya tafiti yoyote ihusuyo Afya ya Uzazi na kujamiiana.\r\n\r\nPia una haki ya kuunda umoja unaolenga katika kuboresha Afya ya Uzazi na kujamiiana.\r\n\r\nBinadamu wote wana haki ya kuishawishi serikali ili kutoa kipaumbele kwa afya ya uzazi na kujamiiana na haki zake.', '2017-07-01 00:40:55', '2017-08-05 15:03:45', 'rights/August2017/Pnzyo4Ql8DY8atceSG3W.jpg'),
(12, 'Haki ya Kuwa Huru na Unyanyasaji na Matibabu ya Magonjwa', 'Watoto wote wana haki ya kulindwa na aina zote za ukandamizwaji hasa, udhalilishaji wa kimapenzi unaomlazimisha mtoto kujiingiza katika biashara haramu za kimapenzi, ukahaba na matumizi ya watoto katika picha, sinema, au majarida yanayolenga kuamsha hisia za kimapenzi.\r\n\r\nHakuna binadamu atakayetumiwa katika majaribio ya kisayansi yanayohusiana na uzazi na kujamiiana mfano uzazi wa mpango, bila ya ridhaa yake.\r\n\r\nBinadamu wote wake kwa waume wana haki ya kulindwa na ushushwaji wa ubora wa huduma za kitabibu na ukatili kutokana hasa katika vipindi vya vita vya silaha.', '2017-07-01 00:41:21', '2017-08-05 15:06:44', 'rights/August2017/0pEqq6KXVkGRKPYFrACo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `symptom_diseases`
--

CREATE TABLE IF NOT EXISTS `symptom_diseases` (
  `id` int(10) unsigned NOT NULL,
  `symptom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disease_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `terminologies`
--

CREATE TABLE IF NOT EXISTS `terminologies` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `more_details` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `terminologies`
--

INSERT INTO `terminologies` (`id`, `name`, `description`, `created_at`, `updated_at`, `more_details`) VALUES
(2, 'Afya ya Uzazi', 'Afya ya Uzazi ni hali ya kuwa salama kimwili, kiakili na kijamii na sio tu hali ya kutokuwa na ugonjwa au ulemavu katika masuala yote yanayohusu mfumo mzima wa uzazi na jinsi unavyofanya kazi.', '2017-07-11 23:51:11', '2017-07-11 23:51:11', NULL),
(3, 'Afya ya Ujinsia', 'Afya ya Ujinsia ni hali ya mtu kuwa mzima ambapo anaweza kufurahia maisha ya ujinsia bila kuwa na wasi wasi wa kupata maumivu, mimba au magonjwa yatokanayo na ngono.', '2017-07-11 23:55:43', '2017-07-12 00:00:37', NULL),
(5, 'Kubalehe', 'Ujana balehe ni kipindi cha mpito, kutoka utotoni hadi utu uzima. Kwenye umri huu kijana hukua haraka kimwili, kiakili na kihisia. Ujana balehe huanza kati ya miaka 8-13 kutegemeana na mazingira yanayomzunguka kijana na mfumo mzima wa mwili wa kijana.', '2017-07-18 20:34:38', '2017-07-18 20:34:38', NULL),
(6, 'Uke', 'Uke nii mlango kutoka kwenye shingo ya mji wa mimba hadi sehemu ya nje ya uke.', '2017-07-18 20:48:53', '2017-08-08 15:24:47', NULL),
(7, 'Kisimi', 'Kisimi ni kipande kidogo kinachoundwa na misuli inayodinda na kinahisia kali kinapoguswa.', '2017-07-18 20:56:26', '2017-08-08 15:24:16', NULL),
(8, 'Mirija ya kupitisha mayai', 'Mirija ya kupitisha mayai ni sehemu ya kupitia yai lililopevuka na mbegu. Ni mahali mimba inapotungwa.', '2017-07-18 21:07:39', '2017-08-08 15:23:28', NULL),
(9, 'Mji wa mimba', 'Mji wa mimba ni kiungo kinachoundwa na misuli chenye umbile la parachichi ambacho ni kadri ya ukubwa wa ngumi ya mwanamke mwenyewe.', '2017-07-18 21:08:52', '2017-08-08 15:22:55', NULL),
(10, 'Mashavu ya ndani ya uke', 'Mashavu ya ndani ya uke ni mikunjo miwili ya ngozi inayo funika kilango cha uke na njia ya mkojo.', '2017-07-18 21:20:30', '2017-08-08 15:22:19', NULL),
(11, 'Mashavu ya nje ya uke', 'Mashavu ya nje ya uke ni mikunjo miwili ya ngozi inayofunika mashavu ya ndani ya uke.', '2017-07-18 21:24:12', '2017-08-08 15:21:35', NULL),
(12, 'Via vya uzazi vya mwanamke', 'Via vya uzazi vya mwanamke vimegawanyika katika makundi mawili; yaani via vya nje na via vya ndani.', '2017-07-18 21:31:11', '2017-07-20 15:48:53', '<p><strong>Via vya nje vmegawanyika katika makundi matatu:</strong></p>\r\n<p>i. Mashavu ya nje ya uke</p>\r\n<p>ii. Mashavu ya ndani ya uke</p>\r\n<p>iii. Kisimi</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Via vya ndani viko katika makundi matano:</strong></p>\r\n<p>i. Uke</p>\r\n<p>ii. Shingo ya mji wa mimba</p>\r\n<p>iii. Mji wa mimba</p>\r\n<p>iv. Mirija ya kupitisha mayai</p>\r\n<p>v. Kokwa</p>'),
(15, 'Ovari', 'Ovari yaani kokwa za kike zinapevusha na kuruhusu yai tayari kwa kurutubishwa, zinatengeneza vichocheo vinavyo husika na maandalizi ya ukuta wa ndani wa mji wa mimba. Vichocheo hivyo huitwa estrojeni na projestoroni.', '2017-07-18 21:56:35', '2017-07-18 23:38:45', NULL),
(16, 'Mimba', 'Mimba ni matokeo ya muungano wa mbegu ya kiume na yai la mwanamke.', '2017-07-18 23:47:16', '2017-07-20 21:29:23', '<p>&nbsp;Muungano huo hutokea katika mirija ya uzazi ya mwanamke na baadae huenda kujibandika katika mfuko wa uzazi wa mwanamke. &nbsp;Kwa kawaida mimba huendelea kukua mpaka miezi tisa.</p>\r\n<p>&nbsp;</p>'),
(17, 'Uume', 'Uume ni kiungo cha uzazi. Ni sehemu iliyondefu mithili ya ndizi  na sehemu hii imeundwa na misuli mithili ya dodoki.', '2017-07-19 00:03:14', '2017-07-20 21:27:16', '<p class="MsoNormal" style="text-align: justify;"><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Mwanaume anapokuwa na hamu ya kujamiiana, mishipa ya fahamu hupeleka ujumbe kwenye ubongo na kusababisha mishi pa ya damu kwenye uume kujaa na uume kusimama na kuwezesha tendo la kujamiiana.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Kazi ya uume ni mrija wa kupitishia mkojo na shahawa, hukakamaa wakati wa kujamiiana ili kurahisisha wakati wa kuingia ukeni.&nbsp;</span><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Ncha ya uume (iliyo na ngozi laini yenye hisia - govi linalofunika ncha ya uume). Kwenye jamii zinazotahiri wanaume govi hutolewa.</span></p>\r\n<p>&nbsp;</p>'),
(18, 'Kokwa', 'Kokwa au koka (pumbu kwa jina lingine) ni tezi mbili zilizo kwenye mfuko wa kende na kazi zake ni kutengeneza na kuhifadhi mbegu za kiume. Pia zinatengeneza vichocheo vinavyosababisha uume kusimama.', '2017-07-19 00:27:11', '2017-07-19 00:28:09', NULL),
(19, 'Afya ya Uzazi kwa kijana', 'Afya ya Uzazi kwa kijana ni hali ya kuwa salama kimwili, kiakili na kijamii na hali ya kutokuwa na ugonjwa  au ulemavu katika masuala yote yanayohusu mfumo mzima wa uzazi na jinsi unavyofanya kazi katika umri wa ujana. Pia inajumuisha hali ya kijana kufurahia maisha yake ya kuwa mwanamke au mwanaume bila kunyanyaswa, kutopata magonjwa yatokanayo na ngono na kupata mimba au kusababisha mimba zisizotarajiwa.', '2017-07-19 00:37:21', '2017-08-08 15:20:57', NULL);
INSERT INTO `terminologies` (`id`, `name`, `description`, `created_at`, `updated_at`, `more_details`) VALUES
(21, 'Mzunguko wa hedhi', 'Mzunguko wa hedhi ni mfululizo wa mabadiliko ya utendaji kazi wa viungo vya mwili vya mwanamke na hasa via vya uzazi katika matayarisho ya kubeba mimba.', '2017-07-20 14:25:28', '2017-08-08 15:20:11', '<p class="MsoNormal"><!-- [if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--></p>\r\n<p class="MsoNormal"><!-- [if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!-- [if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!-- [if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:"Calibri","sans-serif";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:"Times New Roman";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p>\r\n<p><span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;">Kupata damu ya hedhi kwa mara ya kwanza huitwa "KUVUNJA UNGO"&nbsp; na kwa kawaida mwanamke huvunja ungo akiwa na umri kati ya miaka 12 na 16, ila wachache huanza mapema zaidi (miaka 9).</span></span></span><span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;"><span style="font-size: 16px;"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;"> <br /></span></span></span></span></span></span></p>\r\n<p><span style="font-size: 16px;"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;">Wanawake wote hupata hedhi isipokuwa wakati wa ujauzito, wanaponyonyesha au wanapokuwa na baadhi ya matatizo kwenye via au mfumo wa uzazi.<br /></span></span></span></p>\r\n<p>hedhi hio huja <span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;">kila mwezi kwa mwanamke mpaka afikiapo umri kati ya miaka 45 na 50 na baada ya hapo hedhi hukoma. Kipindi hicho huitwa "KUKOMA KWA HEDHI".</span></span></span></span></span> <span style="font-size: 12pt;"><span style="font-family: ''Trebuchet MS'', sans-serif;"><strong>Hedhi hujirudia kila baada ya siku 21 hadi 35 lakini </strong></span></span><span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';">anawake wengi hupata hedhi kila baada ya siku 28 </span><em><span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;">na kwa kawaida, hedhi hudumu kwa siku 2-7.</span></span></span></em></p>\r\n<p><!-- [if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!-- [if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!-- [if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:"Calibri","sans-serif";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:"Times New Roman";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p>\r\n<p><!-- [if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--></p>\r\n<p><!-- [if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="0" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!-- [if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Times New Roman","serif";}\r\n</style>\r\n<![endif]--></p>\r\n<p><span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;">Baadhi </span></span></span><span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;">ya wanawake</span></span></span><span style="font-size: 12.5pt; font-family: ''Trebuchet MS'',''sans-serif'';"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;"> hupata maumivu ya tumbo kutokana na mkakamao wa msukumo wa mji wa mimba, mkakamao huo hutokea wakati mji wa mimba unaposukuma damu ya hedhi itoke.</span></span></span></p>\r\n<p><span style="font-size: 16px;"><strong><span style="font-family: ''Trebuchet MS'', sans-serif;">AWAMU ZA MZUNGUKO WA HEDHI</span></strong></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;"><strong>Awamu ya kwanza:</strong> Huanza tangu siku ya 1 hadi ya 7 ya hedhi.</span></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;"><strong>Awamu ya pili:</strong>&nbsp;Huanza tangu siku ya 8 hadi ya 18. Wakati wa awamu hii, yai huanza kukomaa tayari kupevuka. Ukuta wa ndani ya mji wa mimba huanza kujiandaa/kujijenga.</span></span></p>\r\n<p style="text-align: left; padding-left: 30px;"><span style="font-family: ''Trebuchet MS'', sans-serif;"><span style="font-size: 16px;"><strong>Awamu ya tatu:</strong>&nbsp;Huanza tangu siku ya 15 hadi siku 1 kabla ya hedhi inayofuata. Awamu hii huchukua siku 14 kwa kila mzunguko wa hedhi.</span></span></p>\r\n<p>&nbsp;</p>');
INSERT INTO `terminologies` (`id`, `name`, `description`, `created_at`, `updated_at`, `more_details`) VALUES
(22, 'Kupevuka kwa yai', 'Kupevuka kwa yai inamaanisha kwamba yai kwa kawaida kila mwezi yai moja hupevuka na kutoka katika kijifuko cha mayai tayari kwa kukutana na mbegu ya mwanaume ili kutunga mimba. \r\nYai lililopevuka huweza kuishi kwa muda wa siku mbili (masaa 48).', '2017-07-20 14:30:53', '2017-08-08 15:17:06', NULL),
(23, 'Ujana balehe', 'Ujana balehe ni kipindi cha mpito, kutoka utotoni hadi utu uzima. Kwenye umri huu kijana hukua haraka kimwili, kiakili na kihisia. Kwa fasili ya Shirika la Afya Duniani (WHO) umri wa kijana ni kati ya miaka 10-20 na kwa fasili ya Umoja wa Nchi za Mataifa (UN) umri wa kijana ni kati ya miaka 10-24. Kuna hatua tatu za mabadiliko wakati wa ujana. ', '2017-07-20 14:41:46', '2017-07-20 14:48:59', '<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Umri wa kati ya miaka (10-13): </span></strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Kijana ana</span><span style="font-family: ''Trebuchet MS'',''sans-serif'';">balehe na kukua haraka, anakuwa na tabia ya kujaribu, anaanza kufikiria kinadharia. Utashi wake unakuwa mkubwa zaidi hadi nje ya familia yake, tabia yake huvuka nje ya mipaka ya familia yake, anathamini zaidi watu maarufu na vijana wa rika lake wanaokubalika.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Umri wa Kati ya miaka (14-16): </span></strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Kijana an</span><span style="font-family: ''Trebuchet MS'',''sans-serif'';">aendelea kukua kimwili na kiakili. Anabadilisha tabia na kuangalia kama zinakubalika kwa wazazi, anakuwa na stadi za uchambuzi na uelewa wa matokeo ya tabia, anashawishiwa zaidi na rika katika kuiga tabia na mwenendo, anavutiwa zaidi na wanarika wa jinsia tofauti na yake.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">&nbsp;</span></strong></p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Kijana wa rika kubwa miaka (17-19): </span></strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Kijana an</span><span style="font-family: ''Trebuchet MS'',''sans-serif'';">afikia ukomo wa kukua kimwili na kijinsia, uwezo wa kutatua matatizo unakuwa mkubwa zaidi, uhusiano wa kirika unapungua, anaungana tena na familia, uhusiano wa karibu unakuwa muhimu zaidi kuliko uhusiano wa makundi, kuongezeka uwezo wa kuchagua mambo kiutu-uzima na kuingia katika maisha ya kufanya kazi.</span></p>'),
(24, 'Shahawa', 'Shahawa au manii ni mbegu za mwanaume zinazozalishwa katika korodani. Kila shahawa ni seli inayoweza kutembea nje ya mwili.\r\nShahawa itapokutana na yai la mwanamke wakati wa tendo la ngono / kujamiiana ndipo hutengeneza kiumbe kipya (mimba hutungwa).', '2017-07-20 15:06:58', '2017-07-20 15:06:58', NULL),
(25, 'Mfuko wa kende', 'Mfuko wa kende ni ngozi inayofunika kokwa. Mfuko wa kende una kazi ya kulinda kende dhidi ya joto, baridi au kuumizwa.', '2017-07-20 15:09:09', '2017-08-08 15:12:14', NULL),
(26, 'Via vya uzazi vya mwanaume', 'Via vya uzazi vya mwanaume vimegawanyika katika makundi mawili; yaani via vya nje na via vya ndani.', '2017-07-20 15:35:18', '2017-07-20 15:55:04', '<p>Via vya nje vmeundwa na:</p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Uume: </span></strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Hiki n</span><span style="font-family: ''Trebuchet MS'', sans-serif;">i kiungo cha uzazi. Na sehemu inayoonekana wazi wazi ni sehemu iliyondefu mithili ya ndizi &nbsp;na sehemu hii imeundwa na misuli mithili ya dodoki.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Mfuko kende:&nbsp;</span></strong><span style="font-family: ''Trebuchet MS'', sans-serif; color: #000000;">Ni ngozi inayofunika kokwa. Kazi za mfuko wa kende ni kunalinda kende dhidi ya joto, baridi au kuumizwa.&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Via vya ndani vmeundwa na:&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Mrija wa mkojo:&nbsp;</span></strong><span style="font-family: ''Trebuchet MS'', sans-serif;">Ni mrefu, mwembamba unaopita ndani ya uume. Kazi za mrija wa mkojo ni njia ya kupitishia mkojo na vilevile kupitisha shahawa, lakini wakati wa kujamiiana, kilango cha kibofu hujifunga kwa hiyo mkojo hauwezi kupita wakati huo.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Tezi za protesti:&nbsp;</span></strong><span style="font-family: ''Trebuchet MS'', sans-serif;">Ni tezi iliyo karibu na kibofu cha mkojo na kifuko cha shahawa. Kazi zake ni tezi inayotengeneza majimaji ambayo huchanganyika na shahawa.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Vifuko vya shahawa:</span></strong><span style="font-family: ''Trebuchet MS'', sans-serif;">Ni tezi mbili ndogo, zilizo karibu na tezi ya prosteti. Kazi zake ni kutoa shahawa inayochanganyika na mbegu za kiume na inavirutubisho.&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Mirija ya kusafirishia mbegu:&nbsp;</span></strong><span style="font-family: ''Trebuchet MS'', sans-serif;">Ni vifereji viwili vinavyotoka kwenye kende na kuunganika na mrija wa mkojo.&nbsp;Kazi zake ni kupitisha mbegu za kiume toka kwenye kende</span>.</p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-family: ''Trebuchet MS'',''sans-serif'';">Epi</span><strong><span style="font-family: ''Trebuchet MS'',''sans-serif'';">didimisi:&nbsp;</span></strong><span style="font-family: ''Trebuchet MS'', sans-serif;">Ni kifereji kilicho jiviringaviringa na kipo juu ya kokwa.&nbsp;</span><span style="font-family: ''Trebuchet MS'', sans-serif;">Kazi zake ni kuhifadhi mbegu za kiume zilizokomaa na kuzipitisha kwenda kwenye mrija wa kusafirishia mbegu.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;">&nbsp;</p>'),
(27, 'Tezi za prosteti', 'Tezi za prosteti ni tezi iliyo karibu na kibofu cha mkojo na kifuko cha shahawa. Kazi zake ni tezi inayotengeneza majimaji ambayo huchanganyika na shahawa.', '2017-07-20 15:51:01', '2017-08-08 15:13:29', NULL),
(28, 'Mrija wa mkojo', 'Mrija wa mkojo ni mrefu, mwembamba unaopita ndani ya uume. \r\nKazi za mrija wa mkojo ni njia ya kupitishia mkojo na vilevile kupitisha shahawa, lakini wakati wa kujamiiana, kilango cha kibofu hujifunga kwa hiyo mkojo hauwezi kupita wakati huo.', '2017-07-20 15:51:46', '2017-07-20 15:51:46', NULL),
(29, 'Epididimisi', 'Epididimisi: Ni kifereji kilicho jiviringaviringa na kipo juu ya kokwa. Kazi zake ni kuhifadhi mbegu za kiume zilizokomaa na kuzipitisha kwenda kwenye mrija wa kusafirishia mbegu.', '2017-07-20 15:52:27', '2017-07-20 15:52:27', NULL),
(30, 'Vifuko vya shahawa', 'Vifuko vya shahawa ni tezi mbili ndogo, zilizo karibu na tezi ya prosteti. Kazi zake ni kutoa shahawa inayochanganyika na mbegu za kiume na inavirutubisho.', '2017-07-20 15:53:15', '2017-08-08 15:11:44', NULL),
(31, 'Mirija ya kusafirishia mbegu', 'Mirija ya kusafirishia mbegu ni vifereji viwili vinavyotoka kwenye kende na kuunganika na mrija wa mkojo.\r\nKazi zake ni kupitisha mbegu za kiume toka kwenye kende.', '2017-07-20 15:54:12', '2017-08-08 15:11:15', NULL),
(33, 'Jinsi', 'Jinsi ni tofauti ya kibaiolojia kati ya mwanamke na mwanaume', '2017-07-21 11:14:23', '2017-08-08 15:10:23', NULL),
(34, 'Jinsia', 'Jinsia ni uhusiano kati ya mwanaume na mwanamke unaojengwa na jamii kulingana na majukumu yanayomzunguka mwanaume au mwanamke huyo.', '2017-07-21 11:16:11', '2017-08-08 15:09:41', NULL),
(35, 'Ujinsia', 'Ujinsia ni kipengele kinachomhusisha na kumjumuisha mwanadamu katika jamii kama kitambulisho chake cha kijinsia na mwelekeo wa jinsi.', '2017-07-21 11:22:29', '2017-08-08 15:08:56', NULL),
(36, 'Mimba za Utotoni', 'Mimba za utotoni ni mimba zinazotokana na vijana kufanya ngono zisizo salama. Kijana balehe anapopata mimba; mimba hii huitwa "mimba ya utotoni".\r\n\r\nVijana anaweza kujizuia na ngono zisizo salama kwa njia mbalimbali.', '2017-07-21 11:47:48', '2017-07-21 22:15:42', '<p>Athari za vitendo hivi katika jamii ni pamoja na magonjwa ya ngono na mimba zisizotakiwa. Tafiti zimeonyesha kuwa kwa kutumia vijana waelimishaji rika ni mkakati unaoweza kusaidia sana kupunguza tatizo hili kwani vijana waelimishaji rika wana uwezo wa kuwafikia makundi mbali mbali ya vijana wenzao na kuwapa habari na elimu kuhusiana na afya ya uzazi na ujinsia kwa urahisi. &nbsp;Makundi hayo ni vijana ambao hawajaanza ngono, wanaofanya ngono na waliopata mimba.</p>\r\n<h2>Jinsi ya kuzuia mimba katika umri mdogo</h2>\r\n<ul>\r\n<li>&middot; Kuacha kabisa ngono</li>\r\n<li>&middot; Kutumia njia za uzazi wa mpango mmoja</li>\r\n<li>&middot; Kupiga punyeto au kujichua</li>\r\n<li>&middot; Kuoga maji baridi</li>\r\n<li>&middot; Kujishughulisha na michezo, masomo au kusaidia kazi za nyumbani.</li>\r\n<li>&middot; Kuepuka kuangalia picha, kusoma hadithi au maelezo yanayoweza kuamsha hisia za ngono</li>\r\n<li>&middot; Kujihusisha na maswala ya dini</li>\r\n<li>&middot; Kuomba ushauri kwa mtoa huduma za Afya ya Uzazi</li>\r\n</ul>');
INSERT INTO `terminologies` (`id`, `name`, `description`, `created_at`, `updated_at`, `more_details`) VALUES
(37, 'Madhara ya mimba kwa vijana balehe', 'Mimba kwa vijana balehe / mimba za utotoni zina madhara yaliyogawanywa katika makundi matatu.', '2017-07-21 14:23:58', '2017-08-03 10:51:14', '<p><!-- [if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--></p>\r\n<p><!-- [if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!-- [if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="0" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--></p>\r\n<p class="MsoNormal" style="margin-left: 0.25in; text-align: left;"><strong style="mso-bidi-font-weight: normal;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Madhara ya mimba kwa vijana balehe</span></strong></p>\r\n<!-- [if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n<p>&nbsp;1. <span style="font-family: ''Trebuchet MS'', sans-serif; text-align: justify;">Wakati wa ujauzito</span></p>\r\n<ol start="1" type="i">\r\n<li class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; text-align: justify; mso-list: l2 level1 lfo3; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kuharibika kwa mimba</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l3 level1 lfo4; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">K</span>upatwa na uchungu wa mapema na kujifungua kabla ya wakati wake <span style="mso-spacerun: yes;">&nbsp;</span>Kupatwa na kifafa cha mimba (pre eclampsia).</li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l3 level1 lfo4; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">U</span>pungufu wa dama hasa katika miezi ya mwisho ya ujauzito kutokana na lishe duni</li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l3 level1 lfo4; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kuongezeka uwezekano wa </span>maambukizi ya virusi vya ukimwi toka kwa mama kwenda kwa mtoto.</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif'';">&nbsp;</span><span style="font-family: ''Trebuchet MS'',''sans-serif''; mso-bidi-font-weight: normal;">2. Wakati wa uchungu / muda wa kujifungua&nbsp;</span><strong><span style="font-family: ''Trebuchet MS'',''sans-serif''; mso-bidi-font-weight: normal;"><br /></span></strong></p>\r\n<ol start="1" type="i">\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l3 level1 lfo4; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kushindwa kujifungua kwa njia ya kawaida hasa kwa wale wa umri chini ya miaka 16. </span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l3 level1 lfo4; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kuchanika vibaya viungo vya uzazi wakati wa kujifungua</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l3 level1 lfo4; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Uchungu wa muda mrefu</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l3 level1 lfo4; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kifo</span></li>\r\n</ol>\r\n<p>&nbsp;3. <span style="font-family: ''Trebuchet MS'', sans-serif; text-align: justify;">Baada ya kujifungua</span></p>\r\n<ol start="1" type="i">\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l0 level1 lfo1; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kutokwa damu kwa wingi ambako husababisha upungufu wa damu.</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l0 level1 lfo1; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Matatizo ya lishe duni wakati wa mimba huweza kuendelea hata baada ya kujifungua.</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l0 level1 lfo1; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kutoweza kunyonyesha vizuri.</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l0 level1 lfo1; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Sonona baada ya kujifungua na matatizo mengine ya afya ya akili.</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l0 level1 lfo1; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Hatari kwa mtoto kuzaliwa na uzito chini ya gram 2500.</span></li>\r\n<li class="MsoNormal" style="text-align: justify; mso-list: l0 level1 lfo1; tab-stops: list .5in;"><span lang="EN-GB" style="font-family: ''Trebuchet MS'',''sans-serif''; mso-ansi-language: EN-GB;">Kuzaliwa kabla ya muda (njiti).</span></li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<!-- [if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!-- [if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!-- [if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:"Calibri","sans-serif";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:"Times New Roman";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->\r\n<p>&nbsp;</p>'),
(38, 'Afya', 'Afya ni hali ya kuwa huru na magonjwa au kujeruhiwa', '2017-08-06 14:29:24', '2017-08-08 15:06:20', NULL),
(39, 'Ngono zembe', 'Ngono zembe / ngono isiyo salama ni shughuli za kujamiiana ambazo zinafanyika bila kutumia kinga yoyote itayoweza kusaidia kuzuia mimba zisizotarajiwa na kupunguza hatari ya kupata maambukizi ya magonjwa ya zinaa, haswa gonjwa hatarishi la UKIMWI.', '2017-08-06 14:34:42', '2017-08-06 14:34:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `type_contraceptives`
--

CREATE TABLE IF NOT EXISTS `type_contraceptives` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `type_contraceptives`
--

INSERT INTO `type_contraceptives` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Njia za Muda Mfupi', '2017-07-02 15:54:13', '2017-07-29 07:19:04'),
(3, 'Njia za Muda Mrefu', '2017-07-02 15:54:34', '2017-07-29 07:18:46'),
(4, 'Njia za Kudumu', '2017-07-02 15:54:54', '2017-07-29 07:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `type_diseases`
--

CREATE TABLE IF NOT EXISTS `type_diseases` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Yesaya R. Athuman', 'yesayaathuman@gmail.com', 'users/June2017/SGxA9LfvlmB8MPS7WS0z.jpg', '$2y$10$tJQlQnxc5v85ACK54IALeuHDTT/UT4Pm0EBaGXo7.f9kbnltQFTN.', 'mm8eYbUxgth7CBeHTsykYBlOAJKPjsIdStLLzERLIPSSjg65jmwnj1luJBft', '2017-06-25 23:18:30', '2017-06-27 11:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `use_contraceptives`
--

CREATE TABLE IF NOT EXISTS `use_contraceptives` (
  `id` int(10) unsigned NOT NULL,
  `contraceptive_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `use_contraceptives`
--

INSERT INTO `use_contraceptives` (`id`, `contraceptive_id`, `created_at`, `updated_at`, `use`) VALUES
(1, 1, '2017-07-02 17:42:15', '2017-07-02 17:42:15', '<p><span lang="ES-BO" style="font-size: 12.0pt; font-family: ''Times New Roman'',serif; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES-BO; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;">Tumia kondomu mpya kwa kila mshindo mmoja na uitupe kwa usalama katika choo cha &nbsp;shimo au ichome moto.</span></p>');

-- --------------------------------------------------------

--
-- Table structure for table `working_hours`
--

CREATE TABLE IF NOT EXISTS `working_hours` (
  `id` int(10) unsigned NOT NULL,
  `centre_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `days_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `working_hours`
--

INSERT INTO `working_hours` (`id`, `centre_id`, `days_type`, `service_time`, `created_at`, `updated_at`) VALUES
(1, '107696-7', 'Jumatatu - Ijumaa', 'Saa 9:00 Alasiri - Saa 12:00 Jioni', '2017-08-08 03:08:40', '2017-08-08 03:10:06'),
(2, '107696-7', 'Jumamosi', 'Saa 2:00 Asubuhi - Saa 6:00 Mchana', '2017-08-08 03:09:46', '2017-08-08 03:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `youths`
--

CREATE TABLE IF NOT EXISTS `youths` (
  `id` int(10) unsigned NOT NULL,
  `fb_youth_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `categories_slug_unique` (`slug`) USING BTREE, ADD KEY `categories_parent_id_foreign` (`parent_id`) USING BTREE;

--
-- Indexes for table `centres`
--
ALTER TABLE `centres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centre_services`
--
ALTER TABLE `centre_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contraceptives`
--
ALTER TABLE `contraceptives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`), ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`) USING BTREE;

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `data_types_name_unique` (`name`) USING BTREE, ADD UNIQUE KEY `data_types_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `effects_teenage_pregnancies`
--
ALTER TABLE `effects_teenage_pregnancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `effect_contraceptives`
--
ALTER TABLE `effect_contraceptives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_planning_importances`
--
ALTER TABLE `family_planning_importances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `importance_contraceptives`
--
ALTER TABLE `importance_contraceptives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`), ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`) USING BTREE;

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `menus_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`), ADD KEY `menu_items_menu_id_foreign` (`menu_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `pages_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`), ADD KEY `permissions_key_index` (`key`) USING BTREE;

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `permission_groups_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`), ADD KEY `permission_role_permission_id_index` (`permission_id`) USING BTREE, ADD KEY `permission_role_role_id_index` (`role_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `posts_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `roles_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `settings_key_unique` (`key`) USING BTREE;

--
-- Indexes for table `srh_rights`
--
ALTER TABLE `srh_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptom_diseases`
--
ALTER TABLE `symptom_diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terminologies`
--
ALTER TABLE `terminologies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`) USING BTREE;

--
-- Indexes for table `type_contraceptives`
--
ALTER TABLE `type_contraceptives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_diseases`
--
ALTER TABLE `type_diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Indexes for table `use_contraceptives`
--
ALTER TABLE `use_contraceptives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_hours`
--
ALTER TABLE `working_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youths`
--
ALTER TABLE `youths`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `centres`
--
ALTER TABLE `centres`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `centre_services`
--
ALTER TABLE `centre_services`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `contraceptives`
--
ALTER TABLE `contraceptives`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `effects_teenage_pregnancies`
--
ALTER TABLE `effects_teenage_pregnancies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `effect_contraceptives`
--
ALTER TABLE `effect_contraceptives`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `family_planning_importances`
--
ALTER TABLE `family_planning_importances`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `importance_contraceptives`
--
ALTER TABLE `importance_contraceptives`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `srh_rights`
--
ALTER TABLE `srh_rights`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `symptom_diseases`
--
ALTER TABLE `symptom_diseases`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `terminologies`
--
ALTER TABLE `terminologies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `type_contraceptives`
--
ALTER TABLE `type_contraceptives`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `type_diseases`
--
ALTER TABLE `type_diseases`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `use_contraceptives`
--
ALTER TABLE `use_contraceptives`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `working_hours`
--
ALTER TABLE `working_hours`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `youths`
--
ALTER TABLE `youths`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
