-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50

select 
    r.contest_id,
    round( (count(r.user_id)/ (select count(*) from users))*100,2) as percentage
from Users u
join Register r on r.user_id=u.user_id
group by r.contest_id
order by percentage desc, r.contest_id