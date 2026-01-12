/* ket point*/

-- 1. 어떤 조건에서 root, inner,leaf 가 되는 것인지 파악
-- 2. root : p가 null임 
--    inner :  P에 있는 값이 N에 있음
--    leaf : 나머지
-- 3. 주의할점은 root를 처음에 먼저 걸러줘야함



select n,
    case when p is null then 'Root'
        when n in (select distinct p from bst) then 'Inner'
        else 'Leaf' end as category
from bst
order by n;