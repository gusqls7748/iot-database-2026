use madangdb;

-- 한글이 나눔고딕으로 출력됨
-- 일반 조회 쿼리
select * from Book;

-- 1. 김연아 고객의 번호를 찾으시오
select phone  from Customer 
where name='김연아';

-- 한줄 주석
/*여러줄 
	주석*/
    
    -- 모든 쿼리의 마지막은; 으로 끝냄.
    SELECT * from Book;

-- 테이블에서 가져오는 데이터가 아니면 FROM절 생략
SELECT NOW();

-- 열명시
SELECT bookname,price 
	FROM Book;

-- 필터링
SELECT * FROM customer
	WHERE custid > 1 AND custid < 5;