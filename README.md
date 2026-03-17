# iot-database-2026
2026년 Iot개발 데이터베이스 리포지토리

- 미리보기
ctrl + shift + v

![1.png](1.png) -> ![alt text](2.png) - > ![alt text](3.png)

## 1일차

### 데이터/정보/지식

- `데이터` : 단순한 수치가 값
- `정보` : 데이터의 의미를 부여하는 것
- 지식( Knowlege) : 정보를 통한 사물이나 현상에 대한 이해

### 데이터 베이스

- 조직에 필요한 정보를 위해서 논리적으로 연관된 데이터를 구조적으로 통합, 저장해 놓은 것
- `도메인` Domain - 자기 업무에 관련된 지식
- 기업/기관은 자기 도메인 정보만 저장
- 보통 CS(Client - server) 프로그램이라고 명칭. DB쪽이 서버, 프로그램쪽이 클라이언트

#### 데이터베이스 개념, 특징

- 통합 데이터 - `데이터 중복 최소화`, 중복으로 인한 데이터 `불일치 현상 제거`
- 저장 데이터 - 문서가 아닌 `컴퓨터 저장장치에 저장`. 반영구적 저장
- 운영 데이터 - 저장된 상태에서 `업무를 위해 검색`, 수정 등
- 공용 데이터 - 여러 사람이 업무를 위해서 `공동으로 사용`

#### 특징

- 실시간 접근성 - 수 초 내 결과 리턴
- 계속적 변화 - 추가, 수정, 조회, 삭제가 가능
- 동시 공유 - 여러 사용자가 동시에 공유, 같은 데이터를 사용하더라도 최대한 문제가 없게 처리
- 내용에 따른 참존 - 물리적인 저장 데이터가 아닌 데이터값을 창조

#### DBMS

- 데이터베이스를 관리하는 시스템 DataBase Management System의 약자
- DBMS를 데이터베이스, DB로 통칭

#### DBMS 장점

- 데이터 중복최소화, 데이터 일관성, 데이터 독립성, 관리기능(백업, 복구, `동시성제어`, 계정, 보안), 개발 생산성, 데이터 무결성 유지, 데이터 표준 준수...

![alt text](4.png)


### 데이터베이스 설치

#### 로컬 설치

1. https://www.mysql.com/ 사이트 다운로드 메뉴 (설치는하면안됨)
2. MySQL Community Edition 아래링크 클릭
3. MySQL Installer for Windows 링크 클릭
4. MySQL Installer 8.0.45 , Windows (x86, 32-bit), MSI Installer 500M 이상 다운로드
5. 회원가입이나 로그인 없이 No thanks, just start my download. 클릭
6. mysql-installer-community-8.0.45.0.msi 실행

#### 도커사용 설치

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

7. 일반적인 프로그램 설치와 동일

#### 도커사용 설치

- Docker - 애플리케이션 신속 구축, 테스트, 서비스할 수 있는 컨테이너 기반의 가상화 플랫폼
    - 온라인 상에서 이미지를 다운로드(Pull)
    - 실행하는 컨테이너로 만듬(Run)

1. 도커설치
    - https://www.docker.com/ 사이트 Download Docker Desktop 클릭
    - DOcker desktop Installer.exe 실행

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5-1.png)

- Close ANd Restart로 재부팅
- Docker subsription Service Agreement 창 Accept 클릭
- Linux용 Window 하위 시스템 설치 필수, `wsl --update` 실행

![alt text](image-5.png)

2. 도커 설정
- Start Docker Desktop when you sign in to your computer 체크

3. 도커 콘솔 명령어
    ```powershell
    > docker
    > docker -- version
    > docker search 이미지명
    > docker pull 이미지명
    > docker run ...
    ```

