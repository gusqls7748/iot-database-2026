-- 세션 2번 세션: 접속하는 객체
select @@autocommit;

set autocommit = 0;



-- start TRANSACTION;
UPDATE accounts 
  SET balance = balance - 500
 WHERE id = 2;

 SELECT * from accounts;


-- 다른세션에서 다룬 데이터를 수정
 UPDATE accounts 
  SET balance = balance - 1500
 WHERE id = 3;

  commit;

 ROLLBACK;

-- Non-Repeatable Read
 -- 격리수준 하강
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 격리수준 원상태 복귀
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

UPDATE accounts
    set balance = 30000
where id = 1;

SELECT * from accounts;

commit;

-- Phantom Read 세션 2
insert into employees (name, salary) values('Dread',6500);

select * from employees;

commit;
ROLLBACK;

-- Deadlock
-- AutoCommit 해체
Select @@autocommit;

set autocommit = 0;

select * from accounts;
select * from employees;

commit;

-- 6번 id 급여를 8000으로 변경
update employees
  set salary = 8000
 where id = 8;

 -- 9번 id 급여를 8000으로 변경
update employees
  set salary = 8000
 where id = 9;

 update accounts
    set balance = 7000
 where id = 2;

 -- 테이블락
 Select * from accounts;

 UPDATE accounts 
  SET balance = 9000
 WHERE id = 3;

 ROLLBACK;
