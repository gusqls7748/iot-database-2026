/*동시성 제어(Concurrency control)*/

-- 테이블 수정
ALTER TABLE accounts 
MODIFY owner varchar(40) NOT NULL,
MODIFY balance int NOT NULL;

truncate TABLE accounts;

SELECT  * FROM accounts;

SELECT @@autocommit;

ROLLBACK;
COMMIT;

-- 새로 데이터 입력
INSERT INTO accounts (id, owner, balance)
VALUES (1, 'kim', 10000),(2, 'LEE', 20000),(3, 'sung', 10000000);

SELECT * FROM accounts;

-- 기본 락 실행
-- 세션 1번
-- START TRANSACTION;

UPDATE accounts 
  SET balance = balance - 1000
 WHERE id = 2; -- 

SELECT * FROM accounts;

COMMIT;
ROLLBACK;

-- Non-Repeatabke Read
-- 격리수준 하강
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT balance FROM accounts WHERE id = 1;

-- 격리수준 원상태 복귀
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

COMMIT;

-- Phantom Read
-- 테이블 생성
CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name varchar(50),
	salary int
);

INSERT INTO employees (name, salary)
VALUES ('Ashely', 3000), ('Bread', 4000), ('Canton', 6000);

SELECT * FROM employees;

ROLLBACK;
COMMIT;

-- 팬텀 리드 세션 1
-- 격리수준 하강
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT * FROM employees WHERE salary >= 5000;

COMMIT;

-- Deadlock
-- AutoCommit 해체
SELECT @@autocommit;
SET autocommit = 0;

COMMIT;

-- 9번 id 계좌금액 7000원 변경
update employees
  set salary = 7000
 where id = 9;

select * from employees;

select * from accounts;

-- 테이블 락 
LOCK Tables accounts WRITE;
LOCK Tables accounts READ; -- 읽기 가능 테이블락


UPDATE accounts 
  SET balance = 9000
 WHERE id = 3;

SELECT * FROM accounts;

UNLOCK tables;

