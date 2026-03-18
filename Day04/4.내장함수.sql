/* 내장함수 */

-- 수학함수
SELECT abs(-78), abs(+78);
  FROM DUAL; -- 테이블을 사용하지 않을 떄 사용하는 키워드
  
 SELECT  MOD(10,3)

  -- 반올림
  -- 두번째 인자 양수 소수점, 음수 정수부분
  SELECT round(3.141592, 3);
  
  -- 고객별 평균 주문금액을 백원단위로 반올림하시오
  SELECT o.custid "고객 번호"
  	   , round(sum(saleprice) / count(*), -2) AS "평균금액"
    FROM Orders o
   GROUP BY o.custid;
  
  SELECT ceil(3.14), floor(3.67), power(2, 10), log(10);
  
  -- 2. 문자함수
  -- 결합함수파라미터 갯수 제한이 없음!
  SELECT CONCAT('천', '현','빈', '취직!!!');
  
  -- 소문자, 대문자 변환 ROWNUM
  SELECT lower('HELLO'), UPPER('hello');
  
  -- 자리수채우기
  SELECT LPAD('Hello', 10, '*'),
  		 RPAD('Hello', 10, '@'); -- 주민번호 생년월일 생별이후 여섯자리 *로 채우기
  		 
  -- 문자열 대체
  SELECT replace('Hello World','Hello', 'Bye');
  
  -- 문자열 자르기
  SELECT substr('Hello World',7,5);
  
  -- 문자열 앞뒤 공백 없애기(중간 공백 제외)
  SELECT concat('|',TRIM('         HELLO WORLD        '),'|') "TRIM",
  		 concat('|',LTRIM('         HELLO WORLD        '),'|') "LTRIM",
  		 concat('|',RTRIM('         HELLO WORLD        '),'|') "RTRIM";
  
  
  -- concat구분자로 지정하여 문자열 합치기
  SELECT concat_ws('-', '2026', '03', '18'),
  		 CONCAT_WS(' ', 'hello', 'world');
  
  --알파벳을 아스키코드 변환
  SELECT ascii('A');
  
  -- 문자열 길이리턴
  -- 한글 1글자 UTF에서 3byte, 글자길이와 저장되는 바이트길이는 다름
  SELECT length('안녕하세요'),
  		 char_length('안녕하세요');
  
  -- 3. 날짜시간함수
  
  --날짜로 작성된 문자열을 날짜형식으로 변환
  SELECT str_to_date('2026-03-18', '%Y-%m-%d');
  
  -- 날짜문자열을 날짜포멧에 맞춰서 변경
  SELECT date_format('2024-03-18', '%Y-%m-%d'),
  		 date_format('2025-03-18', '%Y-%m-%d'),
  		 date_format(NOW(), '%Y-%m-%d');
  
  -- 날짜 더하기/뺴기
  SELECT adddate(NOW(), INTERVAL -10 DAY),
  		 date(NOw()), time(now());
  
  -- 날짜 간 날짜차이수
  SELECT datediff('2026-03-19', '2026-03-08');
  
  -- 현재 일시
  SELECT sysdate(), now();
  
  -- 날짜함수 포맷
  /*
   * %Y : 네자리 년도 2026
   * %y : 두자리 년도 26
   * %m : 월
   * %M : 월이름 (January ~ December)
   * %b : 월약자이름 (Jan ~ Dec)
   * %d : 일(Wednesday)
   * %W : 요일숫자(0 일료일 ~ 6 토요일)
   * %h : 12시간 hour 
   * %H : 12시간 Hour
   * %i : 분
   * %s : 초
   * */
  
  SELECT date_format(now(), '%Y-%m-%d %a'),
  		 date_format(now(), '%H:%i:%s');
  
  