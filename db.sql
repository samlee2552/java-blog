DROP DATABASE IF EXISTS site31;
CREATE DATABASE site31;
USE site31;

# 한글 출력 안될 시
SET NAMES utf8mb4;

CREATE TABLE cateItem (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL UNIQUE
);

# 1. 공부계획 2. 일상 3. 

INSERT INTO cateItem
SET regDate = NOW(),
`name` = '공부계획';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = '일상';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = '프론트엔드';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = '백엔드';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = 'IT / 기타';

# 게시물 테이블 생성
DROP TABLE IF EXISTS article;
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    cateItemId INT(10) UNSIGNED NOT NULL,
    displayStatus TINYINT(1) UNSIGNED NOT NULL,
    `title` CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
);

# 1번글 생성
INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
cateItemId = 6,
displayStatus = 1,
title = '블로그를 시작합니다.',
`body` = 


# 회원 테이블 생성
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `loginId` CHAR(100) NOT NULL UNIQUE,
    `loginPw` CHAR(100) NOT NULL,
    `name` CHAR(100) NOT NULL, 
    `nickname` CHAR(100) NOT NULL UNIQUE,
    `email` CHAR(100) NOT NULL,
    `level` INT(1) UNSIGNED DEFAULT 0 NOT NULL
);

# 댓글 테이블 생성
CREATE TABLE articleReply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    articleId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    `like` INT(10) UNSIGNED DEFAULT 0 NOT NULL,
    displayStatus TINYINT(1) UNSIGNED NOT NULL,
    `body` TEXT NOT NULL
);

# 마스터 회원 생성
INSERT INTO `member` SET
regDate = NOW(),
updateDate = NOW(),
`loginId` = 'admin',
`loginPw` = sha2('admin', 256),
`name` = 'admin',
`nickname` = 'admin',
`email` = 'admin@admin.com',
`level` = 10;

#회원 id AUTO_INCREMENT 초기화
ALTER TABLE `member` AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE `member` SET id = @COUNT:=@COUNT+1;

DROP TABLE IF EXISTS attr;
CREATE TABLE attr (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL UNIQUE,
    `value` TEXT NOT NULL
);