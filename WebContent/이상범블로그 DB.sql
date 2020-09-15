/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.1.45-MariaDB : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `blog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `cateItemId` INT(10) UNSIGNED NOT NULL,
  `displayStatus` TINYINT(1) UNSIGNED NOT NULL,
  `title` CHAR(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `like` INT(10) DEFAULT '0',
  `memberId` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cateItemId` (`cateItemId`,`displayStatus`)
) ENGINE=INNODB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `article` */

INSERT  INTO `article`(`id`,`regDate`,`updateDate`,`cateItemId`,`displayStatus`,`title`,`body`,`hit`,`like`,`memberId`) VALUES 
(2,'2020-07-06 11:08:01','2020-07-06 11:08:01',1,1,'2020년 7월 6일 공부계획 ?','## 오늘의 공부계획 ?\r\n\r\n- 15:00 ~ 16:00 : 개인 블로그 UI 개선, \r\n- 16:00 ~ 17:00 : 추가 기능 구현, 게시물 쓰기 등\r\n- 17:00 ~ 18:00 : 기능 구현 계속..\r\n- 공부 인증 영상: ',7,0,1),
(3,'2020-07-06 11:12:07','2020-07-06 11:12:07',4,1,'SQL 기본 문법','# 데이터 조회하기\r\n\r\n``` SQL\r\n    SELECT * FROM 테이블명; \r\n```\r\n\r\n# 테이블 구조 보기\r\n\r\n``` SQL\r\n    DESC 테이블명; \r\n```\r\n- describe 의 약어',19,0,1),
(4,'2020-07-06 11:15:30','2020-07-06 11:15:30',2,1,'일상 ?‍♂','# 근황...\r\n\r\n- 학원,? 집..? 학원.. 집.. \r\n\r\n```youtube\r\nQBtKk-xrIbU\r\n```\r\n\r\n```repl\r\nhttps://repl.it/@chasaem/VoluminousWholeArrays#Main.java\r\n```',11,0,1),
(5,'2020-07-07 11:07:32','2020-07-07 11:07:32',3,1,'[CSS 기초] 제1강 CSS 문법 ?','# CSS 기초 1강: 문법 ?\r\n## 코드 구성\r\n- CSS 코드는 기본적으로 선택자(selector), 속성(property), 값(value) 로 이루어져있다.\r\n```css\r\nh1 { color:blue; }\r\n```\r\n\r\n- h1 은 selector, color 는 property, 값은 value 이다\r\n- 속성 뒤에 \":\" 를 넣고 값을 넣는다\r\n\r\n- CSS 의 코드 구성은 다음과 같다\r\n\r\n```css\r\nselector { property:value; }\r\n```\r\n- 속성과 값을 합한 것을 선언(declaration) 이라고 한다\r\n- semi-colon ; 을 선언 뒤에 넣어서 구분짓는다.\r\n\r\n### 실습문제 ❔\r\n- 글자크기를 조정하는 속성은 font-size 이다.\r\n- 글자크기를 100px(픽셀) 로 바꿔보자\r\n```codepen\r\nhttps://codepen.io/samlee2552/embed/mdVxOmL?theme-id=dark&default-tab=css,result&editable=true\r\n```\r\n### 정답 ?\r\n```codepen\r\nhttps://codepen.io/samlee2552/embed/preview/NWxYbYV?theme-id=dark&default-tab=css,result&editable=true\r\n```\r\n---\r\n- 정답 코드에 나와있듯 각 선언간 공백이나 줄바꿈은 하나의 공백으로 인식한다\r\n```css\r\nh1 { color:blue; font-size:100px; }\r\n\r\nh1 {\r\n    color:blue;\r\n    font-size:100px;\r\n    }\r\n```\r\n- 위 코드들은 둘다 같은 코드이다. 아래 코드는 줄바꿈이 되었지만 하나의 공백으로 인식하기 때문이다.\r\n- 선택자 안에 선언이 많을 경우 식별하기가 어려울 수 있다. 줄바꿈을 해줘서 가독성을 높이자 ?\r\n\r\n## 주석 처리\r\n- CSS 코드 내에서 주석처리 하는 방법은 다음과 같다\r\n- /* 주석처리할 내용 */\r\n```css\r\nh1 {\r\n    color:blue;\r\n    font-size:100px;\r\n    /* background-color:red; */\r\n}\r\n   \r\n```\r\n\r\n끝;\r\n',236,0,1),
(6,'2020-07-08 09:07:18','2020-07-08 09:07:18',3,1,'[CSS 기초] 제2강 CSS 선택자','# CSS 기초 2강: 선택자\r\n\r\n## 선택자 종류\r\n\r\n- 선택자에는 ',18,0,1),
(90,'2020-07-13 22:47:32','2020-07-13 22:47:32',1,1,'토스트 에디터 적용 성공???','# 안녕하세요\r\n## 반갑습니다\r\n### 잘 부탁드립니다\r\n\r\n```youtube\r\n  Iretw1IfZ_4  \r\n```\r\n\r\n```java\r\n    System.out.println(\"HI\");\r\n```\r\n\r\n```xml\r\n    <div>haha</div>\r\n```',6,0,1),
(92,'2020-07-13 23:01:06','2020-07-13 23:01:06',2,1,'블로그 구현해야 할 기능들','## 구현해야 할 기능들\r\n- 메인 사이드 바\r\n- **글쓰기** 이미지 업로드, \r\n    - 제목 미 입력시 alert 뜨게\r\n    - UI 개선\r\n    - 멤버 ID 통해서 작성자 도 출력되게\r\n- 글 수정 삭제, 작성자랑 관리자만 수정 삭제 가능하게\r\n- 회원가입\r\n    - 회원가입 UI 개선\r\n- 로그인/로그아웃\r\n    - 로그인한 회원만 글 작성 가능하게\r\n    -',25,0,1),
(97,'2020-07-16 13:26:40','2020-07-27 10:21:41',1,1,'테스트용','',9,0,1),
(101,'2020-07-19 21:12:38','2020-07-19 21:12:38',1,1,'shady test 1','# test shady test 1',311,0,4),
(204,'2020-07-26 22:37:30','2020-07-27 10:24:59',1,1,'32453425234','',83,0,2),
(208,'2020-07-27 13:24:43','2020-07-27 13:24:43',1,1,'124234','# 안녕12342134',3,0,2),
(209,'2020-07-27 19:49:40','2020-07-27 19:49:40',1,1,'test','body',0,0,1),
(210,'2020-07-27 19:49:42','2020-07-27 19:49:42',1,1,'test','body',0,0,1),
(211,'2020-07-27 19:49:42','2020-07-27 19:49:42',1,1,'test','body',0,0,1),
(212,'2020-07-27 19:49:42','2020-07-27 19:49:42',1,1,'test','body',0,0,1),
(213,'2020-07-27 19:49:42','2020-07-27 19:49:42',1,1,'test','body',0,0,1),
(214,'2020-07-27 19:49:42','2020-07-27 19:49:42',1,1,'test','body',0,0,1),
(215,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(216,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(217,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(218,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(219,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(220,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(221,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(222,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(223,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(224,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(225,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(226,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(227,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(228,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(229,'2020-07-27 19:49:43','2020-07-27 19:49:43',1,1,'test','body',0,0,1),
(230,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(231,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(232,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(233,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(234,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(235,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(236,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(237,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(238,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(239,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(240,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(241,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(242,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(243,'2020-07-27 19:49:44','2020-07-27 19:49:44',1,1,'test','body',0,0,1),
(244,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(245,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(246,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(247,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(248,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(249,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(250,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(251,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(252,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(253,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(254,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(255,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(256,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(257,'2020-07-27 19:49:45','2020-07-27 19:49:45',1,1,'test','body',0,0,1),
(258,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(259,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(260,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(261,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(262,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(263,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(264,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(265,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(266,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(267,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(268,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(269,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(270,'2020-07-27 19:49:46','2020-07-27 19:49:46',1,1,'test','body',0,0,1),
(271,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(272,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(273,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(274,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(275,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(276,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(277,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(278,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(279,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(280,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(281,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(282,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(283,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(284,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(285,'2020-07-27 19:49:47','2020-07-27 19:49:47',1,1,'test','body',0,0,1),
(286,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(287,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(288,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(289,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(290,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(291,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(292,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(293,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(294,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(295,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(296,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(297,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(298,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(299,'2020-07-27 19:49:48','2020-07-27 19:49:48',1,1,'test','body',0,0,1),
(300,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(301,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(302,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(303,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(304,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(305,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(306,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(307,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(308,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(309,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(310,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(311,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(312,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(313,'2020-07-27 19:49:49','2020-07-27 19:49:49',1,1,'test','body',0,0,1),
(314,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(315,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(316,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(317,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(318,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(319,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(320,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(321,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(322,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(323,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(324,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(325,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(326,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(327,'2020-07-27 19:49:50','2020-07-27 19:49:50',1,1,'test','body',0,0,1),
(328,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(329,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(330,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(331,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(332,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(333,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(334,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(335,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(336,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(337,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(338,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(339,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(340,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(341,'2020-07-27 19:49:51','2020-07-27 19:49:51',1,1,'test','body',0,0,1),
(342,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(343,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(344,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(345,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(346,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(347,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(348,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(349,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(350,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(351,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(352,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(353,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(354,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(355,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(356,'2020-07-27 19:49:52','2020-07-27 19:49:52',1,1,'test','body',0,0,1),
(357,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(358,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(359,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(360,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(361,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(362,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(363,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(364,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(365,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(366,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(367,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(368,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(369,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(370,'2020-07-27 19:49:53','2020-07-27 19:49:53',1,1,'test','body',0,0,1),
(371,'2020-07-27 19:49:54','2020-07-27 19:49:54',1,1,'test','body',0,0,1),
(372,'2020-07-27 19:49:54','2020-07-27 19:49:54',1,1,'test','body',0,0,1),
(373,'2020-07-27 19:50:58','2020-07-27 19:50:58',1,1,'test','body',0,0,1),
(374,'2020-07-27 19:50:58','2020-07-27 19:50:58',1,1,'test','body',0,0,1),
(375,'2020-07-27 19:50:58','2020-07-27 19:50:58',1,1,'test','body',0,0,1),
(376,'2020-07-27 19:50:58','2020-07-27 19:50:58',1,1,'test','body',0,0,1),
(377,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(378,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(379,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(380,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(381,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(382,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(383,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(384,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(385,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(386,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(387,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(388,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(389,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(390,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(391,'2020-07-27 19:50:59','2020-07-27 19:50:59',1,1,'test','body',0,0,1),
(392,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(393,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(394,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(395,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(396,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(397,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(398,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(399,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(400,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(401,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(402,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(403,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(404,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(405,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(406,'2020-07-27 19:51:00','2020-07-27 19:51:00',1,1,'test','body',0,0,1),
(407,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(408,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(409,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(410,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(411,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(412,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(413,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(414,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(415,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(416,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(417,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(418,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(419,'2020-07-27 19:51:01','2020-07-27 19:51:01',1,1,'test','body',0,0,1),
(420,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(421,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(422,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(423,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(424,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(425,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(426,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(427,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(428,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(429,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(430,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(431,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(432,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(433,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(434,'2020-07-27 19:51:02','2020-07-27 19:51:02',1,1,'test','body',0,0,1),
(435,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(436,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(437,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(438,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(439,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(440,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(441,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(442,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(443,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(444,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(445,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(446,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(447,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(448,'2020-07-27 19:51:03','2020-07-27 19:51:03',1,1,'test','body',0,0,1),
(449,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(450,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(451,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(452,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(453,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(454,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(455,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(456,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(457,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(458,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(459,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(460,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(461,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(462,'2020-07-27 19:51:04','2020-07-27 19:51:04',1,1,'test','body',0,0,1),
(463,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(464,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(465,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(466,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(467,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(468,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(469,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(470,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(471,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(472,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(473,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(474,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(475,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(476,'2020-07-27 19:51:05','2020-07-27 19:51:05',1,1,'test','body',0,0,1),
(477,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(478,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(479,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(480,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(481,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(482,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(483,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(484,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(485,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',1,0,1),
(486,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(487,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(488,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',0,0,1),
(489,'2020-07-27 19:51:06','2020-07-27 19:51:06',1,1,'test','body',1,0,1),
(490,'2020-07-27 19:51:07','2020-07-27 19:51:07',1,1,'test','body',1,0,1),
(491,'2020-07-27 19:51:07','2020-07-27 19:51:07',1,1,'test','body',0,0,1),
(492,'2020-07-27 19:51:07','2020-07-27 19:51:07',1,1,'test','body',0,0,1),
(493,'2020-07-27 19:52:19','2020-07-30 13:32:17',1,1,'수정 테스트','',1,0,1),
(496,'2020-07-29 10:00:17','2020-07-29 10:01:24',1,1,'제목이 길면 어떻게 될까 확인을 해보자, 하하하하하하호홓 가나다라마바사 동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세. 남산위에 저 소나무 철갑을 두른듯 바람서리 불변함은 일편단심일세 무궁화 삼천리 화려강산 대한사람 대한으로 길이보전하세. 가을 하늘 공활한ㅌ[ 높고 구름엇ㅂ이','',14,0,2),
(497,'2020-07-29 10:43:53','2020-07-31 10:14:57',1,1,'qwerqewr','',6,0,2),
(499,'2020-07-29 13:48:57','2020-07-31 09:33:10',1,1,'[수정test]블로그 개선 해야 할 점들','',28,0,2),
(500,'2020-07-31 09:16:43','2020-07-31 09:25:42',1,1,'535345435345','',9,0,1),
(501,'2020-07-31 09:57:33','2020-07-31 10:06:21',1,1,'sdfgsdfgdsfgdfsgdsfgsdfg','',4,0,2),
(502,'2020-07-31 10:15:14','2020-07-31 10:20:58',1,1,'sdfg','',9,0,2),
(503,'2020-07-31 10:26:24','2020-07-31 10:26:24',1,1,'','',0,0,2),
(504,'2020-07-31 10:41:41','2020-07-31 10:41:41',1,1,'asdf','',2,0,2),
(505,'2020-07-31 10:50:13','2020-07-31 10:50:13',1,1,'asdgasdgsad','',5,0,2),
(506,'2020-07-31 10:53:19','2020-07-31 10:53:19',1,1,'sdfgsdfg','sdfgsdfgsdfgsdfgsdfgsdfgsfdgsdfgsdfgsdfg df',1,0,2),
(509,'2020-07-31 12:01:05','2020-08-03 10:10:23',1,1,'블로그 구현해야 할 것들','# 게시물\r\n- 수정 시 수정 날짜 반영되게\r\n- 좋아요 수 반영되게\r\n- 게시물 제목 긴 부분 ... ellipse 처리 [끝]\r\n\r\n# 댓글\r\n\r\n- 댓글 작성, 수정, 삭제 오류 해결\r\n- 댓글 리스트 나오게 [끝]\r\n-  댓글 작성자 출력되게\r\n\r\n# 회원\r\n- 회원 정보 수정 [내일]\r\n- 회원 가입시 인증 코드 발송 [내일].\r\n- 회원 가입시 메일 발송 오류 해결..... : [끝]',34,0,2),
(510,'2020-08-02 17:53:44','2020-08-02 17:53:44',1,1,'제목이 길면 어떻게 처리 되는지 한번 봐보자 하하호호하하ㅓ히히동해물고 ㅏ백두산이 마르고 닳도록 하나님이 보우하사 우리나라만세 무궁화','ㅁㄴㅇㄹ',18,0,1),
(511,'2020-08-02 18:19:07','2020-08-02 18:19:07',1,1,'ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ','왔다갑니다 ㅎ',29,0,43),
(512,'2020-08-03 09:07:06','2020-08-03 09:07:19',1,1,'댓글 테스트','```java\r\nsfsf```\r\n```java\r\nsfsf```\r\n```java\r\nsfsf```\r\n\r\n```java\r\nsfsf```\r\n```java\r\nsfsf```\r\n```java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf```\r\n```java\r\nsfsf```\r\n```java\r\nsfsf```\r\n```java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf``````java\r\nsfsf```',18,0,1),
(513,'2020-08-03 10:17:37','2020-08-27 23:15:18',1,1,'티스토리 정리 할 것들','# 자바\r\n- lombok\r\n- interface 재 정립\r\n- MVC 패턴 재정리\r\n-  람다식\r\n-  삼항 연산자\r\n\r\n# jsp\r\n- jstl\r\n- parameter, attribute\r\n# spring 관련\r\n- annotaion 정리\r\n        - @Autowired\r\n        - @Component\r\n        - @Service 등\r\n - myBatis\r\n- maven\r\n\r\n\r\n# CSS / html \r\n- normalize\r\n\r\n# mysql 등\r\n\r\n-쿼리, inner join , left join, index\r\n- sql injection 방어\r\n\r\n# mybatis\r\n   - cdata\r\n\r\n\r\n# xml 개념 정리\r\n\r\n# git 명령어 정리\r\n\r\n\r\n# jdbc\r\n- jdbc:mysql://127.0.0.1:3306/at?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull\r\n    username: sbsst\r\n    \r\n    \r\n# 구아바 캐시\r\n\r\n# HTTP 프로토콜\r\n\r\n# 마크다운 문법',44,0,1),
(515,'2020-08-07 09:41:07','2020-08-07 10:26:40',1,1,'[오디션 앱] DB 설계','# DB 설계\r\n\r\n## TABLE\r\n\r\n### 지원자\r\n- 번호, primary key\r\n- 이름\r\n- 성별\r\n- 생년월일\r\n- 전화번호, unique\r\n- 이메일 주소, unique\r\n- 합격 여부, \r\n\r\n### 지원글\r\n- 번호 primary key\r\n- 등록일 \r\n-  제목\r\n-  본문\r\n-  카테고리 번호\r\n\r\n### 지원 작품\r\n- 번호\r\n- 이름\r\n- 감독명\r\n- 필요 인원\r\n- 장르?\r\n\r\n### 카테고리\r\n- 번호\r\n- 이름\r\n\r\n\r\n### 댓글\r\n- 번호\r\n- 등록일\r\n- 작성자\r\n- 작품번호\r\n- 본문',9,0,1),
(516,'2020-08-07 13:45:35','2020-08-07 17:20:04',1,1,'[오디션 앱] DB 스키마','### 회원가입\r\n- 연기자 , 캐스팅디렉터 두개의 회원 유형 중 하나로 가입하게 설계\r\n\r\n### 게시판\r\n- 게시판을 두개로 나눔\r\n    - 지원 공고 가 올라오는 게시판\r\n        - 캐스팅 디렉터들이 구인 공고를 올릴수 있게\r\n        - 배역에 관련된 기본 정보들을 입력 받고 배역 테이블에 저장\r\n            - \r\n        - 댓글 가능\r\n    - 구인 지원\r\n        - 연기자들이 공고의 요구사항에 맞게 지원하는 게시판\r\n        - 원하는 배역을 선택 \r\n        - 연기자들이 글 올리고 댓글도 달 수 있게\r\n        - 합격 여부는 default 0, 합격시 1\r\n\r\n### 배역\r\n    - 작품번호와 역할명, 성별, 필요 인원 수 등을 받는다.\r\n   \r\n        \r\n\r\n\r\n\r\n\r\n#지원자\r\nCREATE TABLE applicant(\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME NOT NULL,\r\n    `name` CHAR(100) NOT NULL,\r\n    `email` CHAR(100) NOT NULL UNIQUE,\r\n    `phoneNum` CHAR(11) NOT NULL,\r\n    `loginPw` CHAR(100) NOT NULL,\r\n    `birthDate` DATETIME NOT NULL,\r\n    `gender` CHAR(1) NOT NULL,\r\n    `mailAuth` TINYINT(1) UNSIGNED NOT NULL\r\n);\r\n\r\n# 캐스팅 디렉터\r\nCREATE TABLE castingDirector (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME NOT NULL,\r\n    `name` CHAR(100) NOT NULL,\r\n    `email` CHAR(100) NOT NULL UNIQUE,\r\n    `phoneNum` CHAR(11) NOT NULL,\r\n    `loginPw` CHAR(100) NOT NULL,\r\n    `mailAuth` TINYINT(1) UNSIGNED NOT NULL\r\n);\r\n\r\n# 카테고리 (게시판)\r\nCREATE TABLE cateItem (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME,\r\n    `name` CHAR(20) NOT NULL UNIQUE\r\n);\r\n\r\n# 작품\r\nCREATE TABLE artwork (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME,\r\n    updateDate DATETIME,\r\n    delDate DATETIME,\r\n	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,\r\n	displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,\r\n	directorName CHAR(20) NOT NULL, #감독명 \r\n	castDirName CHAR(20) NOT NULL, \r\n    title CHAR(100) NOT NULL,\r\n    prodCompany CHAR(100) NOT NULL #제작사 \r\n);\r\n\r\n# 구인 공고 cateItem 1 번\r\nCREATE TABLE recruitNotice (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME,\r\n    updateDate DATETIME,\r\n    delDate DATETIME,\r\n	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,\r\n	displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,\r\n    `title` CHAR(200) NOT NULL,\r\n    `body` TEXT NOT NULL #body 에 배역에 대한 설명 대부분이 들어있을 것\r\n);\r\n\r\n# 구인 지원서 cateItem 2 번\r\nCREATE TABLE recruitApplication (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    memberId INT(10) UNSIGNED NOT NULL, #지원자 번호,\r\n    regDate DATETIME,\r\n    updateDate DATETIME,\r\n    delDate DATETIME,\r\n	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,\r\n	displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,\r\n    `title` CHAR(200) NOT NULL,\r\n    `body` TEXT NOT NULL,\r\n    `role` CHAR(20) NOT NULL # 배역선택,\r\n    `qualifiedStatus` TINYINT(1) DEFAULT 0 # 합격 여부\r\n);\r\n\r\n# 배역\r\nCREATE TABLE `role` (\r\n   id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, \r\n   `artWorkId` INT(10) UNSIGNED NOT NULL, # 작품 번호\r\n   `roleName` CHAR(20) NOT NULL, #배역명\r\n   `gender` CHAR(1) NOT NULL,\r\n   `reqNumOfActor` INT(10) NOT NULL\r\n);\r\n\r\n# 댓글\r\nCREATE TABLE `comment` (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME NOT NULL,\r\n    updateDate DATETIME,\r\n    memberName CHAR(100) NOT NULL, # 작성자 명\r\n    `body` TEXT(200) NOT NULL,\r\n    cateItemId INT(10) NOT NULL, # 공지 / 지원글 중에 어디에 달리는 건지 구분되게\r\n    articleId INT(10) NOT NULL \r\n);',9,0,1),
(517,'2020-08-11 09:16:03','2020-08-11 09:16:03',1,1,'[Spring 오디션 앱] 진행 상황','## 구현 완료\r\n### 게시물\r\n- 작성\r\n- 삭제\r\n- 수정\r\n\r\n### 댓글\r\n- 작성\r\n- 삭제 \r\n- 수정\r\n- ajax 적용\r\n\r\n## 구현 할것\r\n### 게시글\r\n- 동영상 첨부\r\n- 동영상 스트리밍 되게\r\n\r\n### 댓글 동영상 첨부\r\n- 동영상 첨부\r\n- 동영상 스트리밍 되게',1,0,1),
(518,'2020-08-11 10:16:22','2020-08-11 10:16:22',1,1,'https://comento.kr/edu/learn/ITSW/SW%EA%B0%9C%EB%B0%9C-G261','https://comento.kr/edu/learn/ITSW/SW개발-G261',3,0,1),
(519,'2020-08-11 14:47:30','2020-08-11 14:47:30',0,0,'제목1','내용1',0,0,0),
(520,'2020-08-11 14:47:30','2020-08-11 14:47:30',0,1,'제목2','내용2',0,0,0),
(521,'2020-08-11 14:47:30','2020-08-11 14:47:30',0,1,'제목3','내용3',0,0,0),
(522,'2020-08-11 17:35:14','2020-08-11 17:35:14',1,1,'이모지 단축키. CTRL + 마침표','?????‍??‍??????????????????',3,0,1),
(526,'2020-08-14 10:16:26','2020-08-14 10:16:26',1,1,'[Spring 오디션 앱] 진행 상황2','## 게시물\r\n### 구현 완료:\r\n - 영상 첨부 가능\r\n - 수정, 삭제 가능\r\n\r\n### 구현 필요:\r\n   - 첨부 영상 교체\r\n   - 영상만 삭제\r\n   \r\n## 댓글\r\n### 구현 완료:\r\n- 영상 첨부\r\n- 댓글 삭제, 수정\r\n\r\n### 구현 필요:\r\n- 댓글 수정시 영상 첨부 되게, 교체도\r\n-',1,0,1),
(527,'2020-08-18 09:39:16','2020-08-18 09:39:16',1,1,'스크롤 게이지 올라가는거','https://tyle.io/blog/61',1,0,1),
(528,'2020-08-21 11:59:43','2020-08-21 11:59:43',1,1,'ajax 아이디 유효성 검사','https://kutar37.tistory.com/entry/자바스크립트-Ajax-비동기방식-아이디-유효검사',1,0,1),
(529,'2020-08-24 11:51:43','2020-08-24 11:51:43',1,1,'인터셉터','https://elfinlas.github.io/2017/12/28/SpringBootInterceptor/',2,0,1);

/*Table structure for table `cateItem` */

DROP TABLE IF EXISTS `cateItem`;

CREATE TABLE `cateItem` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `name` CHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cateItem` */

INSERT  INTO `cateItem`(`id`,`regDate`,`name`) VALUES 
(1,'2020-06-30 11:45:27','공부계획'),
(2,'2020-06-30 11:45:27','일상'),
(3,'2020-06-30 11:45:27','프론트엔드'),
(4,'2020-06-30 11:45:27','백엔드');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `loginId` CHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginPw` CHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` CHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` CHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` CHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` INT(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginId` (`loginId`),
  UNIQUE KEY `nickname` (`nickname`),
  KEY `loginId_2` (`loginId`,`nickname`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `member` */

INSERT  INTO `member`(`id`,`regDate`,`updateDate`,`loginId`,`loginPw`,`name`,`nickname`,`email`,`level`) VALUES 
(1,'2020-07-16 12:19:16','2020-07-16 12:19:16','admin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','admin','admin','samlee2552@gmail.com',10),
(2,'2020-07-16 12:21:16','2020-07-16 12:21:16','saml2l','fc33e468c1ae679e6c3918d29b1391e678eb755fafd4ac3cd65986914ae5c22f','이상범','쌤리','saml2l@naver.com',10),
(3,'2020-07-24 11:46:26','2020-07-24 11:46:26','danny','668e2b73ac556a2f051304702da290160b29bad3392ddcc72074fefbee80c55a','danny','danny','dannykim5603@gmail.com',0),
(4,'2020-08-02 18:18:24','2020-08-02 18:18:24','dureotkd','de1f7ef09096f5accd952bd311f27107105eb752cec7401d89de86a1b49803ea','성민','까리하게한방','dureotkd123@naver.com',0);

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `articleReply`;

CREATE TABLE `articleReply` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `articleId` INT(10) UNSIGNED NOT NULL,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME DEFAULT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL DEFAULT '1',
  `body` CHAR(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reply` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
