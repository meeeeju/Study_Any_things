/*
Enter your query here.
*/


SELECT 
    c.company_code,
    c.founder,
    (
        SELECT COUNT(DISTINCT lm.lead_manager_code)
        FROM lead_manager lm
        WHERE lm.company_code = c.company_code
    ) AS lm_cnt,
    (
        SELECT COUNT(DISTINCT sm.senior_manager_code)
        FROM senior_manager as sm
        WHERE sm.company_code = c.company_code
    ) AS sm_cnt,
    (
        SELECT COUNT(DISTINCT m.manager_code)
        FROM manager as m
        WHERE m.company_code = c.company_code
    ) AS m_cnt,
    (
        SELECT COUNT(DISTINCT e.employee_code)
        FROM employee as e
        WHERE e.company_code = c.company_code
    ) AS m_cnt
from company as c
order by c.company_code 


    
