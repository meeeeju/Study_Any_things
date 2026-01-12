
/* ket point*/

-- 1. row_number 함수를 통해 순서를 매겨준다
-- 2. 순서를 바탕으로 집계를 해준다 ( 그래야 직업별로 모든 이름이 출력이 됨)
-- 3. 집계를 했으니 집계함수(min, max 아무거나 상관 x) 를 사용하여 출력을 한다
-- 4. null 값 처리를 위해 if 함수를 사용한다.


select  min(if(occupation='Doctor',name,null)) as 'Doctor',
        min(if(occupation='Professor',name,null)) as 'Professor',
        min(if(occupation='Singer',name,null)) as 'Singer',
        min(if(occupation='Actor',name,null)) as 'Actor'
from (select  *, row_number() 
            over (partition by occupation order by name) as rank_occupation
            from OCCUPATIONS) as t
group by rank_occupation
order by rank_occupation

