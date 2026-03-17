/*CREATE*/

-- TABLE
-- Newbook 테이블생성
CREATE TABLE NewBook (
	bookid INTEGER,
	BOOKNAME varchar(20),
	publisher varchar(20),
	price decimal(10, 2) -- 왜국은 달러 떄문에 decimal 쓰는데가 많다
);

-- 컬럼은 대소문자 구분없음. 테이블, 객체명은 대소문자 구분
-- MYSQL 해당버전 특징
SELECT bookid, BOOKNAME, price, publisher 
	FROM NewBook;

-- 테이블 삭제
DROP TABLE NewBook;

-- NewBook 테이블 생성
-- 기본키 추가해서 생성
CREATE TABLE NewBook (
	bookid INTEGER PRIMARY key,
	BOOKNAME varchar(20) NOT NULL,
	publisher varchar(20) NOT NULL,
	price decimal(10, 2)NOT NULL 
);

-- 제약조건을 따로 적는 방법
-- 기본키가 하나 이상이면 반드시 아래의 방법으로 작성
-- PRIMARY KEY (bookid, bookname)
CREATE TABLE NewBook (
	bookid INTEGER,
	BOOKNAME varchar(20) NOT NULL,
	publisher varchar(20) UNIQUE,
	price decimal(10, 2)DEFAULT 10000 CHECK (price > 1000),
	PRIMARY KEY (bookid, bookname) 
);

-- PRIMARY KEY는 UNIQUE(유니크)에 NOT NULL(낫널)

INSERT INTO NewBook (bookid, BOOKNAME, publisher, price)
VALUES (1, '야구의 추억', '가나', 9000);

INSERT INTO NewBook (bookid, BOOKNAME, publisher)
VALUES (2, '골프 바이블', '대한미디어');

INSERT INTO NewBook (bookid, BOOKNAME, publisher, price)
VALUES (3, '골프여제 박세리', '피어슨', 1001);