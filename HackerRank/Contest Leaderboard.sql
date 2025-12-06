
select hacker_id,
        name,
        sum(max_score) as total_score
from (select h.hacker_id, h.name, s.challenge_id, max(score) as max_score
        from Hackers as h
        left join Submissions as s on h.hacker_id = s.hacker_id
        group by h.hacker_id, h.name, s.challenge_id ) as h
group by hacker_id, name
having sum(max_score)> 0
order by total_score desc, hacker_id 