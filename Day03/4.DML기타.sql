/*insert*/

-- BOOK 테이블에 새 책을 추가. '스포츠의학', 출판사 한솔의 학서적, 가격 90,000원
INSERT INTO Book (bookid, bookname, publisher, price)
VALUES (11, '스포츠의학', '한솥의학서적', 90000);

SELECT * FROM Book;

INSERT INTO Book (bookid, bookname, publisher)
VALUES (12, '스포츠의학', '한솥의학서적');

-- 대량입력 준비(BULK INSERT)
CREATE TABLE Imported_Book (
  bookid      INTEGER,
  bookname   VARCHAR(40),
  publisher   VARCHAR(40),
  price      INTEGER
);

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);
COMMIT;

SELECT * FROM Imported_Book;

SELECT * FROM Book;

-- 대량입력(BULK INSERT)
INSERT INTO Book (bookid, bookname, publisher, price)
SELECT bookid, bookname, publisher, price  FROM Imported_Book;

/*update*/
-- Customer에서 고객번호 5번의 고객주소를 '대한민국 부산'으로 수정하시오
SELECT * FROM Customer WHERE custid = 5;

SET SQL_SAFE_UPDATES=1; -- SQL 안전모드 켜기

UPDATE Customer 
   SET address = '대한민국 부산'
     , phone = '010-9090-0909'
 -- WHERE custid = 5; -- WHERE 절이 빠지는 순간, 끔찍한 일이 벌어짐
     
-- 14번 데이터 추가
INSERT INTO Book (bookid, bookname, publisher)
VALUES (14, '스포츠의학3', '한솥의학서적3');

SELECT * FROM Book;

-- 서브쿼리를 활용해서 UPDATE 수행
-- BOOK테이블의 14번 책 출판사를  Imported_Book 22번
-- 책 출판사와 동일하게 변경하시오.
UPDATE Book
   SET publisher =(SELECT publisher FROM Imported_Book
 				    WHERE bookid = 22)
 WHERE bookid = 14;

SELECT * FROM Book;

   
UPDATE Customer SET address = '대한민국 부산' 

/*delete*/
-- 수정과 삭제 전 아래쿼리 확인

SELECT * FROM Book_copy
 WHERE bookid = 6;

DELETE FROM Book_copy 
 WHERE bookid = 6;

-- 1. 안전 모드 해제
SET SQL_SAFE_UPDATES = 0;

-- Customer 복사
CREATE TABLE Customer_copy
SELECT * FROM Customer;

SELECT * FROM Customer_copy;



-- 삭제여부 컬럼 추가
ALTER TABLE Customer_copy
 ADD COLUMN ISDEL CHAR(1);

-- 삭제를 하지 않고 삭제플래그를 활용
UPDATE Customer_copy 
   SET ISDEL = 'Y'
     WHERE custid = 4;

-- ISDEL이 NULL이거나 'N'(탈퇴하지않음)
SELECT * FROM Customer_copy
 WHERE ISDEL IS NULL
    OR ISDEL = 'N';

