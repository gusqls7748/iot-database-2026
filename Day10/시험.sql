-- 1번 
SELECT *  FROM members m ;
SELECT *  FROM books b;
SELECT * FROM rentals r ;
SELECT * FROM division d;

SELECT m.member_name AS 회원명
	 , b.book_name AS 책제목
	 , r.rentalDate AS 대여일
  FROM rentals r
  JOIN members m  ON r.member_idx = m.member_idx 
  JOIN books b ON r.book_idx = b.book_idx 
 WHERE r.returnDate  IS NULL;

-- 2번
SELECT *  FROM members m ;
SELECT *  FROM books b;
SELECT * FROM rentals r ;

SELECT m.member_idx AS 회원번호
	 , m.member_name AS 회원명
	 , COUNT(r.rental_idx) as 대여횟수
  FROM rentals r
  LEFT JOIN members m ON r.member_idx = m.member_idx 
 GROUP BY m.member_idx ,m.member_name  
 ORDER BY 대여횟수 DESC;

--- 3번
SELECT *  FROM members m ;
SELECT *  FROM books b;
SELECT * FROM rentals r ;
SELECT * FROM division d;

SELECT d.div_code AS 장르코드
	 , d.div_name AS 장르명
	 , count(b.book_idx) as 도서수
  FROM books b
 RIGHT JOIN division d ON b.div_code = d.div_code 
 GROUP BY d.div_code, d.div_name;

-- 4.  한번도 대여되지 않은 도서를 조회하시오
-- 잔혹한 어머니의 날 1 부터 총 46건입니다
SELECT *  FROM members m ;
SELECT *  FROM books b;
SELECT * FROM rentals r ;
SELECT * FROM division d;

SELECT *
  FROM books b
  LEFT JOIN rentals r ON b.book_idx = r.book_idx 
 WHERE r.rental_idx IS null;

-- 5번 평균 대여수보다 많이 대여한 회원을 조회하시오
SELECT *  FROM members m ;
SELECT *  FROM books b;
SELECT * FROM rentals r ;
SELECT * FROM division d;

SELECT m.member_idx AS 회원번호
	 , m.member_name AS 회원명
	 , COUNT(r.rental_idx) as 대여횟수
  FROM rentals r
  JOIN members m ON r.member_idx = m.member_idx 
 GROUP BY m.member_idx , m.member_name  
 HAVING count(r.rental_idx) > (SELECT count(*) / count(DISTINCT member_idx) FROM rentals);

SELECT m.member_idx AS 회원번호
	 , m.member_name AS 회원명
	 , COUNT(r.rental_idx) as 대여횟수
  FROM rentals r
  JOIN members m ON r.member_idx = m.member_idx 
 GROUP BY m.member_idx ,m.member_name  
HAVING count(r.rental_idx) > (SELECT count(*) / count(DISTINCT member_idx) FROM rentals);

SELECT m.member_idx AS 회원번호
     , m.member_name AS 회원명
     , COUNT(r.rental_idx) AS 대여횟수
  FROM members m
  JOIN rentals r ON m.member_idx = r.member_idx 
 GROUP BY m.member_idx, m.member_name
HAVING COUNT(r.rental_idx) > (SELECT AVG(t.cnt) 
      							FROM (
        					  		  SELECT COUNT(*) AS cnt 
          							  	FROM rentals 
         							   GROUP BY member_idx) AS t);

-- 6번
SELECT *  FROM members m ;
SELECT *  FROM books b;
SELECT * FROM rentals r ;
SELECT * FROM division d;

-- 1. 평균보다 비싼 책들만 먼저 뽑습니다 (WHERE 절 사용)
SELECT d.div_name  AS 장르명
     , COUNT(*) AS 비싼책권수
  FROM books b
  JOIN division d ON b.div_code = d.div_code
 WHERE b.price > (SELECT AVG(price) FROM books) 
 GROUP BY d.div_name
 ORDER BY 비싼책권수 DESC
 LIMIT 3;
	(SELECT AVG(price) FROM  books b);

-- 제 2: 열혈 독자 목록 (HAVING 숙달)
-- "한 번이라도 대여를 한 회원들의 '평균 대여 횟수'보다 더 많이 대여한 회원들의 이름과 대여 횟수를 조회하세요." (5번 문제의 복습입니다!)
SELECT m.member_name 
	 , m.member_idx  
  FROM members m 
  JOIN rentals r ON m.member_idx = r.member_idx 
 GROUP BY m.member_name, m.member_idx 
HAVING count(m.member_idx) >  (SELECT avg(t.cnt) 
  FROM (SELECT count(*) AS cnt 
  FROM rentals 
  GROUP BY member_idx)AS t) ;


      							
;

