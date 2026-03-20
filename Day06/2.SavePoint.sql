-- 트랜잭션 사용가능 여부 확인
-- 1 자동커밋상태(트랜잭션확인 불가)
-- 0 트랜잭션 사용 모드
SELECT @@autocommit;

-- 자동커밋 끄기
SET autocommit = 0;

-- 트랜잭션 사용순서
START TRANSACTION;

COMMIT;
ROLLBACK;

-- 2. Lee 계좌에서 1000원 출금
START TRANSACTION;

UPDATE accounts
   SET balance = balance - 30000  -- where 절 없으면 데이터를 잃으니깐 경고 날리는 거임
 WHERE id = 2;

SELECT * FROM accounts;

COMMIT;
ROLLBACK;

-- 3. KIM -> Sung 5000원 송금
START TRANSACTION;

-- kim에서 출금
UPDATE accounts
   SET balance = balance - 5000
  WHERE id = 1;

-- sung에게 입금
UPDATE accounts
   SET balance = balance + 5000
  WHERE id = 3;

SELECT * FROM accounts;

COMMIT;
ROLLBACK;

-- 4. kim -> lee 송금 중 문제발생
-- SAVEPOINT 다시!
START TRANSACTION;

-- kim에서 출금
UPDATE accounts
   SET balance = balance - 1000
  WHERE id = 1;

SAVEPOINT sp_transfer;

-- lee에게 입금
UPDATE accounts
   SET balance = balance + 1000
  WHERE id = 2;

SELECT * FROM accounts;

ROLLBACK TO sp_transfer; 

ROLLBACK;
COMMIT;

-- 현재 MYSQL DB엔진 종류확인
-- innoDB(최신 버전엔진), MyISAM(구버전 5.5이하)
-- MYISAM 트랜잭션 처리가 필요X
SHOW TABLE STATUS LIKE 'accounts';

-- 현재 실행중 트랜잭션 조회 쿼리(root만 가능)
SELECT * FROM information_schema.INNODB_TRX it;
