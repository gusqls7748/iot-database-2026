-- CREATE 계속


DROP TABLE NewBook;

-- NEW Book, New Order 테이블 생성
CREATE TABLE NewBook(
	bookid INTEGER PRIMARY KEY,
	bookname varchar(40) NOT NULL ,
	publisher varchar(40),
	price decimal(10, 2) DEFAULT 10000
);

-- NewCustomer 테이블
-- DROP TABLE NewCostomer;
CREATE TABLE  NewCustomer(
	custid INTEGER,
	custname varchar(40),
	address varchar (120) NOT NULL,
	phone varchar(20) NOT NULL,
	PRIMARY KEY(custid)
);


-- NewOrder
-- 주문번호(PK), 고객번호(FK), 책번호(FK)
-- 판매가격, 판매일자
CREATE TABLE NewOrder (
	orderid INTEGER,
	custid integer NOT NULL,
	bookid integer, -- 기본 NULL
	saleprice decimal(10, 2),
	orderdate datetime,
	PRIMARY KEY (orderid),
	FOREIGN KEY (custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE,
	FOREIGN KEY (custid) REFERENCES NewBook(bookid) ON DELETE CASCADE
);

-- OldBook 생성 AUTO_INCREMENT
CREATE TABLE OldBook(
	bookid INTEGER PRIMARY KEY AUTO_INCREMENT,
	bookname varchar(40) NOT NULL,
	publisher varchar(40),
	price decimal(10,2)
);

-- bookid는 생략.
INSERT INTO OldBook (bookname, publisher, price)
VALUES ('프로젝트 헤일메리', '대한미디어', 22000);

SELECT * FROM OldBook;

-- 데이터베이스 생성
-- 관리자에서 가능!
CREATE DATABASE testdb;

-- 사용자 생성, 뷰, 인덱스...