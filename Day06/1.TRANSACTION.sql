/* 트랜잭션 기본*/

-- 계좌 테이블 생성
CREATE TABLE accounts(
	id INT PRIMARY KEY,
	owner varchar(40),
	balance Int
);

-- 데이터 추가
INSERT INTO accounts (id, owner, balance)
VALUES (1, 'kim', 10000),(2, 'LEE', 20000),(3, 'sung', 10000000);

