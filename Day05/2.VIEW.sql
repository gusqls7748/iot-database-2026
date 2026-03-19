-- 뷰

SELECT *
  FROM (SELECT c.custid, c.name, b.bookid, b.price ,o.orderid, o.saleprice, o.orderdate  
 		  FROM Customer c 
  		  JOIN Orders o 
    		ON c.custid = o.custid 
  		  JOIN Book b 
    		ON o.bookid = b.bookid) v
  WHERE v.custid =4;

-- 뷰 생성
CREATE VIEW v_orders AS
SELECT c.custid, c.name, b.bookid, b.price ,o.orderid, o.saleprice, o.orderdate  
 		  FROM Customer c 
  		  JOIN Orders o 
    		ON c.custid = o.custid 
  		  JOIN Book b 
    		ON o.bookid = b.bookid;

SELECT *
  FROM  v_orders v
  WHERE v.custid =4;

SELECT v.name, v.price, v.saleprice, v.orderdate
  FROM v_orders v;

-- v_book 생성
CREATE VIEW v_book AS 
SELECT * 
  FROM Book;

SELECT * FROM v_book;

INSERT INTO v_book
VALUES (40, '에이리언 어스', '파라마운트미디어', 20000);

UPDATE v_book
   SET publisher = '20세기미디어'
 WHERE bookid = 40;

SELECT * from v_orders;

-- 뷰 생성/수정
CREATE OR REPLACE VIEW v_orders AS
SELECT c.custid, c.name
	 , b.bookid, b.price 
	 , o.orderid, o.saleprice, o.orderdate  
 		  FROM Customer c 
  		  JOIN Orders o 
    		ON c.custid = o.custid 
  		  JOIN Book b 
    		ON o.bookid = b.bookid;

-- 뷰삭제
DROP VIEW v_book;