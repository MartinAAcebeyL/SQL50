-- https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50
select p.product_id,
    IFNULL(
        ROUND(SUM(p.price * u.units) / SUM(u.units), 2),
        0
    ) AS average_price
from Prices p
    LEFT join UnitsSold u on p.product_id = u.product_id
    and u.purchase_date between p.start_date and p.end_date
group by p.product_id