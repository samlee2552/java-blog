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

CREATE TABLE article (
   id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   regDate DATETIME NOT NULL,
   cateItemId INT(10) UNSIGNED NOT NULL,
   displayStatus TINYINT(1) UNSIGNED NOT NULL,
   `title` CHAR(200) NOT NULL,
   `body` TEXT NOT NULL
);

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
cateItemId = 2,
displayStatus = 1,
title = '블로그에 오신걸 환영합니다.',
`body` = '안녕하세요 반갑습니다.'
SELECT * FROM article;