4. MySQL 설치
    - Powershell 열기
    - docker seach는 도커허브를 검색 기능

    ```powershell
    > docker search mysql
    ```

    - docker로 이미지 다운

    ```powershell
    > docker pull mysql:8.0.45
    ```

    ![alt text](image-6.png)

     -docker run 컨테이너 실행
    # \는 윈도우에서 사용불가, 여러줄 명령 불가능
     ```powershell
     > docker run -d --name mysql80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my123456 -e MYSQL_DATABASE=mydb -e MYSQL_USER=myuser -e MYSQL_PASSWORD=my123456 -v mysql80_data:/var/lib/mysql --restart unless-stopped mysql:8.0.45
     ```

    - 필요 계정
        - root(관리자) - my123456
        - myuser(일반사용자) - my123456

     - 옵션 설명
        - `--name mysql80` : 컨테이너 이름
        - `-p 3306:3306` : 포트번호 컴퓨터에서 접근하는 포트: 컨테이너 내부 포트
        - `MYSQL_ROOT_PASSWORD` : Mysql 관리자 root계정 비밀번호 초기화
        - `MYSQL_DATABASE` : 컨테이너 시작시 자동 생성할 DB
        - MYSQL_USER / MYSQL_PASSWORD : 일반사용자 계정
        - -v mysql80_data:/var/lib/mysql : 컨테이너 내 mysql 데이터 저장위치
        - --restart unless-stopped : 도커 재시작시 자동복구

        - docker ps - 현재 실행중인 컨테이너 확인

        - docker exec - 도커 컨테이너 내부 접속

         ```powershell
        docker exec -it mysql80 mysql -u root -p
        Enter password:
        ```
    5. MYSQL Workbench 설치

    - Database 개발툴
    - 로컬에서 다운로드한 MYSQL Installer 8.0.45.exe 실행
    - MYSQL Connections 옆 동그라미 + 아이콘 클릭

    ![alt text](image-7.png)

    ![alt text](image-8.png)

    6. DBeaver 개발툴 설치 (나중에)

    - https://dbeaver.io/download/ 다운로드
    - Download EXE 클릭
    - 일반적인 프로그램 설치와 동일

    7. Visual Studio Code DB 확장 설치
        - 확장 > Database 검색
        - Database Client 설치
        - Database                  ![alt text](image-11.png)
        - 연결은 다른 개발툴과 동일
    
    ![alt text](image-9.png)

    #### MYSQL 접속

    - 관리자계정 - root
        - 새 사용자 생성, 새 데이터베이스 생성, 권한, 백업 및 복구
    - 일반계정 - myuser, madang
        - 해당 데이터


    ### 기본 이론

    #### 관계형 데이터베이스

    - Relational Database
        - 1969년 E.FCodd 수학 모델에 근간해서 고안
        - 테이블을 초소단위로 구성
        - 각 테이블간 관계를 통해서 데이터모델 구성

    #### 데이터베이스 종류
    - 관계형 데이터베이스
        - Oracle, SQL Serve(MS), MYSQL(Oracle), MariaDB(오픈소스)
    - NoSQL 데이터베이스
        - MongoDB, Readis, Apache Cassandra, ....
    - In-memory 데이터베이스
        - SAP HANA... 

    #### SQL

    실행 ctrl + enter

    - Structured Query Language
        - `구조화된 질의 언어`
        - 데이터 베이스에서 데이터를 조작하고, 테이블과 같은 객체를 컨트롤하는 등의 작업을 수행하는 프로그래밍 언어

    - SQL 종료
        - `Data Manipulate Language`- 데이터 조작 언어. `SELECT`, `INSERT`, `UPDATE`, `DELETE` 와 같은 데이터를 조작하는 언어
        - `Data Definition Language` - 데이터 정의어. `CREATE`, `ALTER`, `RENAME`, `DROP` 같은 객체(데이터베이스, 테이블, 사용자, 뷰, 인덱스...)를 처리하는 언어. 
        - `Data Control Language` - 데이터 제어어 `GRANT`, `REVOKE` 와 같이 사용자에게 권한 주고 해제하는 기능을 처리하는 언어
        - `Transaction Control Language` - 트랜잭션 제어어. `BEGIN TRAN`, `COMMIT`, `ROLLBACK` 같은 트랜잭션 처리로 동시성 제어를 위한 언어

    ### SELECT 실습

    - DBeaver 설정
        - 환경설정 > 편집기 > SQL편집기 > SQL 포맷
        - Keyword case UPPER로 변경

        ![alt text](image-10.png)

    - 기본문법
        ```sql
        -- 가본 조회 쿼리, * -> 올이라고 호칭. ALL 키워드와 다름
        SELECT * 
            FROM 테이블명;
        
        -- 컬럼, 열, 명시할 때
        SELECT 열1, 열2, ... 열n
            from 테이블명;

        -- 조건을 필터링(필요한 행, 레코드)만 조회할 떄
        SELECT *|열이름 나열
            FROM 테이블명
            WHERE 조건...; 
        
        -- 정렬하고 싶을 때
        -- ASCeding(오름차순) | DESCeing(내림차순)
        -- ASC는 기본으로 생략가능
        -- DESC는 기본이 아니라서 써야함
        SELECT *| 열이름 나열
          FROM 테이블명
         WHERE 조건...
         ORDER BY 열1, 열2 ASC|DESC;
        ```
## 2일차

### 도커 사용하는 이유

- 설치 편의성 - 이미지만 있으면 컨테이너로 실행하는데 수십초에 불과함. 설치 설정 불 필요
- 환경격차 문제 해결 - OS단의 설정까지 건드려야하는 문제를 없애고, 간단하게 서비스를 실행 가능
- 서버비용 절감 - 새로운 서비스를 할 때마다 하드웨어 서버를 구매, 설정할 필요가 없음
- OS에 독립적 - 새로운 서비스의 운영OS에 따라 OS를 새로 설치할 필요없음
- 가상머신보다 빠름 - VMWare, virtualBox와 같은 가상OS 플랫폼 보다 실행속도가 빠름. 필요없는 기능 제거, 용량 축소

