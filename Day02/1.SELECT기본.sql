-- 서점에 어떤 도서가 있는지 알고싶다
-- 모든 도서의 이름과 가격을 조회하시오
SELECT bookname 
	 , price 
  FROM Book; 

-- 모든 도서의 가격와 이름을 조회하시오
SELECT price 
	 , bookname 
  FROM Book;

-- 모든 도서의 도서번호, 도서명, 출판사, 가격 조회하시오
SELECT * 
  FROM Book;

SELECT bookid
	 , bookname
	 , publisher 
	 , price 
  FROM Book;

-- 도서 테이블에 중복을 제외한 모든 출판사를 조회하세요
SELECT DISTINCT publisher 
  FROM Book;

SELECT ALL publisher 
  FROM Book;

-- WHERE 절
-- 가격이 10000이상 20000이하인 도서 조회하세요
SELECT *
  FROM Book
 WHERE price BETWEEN 10000 AND 20000;

-- between은 and로 변경 가능
SELECT *
  FROM Book
 WHERE price >= 10000 
   AND price <= 20000;

-- 출판사가 굿스포츠, 대한미디어인 도서를 조회하시오
SELECT *
  FROM Book
 WHERE publisher IN ('굿스포츠', '대한미디어');

-- OR와 동일. 단, 값이 너무 많으면 IN절이 훨씬 효율적
SELECT *
  FROM Book
 WHERE publisher = '굿스포츠'
    OR publisher = '대한미디어';

-- 출판사가 굿스포츠, 대한미디어가 아닌 도서를 조회하시오.
SELECT *
  FROM Book
 WHERE publisher NOT IN ('굿스포츠', '대한미디어');

-- LIKE 패턴 필터링
-- 축구의 역사 출간한 출판사를 조회하시오
SELECT bookname, publisher 
  FROM Book
 WHERE bookname = '축구의 역사';

SELECT bookname, publisher 
  FROM Book
 WHERE bookname Like '축구의 역사';

-- 책 제목이 축구로 시작하는 책을 출판한 출판사를 조회하시오
SELECT bookname, publisher 
  FROM Book
 WHERE bookname Like '%축구%';

-- 책 제목이 축구로 끝나는 책을 출판한 출판사를 조회하시오
SELECT bookname, publisher 
  FROM Book
 WHERE bookname Like '%축구';

-- 책 제목이 축구로 포함된 책을 출판한 출판사를 조회하시오
SELECT bookname, publisher 
  FROM Book
 WHERE bookname Like '%축구';

-- 책 제목이 축구로 시작하고 총 제목 길이가 8자리인
-- 책을 출판한 출판사를 조회하시오
SELECT bookname, publisher 
  FROM Book
 WHERE bookname Like '축구______';

-- 도서이름의 왼쪽 두번쨰 위치에 '구'라는 
-- 문자열을 갖는 도서를 검색하시오
SELECT *
  FROM Book 
 WHERE bookname LIKE '_구%';

-- 축구에 관한 도서중 가격이 20000원 이상인 도서 조회하시오
SELECT *
  FROM Book 
 WHERE bookname LIKE '%축구%'
   AND price >= 20000;

-- ORDER BY 오름차순, 내림차순 정렬
-- 도서를 이름순으로 조회하시오
SELECT *
  FROM Book
 ORDER BY bookname;

-- 도서를 가격순으로 조회하시오, 가격이 같으면 이름순으로 조회하시오
SELECT *
  FROM Book
 ORDER BY price desc, bookname;

-- 집계함수 SUM
-- 2번이 김연아 고객이 주문한 도서의 총 판매액을 조회하세요
SELECT *
  FROM Customer
 WHERE name = '김연아';

-- 2번이 김연아 고객이 주문한 도서의 총 판매액을 조회하세요
SELECT sum(saleprice) AS "총 매출"
  FROM Orders
 WHERE custid = 2;

-- Alias
SELECT b.bookid AS "책순번"
	 , b.bookname AS "책 제목"
	 , b.price AS "정가" 
  FROM Book AS b;

-- 고객이 주문한 도서의 총 판매액, 평균, 최저, 최고가 조회하세요
SELECT sum(saleprice) "Total"
	 , avg(saleprice) "Average"
	 , min(saleprice) "Minium"
	 , max(saleprice) "maximum"
  FROM Orders o;

-- 마당서점의 총 도서 판매수를 조회하시오
SELECT count(*) "총 판매수"
	 , count(o.orderid) -- 아래와 개수 차이가 날 수 있음
  FROM Orders o;

-- Group BY 어느 고객이 얼마나 주문했는지 알고 싶음
-- 고객별로 주문한 도서의 총 수량과 총 판매액을 조회하시오
-- 내가 검색하고 싶은 group by 컬럼이 있다면 group by에도 컬럼 넣어야한다.
SELECT o.custid
	 , count(*) AS "판매 수량" 
	 , sum(o.saleprice) "총 판매액"
  FROM Orders o
 GROUP BY o.custid;

SELECT *
  FROM Orders;

-- 가격이 8천원 이상인 도서를 구매한 고객에 고객별 주문도서, 총 수량
-- 조회하세요. 단 두 권 이상 고매한 고객만 조회합니다.
 SELECT o.custid, count(*) "도서수량"
   FROM  Orders o 
  WHERE o.saleprice >= 8000
  GROUP BY o.custid 
 Having count(*) >= 2
  ORDER BY o.custid DESC;

-- 마당서점의 고객 요구하는 다음 질문에 대해 SQL문 작성
SELECT *
  FROM Book
 WHERE bookid = '1';

SELECT *
  FROM Book
 WHERE 


SELECT DISTINCT custid, saleprice 
  FROM Orders;