/* 쿼리 실행 */
-- 1. 특정 고객의 최근 주문을 조회하시오
SELECT *
  FROM orders_big
 WHERE customer_id = 123456
 ORDER BY order_date DESC;

-- 2. 특정 기간에 특정 고객의 주문을 조회하시오
SELECT *
  FROM orders_big
 WHERE customer_id = 23456
   AND order_date BETWEEN '2024-01-01' AND '2025-12-31';

-- 3. Seoul에 금액조건에 정렬해서 조회하시오
SELECT *
  FROM orders_big ob
 WHERE ob.city = 'Seoul'
   AND ob.amount >= 900000
 ORDER BY order_date DESC;

/* 실행 계획 */
-- 1. 실행계획
EXPLAIN ANALYZE
SELECT *
  FROM orders_big
 WHERE customer_id = 123456
 ORDER BY order_date DESC;

/* 실행계획 결과. 
 * -> Sort: orders_big.order_date DESC  (cost=1.04e+6 rows=9.95e+6) (actual time=3282..3282 rows=26 loops=1)
    -> Filter: (orders_big.customer_id = 123456)  (cost=1.04e+6 rows=9.95e+6) (actual time=1421..3282 rows=26 loops=1)
        -> Table scan on orders_big  (cost=1.04e+6 rows=9.95e+6) (actual time=0.0745..2951 rows=10e+6 loops=1)
 * */
 
-- customer_id와 order_date에서 인덱스 걸리지 않아 Scan에서 시간이 많이 소요

-- 인덱스 추가
-- 인덱스 테이블 생성에 27초가량 소요
CREATE INDEX idx_orders_customer_id ON orders_big(customer_id);


/* 인덱스 추가후 실행계획
 * -> Sort: orders_big.order_date DESC  (cost=28.6 rows=26) (actual time=0.109..0.11 rows=26 loops=1)
    -> Index lookup on orders_big using idx_orders_customer_id (customer_id=123456)  (cost=28.6 rows=26) (actual time=0.0385..0.0964 rows=26 loops=1)
 * */

-- 두번째 인덱스 추가
CREATE INDEX idx_orders_order_date ON orders_big(order_date DESC);

/* 두번째 인덱스 추가후 실행계획
 * -> Sort: orders_big.order_date DESC  (cost=28.6 rows=26) (actual time=0.407..0.409 rows=26 loops=1)
    -> Index lookup on orders_big using idx_orders_customer_id (customer_id=123456)  (cost=28.6 rows=26) (actual time=0.135..0.391 rows=26 loops=1)
 */

-- 두 인덱스 제거 후 복합 인덱스 추가
CREATE INDEX idx_orders_customer_id_and_order_date ON orders_big(customer_id, order_date);

CREATE INDEX idx_orders_city_and_amount ON orders_big(city, amount);