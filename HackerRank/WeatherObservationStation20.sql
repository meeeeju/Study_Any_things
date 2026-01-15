

/* 틀림 (접근법은 맞았는데 이것을 sql 로 어떻게 풀어야하는지를 몰랐음)
    1. 오름차순으로 정렬
    2. 전체 행의 개수 파악
    3. median 위치 파악 (홀수와 짝수)
*/

/* key points
- 윈도우 함수로 전제 행 개수 세는 방법도 있음 count(*) over() as total_num
- case when 절은 where 절에도 올 수 있음 
*/


SELECT ROUND(AVG(lat_n), 4)
FROM (
    SELECT lat_n
    , ROW_NUMBER() OVER (ORDER BY lat_n) AS row_num
    , COUNT(*) OVER () AS total_num
    FROM station) t
WHERE CASE WHEN MOD(total_num, 2) = 1 THEN row_num = (total_num+1)/2
        ELSE row_num IN (total_num/2, total_num/2 + 1) END


-- 오답
-- with t1 as 
-- (   select lat_n, row_number() over (order by lat_n) as row_num 
--     from station
-- )
-- select case when (max(row_num) %2 =0)  -- 짝수면
--                 then (select  lat_n from t1 where row_num = (select max(row_num) div 2 from t1 ))
--             when  (max(row_num) %2 !=0) 
--                 then (select  lat_n from t1 where row_num = (select max(row_num) div 2 from t1))
--         end as median
-- from t1

-- select round((t2.lat_n + t3.lat_n)/2,4)
-- from (select  lat_n from t1 where row_num = (select max(row_num) div 2 from t1 )) as t2 
--     ,(select  lat_n from t1 where row_num = (select (max(row_num) div 2)+1 from t1)) as t3