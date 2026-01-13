
-- 틀림
/* key points 
-- 결과값이 어떻게 나올지 표로 그려보기
- start_date 따로, end_date 따로 구하기
- 두 date를 연결시킬 컬럼은 row_num 이다
- left join을 사용하여 join을 시킨다.
- 기간이 길었던 프로젝트 순이므로 datediff 사용하기
*/


select t1.start_date,
        t2.end_date
from (
    select row_number() over (order by start_date) as row_num
            , start_date
    from projects
    where start_date not in (select distinct end_date from projects)) t1
    left join
    (select row_number() over (order by end_date) as row_num
            , end_date
    from projects
    where end_date not in (select distinct start_date from projects)) t2
    on t1.row_num = t2.row_num
order by datediff(t2.end_date,t1.start_date),t1.start_date
