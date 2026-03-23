/*
 * 새 도서를 추가하면, 자동으로 Book_log 테이블에 추가된 내용을 기록하는 트리거
 */

-- 로그테이블 생성
CREATE TABLE Book_log (
	log_idx INT PRIMARY KEY AUTO_INCREMENT,
	bookid_l INT,
	bookname_l   varchar(40),
	publisher_l  varchar(40),
	price_l	int,
	dml_type  varchar(10),
	dml_dt	 datetime DEFAULT now()
);



SELECT * FROM Book;
SELECT * FROM Book_log;  -- 현재 아무 데이터도 없음

-- Book 테이블에 데이터 추가
INSERT INTO Book VALUES (48, '겨울왕국', '레리꼬', 18500);

-- 위 데이터 수정
UPDATE Book 
   SET publisher = '디즈니'
     , price = 20000
 WHERE bookid = 48;
   
-- 위 데이터 삭제
DELETE FROM Book_log 
 WHERE bookid_l = 47;