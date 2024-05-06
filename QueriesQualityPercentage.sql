-- url: https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50

SELECT
    q.query_name,
    ROUND(AVG(q.rating / q.position), 2) AS quality,
    round(count(q1.rating)/count(q.rating)*100, 2) as poor_query_percentage
FROM 
    Queries q
left JOIN 
    Queries AS q1 ON q1.query_name = q.query_name and q1.result = q.result and q1.rating<3
where q.query_name is not null 
GROUP BY 
    q.query_name;
