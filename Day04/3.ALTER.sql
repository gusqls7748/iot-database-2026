-- ALTER 객체수정

-- NewBook 테이블에 ISBN 컬럼을 추가하시오
ALTER TABLE NewBook 
  ADD isbn CHAR(13);

-- 데이터 추가
INSERT INTO NewBook VALUES
(1, '프로젝트 헤일메리', '알에이치', 22000, '9788925588735');

SELECT * FROM NewBook;

-- NewBook 테이블에 장르 컬럼을 추가하시오
-- 이전에 데이터에 empty가 추가
ALTER TABLE NewBook
  ADD genre varchar(10) NOT NULL;

SELECT LENGTH(genre) FROM  NewBook 
  WHERE bookid = 1;

-- NewBook에 isbn을 삭제하시오
ALTER TABLE NewBook 
	DROP COLUMN isbn;

-- NewBook publsher에 NOT NULL 제약조건을 추가하시오
ALTER TABLE NewBook 
MODIFY publisher varchar(40) NOT NULL;

-- 기본키 추가는 alter로 거의 하지 않음
-- import_book
ALTER TABLE NewBook 
  ADD PRIMARY KEY(bookid);