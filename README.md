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

#### 도커사용 설치

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

#### 도커사용 설치

- Docker - 애플리케이션 신속 구축, 테스트, 서비스할 수 있는 컨테이너 기반의 가상화 플랫폼
    - 온라인 상에서 이미지를 다운로드(Pull)
    - 실행하는 컨테이너로 만듬(Run)

1. 도커설치
    - https://www.docker.com/ 사이트 Download Docker Desktop 클릭
    - DOcker desktop Installer.exe 실행

![alt text](image-3.png)

![alt text](image-4.png)


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
        - Data Manipulate Language- 데이터 조작 언어. `SELECT`, `INSERT`, `UPDATE`, `DELETE` 와 같은 데이터를 조작하는 언어
        - Data Definition Language - 데이터 정의어. `CREATE`, `ALTER`, `RENAME`, `DROP` 같은 객체(데이터베이스, 테이블, 사용자, 뷰, 인덱스...)를 처리하는 언어. 
        - Data Control Language - 데이터 제어어 `GRANT`, `REVOKE` 와 같이 사용자에게 권한 주고 해제하는 기능을 처리하는 언어
        - Transaction Control Language - 트랜잭션 제어어. `BEGIN TRAN`, `COMMIT`, `ROLLBACK` 같은 트랜잭션 처리로 동시성 제어를 위한 언어

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

      