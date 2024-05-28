-- url: https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan-v2&envId=top-sql-50
select sell_date,
    count(DISTINCT product) as num_sold,
    GROUP_CONCAT(DISTINCT product) as products
from Activities
group by sell_date
order by sell_date;