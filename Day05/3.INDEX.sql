-- 인덱스

-- 인덱스 생성용 테이블
CREATE TABLE Noidx_Book (
	bookid integer,
	bookname varchar(40),
	publiser varchar(40),
	isbn varchar(13),
	releaseyear integer,
	price decimal(8, 0)
);

DROP Table Noidx_Book;
DROP Table Idx_Book;


-- PK있는 책테이블
CREATE TABLE Idx_Book (
	bookid integer,
	bookname varchar(40),
	publiser varchar(40),
	isbn varchar(13),
	releaseyear integer,
	price decimal(8, 0),
	PRIMARY key(bookid)
);

-- Noidx_Book 인덱스 걸기
CREATE UNIQUE INDEX idx_book ON Noidx_Book(bookid);

-- PK가 있으면 PK컬럼은 NOT NULL
INSERT INTO Idx_Book value (1, '프로젝트헤일메리', '미디어', '9789111111111',2022, 18000);

-- UNIQUE만 있으면 NULL가능
INSERT INTO Noidx_Book value (NULL, '프로젝트헤일메리', '미디어', '9789111111111',2022, 18000);

-- PK인덱스가 있는 Idx_Book에 다른 인덱스 생성
CREATE INDEX idx_book_bookname ON Idx_Book(bookname);


-- 두 컬럼으로 인덱스
CREATE INDEX idx_book_isbn_releaseyear ON Idx_Book(isbn, releaseyear);

-- 삭제후 다시 생성
DROP INDEX idx_book_isbn_releaseyear ON Idx_Book;

-- 현재 테이블 상태 분석
ANALYZE TABLE Book;

-- 테이블 인덱스 최적화
OPTIMIZE TABLE Book;