### AI시대 PostgreSQL 학습

- DB시장에서 Oracle, MySQL, SQLServer 다음 POstgreSQL이 4위
- AI시대에 더 비중이 오름
- 나중에 학습할 것

### DBeaver 접속설정 다시

- Public Key Retrieval is not allowed 라는 경고메세지로 접속불가할떄

![alt text](image-12.png)
![alt text](image-13.png)

- Driver properties 탭 `allowPublicRetrieval` 키를 `true`로 변경

### SELECT 실습

#### 기본문법

- 기본문법

    ```sql
    SELECT ALL|DISTINCT 컬럼1,...
        FROM 테이블명
       WHERE 필터링 조건
       GROUP BY 그루핑컬럼1, 컬럼2..
      HAVING 집계함수필터링조건
       ORDER BY 컬럼1, 컬럼2 DESC;
    ```
#### 필터링

    - WHERE 절 - 전체데이터에서 필요한 것만 필터링 

        - 비교 : =(같다), <>(같지 않다), !=(DB종류별로), <,>, <=, >=
        - 범위 : BETWEEN a AND b, 초과, `미만은 사용불가`, `날짜는 조심`할 것! 
            - price BETWEEN 10000 and 20000
        - 집합 : IN, NOT IN 
            - price in(10000, 20000, 25000) -- 가격이 1만, 2만, 2만5천에 속하는 데이터
            - price NOT IN (10000, 20000) -- 가격이 1만, 2만을 제외한 나머지 데이터
        - 패턴 : LIKE (문자열만), %, _
            - bookname LIKE '축구%' -- 책제목중 축구로 시작하는 책 모두
        - NULL : 데이터가 없는 것, 입력되지 않은 것, =로 비교하지 X! where price = null
            - price IS NULL, price IS NOT NULL
        - 복합 : AND(C++ &&와 동일), or(C++ ||), NOT(C++ !)로 비교를 조합
            - (price < 20000> AND (bookname LIKE '축구의%'))

- ORDER BY - 정렬 ASC(오름차순), DESC(냬림차순)


#### 별명

- Alias - 별명으로 컬럼명, 테이블명 등 원래의 이름을 바꿔쓰고 싶을떄 AS 사용 
    - " 쌍따옴표로 별명을 지정하는 것을 추천. (스페이스사용 등) 

#### 그룹화 및 집계함수

- GROUP BY, 집계(통계)함수 - DB를 사용하는 가장 큰 목적 중 하나
    - SUM() : 총합, 숫자컬럼만
    - COUNT() : 총 개수, 컬럼 대신 * 가능
    - MIN() : 최소값, 숫자컬럼만
    - MAX() : 최대값, 숫자컬럼만
    - AVG() : 평균값, 숫자컬럼만

- HAVING - 일반 필터링은 where절로, `집계함수 필터링은 HAVING`절로

- GROUP BY, HAVING `주의사항`
    - GROUP BY에 포함되지 않은 컬럼은 SELECT에 사용할 수 없음!
    - 집계함수 외 일반 컬럼은 SELECT와 GROUP BY를 일치시키는것
    - HAVING 절에는 집계함수 필터링 포함
    - WHERE 절에 집계함수 사용불가!
    - SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY 순 기억

#### 조인

- JOIN - 관계형 DB의 핵심기능 - [쿼리](./Day02/3.JOIN.sql)
 - 두개 이상의 테이블을 합쳐서 하나의 테이블처럼 보여주는 기법

    ![alt text](image-14.png)

 - JOIN 종류 - 종류는 많으나 3가지만 알면 됨
    - INNER JOIN(내부조회) - 조인중에서 가장 간단한 조인 컬럼이 일치하는 데이터에만 조회 . 기준테이블 없음. 조인되는 테이블간의 관계 확인
    - OUTER JOIN(외부조회) - 한 테이블 기준으로 데이터가 일치하지 않는 데이터까지 나오도록 조회하는 조인
        -  LEFT OUTER JOIN - 두 개의 테이블중 앞쪽 테이블 기준
        - RIGHT OUTER JOIN - 두 개의 테이블중 뒤쪽 테이블 기준

#### 서브쿼리(부속질의)

- SubQurry - 쿼리 내부에 포함되는 하위쿼리. 항상 소괄호 () 내에 작성 - [쿼리](./Day02/4.SubQurry.sql)
    - 서브쿼리는 소괄호안의 쿼리부터 먼저 작성
    - 메인쿼리 - 소괄호 밖의 쿼리
    - 서브쿼리 - 소괄호 밖의 쿼리
    - 대부분이 조인으로 변경가능
    - 조인이 가지고 있는 성능개선의 특징을 사용못하기 때문에 속도저하가 발생할 가능성 높음
    - 조인을 많이 사용한다면, 서브쿼리는 필요할 떄만 사용

