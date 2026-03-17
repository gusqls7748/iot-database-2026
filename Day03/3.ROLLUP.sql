-- GROUP UP
-- 주문정보에서 각 고객별 총 판매액을 조회하시오
-- GROUP BY에 WITH ROLLUP을 사용하면
-- HAVING 절 이전에 합산 후
-- HAVING 절로 필터링
SELECT o.custid, sum(o.saleprice) AS "Totalprice"
  FROM Orders o 
 GROUP BY o.custid WITH ROLLUP 
HAVING TotalPrice > 20000;

-- ROLLUP을 모르면 쿼리길이가 두배이상 늘어남
-- 아래가 답
SELECT o.custid, sum(o.saleprice) AS "TotalPrice"
  FROM Orders o
 GROUP BY o.custid
HAVING TotalPrice > 20000
 UNION 
SELECT NULL, sum(t.TotalPrice)
  FROM (SELECT o.custid, sum(o.saleprice) AS "TotalPrice"
        FROM Orders o
       GROUP BY o.custid       
      HAVING TotalPrice > 20000) t;

-- 필터링 ROLLUP을 하려면 서브쿼리 사용
SELECT t.custid, sum(t.TotalPrice) AS "TotalPrice"
  FROM (SELECT o.custid, sum(o.saleprice) AS "TotalPrice"
        FROM Orders o
       GROUP BY o.custid       
      HAVING sum(o.saleprice) > 20000) t
     GROUP BY t.custid WITH Rollup;

SELECT o.custid, sum(o.saleprice) AS "TotalPrice"
	 , GROUPING(o.custid)
  FROM Orders o 
 GROUP BY o.custid WITH ROLLUP