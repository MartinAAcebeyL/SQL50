-- url: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/submissions/1268560582/?envType=study-plan-v2&envId=top-sql-50

SELECT id, SUM(num) AS num
FROM (
    SELECT requester_id AS id, COUNT(requester_id) AS num
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id AS id, COUNT(accepter_id) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
) AS combined_results
GROUP BY id
ORDER BY num DESC
limit 1;