## 3일차

### SELECT 실습

DB 기본타입 - 문자열, 숫자, 날짜시간

#### 서브쿼리 계속

- 서브쿼리 종류 [쿼리](./Day03/1.SUBQURRY.sql)
    - WHERE절 서브쿼리
    - FROM절 서브쿼리
    - SELECT절 서브쿼리

#### 집합연산

- 두 테이블 합치기
    - UNION(중복 제거) [쿼리](./Day03/2.UNION.sql)
    - UNION ALL - 중복표시 합집합

#### GROUP BY 추가 기능

- GROUP BY 컬럼 WITH ROLLUP - 전체합산 추출 [쿼리](./Day03/3.ROLLUP.sql)
    - ROLLUP을 안쓰면 쿼리가 아주 길어짐

#### DML 기타

- DML 중에서 트랜잭션 영향을 받지 않는 것은 SELECT 뿐

#### INSERT

- 테이블에 데이터를 삽입하는 쿼리
- 트랜잭션의 영향을 받음

    ```
    INSERT INTO 테이블명(컬럼1, ,,, 컬럼n)
    VALUES (컬럼1값, ...,컬럼n값);
    ```
- UPDATE나 DELETE와 달리 큰 문제가 발생하지 않음
- 잘못 입력되면 지우면 됨

#### UPDATE

- 테이블에 존재하는 데이터를 수정하는 쿼리
-트랜잭션의 영향을 받음
- 수정은 매우 신중
    ```
    UPDATE 테이블명
       SET 변경컬럼1 = 변경값1
         , 변경컬럼2 = 변경값2
         , ...
         , 변경컬럼n = 변경값n
     WHERE 구분컬럼  = 구분값; 
    ```

#### DELETE

- 테이블에 존재하는 데이터를 삭제하는 쿼리
- 트랜잭션의 영향을 받음
- 삭제는 매우 신중

    ```
    DELETE FROM 테이블명
     WHERE 구분컬럼 = 구분값;
    ```

#### 트랜잭션 처리 [쿼리](./Day03/4.DML기타.sql)

- UPDATE, DELETE, (INSERT포함) 처리오류가 발생하면 복구할 수 있는 기능이 존재
- 8장에서 다룰 예정

### DDL

- 객체 생성하고 수정, 삭제하는 기능을 하는 SQL언어

#### MYSQL 데이터타입
- `BOOL` - true/false
- TINYINT, SMALLINT - 1byte(255까지), 2byte
    - `TINYINT(1)` - 1/0
- `INT` - 4byte(가장기본)
- `BIGINT` - 4byte
- FLOAT - 4byte 소수점
- DOUBLE - 8byte
- `DECIMAL(m,n)` - m 전체 65 자리수, n 소수점 최대 30 자리수
    - 정수가 35자리, 소수점 30자리인 아주 큰수
- DATE - 날짜만 2026-03-17
- `DATETIME` - 날짜와 시간 모두 2026-03-17 16:28:56.092
- CHAR(n) - 고정길이 문자열 n만큼 길이 지정
    - CHAR(10)에 'HELLO'입력하면 'Hello   '로 저장
    - 나머지 5자리 스페이스로 채움
    - 주민번호, 공동코드처럼 정확한 길이 지정
- VARCHAR(n) - 가변길이 문자열 n 만큼 길이 지정
    - VARCHAR(10)은 'Hello' 로 저장. 나머지 5자리는 없앰
    - 길이를 넘어서는 문자열을 입력되지 않음(잘림)
    - char, varchar는 길이를 여유있게 설정
- `TEXT`, LONGTEXT - 아주 긴 문자열, 2 ~ 4GB
- `BLOB` - 바이너리로 저장되는 큰데이터, 2 ~4GB


#### CREATE - [쿼리](./Day03/5.DDL.sql)

- DB객체를 생성하는 쿼리
- 데이터베이스, 테이블, 뷰, 인덱스 등 주요 객체를 생성가능

    ```sql
    CREATE TABLE 테이블명 (
        컬럼1이름 데이터타입 제약조건,
        컬럼2이름 데이터타입 제약조건,
        ...
        컬럼n이름 데이터타입 제약조건,
        [각 제약조건 독립적으로 작성]
    );
    -- 데이터베이스 생성
    CREATE DATABASE 데이터베이스명;
    -- 사용자 생성
    CREATE USER 사용자명 IDENTIFIED BY 비번;
    -- ...
    ``` 
## 4일차

### DDL 계속

#### ALTER

#### DROP